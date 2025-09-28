################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../tflm/tensorflow/lite/micro/kernels/cmsis_nn/add.cc \
../tflm/tensorflow/lite/micro/kernels/cmsis_nn/batch_matmul.cc \
../tflm/tensorflow/lite/micro/kernels/cmsis_nn/conv.cc \
../tflm/tensorflow/lite/micro/kernels/cmsis_nn/depthwise_conv.cc \
../tflm/tensorflow/lite/micro/kernels/cmsis_nn/fully_connected.cc \
../tflm/tensorflow/lite/micro/kernels/cmsis_nn/maximum_minimum.cc \
../tflm/tensorflow/lite/micro/kernels/cmsis_nn/mul.cc \
../tflm/tensorflow/lite/micro/kernels/cmsis_nn/pad.cc \
../tflm/tensorflow/lite/micro/kernels/cmsis_nn/pooling.cc \
../tflm/tensorflow/lite/micro/kernels/cmsis_nn/softmax.cc \
../tflm/tensorflow/lite/micro/kernels/cmsis_nn/svdf.cc \
../tflm/tensorflow/lite/micro/kernels/cmsis_nn/transpose.cc \
../tflm/tensorflow/lite/micro/kernels/cmsis_nn/transpose_conv.cc \
../tflm/tensorflow/lite/micro/kernels/cmsis_nn/unidirectional_sequence_lstm.cc 

SREC += \
tc25_v1_0D.srec 

CC_DEPS += \
./tflm/tensorflow/lite/micro/kernels/cmsis_nn/add.d \
./tflm/tensorflow/lite/micro/kernels/cmsis_nn/batch_matmul.d \
./tflm/tensorflow/lite/micro/kernels/cmsis_nn/conv.d \
./tflm/tensorflow/lite/micro/kernels/cmsis_nn/depthwise_conv.d \
./tflm/tensorflow/lite/micro/kernels/cmsis_nn/fully_connected.d \
./tflm/tensorflow/lite/micro/kernels/cmsis_nn/maximum_minimum.d \
./tflm/tensorflow/lite/micro/kernels/cmsis_nn/mul.d \
./tflm/tensorflow/lite/micro/kernels/cmsis_nn/pad.d \
./tflm/tensorflow/lite/micro/kernels/cmsis_nn/pooling.d \
./tflm/tensorflow/lite/micro/kernels/cmsis_nn/softmax.d \
./tflm/tensorflow/lite/micro/kernels/cmsis_nn/svdf.d \
./tflm/tensorflow/lite/micro/kernels/cmsis_nn/transpose.d \
./tflm/tensorflow/lite/micro/kernels/cmsis_nn/transpose_conv.d \
./tflm/tensorflow/lite/micro/kernels/cmsis_nn/unidirectional_sequence_lstm.d 

OBJS += \
./tflm/tensorflow/lite/micro/kernels/cmsis_nn/add.o \
./tflm/tensorflow/lite/micro/kernels/cmsis_nn/batch_matmul.o \
./tflm/tensorflow/lite/micro/kernels/cmsis_nn/conv.o \
./tflm/tensorflow/lite/micro/kernels/cmsis_nn/depthwise_conv.o \
./tflm/tensorflow/lite/micro/kernels/cmsis_nn/fully_connected.o \
./tflm/tensorflow/lite/micro/kernels/cmsis_nn/maximum_minimum.o \
./tflm/tensorflow/lite/micro/kernels/cmsis_nn/mul.o \
./tflm/tensorflow/lite/micro/kernels/cmsis_nn/pad.o \
./tflm/tensorflow/lite/micro/kernels/cmsis_nn/pooling.o \
./tflm/tensorflow/lite/micro/kernels/cmsis_nn/softmax.o \
./tflm/tensorflow/lite/micro/kernels/cmsis_nn/svdf.o \
./tflm/tensorflow/lite/micro/kernels/cmsis_nn/transpose.o \
./tflm/tensorflow/lite/micro/kernels/cmsis_nn/transpose_conv.o \
./tflm/tensorflow/lite/micro/kernels/cmsis_nn/unidirectional_sequence_lstm.o 

MAP += \
tc25_v1_0D.map 


# Each subdirectory must supply rules for building sources it contributes
tflm/tensorflow/lite/micro/kernels/cmsis_nn/%.o: ../tflm/tensorflow/lite/micro/kernels/cmsis_nn/%.cc
	$(file > $@.in,-mthumb -mfloat-abi=hard -march=armv8.1-m.main+mve.fp+fp.dp -O2 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -Wall -g -gdwarf-4 -D_RA_CORE=CM85 -D_RA_ORDINAL=1 -D_RAFSP_EK_RA8D1_ -D_RENESAS_RA_ -DFIXED_POINT=16 -DCMSIS_NN -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/ra/arm/CMSIS_6/CMSIS/Core/Include" -I"." -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/src" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/ra/fsp/inc" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/ra/fsp/inc/api" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/ra/fsp/inc/instances" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/ra_gen" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/ra_cfg/fsp_cfg/bsp" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/ra_cfg/fsp_cfg" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/mtk3_bsp2" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/mtk3_bsp2/config" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/mtk3_bsp2/config/config_bsp" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/mtk3_bsp2/include" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/mtk3_bsp2/mtkernel/include" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/mtk3_bsp2/mtkernel/kernel/knlinc" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/Application/include" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/tflm/third_party" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/tflm/tensorflow" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/tflm" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/tflm/third_party/gemmlowp" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/tflm/third_party/gemmlowp/fixedpoint" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/script" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/tflm/tensorflow/lite/micro/kernels" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/tflm/third_party/cmsis_nn/Include" -std=c++14 -fabi-version=0 --param=min-pagesize=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" -x c++ "$<")
	@echo Building file: $< && arm-none-eabi-g++ @"$@.in"

