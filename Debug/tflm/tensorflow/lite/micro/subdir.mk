################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../tflm/tensorflow/lite/micro/all_ops_resolver.cc \
../tflm/tensorflow/lite/micro/debug_log.cc \
../tflm/tensorflow/lite/micro/fake_micro_context.cc \
../tflm/tensorflow/lite/micro/flatbuffer_utils.cc \
../tflm/tensorflow/lite/micro/hexdump.cc \
../tflm/tensorflow/lite/micro/memory_helpers.cc \
../tflm/tensorflow/lite/micro/micro_allocation_info.cc \
../tflm/tensorflow/lite/micro/micro_allocator.cc \
../tflm/tensorflow/lite/micro/micro_context.cc \
../tflm/tensorflow/lite/micro/micro_interpreter.cc \
../tflm/tensorflow/lite/micro/micro_interpreter_context.cc \
../tflm/tensorflow/lite/micro/micro_interpreter_graph.cc \
../tflm/tensorflow/lite/micro/micro_log.cc \
../tflm/tensorflow/lite/micro/micro_op_resolver.cc \
../tflm/tensorflow/lite/micro/micro_profiler.cc \
../tflm/tensorflow/lite/micro/micro_resource_variable.cc \
../tflm/tensorflow/lite/micro/micro_time.cc \
../tflm/tensorflow/lite/micro/micro_utils.cc \
../tflm/tensorflow/lite/micro/mock_micro_graph.cc \
../tflm/tensorflow/lite/micro/recording_micro_allocator.cc \
../tflm/tensorflow/lite/micro/system_setup.cc \
../tflm/tensorflow/lite/micro/test_helper_custom_ops.cc \
../tflm/tensorflow/lite/micro/test_helpers.cc 

SREC += \
tc25_v1_0D.srec 

CC_DEPS += \
./tflm/tensorflow/lite/micro/all_ops_resolver.d \
./tflm/tensorflow/lite/micro/debug_log.d \
./tflm/tensorflow/lite/micro/fake_micro_context.d \
./tflm/tensorflow/lite/micro/flatbuffer_utils.d \
./tflm/tensorflow/lite/micro/hexdump.d \
./tflm/tensorflow/lite/micro/memory_helpers.d \
./tflm/tensorflow/lite/micro/micro_allocation_info.d \
./tflm/tensorflow/lite/micro/micro_allocator.d \
./tflm/tensorflow/lite/micro/micro_context.d \
./tflm/tensorflow/lite/micro/micro_interpreter.d \
./tflm/tensorflow/lite/micro/micro_interpreter_context.d \
./tflm/tensorflow/lite/micro/micro_interpreter_graph.d \
./tflm/tensorflow/lite/micro/micro_log.d \
./tflm/tensorflow/lite/micro/micro_op_resolver.d \
./tflm/tensorflow/lite/micro/micro_profiler.d \
./tflm/tensorflow/lite/micro/micro_resource_variable.d \
./tflm/tensorflow/lite/micro/micro_time.d \
./tflm/tensorflow/lite/micro/micro_utils.d \
./tflm/tensorflow/lite/micro/mock_micro_graph.d \
./tflm/tensorflow/lite/micro/recording_micro_allocator.d \
./tflm/tensorflow/lite/micro/system_setup.d \
./tflm/tensorflow/lite/micro/test_helper_custom_ops.d \
./tflm/tensorflow/lite/micro/test_helpers.d 

OBJS += \
./tflm/tensorflow/lite/micro/all_ops_resolver.o \
./tflm/tensorflow/lite/micro/debug_log.o \
./tflm/tensorflow/lite/micro/fake_micro_context.o \
./tflm/tensorflow/lite/micro/flatbuffer_utils.o \
./tflm/tensorflow/lite/micro/hexdump.o \
./tflm/tensorflow/lite/micro/memory_helpers.o \
./tflm/tensorflow/lite/micro/micro_allocation_info.o \
./tflm/tensorflow/lite/micro/micro_allocator.o \
./tflm/tensorflow/lite/micro/micro_context.o \
./tflm/tensorflow/lite/micro/micro_interpreter.o \
./tflm/tensorflow/lite/micro/micro_interpreter_context.o \
./tflm/tensorflow/lite/micro/micro_interpreter_graph.o \
./tflm/tensorflow/lite/micro/micro_log.o \
./tflm/tensorflow/lite/micro/micro_op_resolver.o \
./tflm/tensorflow/lite/micro/micro_profiler.o \
./tflm/tensorflow/lite/micro/micro_resource_variable.o \
./tflm/tensorflow/lite/micro/micro_time.o \
./tflm/tensorflow/lite/micro/micro_utils.o \
./tflm/tensorflow/lite/micro/mock_micro_graph.o \
./tflm/tensorflow/lite/micro/recording_micro_allocator.o \
./tflm/tensorflow/lite/micro/system_setup.o \
./tflm/tensorflow/lite/micro/test_helper_custom_ops.o \
./tflm/tensorflow/lite/micro/test_helpers.o 

MAP += \
tc25_v1_0D.map 


# Each subdirectory must supply rules for building sources it contributes
tflm/tensorflow/lite/micro/%.o: ../tflm/tensorflow/lite/micro/%.cc
	$(file > $@.in,-mthumb -mfloat-abi=hard -march=armv8.1-m.main+mve.fp+fp.dp -O2 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -Wall -g -gdwarf-4 -D_RA_CORE=CM85 -D_RA_ORDINAL=1 -D_RAFSP_EK_RA8D1_ -D_RENESAS_RA_ -DFIXED_POINT=16 -DCMSIS_NN -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/ra/arm/CMSIS_6/CMSIS/Core/Include" -I"." -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/src" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/ra/fsp/inc" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/ra/fsp/inc/api" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/ra/fsp/inc/instances" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/ra_gen" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/ra_cfg/fsp_cfg/bsp" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/ra_cfg/fsp_cfg" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/mtk3_bsp2" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/mtk3_bsp2/config" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/mtk3_bsp2/config/config_bsp" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/mtk3_bsp2/include" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/mtk3_bsp2/mtkernel/include" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/mtk3_bsp2/mtkernel/kernel/knlinc" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/Application/include" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/tflm/third_party" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/tflm/tensorflow" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/tflm" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/tflm/third_party/gemmlowp" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/tflm/third_party/gemmlowp/fixedpoint" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/script" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/tflm/tensorflow/lite/micro/kernels" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/tflm/third_party/cmsis_nn/Include" -std=c++14 -fabi-version=0 --param=min-pagesize=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" -x c++ "$<")
	@echo Building file: $< && arm-none-eabi-g++ @"$@.in"

