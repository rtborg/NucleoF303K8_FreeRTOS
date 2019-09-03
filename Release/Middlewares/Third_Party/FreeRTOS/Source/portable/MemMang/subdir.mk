################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Middlewares/Third_Party/FreeRTOS/Source/portable/MemMang/heap_4.c 

OBJS += \
./Middlewares/Third_Party/FreeRTOS/Source/portable/MemMang/heap_4.o 

C_DEPS += \
./Middlewares/Third_Party/FreeRTOS/Source/portable/MemMang/heap_4.d 


# Each subdirectory must supply rules for building sources it contributes
Middlewares/Third_Party/FreeRTOS/Source/portable/MemMang/%.o: ../Middlewares/Third_Party/FreeRTOS/Source/portable/MemMang/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM Cross C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -D__weak='__attribute__((weak))' -DSTM32F303x8 -D__packed='__attribute__((packed))' -DUSE_HAL_DRIVER -DSTM32F303K8Tx -DNUCLEO_F303K8 -DUSE_STDPERIPH_DRIVER -I"C:\Users\Borislav\Documents\STM32\EclipseWorkspace\NucleoF303K8_FreeRTOS\Drivers\CMSIS\Device\ST\STM32F3xx\Include" -I"C:\Users\Borislav\Documents\STM32\EclipseWorkspace\NucleoF303K8_FreeRTOS\Middlewares\Third_Party\FreeRTOS\Source\portable\GCC\ARM_CM4F" -I"C:\Users\Borislav\Documents\STM32\EclipseWorkspace\NucleoF303K8_FreeRTOS\Drivers\CMSIS\Include" -I"C:\Users\Borislav\Documents\STM32\EclipseWorkspace\NucleoF303K8_FreeRTOS\Drivers\STM32F3xx_HAL_Driver\Inc" -I"C:\Users\Borislav\Documents\STM32\EclipseWorkspace\NucleoF303K8_FreeRTOS\Drivers\STM32F3xx_HAL_Driver\Inc\Legacy" -I"C:\Users\Borislav\Documents\STM32\EclipseWorkspace\NucleoF303K8_FreeRTOS\Inc" -I"C:\Users\Borislav\Documents\STM32\EclipseWorkspace\NucleoF303K8_FreeRTOS\Middlewares\Third_Party\FreeRTOS\Source\include" -std=gnu11 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


