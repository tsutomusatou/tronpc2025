################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../tflm/third_party/cmsis_nn/Source/NNSupportFunctions/arm_nn_depthwise_conv_nt_t_padded_s8.c \
../tflm/third_party/cmsis_nn/Source/NNSupportFunctions/arm_nn_depthwise_conv_nt_t_s16.c \
../tflm/third_party/cmsis_nn/Source/NNSupportFunctions/arm_nn_depthwise_conv_nt_t_s4.c \
../tflm/third_party/cmsis_nn/Source/NNSupportFunctions/arm_nn_depthwise_conv_nt_t_s8.c \
../tflm/third_party/cmsis_nn/Source/NNSupportFunctions/arm_nn_lstm_calculate_gate_s16.c \
../tflm/third_party/cmsis_nn/Source/NNSupportFunctions/arm_nn_lstm_calculate_gate_s8_s16.c \
../tflm/third_party/cmsis_nn/Source/NNSupportFunctions/arm_nn_lstm_step_s16.c \
../tflm/third_party/cmsis_nn/Source/NNSupportFunctions/arm_nn_lstm_step_s8.c \
../tflm/third_party/cmsis_nn/Source/NNSupportFunctions/arm_nn_mat_mul_core_1x_s4.c \
../tflm/third_party/cmsis_nn/Source/NNSupportFunctions/arm_nn_mat_mul_core_1x_s8.c \
../tflm/third_party/cmsis_nn/Source/NNSupportFunctions/arm_nn_mat_mul_core_4x_s8.c \
../tflm/third_party/cmsis_nn/Source/NNSupportFunctions/arm_nn_mat_mult_nt_interleaved_t_even_s4.c \
../tflm/third_party/cmsis_nn/Source/NNSupportFunctions/arm_nn_mat_mult_nt_t_s16.c \
../tflm/third_party/cmsis_nn/Source/NNSupportFunctions/arm_nn_mat_mult_nt_t_s4.c \
../tflm/third_party/cmsis_nn/Source/NNSupportFunctions/arm_nn_mat_mult_nt_t_s8.c \
../tflm/third_party/cmsis_nn/Source/NNSupportFunctions/arm_nn_mat_mult_nt_t_s8_s32.c \
../tflm/third_party/cmsis_nn/Source/NNSupportFunctions/arm_nn_transpose_conv_row_s8_s32.c \
../tflm/third_party/cmsis_nn/Source/NNSupportFunctions/arm_nn_vec_mat_mul_result_acc_s16.c \
../tflm/third_party/cmsis_nn/Source/NNSupportFunctions/arm_nn_vec_mat_mul_result_acc_s8_s16.c \
../tflm/third_party/cmsis_nn/Source/NNSupportFunctions/arm_nn_vec_mat_mult_t_per_ch_s8.c \
../tflm/third_party/cmsis_nn/Source/NNSupportFunctions/arm_nn_vec_mat_mult_t_s16.c \
../tflm/third_party/cmsis_nn/Source/NNSupportFunctions/arm_nn_vec_mat_mult_t_s16_s16.c \
../tflm/third_party/cmsis_nn/Source/NNSupportFunctions/arm_nn_vec_mat_mult_t_s4.c \
../tflm/third_party/cmsis_nn/Source/NNSupportFunctions/arm_nn_vec_mat_mult_t_s8.c \
../tflm/third_party/cmsis_nn/Source/NNSupportFunctions/arm_nn_vec_mat_mult_t_svdf_s8.c \
../tflm/third_party/cmsis_nn/Source/NNSupportFunctions/arm_nntables.c \
../tflm/third_party/cmsis_nn/Source/NNSupportFunctions/arm_q7_to_q15_with_offset.c \
../tflm/third_party/cmsis_nn/Source/NNSupportFunctions/arm_s8_to_s16_unordered_with_offset.c 

SREC += \
tc25_v1_0D.srec 

