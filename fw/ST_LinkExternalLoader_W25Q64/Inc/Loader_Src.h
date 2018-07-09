/**
  ******************************************************************************
  * @file    Loader_Src.h
  * @author  MCD Tools Team
  * @date    October-2015
  * @brief   Loader Header file.
  ******************************************************************************
  */

/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __LOADER_SRC_H
#define __LOADER_SRC_H

/* Includes ------------------------------------------------------------------*/
#include "stm32f7xx_hal.h"
//#include "stm32f769i_eval.h"
#include "stm32f7xx_hal_qspi.h"
#include "stm32f769i_eval_qspi.h"
#include "W25Q64.h"
/* Exported types ------------------------------------------------------------*/
/* Exported constants --------------------------------------------------------*/


#if defined(__CC_ARM)
extern uint32_t Load$$QSPI$$Base;
extern uint32_t Load$$QSPI$$Length;
#elif defined(__ICCARM__)
#pragma section =".qspi"
#pragma section =".qspi_init"
#elif defined(__GNUC__)
extern uint32_t _qspi_init_base;
extern uint32_t _qspi_init_length;
#endif


#ifdef __ICCARM__                //IAR
#define KeepInCompilation __root 
#elif __CC_ARM                   //MDK-ARM
#define KeepInCompilation __attribute__((used))
#else //TASKING               //TrueStudio
#define KeepInCompilation __attribute__((used))
#endif


#define StartRamAddress          0x20000000
#define EndRamAddress            0x20080000



/* Exported types ------------------------------------------------------------*/
/* Exported constants --------------------------------------------------------*/
/* Definition for QSPI clock resources */
#define QSPI_CLK_ENABLE()          __HAL_RCC_QSPI_CLK_ENABLE()
#define QSPI_CLK_DISABLE()         __HAL_RCC_QSPI_CLK_DISABLE()
#define QSPI_CS_GPIO_CLK_ENABLE()  __HAL_RCC_GPIOB_CLK_ENABLE()
#define QSPI_CLK_GPIO_CLK_ENABLE() __HAL_RCC_GPIOB_CLK_ENABLE()
#define QSPI_D0_GPIO_CLK_ENABLE()  __HAL_RCC_GPIOF_CLK_ENABLE()
#define QSPI_D1_GPIO_CLK_ENABLE()  __HAL_RCC_GPIOF_CLK_ENABLE()
#define QSPI_D2_GPIO_CLK_ENABLE()  __HAL_RCC_GPIOF_CLK_ENABLE()
#define QSPI_D3_GPIO_CLK_ENABLE()  __HAL_RCC_GPIOF_CLK_ENABLE()
#define QSPI_DMA_CLK_ENABLE()      __HAL_RCC_DMA2_CLK_ENABLE()

#define QSPI_FORCE_RESET()         __HAL_RCC_QSPI_FORCE_RESET()
#define QSPI_RELEASE_RESET()       __HAL_RCC_QSPI_RELEASE_RESET()

/* Definition for QSPI Pins */
#define QSPI_CS_PIN                GPIO_PIN_6
#define QSPI_CS_GPIO_PORT          GPIOB
#define QSPI_CLK_PIN               GPIO_PIN_2
#define QSPI_CLK_GPIO_PORT         GPIOB
#define QSPI_D0_PIN                GPIO_PIN_8
#define QSPI_D0_GPIO_PORT          GPIOF
#define QSPI_D1_PIN                GPIO_PIN_9
#define QSPI_D1_GPIO_PORT          GPIOF
#define QSPI_D2_PIN                GPIO_PIN_7
#define QSPI_D2_GPIO_PORT          GPIOF
#define QSPI_D3_PIN                GPIO_PIN_6
#define QSPI_D3_GPIO_PORT          GPIOF

/* Definition for QSPI DMA */
#define QSPI_DMA_INSTANCE          DMA2_Stream7
#define QSPI_DMA_CHANNEL           DMA_CHANNEL_3
#define QSPI_DMA_IRQ               DMA2_Stream7_IRQn
#define QSPI_DMA_IRQ_HANDLER       DMA2_Stream7_IRQHandler



//#define PROG_ERASE_RESUME_CMD                0x7A
//#define PROG_ERASE_SUSPEND_CMD               0x75

///* One-Time Programmable Operations */
//#define READ_OTP_ARRAY_CMD                   0x4B
//#define PROG_OTP_ARRAY_CMD                   0x42

///* 4-byte Address Mode Operations */
//#define ENTER_4_BYTE_ADDR_MODE_CMD           0xB7
//#define EXIT_4_BYTE_ADDR_MODE_CMD            0xE9

///* Quad Operations */
//#define ENTER_QUAD_CMD                       0x35
//#define EXIT_QUAD_CMD                        0xF5

/* Default dummy clocks cycles */
#define DUMMY_CLOCK_CYCLES_READ              8
#define DUMMY_CLOCK_CYCLES_READ_QUAD         10

#define DUMMY_CLOCK_CYCLES_READ_DTR          6
#define DUMMY_CLOCK_CYCLES_READ_QUAD_DTR     8

///* End address of the QSPI memory */
//#define QSPI_END_ADDR              (1 << QSPI_FLASH_SIZE)

/* Size of buffers */
#define BUFFERSIZE                 (COUNTOF(aTxBuffer) - 1)

/* Exported macro ------------------------------------------------------------*/
#define COUNTOF(__BUFFER__)        (sizeof(__BUFFER__) / sizeof(*(__BUFFER__)))



HAL_StatusTypeDef HAL_InitTick(uint32_t TickPriority);
void SystemClock_Config(void);


//All system initialisation
int Init (uint8_t configureMemoryMappedMode);
int MassErase (void);
int SectorErase (uint32_t EraseStartAddress ,uint32_t EraseEndAddress);
int Write(uint32_t Address, uint32_t Size, uint8_t* buffer);
int Read (uint32_t Address, uint32_t Size, uint8_t* Buffer);
//KeepInCompilation uint64_t Verify (uint32_t MemoryAddr, uint32_t RAMBufferAddr, uint32_t Size, uint32_t missalignement);
uint32_t CheckSum(uint32_t StartAddress, uint32_t Size, uint32_t InitVal);
int Verify (uint32_t MemoryAddr, uint32_t RAMBufferAddr, uint32_t Size);
HAL_StatusTypeDef HAL_InitTick(uint32_t TickPriority);
void HAL_Delay(__IO uint32_t Delay);
//QSPI operation functions
static int QSPI_ResetMemory(QSPI_HandleTypeDef *hqspi);
static int QSPI_EraseSector (uint32_t Address);
static int QSPI_WritePage(uint32_t Address, uint32_t sz, uint8_t *buf);
static int QSPI_WriteEnable(QSPI_HandleTypeDef *hqspi);
static int QSPI_EnableMemoryMappedMode(void);
static int QSPI_AutoPollingMemReady(QSPI_HandleTypeDef *hqspi, uint32_t Timeout);
//static int QSPI_MappedMode(void);

#endif /* __LOADER_SRC_H */
/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
