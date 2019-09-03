# Nucleo F303K8
Nucleo F303K8 (STM32F303K8T6) bare metal FreeRTOS project

Important considerations: The Nucleo F303K8 does not have an external oscillator for the STM32F303K8T6 chip, but the clock for the ST-LINK debugger can be utilized. You need to manually open bridge SB6 and close bridge SB4, after that HSE 8MHz can be selected in the clock configuration. 
