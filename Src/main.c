// Running on internal oscillator, clock speed = 8MHz

#include "main.h"
#include <string.h>
#include "FreeRTOS.h"
#include "task.h"


#define EUSART1_TX_BUFFER_SIZE 8
#define EUSART1_RX_BUFFER_SIZE 8

I2C_HandleTypeDef hi2c1;
UART_HandleTypeDef huart1;
UART_HandleTypeDef huart2;
TaskHandle_t xTaskHandle1 = NULL;
TaskHandle_t xTaskHandle2 = NULL;

volatile uint8_t eusart1TxHead = 0;
volatile uint8_t eusart1TxTail = 0;
volatile uint8_t eusart1TxBuffer[EUSART1_TX_BUFFER_SIZE];
volatile uint8_t eusart1TxBufferRemaining;

volatile uint8_t eusart1RxHead = 0;
volatile uint8_t eusart1RxTail = 0;
volatile uint8_t eusart1RxBuffer[EUSART1_RX_BUFFER_SIZE];
volatile uint8_t eusart1RxCount;

void SystemClock_Config(void);
static void MX_GPIO_Init(void);
static void MX_I2C1_Init(void);
static void MX_USART1_UART_Init(void);
static void MX_USART2_UART_Init(void);

void vTask1_handler(void *params);
void vTask2_handler(void *params);

void usart2_putch(uint8_t ch);
uint8_t usart2_getch();

void USART2_IRQHandler(void);

char buffer[] = "Hello World!";

int main(void)
{
  HAL_Init();
  SystemClock_Config();
  MX_GPIO_Init();
  MX_I2C1_Init();
  MX_USART1_UART_Init();
  MX_USART2_UART_Init();

  // Create tasks
  	xTaskCreate(vTask1_handler, "Task 1", configMINIMAL_STACK_SIZE, NULL, 2,
  			&xTaskHandle1);
  	xTaskCreate(vTask2_handler, "Task 2", configMINIMAL_STACK_SIZE, NULL, 2,
  			&xTaskHandle2);
  	// Start the scheduler
  	vTaskStartScheduler();
  	/* We should never get here as control is now taken by the scheduler */
  
  while (1)
  {
	  HAL_UART_Transmit(&huart2, buffer, strlen(buffer), 100);
	  HAL_GPIO_TogglePin(LD3_GPIO_Port, LD3_Pin);
	  HAL_Delay(1000);
  }

}

/**
  * @brief System Clock Configuration
  * @retval None
  */
void SystemClock_Config(void)
{
	  RCC_OscInitTypeDef RCC_OscInitStruct = {0};
	  RCC_ClkInitTypeDef RCC_ClkInitStruct = {0};
	  RCC_PeriphCLKInitTypeDef PeriphClkInit = {0};

	  /** Initializes the CPU, AHB and APB busses clocks
	  */
	  RCC_OscInitStruct.OscillatorType = RCC_OSCILLATORTYPE_HSI;
	  RCC_OscInitStruct.HSIState = RCC_HSI_ON;
	  RCC_OscInitStruct.HSICalibrationValue = RCC_HSICALIBRATION_DEFAULT;
	  RCC_OscInitStruct.PLL.PLLState = RCC_PLL_NONE;
	  if (HAL_RCC_OscConfig(&RCC_OscInitStruct) != HAL_OK)
	  {
	    Error_Handler();
	  }
	  /** Initializes the CPU, AHB and APB busses clocks
	  */
	  RCC_ClkInitStruct.ClockType = RCC_CLOCKTYPE_HCLK|RCC_CLOCKTYPE_SYSCLK
	                              |RCC_CLOCKTYPE_PCLK1|RCC_CLOCKTYPE_PCLK2;
	  RCC_ClkInitStruct.SYSCLKSource = RCC_SYSCLKSOURCE_HSI;
	  RCC_ClkInitStruct.AHBCLKDivider = RCC_SYSCLK_DIV1;
	  RCC_ClkInitStruct.APB1CLKDivider = RCC_HCLK_DIV2;
	  RCC_ClkInitStruct.APB2CLKDivider = RCC_HCLK_DIV1;

	  if (HAL_RCC_ClockConfig(&RCC_ClkInitStruct, FLASH_LATENCY_0) != HAL_OK)
	  {
	    Error_Handler();
	  }
	  PeriphClkInit.PeriphClockSelection = RCC_PERIPHCLK_USART1|RCC_PERIPHCLK_I2C1;
	  PeriphClkInit.Usart1ClockSelection = RCC_USART1CLKSOURCE_HSI;
	  PeriphClkInit.I2c1ClockSelection = RCC_I2C1CLKSOURCE_SYSCLK;
	  if (HAL_RCCEx_PeriphCLKConfig(&PeriphClkInit) != HAL_OK)
	  {
	    Error_Handler();
	  }
}

