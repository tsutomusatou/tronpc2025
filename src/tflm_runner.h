#ifndef TFLM_RUNNER_H
#define TFLM_RUNNER_H

#include <stdint.h>
#include <stddef.h>

#ifdef __cplusplus
extern "C" {
#endif

void tflm_setup(void);
void tflm_predict(const int16_t* audio_input, size_t length);
size_t tflm_get_input_sample_length(void);

extern int yesno;

#ifdef __cplusplus
}
#endif

#endif // TFLM_RUNNER_H
