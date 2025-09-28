#include "dfplayer.h"
#include "voicecommand.h"

ID    dfplayer_tskid;
T_CTSK dfplayer_ctsk = {             // Task creation information
    .itskpri    = 7,
    .stksz      = 1024,
    .task       = dfplayer_task,
    .tskatr     = TA_HLNG | TA_RNG3,
};

uint16_t track_number = 1;
volatile bool dfplayer_busy = true;

fsp_err_t  dfplayer_init(void)
{
    fsp_err_t err = FSP_SUCCESS;

    /* Wait for DFPlayer is ready (3 sec) */
    tk_dly_tsk(3000);

    g_uart_event = RESET_VALUE;

     /* Control playback mode
      * 1:repeat one song
      * 2:repeat all
      * 3:play one song and pause
      * 4:Play randomly
      * 5:Repeat all in the folder
      * ?:query the current playback mode
      */
     uint8_t playmode_cmd[] = "AT+PLAYMODE=3\r\n";

     uart_tx_done = false;
     err = R_SCI_B_UART_Write(&g_uart_ctrl, playmode_cmd, strlen((char *)playmode_cmd));
     while (!uart_tx_done)
     {
         APP_PRINT((UB*)"Wait event...%d\n", g_uart_event);
         tk_dly_tsk(1);  // 軽く待機
     }
     tk_dly_tsk(2000);

     return err;
}


fsp_err_t  dfplayer_playback()
{
    fsp_err_t err = FSP_SUCCESS;
    char play_cmd[32];

    g_uart_event = RESET_VALUE;

    sprintf(play_cmd, "AT+PLAYNUM=%u\r\n", track_number);

    uart_tx_done = false;
    err = R_SCI_B_UART_Write(&g_uart_ctrl, (uint8_t *)play_cmd, strlen(play_cmd));
    while (!uart_tx_done)
    {
        APP_PRINT((UB*)"Wait playback completion...\n");
        tk_dly_tsk(1);  // 軽く待機
    }

    return err;
}

void dfplayer_task(INT stacd, void *exinf)
{
    SEGGER_RTT_printf(0, "DFPlayer task started.\n");

    dfplayer_init();

    dfplayer_busy = false;

    while(1) {
        SEGGER_RTT_printf(0, "DFPlayer sleeping.\n");
        tk_slp_tsk(TMO_FEVR);
        SEGGER_RTT_printf(0, "DFPlayer wake up.\n");

        dfplayer_busy = true;
        dfplayer_playback();
        tk_dly_tsk(1000);  // 再生中は2秒待機

        dfplayer_busy = false;

        /* Keep yesno inference */
        if (voice_command_state) {
            ER err = tk_wup_tsk(voicecommand_tskid);
            if (err < E_OK)
            {
                APP_PRINT("tk_wup_tsk failed: %d\n", err);
            }
        }

    }
}
