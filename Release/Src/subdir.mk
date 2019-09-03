################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Src/freertos.c \
../Src/main.c \
../Src/stm32f3xx_hal_msp.c \
../Src/stm32f3xx_hal_timebase_tim.c \
../Src/stm32f3xx_it.c \
../Src/syscalls.c \
../Src/system_stm32f3xx.c 

OBJS += \
./Src/freertos.o \
./Src/main.o \
./Src/stm32f3xx_hal_msp.o \
./Src/stm32f3xx_hal_timebase_tim.o \
./Src/stm32f3xx_it.o \
./Src/syscalls.o \
./Src/system_stm32f3xx.o 

C_DEPS += \
./Src/freertos.d \
./Src/main.d \
./Src/stm32f3xx_hal_msp.d \
./Src/stm32f3xx_hal_timebase_tim.d \
./Src/stm32f3xx_it.d \
./Src/syscalls.d \
./Src/system_stm32f3xx.d 


# Each subdirectory must supply rules for building sources it contributes
Src/%.o: ../Src/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM Cross C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -D__weak='__attribute__((weak))' -DSTM32F303x8 -D__packed='__attribute__((packed))' -DUSE_HAL_DRIVER -DSTM32F303K8Tx -DNUCLEO_F303K8 -DUSE_STDPERIPH_DRIVER -I"C:\Users\Borislav\Documents\STM32\EclipseWorkspace\NucleoF303K8_FreeRTOS\Drivers\CMSIS\Device\ST\STM32F3xx\Include" -I"C:\Users\Borislav\Documents\STM32\EclipseWorkspace\NucleoF303K8_FreeRTOS\Middlewares\Third_Party\FreeRTOS\Source\portable\GCC\ARM_CM4F" -I"C:\Users\Borislav\Documents\STM32\EclipseWorkspace\NucleoF303K8_FreeRTOS\Drivers\CMSIS\Include" -I"C:\Users\Borislav\Documents\STM32\EclipseWorkspace\NucleoF303K8_FreeRTOS\Drivers\STM32F3xx_HAL_Driver\Inc" -I"C:\Users\Borislav\Documents\STM32\EclipseWorkspace\NucleoF303K8_FreeRTOS\Drivers\STM32F3xx_HAL_Driver\Inc\Legacy" -I"C:\Users\Borislav\Documents\STM32\EclipseWorkspace\NucleoF303K8_FreeRTOS\Inc" -I"C:\Users\Borislav\Documents\STM32\EclipseWorkspace\NucleoF303K8_FreeRTOS\Middlewares\Third_Party\FreeRTOS\Source\include" -std=gnu11 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


