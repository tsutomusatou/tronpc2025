################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../mtk3_bsp2/mtkernel/kernel/tkernel/cpuctl.c \
../mtk3_bsp2/mtkernel/kernel/tkernel/device.c \
../mtk3_bsp2/mtkernel/kernel/tkernel/deviceio.c \
../mtk3_bsp2/mtkernel/kernel/tkernel/eventflag.c \
../mtk3_bsp2/mtkernel/kernel/tkernel/int.c \
../mtk3_bsp2/mtkernel/kernel/tkernel/klock.c \
../mtk3_bsp2/mtkernel/kernel/tkernel/mailbox.c \
../mtk3_bsp2/mtkernel/kernel/tkernel/memory.c \
../mtk3_bsp2/mtkernel/kernel/tkernel/mempfix.c \
../mtk3_bsp2/mtkernel/kernel/tkernel/mempool.c \
../mtk3_bsp2/mtkernel/kernel/tkernel/messagebuf.c \
../mtk3_bsp2/mtkernel/kernel/tkernel/misc_calls.c \
../mtk3_bsp2/mtkernel/kernel/tkernel/mutex.c \
../mtk3_bsp2/mtkernel/kernel/tkernel/objname.c \
../mtk3_bsp2/mtkernel/kernel/tkernel/power.c \
../mtk3_bsp2/mtkernel/kernel/tkernel/rendezvous.c \
../mtk3_bsp2/mtkernel/kernel/tkernel/semaphore.c \
../mtk3_bsp2/mtkernel/kernel/tkernel/task.c \
../mtk3_bsp2/mtkernel/kernel/tkernel/task_manage.c \
../mtk3_bsp2/mtkernel/kernel/tkernel/task_sync.c \
../mtk3_bsp2/mtkernel/kernel/tkernel/time_calls.c \
../mtk3_bsp2/mtkernel/kernel/tkernel/timer.c \
../mtk3_bsp2/mtkernel/kernel/tkernel/tkinit.c \
../mtk3_bsp2/mtkernel/kernel/tkernel/wait.c 

SREC += \
tc25_v1_0D.srec 

C_DEPS += \
./mtk3_bsp2/mtkernel/kernel/tkernel/cpuctl.d \
./mtk3_bsp2/mtkernel/kernel/tkernel/device.d \
./mtk3_bsp2/mtkernel/kernel/tkernel/deviceio.d \
./mtk3_bsp2/mtkernel/kernel/tkernel/eventflag.d \
./mtk3_bsp2/mtkernel/kernel/tkernel/int.d \
./mtk3_bsp2/mtkernel/kernel/tkernel/klock.d \
./mtk3_bsp2/mtkernel/kernel/tkernel/mailbox.d \
./mtk3_bsp2/mtkernel/kernel/tkernel/memory.d \
./mtk3_bsp2/mtkernel/kernel/tkernel/mempfix.d \
./mtk3_bsp2/mtkernel/kernel/tkernel/mempool.d \
./mtk3_bsp2/mtkernel/kernel/tkernel/messagebuf.d \
./mtk3_bsp2/mtkernel/kernel/tkernel/misc_calls.d \
./mtk3_bsp2/mtkernel/kernel/tkernel/mutex.d \
./mtk3_bsp2/mtkernel/kernel/tkernel/objname.d \
./mtk3_bsp2/mtkernel/kernel/tkernel/power.d \
./mtk3_bsp2/mtkernel/kernel/tkernel/rendezvous.d \
./mtk3_bsp2/mtkernel/kernel/tkernel/semaphore.d \
./mtk3_bsp2/mtkernel/kernel/tkernel/task.d \
./mtk3_bsp2/mtkernel/kernel/tkernel/task_manage.d \
./mtk3_bsp2/mtkernel/kernel/tkernel/task_sync.d \
./mtk3_bsp2/mtkernel/kernel/tkernel/time_calls.d \
./mtk3_bsp2/mtkernel/kernel/tkernel/timer.d \
./mtk3_bsp2/mtkernel/kernel/tkernel/tkinit.d \
./mtk3_bsp2/mtkernel/kernel/tkernel/wait.d 