/**
  * @brief I2C1 Initialization Function
  * @param None
  * @retval None
  */
static void MX_I2C1_Init(void)
{

  hi2c1.Instance = I2C1;
  hi2c1.Init.Timing = 0x10808DD3;
  hi2c1.Init.OwnAddress1 = 0;
  hi2c1.Init.AddressingMode = I2C_ADDRESSINGMODE_7BIT;
  hi2c1.Init.DualAddressMode = I2C_DUALADDRESS_DISABLE;
  hi2c1.Init.OwnAddress2 = 0;
  hi2c1.Init.OwnAddress2Masks = I2C_OA2_NOMASK;
  hi2c1.Init.GeneralCallMode = I2C_GENERALCALL_DISABLE;
  hi2c1.Init.NoStretchMode = I2C_NOSTRETCH_DISABLE;
  if (HAL_I2C_Init(&hi2c1) != HAL_OK)
  {
    Error_Handler();
  }
  /** Configure Analogue filter 
  */
  if (HAL_I2CEx_ConfigAnalogFilter(&hi2c1, I2C_ANALOGFILTER_ENABLE) != HAL_OK)
  {
    Error_Handler();
  }
  /** Configure Digital filter 
  */
  if (HAL_I2CEx_ConfigDigitalFilter(&hi2c1, 0) != HAL_OK)
  {
    Error_Handler();
  }

}

/**
  * @brief USART1 Initialization Function
  * @param None
  * @retval None
  */
static void MX_USART1_UART_Init(void)
{
  huart1.Instance = USART1;
  huart1.Init.BaudRate = 9600;
  huart1.Init.WordLength = UART_WORDLENGTH_8B;
  huart1.Init.StopBits = UART_STOPBITS_1;
  huart1.Init.Parity = UART_PARITY_NONE;
  huart1.Init.Mode = UART_MODE_TX_RX;
  huart1.Init.HwFlowCtl = UART_HWCONTROL_NONE;
  huart1.Init.OverSampling = UART_OVERSAMPLING_16;
  huart1.Init.OneBitSampling = UART_ONE_BIT_SAMPLE_DISABLE;
  huart1.AdvancedInit.AdvFeatureInit = UART_ADVFEATURE_NO_INIT;


  if (HAL_UART_Init(&huart1) != HAL_OK)
  {
    Error_Handler();
  }

}

/**
  * @brief USART2 Initialization Function
  * @param None
  * @retval None
  */
static void MX_USART2_UART_Init(void)
{

  huart2.Instance = USART2;
  huart2.Init.BaudRate = 9600;
  huart2.Init.WordLength = UART_WORDLENGTH_8B;
  huart2.Init.StopBits = UART_STOPBITS_1;
  huart2.Init.Parity = UART_PARITY_NONE;
  huart2.Init.Mode = UART_MODE_TX_RX;
  huart2.Init.HwFlowCtl = UART_HWCONTROL_NONE;
  huart2.Init.OverSampling = UART_OVERSAMPLING_16;
  huart2.Init.OneBitSampling = UART_ONE_BIT_SAMPLE_DISABLE;
  huart2.AdvancedInit.AdvFeatureInit = UART_ADVFEATURE_NO_INIT;
  if (HAL_UART_Init(&huart2) != HAL_OK)
  {
    Error_Handler();
  }

  // initializing the driver state
  eusart1TxHead = 0;
  eusart1TxTail = 0;
  eusart1TxBufferRemaining = sizeof(eusart1TxBuffer);

  eusart1RxHead = 0;
  eusart1RxTail = 0;
  eusart1RxCount = 0;

  // Enable UART RX and TX interrupt. Note: this needs to be done after uart initializing
  	HAL_NVIC_SetPriority(USART2_IRQn, 5, 5);
  	__HAL_UART_ENABLE_IT(&huart2, UART_IT_RXNE);
  	__HAL_UART_ENABLE_IT(&huart2, UART_IT_TXE);
  	//HAL_NVIC_EnableIRQ(USART2_IRQn);

}


