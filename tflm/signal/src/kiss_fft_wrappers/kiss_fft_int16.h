/* Copyright 2023 The TensorFlow Authors. All Rights Reserved.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
==============================================================================*/

#ifndef SIGNAL_SRC_KISS_FFT_WRAPPERS_KISS_FFT_INT16_H_
#define SIGNAL_SRC_KISS_FFT_WRAPPERS_KISS_FFT_INT16_H_

#include "signal/src/kiss_fft_wrappers/kiss_fft_common.h"

#include <stddef.h>  // for size_t

#ifdef __cplusplus
extern "C" {
#endif

#include "third_party/kissfft/kiss_fft.h"


// kissfft の型を forward declare（定義は kiss_fft.c 側にある）
typedef struct kiss_fft_state* kiss_fft_cfg;
typedef struct kiss_fftr_state* kiss_fftr_cfg;

// kissfft の構造体定義（必要ならここで再宣言）
//typedef struct {
//    short r;
//    short i;
//} kiss_fft_cpx;

#define FIXED_POINT 16

typedef short kiss_fft_scalar;

// ラッパー関数の宣言（定義は .cc に書く）
kiss_fft_cfg kiss_fft_alloc_int16(int nfft, int inverse_fft, void *mem, size_t *lenmem);
void kiss_fft_int16(kiss_fft_cfg cfg, const kiss_fft_cpx *fin, kiss_fft_cpx *fout);

kiss_fftr_cfg kiss_fftr_alloc_int16(int nfft, int inverse_fft, void *mem, size_t *lenmem);
void kiss_fftr_int16(kiss_fftr_cfg cfg, const kiss_fft_scalar *timedata, kiss_fft_cpx *freqdata);
void kiss_fftri_int16(kiss_fftr_cfg cfg, const kiss_fft_cpx *freqdata, kiss_fft_scalar *timedata);

#ifdef __cplusplus
}
#endif



#endif  // SIGNAL_SRC_KISS_FFT_WRAPPERS_KISS_FFT_INT16_H_