OBJS += \
./mtk3_bsp2/mtkernel/kernel/tkernel/cpuctl.o \
./mtk3_bsp2/mtkernel/kernel/tkernel/device.o \
./mtk3_bsp2/mtkernel/kernel/tkernel/deviceio.o \
./mtk3_bsp2/mtkernel/kernel/tkernel/eventflag.o \
./mtk3_bsp2/mtkernel/kernel/tkernel/int.o \
./mtk3_bsp2/mtkernel/kernel/tkernel/klock.o \
./mtk3_bsp2/mtkernel/kernel/tkernel/mailbox.o \
./mtk3_bsp2/mtkernel/kernel/tkernel/memory.o \
./mtk3_bsp2/mtkernel/kernel/tkernel/mempfix.o \
./mtk3_bsp2/mtkernel/kernel/tkernel/mempool.o \
./mtk3_bsp2/mtkernel/kernel/tkernel/messagebuf.o \
./mtk3_bsp2/mtkernel/kernel/tkernel/misc_calls.o \
./mtk3_bsp2/mtkernel/kernel/tkernel/mutex.o \
./mtk3_bsp2/mtkernel/kernel/tkernel/objname.o \
./mtk3_bsp2/mtkernel/kernel/tkernel/power.o \
./mtk3_bsp2/mtkernel/kernel/tkernel/rendezvous.o \
./mtk3_bsp2/mtkernel/kernel/tkernel/semaphore.o \
./mtk3_bsp2/mtkernel/kernel/tkernel/task.o \
./mtk3_bsp2/mtkernel/kernel/tkernel/task_manage.o \
./mtk3_bsp2/mtkernel/kernel/tkernel/task_sync.o \
./mtk3_bsp2/mtkernel/kernel/tkernel/time_calls.o \
./mtk3_bsp2/mtkernel/kernel/tkernel/timer.o \
./mtk3_bsp2/mtkernel/kernel/tkernel/tkinit.o \
./mtk3_bsp2/mtkernel/kernel/tkernel/wait.o 

MAP += \
tc25_v1_0D.map 


# Each subdirectory must supply rules for building sources it contributes
mtk3_bsp2/mtkernel/kernel/tkernel/%.o: ../mtk3_bsp2/mtkernel/kernel/tkernel/%.c
	$(file > $@.in,-mthumb -mfloat-abi=hard -march=armv8.1-m.main+mve.fp+fp.dp -O2 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -Wall -g -gdwarf-4 -D_RENESAS_RA_ -D_RA_CORE=CM85 -D_RA_ORDINAL=1 -D_RAFSP_EK_RA8D1_ -DFIXED_POINT=16 -DCMSIS_NN -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/src" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/ra/fsp/inc" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/ra/fsp/inc/api" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/ra/fsp/inc/instances" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/ra_gen" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/ra_cfg/fsp_cfg/bsp" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/ra_cfg/fsp_cfg" -I"." -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/ra/arm/CMSIS_6/CMSIS/Core/Include" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/mtk3_bsp2" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/mtk3_bsp2/config" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/mtk3_bsp2/config/config_bsp" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/mtk3_bsp2/include" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/mtk3_bsp2/mtkernel/include" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/mtk3_bsp2/mtkernel/kernel/knlinc" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/Application/include" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/tflm" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/tflm/tensorflow" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/tflm/third_party" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/tflm/third_party/gemmlowp" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/tflm/third_party/gemmlowp/fixedpoint" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/script" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/tflm/tensorflow/lite/micro/kernels" -I"C:/Users/tsuto/e2_studio/workspace/tc25_v1_0D/tflm/third_party/cmsis_nn/Include" -std=c99 -Wno-stringop-overflow -Wno-format-truncation --param=min-pagesize=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" -x c "$<")
	@echo Building file: $< && arm-none-eabi-gcc @"$@.in"