/**
  * @brief GPIO Initialization Function
  * @param None
  * @retval None
  */
static void MX_GPIO_Init(void)
{
  GPIO_InitTypeDef GPIO_InitStruct = {0};

  /* GPIO Ports Clock Enable */
  __HAL_RCC_GPIOF_CLK_ENABLE();
  __HAL_RCC_GPIOA_CLK_ENABLE();
  __HAL_RCC_GPIOB_CLK_ENABLE();

  /*Configure GPIO pin Output Level */
  HAL_GPIO_WritePin(LD3_GPIO_Port, LD3_Pin, GPIO_PIN_RESET);

  /*Configure GPIO pin : LD3_Pin */
  GPIO_InitStruct.Pin = LD3_Pin;
  GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
  HAL_GPIO_Init(LD3_GPIO_Port, &GPIO_InitStruct);

}

void usart2_putch(uint8_t ch) {
	while(0 == eusart1TxBufferRemaining)
	    {
	    }

	// Check if TXEIE is enabled
	if ((USART2->CR1 & (1 << 7)) == 0) {
		USART2->TDR = ch;
	} else {
		// Else disable interrupt temporary
		USART2->TDR &= ~(1 << 7);
		eusart1TxBuffer[eusart1TxHead++] = ch;
		if(sizeof(eusart1TxBuffer) <= eusart1TxHead)
		{
			eusart1TxHead = 0;
		}
		eusart1TxBufferRemaining--;
	}
	// Enable interrupt again
	USART2->TDR |= (1 << 7);
}

void vTask1_handler(void *params) {
	while (1) {
		usart2_putch('!');
		//HAL_UART_Transmit(&huart2, buffer, sizeof(buffer), 5);
		vTaskDelay(500);
	}
}

void vTask2_handler(void *params) {
	while (1) {
		HAL_GPIO_TogglePin(LD3_GPIO_Port, LD3_Pin);
		vTaskDelay(1000);
	}
}

void USART2_IRQHandler(void) {
	if (__HAL_UART_GET_IT_SOURCE(&huart2, UART_IT_RXNE)) {

	} else if (__HAL_UART_GET_IT_SOURCE(&huart2, UART_IT_TXE)) {

		if(sizeof(eusart1TxBuffer) > eusart1TxBufferRemaining)
		{
			USART2->TDR = eusart1TxBuffer[eusart1TxTail++];
			if(sizeof(eusart1TxBuffer) <= eusart1TxTail)
			{
				eusart1TxTail = 0;
			}
			eusart1TxBufferRemaining++;
		}
		else
		{
			// Disable interrupt
			USART2->TDR &= ~(1 << 7);
		}
	}
}

/**
  * @brief  Period elapsed callback in non blocking mode
  * @note   This function is called  when TIM2 interrupt took place, inside
  * HAL_TIM_IRQHandler(). It makes a direct call to HAL_IncTick() to increment
  * a global variable "uwTick" used as application time base.
  * @param  htim : TIM handle
  * @retval None
  */
void HAL_TIM_PeriodElapsedCallback(TIM_HandleTypeDef *htim)
{
  /* USER CODE BEGIN Callback 0 */

  /* USER CODE END Callback 0 */
  if (htim->Instance == TIM2) {
    HAL_IncTick();
  }
  /* USER CODE BEGIN Callback 1 */

  /* USER CODE END Callback 1 */
}

/**
  * @brief  This function is executed in case of error occurrence.
  * @retval None
  */
void Error_Handler(void)
{
  /* USER CODE BEGIN Error_Handler_Debug */
  /* User can add his own implementation to report the HAL error return state */

  /* USER CODE END Error_Handler_Debug */
}

#ifdef  USE_FULL_ASSERT
/**
  * @brief  Reports the name of the source file and the source line number
  *         where the assert_param error has occurred.
  * @param  file: pointer to the source file name
  * @param  line: assert_param error line source number
  * @retval None
  */
void assert_failed(char *file, uint32_t line)
{ 
  /* USER CODE BEGIN 6 */
  /* User can add his own implementation to report the file name and line number,
     tex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */
  /* USER CODE END 6 */
}
#endif /* USE_FULL_ASSERT */

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
