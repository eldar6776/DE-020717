/**
  ******************************************************************************
  * @file    W25Q64.h
  * @author  MCD Application Team
  * @brief   This file contains all the description of the W25Q64 QSPI memory.
  ******************************************************************************
  * @attention
  *
  * <h2><center>&copy; COPYRIGHT(c) 2015 STMicroelectronics</center></h2>
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

/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __W25Q64_H
#define __W25Q64_H

#ifdef __cplusplus
 extern "C" {
#endif 

/* Includes ------------------------------------------------------------------*/

/** @addtogroup BSP
  * @{
  */ 

/** @addtogroup Components
  * @{
  */ 
  
/** @addtogroup W25Q64
  * @{
  */

/** @defgroup W25Q64_Exported_Types
  * @{
  */
/** 
* @brief  W25Q64 Configuration  
*/  
#define W25Q64_FLASH_START_ADDRESS			0x90000000	/* Device Start Address */
#define W25Q64_FLASH_SIZE					0x800000	/* 8MBytes */
#define W25Q64_SECTOR_SIZE					0x10000		/* 64KBytes */
#define W25Q64_SUBSECTOR_SIZE				0x1000		/* 4kBytes */
#define W25Q64_PAGE_SIZE					0x100		/* 256 bytes */
#define W25Q64_ID							0x4017		/* device id */
#define W25Q64_DUMMY_CYCLES_READ			8
#define W25Q64_DUMMY_CYCLES_READ_QUAD		10

#define W25Q64_BULK_ERASE_MAX_TIME			250000
#define W25Q64_SECTOR_ERASE_MAX_TIME		5000
#define W25Q64_SUBSECTOR_ERASE_MAX_TIME		800


// Standard command sub-set (common for all flash chips)
#define CMD_JEDEC_ID						0x9F
#define CMD_WRITE_ENABLE					0x06		/* Write Enable command */
#define CMD_WRITE_DISABLE					0x04		/* Write Disable */
#define CMD_READ_STATUS_REGISTER			0x05		/* Status read command */
#define CMD_WRITE_STATUS_REGISTER			0x01		/* Write Status Register */
#define CMD_SECTOR_ERASE					0x20		/* Sector (4K) Erase */
#define CMD_BLOCK_32K_ERASE 				0x52		/* Block  (32K) Erase */
#define CMD_BLOCK_64K_ERASE					0xD8		/* Block  (64K) Erase */
#define CMD_CHIP_ERASE						0xC7		/* Chip Erase */
#define CMD_RESET_ENABLE					0x66
#define CMD_RESET_DEVICE					0x99
#define CMD_POWER_DOWN						0xB9		/* Deep Power-down */
#define CMD_RELEASE_POWER_DOWN				0xAB		/* Release from DP, and Read Signature */
#define CMD_PAGE_PROGRAM					0x02		/* Page Program command */
#define CMD_QUAD_PAGE_PROGRAM				0x32		/* Quad Input Fast Program */
#define CMD_READ_DATA						0x03		/* Random read command */
#define CMD_FAST_READ_DATA					0x0B		/* Read Data Bytes at Higher Speed */
#define CMD_FAST_READ_QUAD_OUT				0x6B		/* Quad Output Fast Read */
#define CMD_FAST_READ_QUAD_IN_OUT			0xEB		/* Quad IO Fast Read */


// Winbond specific commands
#define W25Q64_VOLATILE_SR_WRITE_ENABLE		0x50
#define W25Q64_READ_STATUS_REGISTER_2		0x35
#define W25Q64_WRITE_STATUS_REGISTER_2		0x31
#define W25Q64_READ_STATUS_REGISTER_3		0x15
#define W25Q64_WRITE_STATUS_REGISTER_3		0x11
#define W25Q64_ENTER_QUAD_MODE				0x38
#define W25Q64_SET_READ_PARAMETERS			0xC0
/**
 * This definitions specify the EXTRA bytes in each of the command
 * transactions. This count includes Command byte, address bytes and any
 * don't care bytes needed.
 */
#define READ_WRITE_EXTRA_BYTES		4 /* Read/Write extra bytes */
#define	WRITE_ENABLE_BYTES			1 /* Write Enable bytes */
#define SECTOR_ERASE_BYTES			4 /* Sector erase extra bytes */
#define BULK_ERASE_BYTES			1 /* Bulk erase extra bytes */
#define STATUS_READ_BYTES			2 /* Status read bytes count */
#define STATUS_WRITE_BYTES			2 /* Status write bytes count */


/* Flag Status Register */
#define W25Q64_FSR_BUSY                    ((uint8_t)0x01)    /*!< busy */
#define W25Q64_FSR_WREN                    ((uint8_t)0x02)    /*!< write enable */
#define W25Q64_FSR_QE                      ((uint8_t)0x02)    /*!< quad enable */
  
/** @defgroup W25Q64_Exported_Functions
  * @{
  */ 
#ifdef __cplusplus
}
#endif

#endif /* __W25Q64_H */

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
