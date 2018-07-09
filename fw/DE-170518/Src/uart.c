/**
 ******************************************************************************
 * File Name          : uart.c
 * Date               : 21/08/2016 20:59:16
 * Description        : UART driver
 ******************************************************************************
 *
 *
 ******************************************************************************
 */
 
 
/* Includes ------------------------------------------------------------------*/
#include "uart.h"


/* Private typedef -----------------------------------------------------------*/
/* Private define ------------------------------------------------------------*/
/* Private macro -------------------------------------------------------------*/
/* Private variables ---------------------------------------------------------*/
uint8_t rx_buffer[UART_BUF_SIZE];
uint8_t tx_buffer[UART_BUF_SIZE];
uint8_t *p_comm_buffer;
uint8_t uart_baudrate;
UART_HandleTypeDef UartHandle;
__IO ITStatus uart_ready = RESET;


/* Private function prototypes -----------------------------------------------*/
/* Private functions ---------------------------------------------------------*/
void UART_Init(uint8_t baudrate)
{
	GPIO_InitTypeDef  GPIO_InitStruct;

	/*##-1- Enable peripherals and GPIO Clocks #################################*/
	/* Enable GPIO TX/RX clock */
	USARTx_TX_GPIO_CLK_ENABLE();
	USARTx_RX_GPIO_CLK_ENABLE();

	/* Enable USARTx clock */
	USARTx_CLK_ENABLE(); 

	/* UART RX GPIO pin configuration  */
	GPIO_InitStruct.Pin 		= USARTx_RX_PIN;
	GPIO_InitStruct.Mode      	= GPIO_MODE_AF_PP;
	GPIO_InitStruct.Pull      	= GPIO_NOPULL;
	GPIO_InitStruct.Speed     	= GPIO_SPEED_HIGH;	
	GPIO_InitStruct.Alternate 	= USARTx_RX_AF;
	HAL_GPIO_Init(USARTx_RX_GPIO_PORT, &GPIO_InitStruct);	
	
	/*##-2- Configure peripheral GPIO ##########################################*/  
	/* UART TX GPIO pin configuration  */
	GPIO_InitStruct.Pin       	= USARTx_TX_PIN;
	GPIO_InitStruct.Mode      	= GPIO_MODE_AF_OD;
	GPIO_InitStruct.Pull      	= GPIO_PULLUP;
	GPIO_InitStruct.Speed     	= GPIO_SPEED_HIGH;
	GPIO_InitStruct.Alternate 	= USARTx_TX_AF;
	HAL_GPIO_Init(USARTx_TX_GPIO_PORT, &GPIO_InitStruct);



	/*##-3- Configure the NVIC for UART ########################################*/
	/* NVIC for USART */
	HAL_NVIC_SetPriority(USARTx_IRQn, 0, 1);
	HAL_NVIC_EnableIRQ(USARTx_IRQn);

	UartHandle.Instance        = USARTx;
	if(baudrate == UART_BAUDRATE_2400) UartHandle.Init.BaudRate = 2400;
	else if(baudrate == UART_BAUDRATE_4800) UartHandle.Init.BaudRate = 4800;
	else if(baudrate == UART_BAUDRATE_9600) UartHandle.Init.BaudRate = 9600;
	else if(baudrate == UART_BAUDRATE_19200) UartHandle.Init.BaudRate = 19200;
	else if(baudrate == UART_BAUDRATE_38400) UartHandle.Init.BaudRate = 38400;
	else if(baudrate == UART_BAUDRATE_56700) UartHandle.Init.BaudRate = 56700;
	else if(baudrate == UART_BAUDRATE_115200) UartHandle.Init.BaudRate = 115200;
	else if(baudrate == UART_BAUDRATE_230400) UartHandle.Init.BaudRate = 230400;
	else if(baudrate == UART_BAUDRATE_460800) UartHandle.Init.BaudRate = 460800;
	else if(baudrate == UART_BAUDRATE_921600) UartHandle.Init.BaudRate = 921600;
	else UartHandle.Init.BaudRate = 115200;
	UartHandle.Init.WordLength = UART_WORDLENGTH_8B;
	UartHandle.Init.StopBits   = UART_STOPBITS_1;
	UartHandle.Init.Parity     = UART_PARITY_NONE;
	UartHandle.Init.HwFlowCtl  = UART_HWCONTROL_NONE;
	UartHandle.Init.Mode       = UART_MODE_TX_RX;
	UartHandle.AdvancedInit.AdvFeatureInit = UART_ADVFEATURE_NO_INIT; 
	
	if(HAL_UART_DeInit(&UartHandle) != HAL_OK)
	{
		/* Initialization Error */
		while(1) { ; }
	}  
	
	if(HAL_HalfDuplex_Init(&UartHandle) != HAL_OK)
	{
		/* Initialization Error */
		while(1) { ; }
	}
}


/**
  * @brief  Tx Transfer completed callback
  * @param  UartHandle: UART handle. 
  * @note   This example shows a simple way to report end of IT Tx transfer, and 
  *         you can add your own implementation. 
  * @retval None
  */
void HAL_UART_TxCpltCallback(UART_HandleTypeDef *UartHandle)
{
	/* Set transmission flag: transfer complete */
	uart_ready = SET;
}


/**
  * @brief  Rx Transfer completed callback
  * @param  UartHandle: UART handle
  * @note   This example shows a simple way to report end of DMA Rx transfer, and 
  *         you can add your own implementation.
  * @retval None
  */
void HAL_UART_RxCpltCallback(UART_HandleTypeDef *UartHandle)
{
	/* Set transmission flag: transfer complete */
	uart_ready = SET;
}


/**
  * @brief  UART error callbacks
  * @param  UartHandle: UART handle
  * @note   This example shows a simple way to report transfer error, and you can
  *         add your own implementation.
  * @retval None
  */
void HAL_UART_ErrorCallback(UART_HandleTypeDef *UartHandle)
{
    /* Initialization Error */
	while(1) { ; }
}

