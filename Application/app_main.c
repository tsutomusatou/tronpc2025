/*
 *	EK-RA8D1 LCD Example for μT-Kernel 3.0 BSP2
 *
 *    Copyright (C) 2025 by Ken Sakamura.
 *    This software is distributed under the T-License 2.1.
 *----------------------------------------------------------------------
 *
 *    Released by TRON Forum(http://www.tron.org) at 2025/06.
 */

#include <tk/tkernel.h>
#include <tm/tmonitor.h>

#include <stdint.h>

#include "tglib.h"
#include "touch.h"
#include "dfplayer.h"
#include "raspi.h"
#include "voicecommand.h"
#include "control_flag.h"
#include "images/button_img.h"
#include "gui_draw.h"
#include <stdint.h>

#define BTN_MARGIN 20

LOCAL void task_1(INT stacd, void *exinf);	// task execution function
LOCAL ID	tskid_1;			// Task ID number
LOCAL T_CTSK ctsk_1 = {				// Task creation information
	.itskpri	= 5,
	.stksz		= 1024,
	.task		= task_1,
	.tskatr		= TA_HLNG | TA_RNG3,
};

WindowState current_window = WINDOW_MAIN;
int last_window = -1;

/* Buffer to copy a button image */
static uint16_t img_buf[BTN_NUM][BTN_WIDTH * BTN_HEIGHT];

Image btns[BTN_NUM] = {
    /* aisatsu */
    {(int)(LCD_WIDTH/2 - BTN_WIDTH - BTN_MARGIN),
     (int)(LCD_HEIGHT/2 - BTN_HEIGHT/2 - BTN_HEIGHT - BTN_MARGIN),
     BTN_WIDTH,
     BTN_HEIGHT,
     button_aisatsu},
    /* hitokoto  */
    {(int)(LCD_WIDTH/2 - BTN_WIDTH - BTN_MARGIN),
     (int)(LCD_HEIGHT/2 - BTN_HEIGHT/2),
     BTN_WIDTH,
     BTN_HEIGHT,
     button_hitokoto},
    /* tenki  */
    {(int)(LCD_WIDTH/2 - BTN_WIDTH - BTN_MARGIN),
     (int)(LCD_HEIGHT/2 + BTN_HEIGHT/2 + BTN_MARGIN),
     BTN_WIDTH,
     BTN_HEIGHT,
     button_tenki},
    /* aizuchi  */
    {(int)(LCD_WIDTH/2 + BTN_MARGIN),
     (int)(LCD_HEIGHT/2 - BTN_HEIGHT/2 - BTN_HEIGHT - BTN_MARGIN),
     BTN_WIDTH,
     BTN_HEIGHT,
     button_aizuchi},
    /* warikomi  */
    {(int)(LCD_WIDTH/2 + BTN_MARGIN),
     (int)(LCD_HEIGHT/2 - BTN_HEIGHT/2),
     BTN_WIDTH,
     BTN_HEIGHT,
     button_warikomi},
    /* henji  */
    {(int)(LCD_WIDTH/2 + BTN_MARGIN),
     (int)(LCD_HEIGHT/2 + BTN_HEIGHT/2 + BTN_MARGIN),
     BTN_WIDTH,
     BTN_HEIGHT,
     button_henji}
};

Image mode_btn = {
    /* MODE button */
    LCD_WIDTH - MODE_BTN_W - 6,
    LCD_HEIGHT - MODE_BTN_H - 6,
    MODE_BTN_W,
    MODE_BTN_H,
    button_mode
};

static uint16_t img_buf_llm[LLM_ICON_W * LLM_ICON_H];

Image llm_icon = {
    /* MODE button */
    (int)(LCD_WIDTH/2 - LLM_ICON_W/2),
    (int)(LCD_HEIGHT/2 - LLM_ICON_H/2),
    LLM_ICON_W,
    LLM_ICON_H,
    icon_llm
};

