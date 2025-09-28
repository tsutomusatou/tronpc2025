/***********************************************************************************************************************
 * File Name    : ssi_mic.c
 * Description  : Contains data structures and functions used in ssi_mic.c.
 **********************************************************************************************************************/
#include "ssi_mic.h"
#include "control_flag.h"
#include "audio_provider.h"
#include "tensorflow/lite/c/common.h"

//void tflm_setup(void);
//int tflm_predict(const int16_t* audio_input, size_t length);

//static int32_t LatestAudioTimestamp();
void inference_loop();
static void deinit_gpt(void);
static void deinit_ssi(void);

/* Global variables */
volatile i2s_event_t g_i2s_event = I2S_EVENT_TX_EMPTY;  /* an actual event updates in callback */

#define NUM_FRAME   195 /* 195 frame = 4ms data in 48kHz sampling. */
#define NUM_CHANNEL 2   /* Mic data is stereo. */
#define MIC_DATA    (NUM_FRAME * NUM_CHANNEL)

/* Destination buffer to receive the sample audio data */
uint32_t g_dest_buff[MIC_DATA] = {RESET_VALUE};

int16_t g_audio_capture_buffer[AUDIO_CAPTURE_BUFFER_SIZE];
volatile uint32_t g_audio_capture_write_pos = 0;  /* Data write position */

#define MODEL_INPUT_MS 100  /* Input mic data to inference model every 100 ms. */
static int32_t inf_interval = 0;

/***********************************************************************************************************************
 * The RA Configuration tool generates main() and uses it to generate threads if an RTOS is used.  This function is
 * called by main() when no RTOS is used.
 **********************************************************************************************************************/
void ssi_mic_init(void)
{
    /* Error status */
    fsp_err_t err = FSP_SUCCESS;

    SEGGER_RTT_printf(0, "ssi_mic_init\n");

    /* Open SSI module */
    err = R_SSI_Open(&g_i2s_ctrl, &g_i2s_cfg);
    if (FSP_SUCCESS != err)
    {
        APP_ERR_PRINT("\r\n SSI open failed \r\n");
        /* Trap here */
        APP_ERR_TRAP(err);
    }

    /* Open GPT in periodic mode as internal clock for SSI bit clock */
    err = R_GPT_Open(&g_timer_ctrl, &g_timer_cfg);
    if (FSP_SUCCESS != err)
    {
        APP_ERR_PRINT("\r\n GPT open failed, Closing SSI \r\n");
        deinit_ssi();
        /* Trap here */
        APP_ERR_TRAP(err);
    }

    /* Start GPT in periodic mode */
    err = R_GPT_Start(&g_timer_ctrl);
    if (FSP_SUCCESS != err)
    {
        APP_ERR_PRINT("\r\n GPT start failed, Closing SSI and GPT \r\n");
        deinit_ssi();
        deinit_gpt();
        /* Trap here */
        APP_ERR_TRAP(err);
    }


//    /* Set up tensorflow lite for microcontroller */
////    tflm_setup();
//
//    while(true)
//    {
//        /* Send data in main loop the first time, and if it was not ready in the interrupt. */
//        if (g_send_data_in_main_loop)
//        {
//            /* Clear flag. */
//            g_send_data_in_main_loop = false;
//
//            /* Read audio data from mic with SSI. */
//            ssi_mic_read();
//            /* Inference loop */
////            inference_loop();
//        }
//    }
}

void ssi_mic_read(void)
{
    fsp_err_t err = FSP_SUCCESS;

    /* Transfer data. This call is non-blocking. */
    err = R_SSI_Read(&g_i2s_ctrl, g_dest_buff, MIC_DATA * sizeof(uint32_t));
    if (FSP_SUCCESS == err)
    {
        // Down sampling. 48kHz -> 16kHz.
        int max_i = (NUM_FRAME - 3) / 3;
        for (int i = 0; i < max_i; i++) {
            int32_t s0 = (int32_t)g_dest_buff[(3*i)*2];
            int32_t s0_16 = (s0 << 8) >> 14;

            int32_t s1 = (int32_t)g_dest_buff[(3*i+1)*2];
            int32_t s1_16 = (s1 << 8) >> 14;

            int32_t s2 = (int32_t)g_dest_buff[(3*i+2)*2];
            int32_t s2_16 = (s2 << 8) >> 14;

            int32_t avg = (s0_16 + s1_16 + s2_16) / 3;

            if (avg > 32767) avg = 32767;
            if (avg < -32768) avg = -32768;

            int16_t pcm16 = (int16_t)avg;

            /* Write data to ring buffer */
            g_audio_capture_buffer[g_audio_capture_write_pos] = pcm16;

//            SEGGER_RTT_printf(0, "%d\n", pcm16);

            /* Update position which data is updated */
            g_audio_capture_write_pos = (g_audio_capture_write_pos + 1) % AUDIO_CAPTURE_BUFFER_SIZE;
        }

        /* Accumulated time. Increment 4ms at 1 cycle. */
        inf_interval += (int32_t)(max_i / 16);
    } else {
        APP_ERR_PRINT("\r\n SSI not ready\r\n");
    }
}

int32_t LatestAudioTimestamp() {
    return (int32_t)(g_audio_capture_write_pos / 16);  // 16 samples/ms @16kHz
}

void inference_loop() {
    /* Get the latest time stamp */
    int32_t latest_time_ms = LatestAudioTimestamp();

    if (inf_interval >= MODEL_INPUT_MS) {
        int start_ms = 0;
        if (latest_time_ms >= MODEL_INPUT_MS) {
            start_ms = latest_time_ms - MODEL_INPUT_MS;
        } else {
            start_ms = 1000 - MODEL_INPUT_MS;
        }

        int16_t* input_audio = NULL;
        int input_size = 0;

        /* Get 1 sec audio data for inference */
        TfLiteStatus status = GetAudioSamples(start_ms, 1000, &input_size, &input_audio);
        if (status != kTfLiteOk) {
            return;
        }

        /*Execute inference */
        tflm_predict(input_audio, input_size);

        inf_interval = 0;

    }
}

void ssi_mic_callback(i2s_callback_args_t *p_args)
{
    if (I2S_EVENT_RX_FULL == p_args->event)
    {
//        ssi_event_rx_full = true;
        ER err = tk_set_flg(ssi_flg_id, SSI_MIC_RX_DONE);
        if (err < E_OK)
        {
            SEGGER_RTT_printf(0, "Failed to set event flag: %d\n", err);
        }
    }
}

static void deinit_ssi(void)
{
    fsp_err_t err = FSP_SUCCESS;
    /* Close SSI Module */
    err = R_SSI_Close(&g_i2s_ctrl);
    if (FSP_SUCCESS != err)
    {
        APP_ERR_PRINT("\r\n R_SSI_Close API Failed \r\n");
    }
}


static void deinit_gpt(void)
{
    fsp_err_t err = FSP_SUCCESS;
    /* Close GPT module */
    err = R_GPT_Close(&g_timer_ctrl);
    if (FSP_SUCCESS != err)
    {
        APP_ERR_PRINT("\r\n R_SSI_Close API Failed \r\n");
    }
}
