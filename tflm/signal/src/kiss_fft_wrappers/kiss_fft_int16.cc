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

#include "signal/src/kiss_fft_wrappers/kiss_fft_common.h"
#include "signal/src/kiss_fft_wrappers/kiss_fft_int16.h"

namespace kiss_fft_fixed16 {
#define FIXED_POINT 16

extern "C" {
#include "third_party/kissfft/kiss_fft.h"
#include "third_party/kissfft/kiss_fftr.h"
#include "third_party/kissfft/_kiss_fft_guts.h"
}

#undef FIXED_POINT


// ラッパー関数の定義
kiss_fft_cfg kiss_fft_alloc_int16(int nfft, int inverse_fft, void *mem, size_t *lenmem) {
    return kiss_fft_alloc(nfft, inverse_fft, mem, lenmem);
}

void kiss_fft_int16(kiss_fft_cfg cfg, const kiss_fft_cpx *fin, kiss_fft_cpx *fout) {
    kiss_fft(cfg, fin, fout);
}

kiss_fftr_cfg kiss_fftr_alloc_int16(int nfft, int inverse_fft, void *mem, size_t *lenmem) {
    return kiss_fftr_alloc(nfft, inverse_fft, mem, lenmem);
}

void kiss_fftr_int16(kiss_fftr_cfg cfg, const kiss_fft_scalar *timedata, kiss_fft_cpx *freqdata) {
    kiss_fftr(cfg, timedata, freqdata);
}

void kiss_fftri_int16(kiss_fftr_cfg cfg, const kiss_fft_cpx *freqdata, kiss_fft_scalar *timedata) {
    kiss_fftri(cfg, freqdata, timedata);
}

}  // namespace kiss_fft_fixed16
