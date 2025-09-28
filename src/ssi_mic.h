/***********************************************************************************************************************
 * File Name    : ssi_ep.h
 * Description  : Contains macros, data buffers used in ssi_ep.h
 ***********************************************************************************************************************/
/***********************************************************************************************************************
* Copyright (c) 2020 - 2025 Renesas Electronics Corporation and/or its affiliates
*
* SPDX-License-Identifier: BSD-3-Clause
***********************************************************************************************************************/

#ifndef SSI_MIC_H_
#define SSI_MIC_H_

#include <stdint.h>
#include "tk/tkernel.h"
#include "common_utils.h"


extern void ssi_mic_init(void);
extern void ssi_mic_read(void);
extern void inference_loop();

#define MODEL_INPUT_SIZE (16000)         /* Size of data to be input to model. 1sec@16kHz */
#define AUDIO_CAPTURE_BUFFER_SIZE 16000  /* Size of data from SSI module. 1sec@16kHz */
extern int16_t g_audio_capture_buffer[AUDIO_CAPTURE_BUFFER_SIZE];

extern bool ssi_event_rx_full;

#endif /* SSI_MIC_H_ */
