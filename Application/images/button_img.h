#ifndef BUTTON_IMG_H
#define BUTTON_IMG_H

#define LCD_WIDTH  480
#define LCD_HEIGHT 854

/* Window */
typedef enum {
    WINDOW_MAIN,
    WINDOW_VOICECOMMAND,
    WINDOW_LLM
} WindowState;

extern WindowState current_window;

/* Buttons in WINDOW_MAIN  */
#define BTN_HEIGHT 140
#define BTN_WIDTH  140
#define BTN_NUM    6
extern const uint16_t button_aisatsu[BTN_HEIGHT * BTN_WIDTH];
extern const uint16_t button_hitokoto[BTN_HEIGHT * BTN_WIDTH];
extern const uint16_t button_tenki[BTN_HEIGHT * BTN_WIDTH];
extern const uint16_t button_aizuchi[BTN_HEIGHT * BTN_WIDTH];
extern const uint16_t button_warikomi[BTN_HEIGHT * BTN_WIDTH];
extern const uint16_t button_henji[BTN_HEIGHT * BTN_WIDTH];

/* Icon in WINDOW_VOICE_COMMAND */
extern const uint16_t icon_voice_command[130 * 157];

/* MODE button */
#define MODE_BTN_H 73
#define MODE_BTN_W 73
extern const uint16_t button_mode[MODE_BTN_H * MODE_BTN_W];

#define LLM_ICON_H 157
#define LLM_ICON_W 130
extern const uint16_t icon_llm[LLM_ICON_H * LLM_ICON_W];

#define VOICECOMMAND_ICON_H 140
#define VOICECOMMAND_ICON_W 140
extern const uint16_t icon_voicecommand[VOICECOMMAND_ICON_H * VOICECOMMAND_ICON_W];

typedef struct {
    int x;
    int y;
    int w;
    int h;
    const uint16_t *img;
} Image;

extern Image btns[BTN_NUM];
extern Image mode_btn;
extern Image llm_icon;
extern Image voicecommand_icon;

#endif
