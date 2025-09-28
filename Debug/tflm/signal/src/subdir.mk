################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../tflm/signal/src/energy.cc \
../tflm/signal/src/fft_auto_scale.cc \
../tflm/signal/src/filter_bank.cc \
../tflm/signal/src/filter_bank_log.cc \
../tflm/signal/src/filter_bank_spectral_subtraction.cc \
../tflm/signal/src/filter_bank_square_root.cc \
../tflm/signal/src/irfft_int16.cc \
../tflm/signal/src/log.cc \
../tflm/signal/src/max_abs.cc \
../tflm/signal/src/msb_32.cc \
../tflm/signal/src/msb_64.cc \
../tflm/signal/src/pcan_argc_fixed.cc \
../tflm/signal/src/rfft_int16.cc \
../tflm/signal/src/square_root_32.cc \
../tflm/signal/src/square_root_64.cc \
../tflm/signal/src/window.cc 

SREC += \
tc25_v1_0D.srec 

CC_DEPS += \
./tflm/signal/src/energy.d \
./tflm/signal/src/fft_auto_scale.d \
./tflm/signal/src/filter_bank.d \
./tflm/signal/src/filter_bank_log.d \
./tflm/signal/src/filter_bank_spectral_subtraction.d \
./tflm/signal/src/filter_bank_square_root.d \
./tflm/signal/src/irfft_int16.d \
./tflm/signal/src/log.d \
./tflm/signal/src/max_abs.d \
./tflm/signal/src/msb_32.d \
./tflm/signal/src/msb_64.d \
./tflm/signal/src/pcan_argc_fixed.d \
./tflm/signal/src/rfft_int16.d \
./tflm/signal/src/square_root_32.d \
./tflm/signal/src/square_root_64.d \
./tflm/signal/src/window.d 

OBJS += \
./tflm/signal/src/energy.o \
./tflm/signal/src/fft_auto_scale.o \
./tflm/signal/src/filter_bank.o \
./tflm/signal/src/filter_bank_log.o \
./tflm/signal/src/filter_bank_spectral_subtraction.o \
./tflm/signal/src/filter_bank_square_root.o \
./tflm/signal/src/irfft_int16.o \
./tflm/signal/src/log.o \
./tflm/signal/src/max_abs.o \
./tflm/signal/src/msb_32.o \
./tflm/signal/src/msb_64.o \
./tflm/signal/src/pcan_argc_fixed.o \
./tflm/signal/src/rfft_int16.o \
./tflm/signal/src/square_root_32.o \
./tflm/signal/src/square_root_64.o \
./tflm/signal/src/window.o 

MAP += \
tc25_v1_0D.map 


# Each subdirectory must supply rules for building sources it contributes
tflm/signal/src/%.o: ../tflm/signal/src/%.cc
	$(file > $@.in,-mthumb -mfloat-abi=hard -march=armv8.1-m.main+mve.fp+fp.dp -O2 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -Wall -g -gdwarf-4 -D_RA_CORE=CM85 -D_RA_ORDINAL=1 -D_RAFSP_EK_RA8D1_ -D_RENESAS_RA_ -DFIXED_POINT=16 -DCMSIS_NN -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/ra/arm/CMSIS_6/CMSIS/Core/Include" -I"." -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/src" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/ra/fsp/inc" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/ra/fsp/inc/api" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/ra/fsp/inc/instances" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/ra_gen" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/ra_cfg/fsp_cfg/bsp" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/ra_cfg/fsp_cfg" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/mtk3_bsp2" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/mtk3_bsp2/config" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/mtk3_bsp2/config/config_bsp" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/mtk3_bsp2/include" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/mtk3_bsp2/mtkernel/include" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/mtk3_bsp2/mtkernel/kernel/knlinc" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/Application/include" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/tflm/third_party" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/tflm/tensorflow" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/tflm" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/tflm/third_party/gemmlowp" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/tflm/third_party/gemmlowp/fixedpoint" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/script" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/tflm/tensorflow/lite/micro/kernels" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/tflm/third_party/cmsis_nn/Include" -std=c++14 -fabi-version=0 --param=min-pagesize=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" -x c++ "$<")
	@echo Building file: $< && arm-none-eabi-g++ @"$@.in"

