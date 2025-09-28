#ifndef VOICECOMMAND_H
#define VOICECOMMAND_H

#include <tk/tkernel.h>
#include "ssi_mic.h"

extern ID    voicecommand_tskid;            // Task ID number
extern T_CTSK voicecommand_ctsk;
extern void voicecommand_task(INT stacd, void *exinf);

extern bool voice_command_state;

#endif /* VOICECOMMAND_H */
