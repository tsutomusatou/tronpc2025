################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
S_UPPER_SRCS += \
../mtk3_bsp2/mtkernel/kernel/sysdepend/cpu/core/armv7a/dispatch.S \
../mtk3_bsp2/mtkernel/kernel/sysdepend/cpu/core/armv7a/exc_entry.S \
../mtk3_bsp2/mtkernel/kernel/sysdepend/cpu/core/armv7a/int_asm.S \
../mtk3_bsp2/mtkernel/kernel/sysdepend/cpu/core/armv7a/reset_hdl.S \
../mtk3_bsp2/mtkernel/kernel/sysdepend/cpu/core/armv7a/vector_tbl.S 

C_SRCS += \
../mtk3_bsp2/mtkernel/kernel/sysdepend/cpu/core/armv7a/cpu_cntl.c \
../mtk3_bsp2/mtkernel/kernel/sysdepend/cpu/core/armv7a/exc_hdl.c \
../mtk3_bsp2/mtkernel/kernel/sysdepend/cpu/core/armv7a/interrupt.c \
../mtk3_bsp2/mtkernel/kernel/sysdepend/cpu/core/armv7a/reset_main.c 

SREC += \
tc25_v1_0D.srec 

C_DEPS += \
./mtk3_bsp2/mtkernel/kernel/sysdepend/cpu/core/armv7a/cpu_cntl.d \
./mtk3_bsp2/mtkernel/kernel/sysdepend/cpu/core/armv7a/exc_hdl.d \
./mtk3_bsp2/mtkernel/kernel/sysdepend/cpu/core/armv7a/interrupt.d \
./mtk3_bsp2/mtkernel/kernel/sysdepend/cpu/core/armv7a/reset_main.d 

OBJS += \
./mtk3_bsp2/mtkernel/kernel/sysdepend/cpu/core/armv7a/cpu_cntl.o \
./mtk3_bsp2/mtkernel/kernel/sysdepend/cpu/core/armv7a/dispatch.o \
./mtk3_bsp2/mtkernel/kernel/sysdepend/cpu/core/armv7a/exc_entry.o \
./mtk3_bsp2/mtkernel/kernel/sysdepend/cpu/core/armv7a/exc_hdl.o \
./mtk3_bsp2/mtkernel/kernel/sysdepend/cpu/core/armv7a/int_asm.o \
./mtk3_bsp2/mtkernel/kernel/sysdepend/cpu/core/armv7a/interrupt.o \
./mtk3_bsp2/mtkernel/kernel/sysdepend/cpu/core/armv7a/reset_hdl.o \
./mtk3_bsp2/mtkernel/kernel/sysdepend/cpu/core/armv7a/reset_main.o \
./mtk3_bsp2/mtkernel/kernel/sysdepend/cpu/core/armv7a/vector_tbl.o 

S_UPPER_DEPS += \
./mtk3_bsp2/mtkernel/kernel/sysdepend/cpu/core/armv7a/dispatch.d \
./mtk3_bsp2/mtkernel/kernel/sysdepend/cpu/core/armv7a/exc_entry.d \
./mtk3_bsp2/mtkernel/kernel/sysdepend/cpu/core/armv7a/int_asm.d \
./mtk3_bsp2/mtkernel/kernel/sysdepend/cpu/core/armv7a/reset_hdl.d \
./mtk3_bsp2/mtkernel/kernel/sysdepend/cpu/core/armv7a/vector_tbl.d 

MAP += \
tc25_v1_0D.map 


# Each subdirectory must supply rules for building sources it contributes
mtk3_bsp2/mtkernel/kernel/sysdepend/cpu/core/armv7a/%.o: ../mtk3_bsp2/mtkernel/kernel/sysdepend/cpu/core/armv7a/%.c
	$(file > $@.in,-mthumb -mfloat-abi=hard -march=armv8.1-m.main+mve.fp+fp.dp -O2 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -Wall -g -gdwarf-4 -D_RENESAS_RA_ -D_RA_CORE=CM85 -D_RA_ORDINAL=1 -D_RAFSP_EK_RA8D1_ -DFIXED_POINT=16 -DCMSIS_NN -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/src" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/ra/fsp/inc" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/ra/fsp/inc/api" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/ra/fsp/inc/instances" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/ra_gen" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/ra_cfg/fsp_cfg/bsp" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/ra_cfg/fsp_cfg" -I"." -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/ra/arm/CMSIS_6/CMSIS/Core/Include" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/mtk3_bsp2" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/mtk3_bsp2/config" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/mtk3_bsp2/config/config_bsp" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/mtk3_bsp2/include" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/mtk3_bsp2/mtkernel/include" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/mtk3_bsp2/mtkernel/kernel/knlinc" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/Application/include" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/tflm" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/tflm/tensorflow" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/tflm/third_party" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/tflm/third_party/gemmlowp" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/tflm/third_party/gemmlowp/fixedpoint" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/script" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/tflm/tensorflow/lite/micro/kernels" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/tflm/third_party/cmsis_nn/Include" -std=c99 -Wno-stringop-overflow -Wno-format-truncation --param=min-pagesize=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" -x c "$<")
	@echo Building file: $< && arm-none-eabi-gcc @"$@.in"
mtk3_bsp2/mtkernel/kernel/sysdepend/cpu/core/armv7a/%.o: ../mtk3_bsp2/mtkernel/kernel/sysdepend/cpu/core/armv7a/%.S
	$(file > $@.in,-mthumb -mfloat-abi=hard -march=armv8.1-m.main+mve.fp+fp.dp -O2 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -Wall -g -gdwarf-4 -x assembler-with-cpp -D_RENESAS_RA_ -D_RA_CORE=CM85 -D_RA_ORDINAL=1 -D_RAFSP_EK_RA8D1_ -DFIXED_POINT=16 -DCMSIS_NN -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/src" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/ra/fsp/inc" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/ra/fsp/inc/api" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/ra/fsp/inc/instances" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/ra_gen" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/ra_cfg/fsp_cfg/bsp" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/ra_cfg/fsp_cfg" -I"." -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/ra/arm/CMSIS_6/CMSIS/Core/Include" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/mtk3_bsp2" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/mtk3_bsp2/config" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/mtk3_bsp2/include" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/mtk3_bsp2/mtkernel/kernel/knlinc" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/Application/include" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/tflm" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/tflm/tensorflow" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/mtk3_bsp2/mtkernel/include" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/tflm/third_party" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/tflm/tensorflow/lite/micro/kernels" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/mtk3_bsp2/config/config_bsp" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/tflm/third_party/gemmlowp" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/tflm/third_party/gemmlowp/fixedpoint" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/tflm/third_party/cmsis_nn/Include" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/script" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" "$<")
	@echo Building file: $< && arm-none-eabi-gcc @"$@.in"

