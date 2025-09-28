################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../src/tflm_runner.cpp 

CC_SRCS += \
../src/audio_provider.cc 

C_SRCS += \
../src/gt911.c \
../src/hal_entry.c \
../src/mipi_dsi_ep.c \
../src/ssi_mic.c \
../src/uart_dfplayer.c \
../src/uart_raspi.c 

SREC += \
tc25_v1_0D.srec 

C_DEPS += \
./src/gt911.d \
./src/hal_entry.d \
./src/mipi_dsi_ep.d \
./src/ssi_mic.d \
./src/uart_dfplayer.d \
./src/uart_raspi.d 

CC_DEPS += \
./src/audio_provider.d 

OBJS += \
./src/audio_provider.o \
./src/gt911.o \
./src/hal_entry.o \
./src/mipi_dsi_ep.o \
./src/ssi_mic.o \
./src/tflm_runner.o \
./src/uart_dfplayer.o \
./src/uart_raspi.o 

MAP += \
tc25_v1_0D.map 

CPP_DEPS += \
./src/tflm_runner.d 


# Each subdirectory must supply rules for building sources it contributes
src/%.o: ../src/%.cc
	$(file > $@.in,-mthumb -mfloat-abi=hard -march=armv8.1-m.main+mve.fp+fp.dp -O2 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -Wall -g -gdwarf-4 -D_RA_CORE=CM85 -D_RA_ORDINAL=1 -D_RAFSP_EK_RA8D1_ -D_RENESAS_RA_ -DFIXED_POINT=16 -DCMSIS_NN -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/ra/arm/CMSIS_6/CMSIS/Core/Include" -I"." -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/src" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/ra/fsp/inc" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/ra/fsp/inc/api" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/ra/fsp/inc/instances" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/ra_gen" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/ra_cfg/fsp_cfg/bsp" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/ra_cfg/fsp_cfg" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/mtk3_bsp2" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/mtk3_bsp2/config" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/mtk3_bsp2/config/config_bsp" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/mtk3_bsp2/include" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/mtk3_bsp2/mtkernel/include" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/mtk3_bsp2/mtkernel/kernel/knlinc" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/Application/include" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/tflm/third_party" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/tflm/tensorflow" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/tflm" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/tflm/third_party/gemmlowp" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/tflm/third_party/gemmlowp/fixedpoint" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/script" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/tflm/tensorflow/lite/micro/kernels" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/tflm/third_party/cmsis_nn/Include" -std=c++14 -fabi-version=0 --param=min-pagesize=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" -x c++ "$<")
	@echo Building file: $< && arm-none-eabi-g++ @"$@.in"
src/%.o: ../src/%.c
	$(file > $@.in,-mthumb -mfloat-abi=hard -march=armv8.1-m.main+mve.fp+fp.dp -O2 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -Wall -g -gdwarf-4 -D_RENESAS_RA_ -D_RA_CORE=CM85 -D_RA_ORDINAL=1 -D_RAFSP_EK_RA8D1_ -DFIXED_POINT=16 -DCMSIS_NN -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/src" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/ra/fsp/inc" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/ra/fsp/inc/api" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/ra/fsp/inc/instances" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/ra_gen" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/ra_cfg/fsp_cfg/bsp" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/ra_cfg/fsp_cfg" -I"." -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/ra/arm/CMSIS_6/CMSIS/Core/Include" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/mtk3_bsp2" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/mtk3_bsp2/config" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/mtk3_bsp2/config/config_bsp" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/mtk3_bsp2/include" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/mtk3_bsp2/mtkernel/include" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/mtk3_bsp2/mtkernel/kernel/knlinc" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/Application/include" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/tflm" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/tflm/tensorflow" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/tflm/third_party" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/tflm/third_party/gemmlowp" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/tflm/third_party/gemmlowp/fixedpoint" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/script" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/tflm/tensorflow/lite/micro/kernels" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/tflm/third_party/cmsis_nn/Include" -std=c99 -Wno-stringop-overflow -Wno-format-truncation --param=min-pagesize=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" -x c "$<")
	@echo Building file: $< && arm-none-eabi-gcc @"$@.in"
src/%.o: ../src/%.cpp
	$(file > $@.in,-mthumb -mfloat-abi=hard -march=armv8.1-m.main+mve.fp+fp.dp -O2 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -Wall -g -gdwarf-4 -D_RA_CORE=CM85 -D_RA_ORDINAL=1 -D_RAFSP_EK_RA8D1_ -D_RENESAS_RA_ -DFIXED_POINT=16 -DCMSIS_NN -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/ra/arm/CMSIS_6/CMSIS/Core/Include" -I"." -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/src" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/ra/fsp/inc" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/ra/fsp/inc/api" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/ra/fsp/inc/instances" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/ra_gen" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/ra_cfg/fsp_cfg/bsp" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/ra_cfg/fsp_cfg" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/mtk3_bsp2" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/mtk3_bsp2/config" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/mtk3_bsp2/config/config_bsp" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/mtk3_bsp2/include" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/mtk3_bsp2/mtkernel/include" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/mtk3_bsp2/mtkernel/kernel/knlinc" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/Application/include" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/tflm/third_party" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/tflm/tensorflow" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/tflm" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/tflm/third_party/gemmlowp" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/tflm/third_party/gemmlowp/fixedpoint" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/script" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/tflm/tensorflow/lite/micro/kernels" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/tflm/third_party/cmsis_nn/Include" -std=c++14 -fabi-version=0 --param=min-pagesize=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" -x c++ "$<")
	@echo Building file: $< && arm-none-eabi-g++ @"$@.in"