C_DEPS += \
./tflm/third_party/cmsis_nn/Source/NNSupportFunctions/arm_nn_depthwise_conv_nt_t_padded_s8.d \
./tflm/third_party/cmsis_nn/Source/NNSupportFunctions/arm_nn_depthwise_conv_nt_t_s16.d \
./tflm/third_party/cmsis_nn/Source/NNSupportFunctions/arm_nn_depthwise_conv_nt_t_s4.d \
./tflm/third_party/cmsis_nn/Source/NNSupportFunctions/arm_nn_depthwise_conv_nt_t_s8.d \
./tflm/third_party/cmsis_nn/Source/NNSupportFunctions/arm_nn_lstm_calculate_gate_s16.d \
./tflm/third_party/cmsis_nn/Source/NNSupportFunctions/arm_nn_lstm_calculate_gate_s8_s16.d \
./tflm/third_party/cmsis_nn/Source/NNSupportFunctions/arm_nn_lstm_step_s16.d \
./tflm/third_party/cmsis_nn/Source/NNSupportFunctions/arm_nn_lstm_step_s8.d \
./tflm/third_party/cmsis_nn/Source/NNSupportFunctions/arm_nn_mat_mul_core_1x_s4.d \
./tflm/third_party/cmsis_nn/Source/NNSupportFunctions/arm_nn_mat_mul_core_1x_s8.d \
./tflm/third_party/cmsis_nn/Source/NNSupportFunctions/arm_nn_mat_mul_core_4x_s8.d \
./tflm/third_party/cmsis_nn/Source/NNSupportFunctions/arm_nn_mat_mult_nt_interleaved_t_even_s4.d \
./tflm/third_party/cmsis_nn/Source/NNSupportFunctions/arm_nn_mat_mult_nt_t_s16.d \
./tflm/third_party/cmsis_nn/Source/NNSupportFunctions/arm_nn_mat_mult_nt_t_s4.d \
./tflm/third_party/cmsis_nn/Source/NNSupportFunctions/arm_nn_mat_mult_nt_t_s8.d \
./tflm/third_party/cmsis_nn/Source/NNSupportFunctions/arm_nn_mat_mult_nt_t_s8_s32.d \
./tflm/third_party/cmsis_nn/Source/NNSupportFunctions/arm_nn_transpose_conv_row_s8_s32.d \
./tflm/third_party/cmsis_nn/Source/NNSupportFunctions/arm_nn_vec_mat_mul_result_acc_s16.d \
./tflm/third_party/cmsis_nn/Source/NNSupportFunctions/arm_nn_vec_mat_mul_result_acc_s8_s16.d \
./tflm/third_party/cmsis_nn/Source/NNSupportFunctions/arm_nn_vec_mat_mult_t_per_ch_s8.d \
./tflm/third_party/cmsis_nn/Source/NNSupportFunctions/arm_nn_vec_mat_mult_t_s16.d \
./tflm/third_party/cmsis_nn/Source/NNSupportFunctions/arm_nn_vec_mat_mult_t_s16_s16.d \
./tflm/third_party/cmsis_nn/Source/NNSupportFunctions/arm_nn_vec_mat_mult_t_s4.d \
./tflm/third_party/cmsis_nn/Source/NNSupportFunctions/arm_nn_vec_mat_mult_t_s8.d \
./tflm/third_party/cmsis_nn/Source/NNSupportFunctions/arm_nn_vec_mat_mult_t_svdf_s8.d \
./tflm/third_party/cmsis_nn/Source/NNSupportFunctions/arm_nntables.d \
./tflm/third_party/cmsis_nn/Source/NNSupportFunctions/arm_q7_to_q15_with_offset.d \
./tflm/third_party/cmsis_nn/Source/NNSupportFunctions/arm_s8_to_s16_unordered_with_offset.d 

