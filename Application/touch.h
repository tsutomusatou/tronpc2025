#ifndef TOUCH_H
#define TOUCH_H

#include <tk/tkernel.h>

extern ID touch_tskid;
extern T_CTSK touch_ctsk;
extern void touch_task(INT stacd, void *exinf);

#endif
