#ifndef RASPI_H
#define RASPI_H

#include <tk/tkernel.h>
#include <tm/tmonitor.h>

#include "uart_raspi.h"

extern int llm_mode_state;

extern void raspi_task(INT stacd, void *exinf);

extern ID    raspi_tskid;            // Task ID number
extern T_CTSK raspi_ctsk;

#endif /* RASPI_H */