OBJS += \
./tflm/third_party/cmsis_nn/Source/NNSupportFunctions/arm_nn_depthwise_conv_nt_t_padded_s8.o \
./tflm/third_party/cmsis_nn/Source/NNSupportFunctions/arm_nn_depthwise_conv_nt_t_s16.o \
./tflm/third_party/cmsis_nn/Source/NNSupportFunctions/arm_nn_depthwise_conv_nt_t_s4.o \
./tflm/third_party/cmsis_nn/Source/NNSupportFunctions/arm_nn_depthwise_conv_nt_t_s8.o \
./tflm/third_party/cmsis_nn/Source/NNSupportFunctions/arm_nn_lstm_calculate_gate_s16.o \
./tflm/third_party/cmsis_nn/Source/NNSupportFunctions/arm_nn_lstm_calculate_gate_s8_s16.o \
./tflm/third_party/cmsis_nn/Source/NNSupportFunctions/arm_nn_lstm_step_s16.o \
./tflm/third_party/cmsis_nn/Source/NNSupportFunctions/arm_nn_lstm_step_s8.o \
./tflm/third_party/cmsis_nn/Source/NNSupportFunctions/arm_nn_mat_mul_core_1x_s4.o \
./tflm/third_party/cmsis_nn/Source/NNSupportFunctions/arm_nn_mat_mul_core_1x_s8.o \
./tflm/third_party/cmsis_nn/Source/NNSupportFunctions/arm_nn_mat_mul_core_4x_s8.o \
./tflm/third_party/cmsis_nn/Source/NNSupportFunctions/arm_nn_mat_mult_nt_interleaved_t_even_s4.o \
./tflm/third_party/cmsis_nn/Source/NNSupportFunctions/arm_nn_mat_mult_nt_t_s16.o \
./tflm/third_party/cmsis_nn/Source/NNSupportFunctions/arm_nn_mat_mult_nt_t_s4.o \
./tflm/third_party/cmsis_nn/Source/NNSupportFunctions/arm_nn_mat_mult_nt_t_s8.o \
./tflm/third_party/cmsis_nn/Source/NNSupportFunctions/arm_nn_mat_mult_nt_t_s8_s32.o \
./tflm/third_party/cmsis_nn/Source/NNSupportFunctions/arm_nn_transpose_conv_row_s8_s32.o \
./tflm/third_party/cmsis_nn/Source/NNSupportFunctions/arm_nn_vec_mat_mul_result_acc_s16.o \
./tflm/third_party/cmsis_nn/Source/NNSupportFunctions/arm_nn_vec_mat_mul_result_acc_s8_s16.o \
./tflm/third_party/cmsis_nn/Source/NNSupportFunctions/arm_nn_vec_mat_mult_t_per_ch_s8.o \
./tflm/third_party/cmsis_nn/Source/NNSupportFunctions/arm_nn_vec_mat_mult_t_s16.o \
./tflm/third_party/cmsis_nn/Source/NNSupportFunctions/arm_nn_vec_mat_mult_t_s16_s16.o \
./tflm/third_party/cmsis_nn/Source/NNSupportFunctions/arm_nn_vec_mat_mult_t_s4.o \
./tflm/third_party/cmsis_nn/Source/NNSupportFunctions/arm_nn_vec_mat_mult_t_s8.o \
./tflm/third_party/cmsis_nn/Source/NNSupportFunctions/arm_nn_vec_mat_mult_t_svdf_s8.o \
./tflm/third_party/cmsis_nn/Source/NNSupportFunctions/arm_nntables.o \
./tflm/third_party/cmsis_nn/Source/NNSupportFunctions/arm_q7_to_q15_with_offset.o \
./tflm/third_party/cmsis_nn/Source/NNSupportFunctions/arm_s8_to_s16_unordered_with_offset.o 

MAP += \
tc25_v1_0D.map 


# Each subdirectory must supply rules for building sources it contributes
tflm/third_party/cmsis_nn/Source/NNSupportFunctions/%.o: ../tflm/third_party/cmsis_nn/Source/NNSupportFunctions/%.c
	$(file > $@.in,-mthumb -mfloat-abi=hard -march=armv8.1-m.main+mve.fp+fp.dp -O2 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -Wall -g -gdwarf-4 -D_RENESAS_RA_ -D_RA_CORE=CM85 -D_RA_ORDINAL=1 -D_RAFSP_EK_RA8D1_ -DFIXED_POINT=16 -DCMSIS_NN -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/src" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/ra/fsp/inc" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/ra/fsp/inc/api" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/ra/fsp/inc/instances" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/ra_gen" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/ra_cfg/fsp_cfg/bsp" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/ra_cfg/fsp_cfg" -I"." -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/ra/arm/CMSIS_6/CMSIS/Core/Include" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/mtk3_bsp2" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/mtk3_bsp2/config" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/mtk3_bsp2/config/config_bsp" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/mtk3_bsp2/include" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/mtk3_bsp2/mtkernel/include" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/mtk3_bsp2/mtkernel/kernel/knlinc" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/Application/include" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/tflm" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/tflm/tensorflow" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/tflm/third_party" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/tflm/third_party/gemmlowp" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/tflm/third_party/gemmlowp/fixedpoint" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/script" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/tflm/tensorflow/lite/micro/kernels" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/tflm/third_party/cmsis_nn/Include" -std=c99 -Wno-stringop-overflow -Wno-format-truncation --param=min-pagesize=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" -x c "$<")
	@echo Building file: $< && arm-none-eabi-gcc @"$@.in"

