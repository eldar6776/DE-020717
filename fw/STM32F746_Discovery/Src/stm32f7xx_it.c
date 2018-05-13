/**
  ******************************************************************************
  * @file    STemWin/STemWin_HelloWorld/Src/stm32f7xx_it.c
  * @author  MCD Application Team
  * @brief   Main Interrupt Service Routines.
  ******************************************************************************
  * @attention
  *
  * <h2><center>&copy; COPYRIGHT(c) 2016 STMicroelectronics</center></h2>
  *
  * Redistribution and use in source and binary forms, with or without modification,
  * are permitted provided that the following conditions are met:
  *   1. Redistributions of source code must retain the above copyright notice,
  *      this list of conditions and the following disclaimer.
  *   2. Redistributions in binary form must reproduce the above copyright notice,
  *      this list of conditions and the following disclaimer in the documentation
  *      and/or other materials provided with the distribution.
  *   3. Neither the name of STMicroelectronics nor the names of its contributors
  *      may be used to endorse or promote products derived from this software
  *      without specific prior written permission.
  *
  * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
  * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
  * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
  * DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
  * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
  * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
  * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
  * CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
  * OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
  * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
  *
  ******************************************************************************
  */

/* Includes ------------------------------------------------------------------*/
#include "stm32f7xx_hal.h"
#include "stm32f7xx_it.h"
#include "stm32746g_audio.h"
#include "main.h"
#include "GUI.h"


/* Private typedef -----------------------------------------------------------*/
/* Private define ------------------------------------------------------------*/
/* Private macro -------------------------------------------------------------*/
/* Private variables ---------------------------------------------------------*/
extern volatile GUI_TIMER_TIME OS_TimeMS;
extern __IO uint32_t SystickCnt;
extern LTDC_HandleTypeDef hltdc;
extern TIM_HandleTypeDef htim3;
extern UART_HandleTypeDef huart6;
extern QSPI_HandleTypeDef hqspi;
extern SAI_HandleTypeDef haudio_out_sai;
extern SAI_HandleTypeDef haudio_in_sai;
extern DMA2D_HandleTypeDef hdma2d;

/* Private function prototypes -----------------------------------------------*/
/* Private functions ---------------------------------------------------------*/
void NMI_Handler(void)
{
	
}


void HardFault_Handler(void)
{
	Error_Handler();
}	


void MemManage_Handler(void)
{
	Error_Handler();
}


void BusFault_Handler(void)
{
	Error_Handler();
}


void UsageFault_Handler(void)
{
	Error_Handler();
}	


void DebugMon_Handler(void)
{
	
}


void SysTick_Handler(void)
{
	HAL_IncTick();
	OS_TimeMS++;
	SystickCnt++;
	HAL_SYSTICK_IRQHandler();
}


void DMA2D_IRQHandler(void) 
{
	HAL_DMA2D_IRQHandler(&hdma2d);
	DMA2D->IFCR = (U32)DMA2D_IFSR_CTCIF;
}


void AUDIO_OUT_SAIx_DMAx_IRQHandler(void)
{
	HAL_DMA_IRQHandler(haudio_out_sai.hdmatx);
}


void AUDIO_IN_SAIx_DMAx_IRQHandler(void)
{
	HAL_DMA_IRQHandler(haudio_in_sai.hdmarx);
}


void USART6_IRQHandler(void)
{
	HAL_UART_IRQHandler(&huart6);
}


void TIM3_IRQHandler(void)
{
	HAL_TIM_IRQHandler(&htim3);
}


void LTDC_IRQHandler(void)
{
	HAL_LTDC_IRQHandler(&hltdc);
}


void QUADSPI_IRQHandler(void)
{
	HAL_QSPI_IRQHandler(&hqspi);
}


void EXTI3_IRQHandler(void)
{
	HAL_GPIO_EXTI_IRQHandler(GPIO_PIN_3);
}


void EXTI15_10_IRQHandler(void)
{
	HAL_GPIO_EXTI_IRQHandler(GPIO_PIN_13);
}

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
