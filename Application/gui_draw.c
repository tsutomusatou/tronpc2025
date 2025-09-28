#include "tglib.h"
#include "images/button_img.h"

void draw_pixel(int x, int y, uint16_t color565)
{
    /*Change rgb565 to 32bit color */
    uint8_t r = ((color565 >> 11) & 0x1F) << 3;
    uint8_t g = ((color565 >> 5)  & 0x3F) << 2;
    uint8_t b = (color565 & 0x1F) << 3;

    uint32_t color32 = (r << 16) | (g << 8) | b;
    tglib_draw_rect(color32, x, y, 1, 1); /* Draw 1 pixel */
}

void draw_image(const uint16_t *img, int x, int y, int w, int h)
{
    uint16_t color_idx = 0;

    for (int j = 0; j < h; j++) {
        for (int i = 0; i < w; i++) {
            uint16_t color = img[j * w + i];
            int draw_x = x + j;
            int draw_y = 854 - 1 - (y + i);

            draw_pixel(draw_x, draw_y, color);
            color_idx = j*w+i;
        }
    }
}
