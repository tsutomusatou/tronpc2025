#include "gt911.h"  // gt911_get_status() の宣言があるヘッダ
#include "touch.h"
#include "dfplayer.h"
#include "raspi.h"
#include "voicecommand.h"
#include "images/button_img.h"

extern volatile bool dfplayer_busy;

static int prev_x = -1;
static int prev_y = -1;

ID touch_tskid;

T_CTSK touch_ctsk = {
    .tskatr  = TA_HLNG | TA_RNG3,
    .task    = touch_task,
    .itskpri = 9,
    .stksz   = 1024,
    .exinf   = NULL
};

void voicecommand_mode_onoff(bool state)
{
    voice_command_state = state;

    if (voice_command_state) {
        ER err = tk_wup_tsk(voicecommand_tskid);
        if (err < E_OK)
        {
            APP_PRINT("tk_wup_tsk failed: %d\n", err);
        }
    }
}

void llm_mode_onoff(int state)
{
    llm_mode_state = state;

//    SEGGER_RTT_printf(0, "LLM mode = %d\n", state);
    ER err = tk_wup_tsk(raspi_tskid);
    if (err < E_OK)
    {
        APP_PRINT("tk_wup_tsk failed: %d\n", err);
    }
}

int check_button_touch(int tx, int ty)
{
    int lcd_x = tx;
    int lcd_y = LCD_HEIGHT - 1 - ty;

    if (current_window == WINDOW_MAIN) {
        for (int i = 0; i < BTN_NUM; i++) {
            if (lcd_x >= btns[i].x && lcd_x < (btns[i].x + btns[i].w) &&
                lcd_y >= btns[i].y && lcd_y < (btns[i].y + btns[i].h)) {
                return i;  /* Return pressed button index */
            }
        }
    }

    /* Switch window */
    if (lcd_x >= mode_btn.x && lcd_x < (mode_btn.x + mode_btn.w) &&
        lcd_y >= mode_btn.y && lcd_y < (mode_btn.y + mode_btn.h)) {
        if (current_window == WINDOW_MAIN) {
            SEGGER_RTT_printf(0, "Switch to Voice command window.\n");
            current_window = WINDOW_VOICECOMMAND;
            voicecommand_mode_onoff(true);
        } else if (current_window == WINDOW_VOICECOMMAND) {
            SEGGER_RTT_printf(0, "Switch to LLM window.\n");
            current_window = WINDOW_LLM;
            voicecommand_mode_onoff(false);
            llm_mode_onoff(1);
        } else if (current_window == WINDOW_LLM) {
            SEGGER_RTT_printf(0, "Switch to main window.\n");
            current_window = WINDOW_MAIN;
            llm_mode_onoff(0);
        }
    }
    return -1;  /* No button was pressed or MODE button was pressed. */
}

void touch_task(INT stacd, void *exinf)
{
    uint8_t status = 0;
    coord_t points[5];

    SEGGER_RTT_printf(0, "Touch task started.\n");

    while (1)
    {
        fsp_err_t err = gt911_get_status(&status, points, 5);
        if (err == FSP_SUCCESS && (status & 0x0F) > 0)
        {
            int x = points[0].x;
            int y = points[0].y;
            int num_touches = status & 0x0F;

            for (int i = 0; i < num_touches; i++)
            {
                SEGGER_RTT_printf(0, "Touch[%d]: X=%d Y=%d\n", i, points[i].x, points[i].y);
            }

            if (!dfplayer_busy)
            {
                 if (x != prev_x || y != prev_y) {
                     int btn_id = check_button_touch(x, y);
                     if (btn_id >= 0) { /* Wake up DFPlayer task to play audio */
                         track_number = btn_id + 1;

                         APP_PRINT("Wake up dfplayer task.\n");
                         ER err = tk_wup_tsk(dfplayer_tskid);
                         if (err < E_OK)
                         {
                             APP_PRINT("tk_wup_tsk failed: %d\n", err);
                         }
                     }
                 }
             }
             prev_x = x;
             prev_y = y;
        }

        tk_dly_tsk(50);
    }
}
