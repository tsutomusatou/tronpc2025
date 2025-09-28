#ifndef GUI_DRAW_H
#define GUI_DRAW_H

#include <stdint.h>

// 画像描画関数：RGB565配列を指定座標に描画
void draw_image(const uint16_t *img, int x, int y, int w, int h);

#endif
