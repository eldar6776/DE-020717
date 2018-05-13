/**
 ******************************************************************************
 * File Name          : uart.h
 * Date               : 
 * Description        : 
 ******************************************************************************
 *
 *
 ******************************************************************************
 */
#ifndef _UART_H_
#define _UART_H_  		237	// version 2.37

/* Includes ------------------------------------------------------------------*/
#include "stm32f7xx.h"
#include "stdio.h"


/* Exported defines    -------------------------------------------------------*/
#define UART_BUF_SIZE					256

#define UART_BAUDRATE_2400				'0'
#define UART_BAUDRATE_4800				'1'
#define UART_BAUDRATE_9600				'2'
#define UART_BAUDRATE_19200				'3'
#define UART_BAUDRATE_38400				'4'
#define UART_BAUDRATE_56700				'5'
#define UART_BAUDRATE_115200			'6'
#define UART_BAUDRATE_230400			'7'
#define UART_BAUDRATE_460800			'8'
#define UART_BAUDRATE_921600			'9'



/* Definition for USARTx clock resources */
#define USARTx                           USART6
#define USARTx_CLK_ENABLE()              __USART6_CLK_ENABLE()
#define USARTx_RX_GPIO_CLK_ENABLE()      __GPIOC_CLK_ENABLE()
#define USARTx_TX_GPIO_CLK_ENABLE()      __GPIOC_CLK_ENABLE()

#define USARTx_FORCE_RESET()             __USART6_FORCE_RESET()
#define USARTx_RELEASE_RESET()           __USART6_RELEASE_RESET()

/* Definition for USARTx Pins */
#define USARTx_TX_PIN                    GPIO_PIN_6
#define USARTx_TX_GPIO_PORT              GPIOC
#define USARTx_TX_AF                     GPIO_AF8_USART6
#define USARTx_RX_PIN                    GPIO_PIN_7
#define USARTx_RX_GPIO_PORT              GPIOC
#define USARTx_RX_AF                     GPIO_AF8_USART6

/* Definition for USARTx's NVIC */
#define USARTx_IRQn                      USART6_IRQn
#define USARTx_IRQHandler                USART6_IRQHandler


/* Exported types    ---------------------------------------------------------*/
/* Exported variables  -------------------------------------------------------*/
extern uint8_t rx_buffer[UART_BUF_SIZE];
extern uint8_t tx_buffer[UART_BUF_SIZE];
extern uint8_t *p_comm_buffer;
extern uint8_t uart_baudrate;

/* Exported macros     -------------------------------------------------------*/

	

/* Exported functions  -------------------------------------------------------*/
void UART_Init(uint8_t baudrate);
void nvic_config(void);
void RS485_Send_Data(uint8_t *buf,uint16_t len);
void RS485ModeGpio_Init(void);

#endif
/******************************   END OF FILE  **********************************/

