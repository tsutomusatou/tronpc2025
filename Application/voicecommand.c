#include "voicecommand.h"
#include "dfplayer.h"
#include "control_flag.h"
#include "images/button_img.h"
#include "tflm_runner.h"

//void tflm_setup(void);

ID    voicecommand_tskid;
T_CTSK voicecommand_ctsk = {             // Task creation information
    .itskpri    = 10,
    .stksz      = 8192,
    .task       = voicecommand_task,
    .tskatr     = TA_HLNG | TA_RNG3,
};

bool voice_command_state = false;

fsp_err_t  voicecommand_init(void)
{
    fsp_err_t err = FSP_SUCCESS;

    tflm_setup();

    return err;
}

void voice_recognition(void)
{
    SYSTIM now;
    SYSTIM start_time;


    SEGGER_RTT_printf(0, "Voice recognition start.\n");

    /* Save start time */
    tk_get_tim(&start_time);

    /* Read once */
    ssi_mic_read();

    while (1) {
        if (!voice_command_state) {
            SEGGER_RTT_printf(0, "Voice recognition stop.\n");
            break;
        }

        if (yesno == -1) {
            /* Wait for SSI read completion */
             uint32_t flg_pattern;
            tk_wai_flg(ssi_flg_id, SSI_MIC_RX_DONE, TWF_ANDW, &flg_pattern, TMO_FEVR);

            /* Read data from mic */
            ssi_mic_read();
        } else {
            /* Get current time */
            tk_get_tim(&now);

            /* Can play audio after 1 sec */
            if ((now.lo - start_time.lo) >= 1000) {
                if (yesno == 0) { /* no */
                    SEGGER_RTT_printf(0, "no\n");
                } else if (yesno == 1) { /* yes */
                    SEGGER_RTT_printf(0, "yes\n");
                }

                /* launch dfplayer */
                track_number = yesno + 1;

                APP_PRINT("Wake up dfplayer task by voice command.\n");
                ER err = tk_wup_tsk(dfplayer_tskid);
                if (err < E_OK)
                {
                    APP_PRINT("tk_wup_tsk failed: %d\n", err);
                }

                SEGGER_RTT_printf(0, "Voice Command sleeping.\n");
                tk_slp_tsk(TMO_FEVR);
                SEGGER_RTT_printf(0, "Voice Command wake up.\n");

                /* Reset start time */
                tk_get_tim(&start_time);
            }

            /* Clear inference result */
            yesno = -1;
        }

        /* Inference */
        inference_loop();

    }
}

void voicecommand_task(INT stacd, void *exinf)
{
    SEGGER_RTT_printf(0, "Voice Command task started.\n");

    voicecommand_init();

    while(1) {
        SEGGER_RTT_printf(0, "Voice Command sleeping.\n");
        tk_slp_tsk(TMO_FEVR);
        SEGGER_RTT_printf(0, "Voice Command wake up.\n");

        voice_recognition();
    }
}