static uint16_t img_buf_voicecommand[VOICECOMMAND_ICON_W * VOICECOMMAND_ICON_H];

Image voicecommand_icon = {
    /* MODE button */
    (int)(LCD_WIDTH/2 - VOICECOMMAND_ICON_W/2),
    (int)(LCD_HEIGHT/2 - VOICECOMMAND_ICON_H/2),
    VOICECOMMAND_ICON_W,
    VOICECOMMAND_ICON_H,
    icon_voicecommand
};

ID ssi_flg_id;

LOCAL void task_1(INT stacd, void *exinf)
{
	UINT	w, h;

	SEGGER_RTT_printf(0, "Start task-1\n");

	tglib_init();				/* Init LCD */
	tglib_onoff_lcd(LCD_ON);		/* LCD ON */

	/* Get display size */
	w = tglib_get_width();
	h = tglib_get_height();

	SEGGER_RTT_printf(0, "Width:%d  Height:%d\n", w, h);

	/* Copy button images to buffers */
	for (int i = 0; i < BTN_NUM; i++) {
        memcpy(img_buf[i], btns[i].img, btns[i].w * btns[i].h * sizeof(uint16_t));
	}

	memcpy(img_buf_llm, llm_icon.img, llm_icon.w * llm_icon.h * sizeof(uint16_t));
	memcpy(img_buf_voicecommand, voicecommand_icon.img, voicecommand_icon.w * voicecommand_icon.h * sizeof(uint16_t));

	while(1) {
	    if (current_window != last_window) {
	        last_window = current_window;

	        /* Cleare Screen */
	        tglib_clear_scr(TLIBLCD_COLOR_WHITE);

	        /* Draw MODE button */
	        draw_image(mode_btn.img, mode_btn.x, mode_btn.y, mode_btn.w, mode_btn.h);

	        if (current_window == WINDOW_MAIN) {
    	        /* Draw audio play buttons */
	            for (int i = 0; i < BTN_NUM; i++) {
                    draw_image(img_buf[i], btns[i].x, btns[i].y, btns[i].w, btns[i].h);
	            }
	        } else if (current_window == WINDOW_VOICECOMMAND) {
	            draw_image(img_buf_voicecommand, voicecommand_icon.x, voicecommand_icon.y, voicecommand_icon.w, voicecommand_icon.h);
	        } else if (current_window == WINDOW_LLM) {
	            draw_image(img_buf_llm, llm_icon.x, llm_icon.y, llm_icon.w, llm_icon.h);
  	        }
	    }

	    tk_dly_tsk(50);
	}
}


/* usermain */
EXPORT INT usermain(void)
{
	APP_PRINT((UB*)"=== Start User-main program ===\n");

	/* Create & Start Tasks */
	tskid_1 = tk_cre_tsk(&ctsk_1);
	tk_sta_tsk(tskid_1, 0);

    /* Touch panel */
    touch_tskid = tk_cre_tsk(&touch_ctsk);
    tk_sta_tsk(touch_tskid, 0);

	/* DFPlayer */
	dfplayer_tskid = tk_cre_tsk(&dfplayer_ctsk);
	tk_sta_tsk(dfplayer_tskid, 0);
	APP_PRINT("DFPlayer Task ID: %d\n", dfplayer_tskid);

	/* Raspi */
	raspi_tskid = tk_cre_tsk(&raspi_ctsk);
	tk_sta_tsk(raspi_tskid, 0);


	/* Voice command */
	voicecommand_tskid = tk_cre_tsk(&voicecommand_ctsk);
	tk_sta_tsk(voicecommand_tskid, 0);

	/* Event flag for completion of reading from mic */
    T_CFLG cflg = {
        .flgatr = TA_WMUL,
        .iflgptn = 0
    };

    ssi_flg_id = tk_cre_flg(&cflg);
    if (ssi_flg_id <= 0)
    {
        SEGGER_RTT_printf(0, "Failed to create voice event flag\n");
    }


	tk_slp_tsk(TMO_FEVR);

	return 0;
}
