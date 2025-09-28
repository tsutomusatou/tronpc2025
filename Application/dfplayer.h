#ifndef DFPLAYER_H
#define DFPLAYER_H

#include <tk/tkernel.h>

#include "uart_dfplayer.h"

extern uint16_t track_number;

extern ID    dfplayer_tskid;            // Task ID number
extern T_CTSK dfplayer_ctsk;
extern void dfplayer_task(INT stacd, void *exinf);

#endif /* DFPLAYER_H */
