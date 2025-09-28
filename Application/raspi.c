#include "raspi.h"

ID    raspi_tskid;
T_CTSK raspi_ctsk = {             // Task creation information
    .itskpri    = 6,
    .stksz      = 1024,
    .task       = raspi_task,
    .tskatr     = TA_HLNG | TA_RNG3,
};

int llm_mode_state = 0;

fsp_err_t  raspi_init(void)
{
    fsp_err_t err = FSP_SUCCESS;

    /* Nothing to do */

     return err;
}

fsp_err_t  raspi_send_msg()
{
    fsp_err_t err = FSP_SUCCESS;
    char msg[16];

    sprintf(msg, "%d\n", llm_mode_state);

    g_uart_raspi_event = RESET_VALUE;

    SEGGER_RTT_printf(0, "Sending msg to Raspi: %s\n", msg);

    uart_raspi_tx_done = false;
    err = R_SCI_B_UART_Write(&g_uart_raspi_ctrl, (uint8_t *)msg, strlen(msg));
    while (!uart_raspi_tx_done)
    {
        tk_dly_tsk(1);  // 軽く待機
    }
    return err;
}

void raspi_task(INT stacd, void *exinf)
{
    SEGGER_RTT_printf(0, "Raspi task started.\n");

    raspi_init();

    while(1) {
        tk_slp_tsk(TMO_FEVR);
        SEGGER_RTT_printf(0, "LLM mode on.\n");

        raspi_send_msg();
    }
}
