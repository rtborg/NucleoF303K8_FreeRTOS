################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
S_UPPER_SRCS += \
../startup/startup_stm32f303x8.S 

OBJS += \
./startup/startup_stm32f303x8.o 

S_UPPER_DEPS += \
./startup/startup_stm32f303x8.d 


# Each subdirectory must supply rules for building sources it contributes
startup/%.o: ../startup/%.S
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM Cross Assembler'
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -x assembler-with-cpp -D__weak='__attribute__((weak))' -DSTM32F303x8 -D__packed='__attribute__((packed))' -DUSE_HAL_DRIVER -DSTM32F303K8Tx -DNUCLEO_F303K8 -DUSE_STDPERIPH_DRIVER -I"C:\Users\Borislav\Documents\STM32\EclipseWorkspace\NucleoF303K8_FreeRTOS\Drivers\CMSIS\Device\ST\STM32F3xx\Include" -I"C:\Users\Borislav\Documents\STM32\EclipseWorkspace\NucleoF303K8_FreeRTOS\Middlewares\Third_Party\FreeRTOS\Source\portable\GCC\ARM_CM4F" -I"C:\Users\Borislav\Documents\STM32\EclipseWorkspace\NucleoF303K8_FreeRTOS\Drivers\CMSIS\Include" -I"C:\Users\Borislav\Documents\STM32\EclipseWorkspace\NucleoF303K8_FreeRTOS\Drivers\STM32F3xx_HAL_Driver\Inc" -I"C:\Users\Borislav\Documents\STM32\EclipseWorkspace\NucleoF303K8_FreeRTOS\Drivers\STM32F3xx_HAL_Driver\Inc\Legacy" -I"C:\Users\Borislav\Documents\STM32\EclipseWorkspace\NucleoF303K8_FreeRTOS\Inc" -I"C:\Users\Borislav\Documents\STM32\EclipseWorkspace\NucleoF303K8_FreeRTOS\Middlewares\Third_Party\FreeRTOS\Source\include" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


