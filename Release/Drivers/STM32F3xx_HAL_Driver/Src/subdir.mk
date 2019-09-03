################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/STM32F3xx_HAL_Driver/Src/stm32f3xx_hal.c \
../Drivers/STM32F3xx_HAL_Driver/Src/stm32f3xx_hal_cortex.c \
../Drivers/STM32F3xx_HAL_Driver/Src/stm32f3xx_hal_dma.c \
../Drivers/STM32F3xx_HAL_Driver/Src/stm32f3xx_hal_flash.c \
../Drivers/STM32F3xx_HAL_Driver/Src/stm32f3xx_hal_flash_ex.c \
../Drivers/STM32F3xx_HAL_Driver/Src/stm32f3xx_hal_gpio.c \
../Drivers/STM32F3xx_HAL_Driver/Src/stm32f3xx_hal_i2c.c \
../Drivers/STM32F3xx_HAL_Driver/Src/stm32f3xx_hal_i2c_ex.c \
../Drivers/STM32F3xx_HAL_Driver/Src/stm32f3xx_hal_pwr.c \
../Drivers/STM32F3xx_HAL_Driver/Src/stm32f3xx_hal_pwr_ex.c \
../Drivers/STM32F3xx_HAL_Driver/Src/stm32f3xx_hal_rcc.c \
../Drivers/STM32F3xx_HAL_Driver/Src/stm32f3xx_hal_rcc_ex.c \
../Drivers/STM32F3xx_HAL_Driver/Src/stm32f3xx_hal_tim.c \
../Drivers/STM32F3xx_HAL_Driver/Src/stm32f3xx_hal_tim_ex.c \
../Drivers/STM32F3xx_HAL_Driver/Src/stm32f3xx_hal_uart.c \
../Drivers/STM32F3xx_HAL_Driver/Src/stm32f3xx_hal_uart_ex.c 

OBJS += \
./Drivers/STM32F3xx_HAL_Driver/Src/stm32f3xx_hal.o \
./Drivers/STM32F3xx_HAL_Driver/Src/stm32f3xx_hal_cortex.o \
./Drivers/STM32F3xx_HAL_Driver/Src/stm32f3xx_hal_dma.o \
./Drivers/STM32F3xx_HAL_Driver/Src/stm32f3xx_hal_flash.o \
./Drivers/STM32F3xx_HAL_Driver/Src/stm32f3xx_hal_flash_ex.o \
./Drivers/STM32F3xx_HAL_Driver/Src/stm32f3xx_hal_gpio.o \
./Drivers/STM32F3xx_HAL_Driver/Src/stm32f3xx_hal_i2c.o \
./Drivers/STM32F3xx_HAL_Driver/Src/stm32f3xx_hal_i2c_ex.o \
./Drivers/STM32F3xx_HAL_Driver/Src/stm32f3xx_hal_pwr.o \
./Drivers/STM32F3xx_HAL_Driver/Src/stm32f3xx_hal_pwr_ex.o \
./Drivers/STM32F3xx_HAL_Driver/Src/stm32f3xx_hal_rcc.o \
./Drivers/STM32F3xx_HAL_Driver/Src/stm32f3xx_hal_rcc_ex.o \
./Drivers/STM32F3xx_HAL_Driver/Src/stm32f3xx_hal_tim.o \
./Drivers/STM32F3xx_HAL_Driver/Src/stm32f3xx_hal_tim_ex.o \
./Drivers/STM32F3xx_HAL_Driver/Src/stm32f3xx_hal_uart.o \
./Drivers/STM32F3xx_HAL_Driver/Src/stm32f3xx_hal_uart_ex.o 

C_DEPS += \
./Drivers/STM32F3xx_HAL_Driver/Src/stm32f3xx_hal.d \
./Drivers/STM32F3xx_HAL_Driver/Src/stm32f3xx_hal_cortex.d \
./Drivers/STM32F3xx_HAL_Driver/Src/stm32f3xx_hal_dma.d \
./Drivers/STM32F3xx_HAL_Driver/Src/stm32f3xx_hal_flash.d \
./Drivers/STM32F3xx_HAL_Driver/Src/stm32f3xx_hal_flash_ex.d \
./Drivers/STM32F3xx_HAL_Driver/Src/stm32f3xx_hal_gpio.d \
./Drivers/STM32F3xx_HAL_Driver/Src/stm32f3xx_hal_i2c.d \
./Drivers/STM32F3xx_HAL_Driver/Src/stm32f3xx_hal_i2c_ex.d \
./Drivers/STM32F3xx_HAL_Driver/Src/stm32f3xx_hal_pwr.d \
./Drivers/STM32F3xx_HAL_Driver/Src/stm32f3xx_hal_pwr_ex.d \
./Drivers/STM32F3xx_HAL_Driver/Src/stm32f3xx_hal_rcc.d \
./Drivers/STM32F3xx_HAL_Driver/Src/stm32f3xx_hal_rcc_ex.d \
./Drivers/STM32F3xx_HAL_Driver/Src/stm32f3xx_hal_tim.d \
./Drivers/STM32F3xx_HAL_Driver/Src/stm32f3xx_hal_tim_ex.d \
./Drivers/STM32F3xx_HAL_Driver/Src/stm32f3xx_hal_uart.d \
./Drivers/STM32F3xx_HAL_Driver/Src/stm32f3xx_hal_uart_ex.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/STM32F3xx_HAL_Driver/Src/%.o: ../Drivers/STM32F3xx_HAL_Driver/Src/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM Cross C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -D__weak='__attribute__((weak))' -DSTM32F303x8 -D__packed='__attribute__((packed))' -DUSE_HAL_DRIVER -DSTM32F303K8Tx -DNUCLEO_F303K8 -DUSE_STDPERIPH_DRIVER -I"C:\Users\Borislav\Documents\STM32\EclipseWorkspace\NucleoF303K8_FreeRTOS\Drivers\CMSIS\Device\ST\STM32F3xx\Include" -I"C:\Users\Borislav\Documents\STM32\EclipseWorkspace\NucleoF303K8_FreeRTOS\Middlewares\Third_Party\FreeRTOS\Source\portable\GCC\ARM_CM4F" -I"C:\Users\Borislav\Documents\STM32\EclipseWorkspace\NucleoF303K8_FreeRTOS\Drivers\CMSIS\Include" -I"C:\Users\Borislav\Documents\STM32\EclipseWorkspace\NucleoF303K8_FreeRTOS\Drivers\STM32F3xx_HAL_Driver\Inc" -I"C:\Users\Borislav\Documents\STM32\EclipseWorkspace\NucleoF303K8_FreeRTOS\Drivers\STM32F3xx_HAL_Driver\Inc\Legacy" -I"C:\Users\Borislav\Documents\STM32\EclipseWorkspace\NucleoF303K8_FreeRTOS\Inc" -I"C:\Users\Borislav\Documents\STM32\EclipseWorkspace\NucleoF303K8_FreeRTOS\Middlewares\Third_Party\FreeRTOS\Source\include" -std=gnu11 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


