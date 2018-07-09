/**
  ******************************************************************************
  * @file    Loader_Src.c
  * @author  MCD Tools Team
  * @date    October-2015
  * @brief   This file defines the operations of the external loader for
  *          N25Q256A QSPI memory of STM32L476G-EVAL.
  ******************************************************************************
  */

#include "Loader_Src.h"
#include "stm32f769i_eval_qspi.h"
#include <string.h>


/* Private variables ---------------------------------------------------------*/
//QSPI structure
QSPI_HandleTypeDef QSPIHandle; 
QSPI_CommandTypeDef sCommand;
QSPI_AutoPollingTypeDef sConfig;


int Init (uint8_t configureMemoryMappedMode)
{
	SystemInit();
	SystemClock_Config();

	/* Zero Init structs */
	memset(&QSPIHandle, 0, sizeof(QSPIHandle));
	memset(&sCommand, 0, sizeof(sCommand));
	memset(&sConfig, 0, sizeof(sConfig));

	/* Initialize QuadSPI ------------------------------------------------------ */
	QSPIHandle.Instance = QUADSPI;	  
	HAL_QSPI_DeInit(&QSPIHandle) ;

	QSPIHandle.Init.ClockPrescaler		= 2;
	QSPIHandle.Init.FifoThreshold		= 1;
	QSPIHandle.Init.SampleShifting		= QSPI_SAMPLE_SHIFTING_HALFCYCLE; 
	QSPIHandle.Init.FlashSize			= 22;
	QSPIHandle.Init.ChipSelectHighTime 	= QSPI_CS_HIGH_TIME_3_CYCLE; 
	QSPIHandle.Init.ClockMode			= QSPI_CLOCK_MODE_0;
	QSPIHandle.Init.DualFlash			= QSPI_DUALFLASH_DISABLE;
	QSPIHandle.Init.FlashID				= QSPI_FLASH_ID_1;
	QSPIHandle.State					= HAL_QSPI_STATE_RESET;
	
	if (HAL_QSPI_Init(&QSPIHandle) != HAL_OK)
	{
		return 0;
	}

	if (QSPI_ResetMemory(&QSPIHandle) != 1)
	{
		return 0;
	}
	
//	if(!configureMemoryMappedMode)
//	{
//		if (QSPI_EnableMemoryMappedMode() != 1)
//		{
//			return 0;
//		}
//	}
	
	return 1; 
}


int Read (uint32_t Address, uint32_t Size, uint8_t* Buffer)
{     	
//	uint32_t InternalAddr = Address - W25Q64_FLASH_START_ADDRESS;  

	sCommand.InstructionMode   	= QSPI_INSTRUCTION_1_LINE;
	sCommand.Instruction 		= CMD_READ_DATA;
	sCommand.AddressMode 		= QSPI_ADDRESS_1_LINE;
	sCommand.AddressSize 		= QSPI_ADDRESS_24_BITS;
	sCommand.Address     		= Address & 0x0FFFFFFF;
	sCommand.DataMode    		= QSPI_DATA_1_LINE;
	sCommand.NbData      		= Size;

	if (HAL_QSPI_Command(&QSPIHandle, &sCommand, HAL_QPSI_TIMEOUT_DEFAULT_VALUE) != HAL_OK)
	{
		return 0;
	}

	if (HAL_QSPI_Receive(&QSPIHandle, Buffer, HAL_QPSI_TIMEOUT_DEFAULT_VALUE) != HAL_OK)
	{
		return 0;
	}
	
	return 1;     
//	uint32_t i = 0;
//	
//	QSPI_EnableMemoryMappedMode();
//	
//	for (i=0; i < Size; i++)
//	{ 
//		*(uint8_t*)Buffer++ = *(uint8_t*)Address;
//		Address ++;
//	}
//   
//	return 1;  
} 


int MassErase (void)
{
	if(QSPI_WriteEnable(&QSPIHandle) != 1)
	{
		return 0;
	}

	/* Erasing Sequence -------------------------------------------------- */
	sCommand.InstructionMode   = QSPI_INSTRUCTION_1_LINE;
	sCommand.Instruction       = CMD_CHIP_ERASE;
	sCommand.AddressMode       = QSPI_ADDRESS_NONE;
	sCommand.AlternateByteMode = QSPI_ALTERNATE_BYTES_NONE;
	sCommand.DataMode          = QSPI_DATA_NONE;
	sCommand.DummyCycles       = 0;
	sCommand.NbData            = 0;
	sCommand.DdrMode           = QSPI_DDR_MODE_DISABLE;
	sCommand.DdrHoldHalfCycle  = QSPI_DDR_HHC_ANALOG_DELAY;
	sCommand.SIOOMode          = QSPI_SIOO_INST_EVERY_CMD;
	
	if(HAL_QSPI_Command( &QSPIHandle, &sCommand,HAL_QPSI_TIMEOUT_DEFAULT_VALUE) != HAL_OK)
	{
		return 0;
	}

//	if (QSPI_AutoPollingMemReady(&QSPIHandle, W25Q64_BULK_ERASE_MAX_TIME) != 1)
//	{
//		return 0;
//	}
	
	return 1 ;	
}


int SectorErase (uint32_t EraseStartAddress ,uint32_t EraseEndAddress)
{      
	uint32_t BlockAddr;
	EraseStartAddress = EraseStartAddress - (EraseStartAddress % 0x10000);

	while (EraseEndAddress >= EraseStartAddress)
	{      
		BlockAddr = EraseStartAddress & 0x0FFFFFFF;
		
		if(QSPI_EraseSector(BlockAddr) != 1)
		{
			return 0;
		}
		
		EraseStartAddress += 0x10000;
	}

	return 1;	
}


int Write(uint32_t Address, uint32_t Size, uint8_t* buffer)
{
	uint32_t NumOfPage = 0, NumOfSingle = 0, Addr = 0, count = 0, temp = 0;
	uint32_t   QSPI_DataNum = 0;

	Addr = Address % W25Q64_PAGE_SIZE;
	count = W25Q64_PAGE_SIZE - Addr;
	NumOfPage =  Size / W25Q64_PAGE_SIZE;
	NumOfSingle = Size % W25Q64_PAGE_SIZE;

	if (Addr == 0) /*!< Address is QSPI_PAGESIZE aligned  */
	{
		if (NumOfPage == 0) /*!< NumByteToWrite < QSPI_PAGESIZE */
		{
			QSPI_DataNum = Size;      
			QSPI_WritePage(Address, QSPI_DataNum, buffer);
		}
		else /*!< Size > QSPI_PAGESIZE */
		{
			while (NumOfPage--)
			{
				QSPI_DataNum = W25Q64_PAGE_SIZE;
				QSPI_WritePage(Address, QSPI_DataNum, buffer);
				Address +=  W25Q64_PAGE_SIZE;
				buffer += W25Q64_PAGE_SIZE;
			}

			QSPI_DataNum = NumOfSingle;
			if(QSPI_DataNum > 0)
			QSPI_WritePage(Address, QSPI_DataNum, buffer);
		}
	}
	else /*!< Address is not QSPI_PAGESIZE aligned  */
	{
		if (NumOfPage == 0) /*!< Size < QSPI_PAGESIZE */
		{
			if (NumOfSingle > count) /*!< (Size + Address) > QSPI_PAGESIZE */
			{
				temp = NumOfSingle - count;
				QSPI_DataNum = count;
				QSPI_WritePage(Address, QSPI_DataNum, buffer);
				Address +=  count;
				buffer += count;
				QSPI_DataNum = temp;
				QSPI_WritePage(Address, QSPI_DataNum, buffer);
			}
			else
			{
				QSPI_DataNum = Size; 
				QSPI_WritePage(Address, QSPI_DataNum, buffer);
			}
		}
		else /*!< Size > QSPI_PAGESIZE */
		{
			Size -= count;
			NumOfPage =  Size / W25Q64_PAGE_SIZE;
			NumOfSingle = Size % W25Q64_PAGE_SIZE;
			QSPI_DataNum = count;
			QSPI_WritePage(Address, QSPI_DataNum, buffer);
			Address +=  count;
			buffer += count;

			while (NumOfPage--)
			{
				QSPI_DataNum = W25Q64_PAGE_SIZE;
				QSPI_WritePage(Address, QSPI_DataNum, buffer);
				Address +=  W25Q64_PAGE_SIZE;
				buffer += W25Q64_PAGE_SIZE;
			}

			if (NumOfSingle != 0)
			{
				QSPI_DataNum = NumOfSingle;
				QSPI_WritePage(Address, QSPI_DataNum, buffer);
			}
		}
	}

	return 1;
}


int Verify (uint32_t MemoryAddr, uint32_t RAMBufferAddr, uint32_t Size)
{ 
//	uint32_t InternalAddr = MemoryAddr - W25Q64_FLASH_START_ADDRESS;
	uint32_t VerifiedData = 0;
	uint8_t TmpBuffer = 0x00;
	
	Size*=4;
	

	while (Size>VerifiedData)
	{
		sCommand.InstructionMode   	= QSPI_INSTRUCTION_1_LINE;
		sCommand.Instruction 		= CMD_READ_DATA;
		sCommand.AddressMode 		= QSPI_ADDRESS_1_LINE;
		sCommand.AddressSize 		= QSPI_ADDRESS_24_BITS;
		sCommand.Address     		= ((MemoryAddr & 0x0FFFFFFF) + VerifiedData);
		sCommand.DataMode    		= QSPI_DATA_1_LINE;
		sCommand.NbData      		= 1;

		if (HAL_QSPI_Command(&QSPIHandle, &sCommand, HAL_QPSI_TIMEOUT_DEFAULT_VALUE) != HAL_OK)
		{
			return 0;
		}

		if (HAL_QSPI_Receive(&QSPIHandle, &TmpBuffer, HAL_QPSI_TIMEOUT_DEFAULT_VALUE) != HAL_OK)
		{
			return 0;
		}
		
		if (TmpBuffer != *((uint8_t*)RAMBufferAddr + VerifiedData))
		{
			return 0;  
		}

		VerifiedData++;  
	}

	return 1;
}


/**
  * Description :
  * Calculates checksum value of the memory zone
  * Inputs    :
  *      StartAddress  : Flash start address
  *      Size          : Size (in WORD)  
  *      InitVal       : Initial CRC value
  * outputs   :
  *     R0             : Checksum value
  * Note: Optional for all types of device
  */
uint32_t CheckSum(uint32_t StartAddress, uint32_t Size, uint32_t InitVal)
{
  uint8_t missalignementAddress = StartAddress%4;
  uint8_t missalignementSize = Size;
  int cnt;
  uint32_t Val;
	
  StartAddress-=StartAddress%4;
  Size += (Size%4==0)?0:4-(Size%4);
  
  for(cnt=0; cnt<Size ; cnt+=4)
  {
    Val = *(uint32_t*)StartAddress;
    if(missalignementAddress)
    {
      switch (missalignementAddress)
      {
        case 1:
          InitVal += (uint8_t) (Val>>8 & 0xff);
          InitVal += (uint8_t) (Val>>16 & 0xff);
          InitVal += (uint8_t) (Val>>24 & 0xff);
          missalignementAddress-=1;
          break;
        case 2:
          InitVal += (uint8_t) (Val>>16 & 0xff);
          InitVal += (uint8_t) (Val>>24 & 0xff);
          missalignementAddress-=2;
          break;
        case 3:   
          InitVal += (uint8_t) (Val>>24 & 0xff);
          missalignementAddress-=3;
          break;
      }  
    }
    else if((Size-missalignementSize)%4 && (Size-cnt) <=4)
    {
      switch (Size-missalignementSize)
      {
        case 1:
          InitVal += (uint8_t) Val;
          InitVal += (uint8_t) (Val>>8 & 0xff);
          InitVal += (uint8_t) (Val>>16 & 0xff);
          missalignementSize-=1;
          break;
        case 2:
          InitVal += (uint8_t) Val;
          InitVal += (uint8_t) (Val>>8 & 0xff);
          missalignementSize-=2;
          break;
        case 3:   
          InitVal += (uint8_t) Val;
          missalignementSize-=3;
          break;
      } 
    }
    else
    {
      InitVal += (uint8_t) Val;
      InitVal += (uint8_t) (Val>>8 & 0xff);
      InitVal += (uint8_t) (Val>>16 & 0xff);
      InitVal += (uint8_t) (Val>>24 & 0xff);
    }
    StartAddress+=4;
  }
  
  return (InitVal);
}


static int QSPI_EraseSector (uint32_t Address) 
{
	if(QSPI_WriteEnable(&QSPIHandle) != 1)
	{
		return 0;
	}

	/* Erasing Sequence -------------------------------------------------- */
	sCommand.InstructionMode   	= QSPI_INSTRUCTION_1_LINE;
	sCommand.Instruction       	= CMD_BLOCK_64K_ERASE;
	sCommand.AddressMode		= QSPI_ADDRESS_1_LINE;
	sCommand.AddressSize 		= QSPI_ADDRESS_24_BITS;
	sCommand.Address     		= Address;
	sCommand.AlternateByteMode 	= QSPI_ALTERNATE_BYTES_NONE;
	sCommand.DataMode          	= QSPI_DATA_NONE;
	sCommand.DummyCycles       	= 0;
	sCommand.NbData            	= 0;
	sCommand.DdrMode           	= QSPI_DDR_MODE_DISABLE;
	sCommand.DdrHoldHalfCycle  	= QSPI_DDR_HHC_ANALOG_DELAY;
	sCommand.SIOOMode          	= QSPI_SIOO_INST_EVERY_CMD;
	
	if(HAL_QSPI_Command( &QSPIHandle, &sCommand,HAL_QPSI_TIMEOUT_DEFAULT_VALUE) != HAL_OK)
	{
		return 0;
	}

	/* Configure automatic polling mode to wait for end of erase ------- */  
	if (QSPI_AutoPollingMemReady(&QSPIHandle, W25Q64_SECTOR_ERASE_MAX_TIME) != 1)
	{
		return 0;
	}

	
	return 1 ;	
}


static int QSPI_WritePage(uint32_t Address, uint32_t sz, uint8_t *buf) 
{
//	uint32_t InternalAddr = Address - W25Q64_FLASH_START_ADDRESS;
	
	if(QSPI_WriteEnable(&QSPIHandle) != 1)
	{
		return 0;
	}

	/* Writing Sequence ------------------------------------------------ */
	sCommand.InstructionMode   	= QSPI_INSTRUCTION_1_LINE;
	sCommand.Instruction 		= CMD_PAGE_PROGRAM;
	sCommand.AddressMode 		= QSPI_ADDRESS_1_LINE;
	sCommand.AddressSize 		= QSPI_ADDRESS_24_BITS;
	sCommand.Address     		= Address & 0x0FFFFFFF;
	sCommand.DataMode    		= QSPI_DATA_1_LINE;
	sCommand.NbData      		= sz;

	if (HAL_QSPI_Command(&QSPIHandle, &sCommand, HAL_QPSI_TIMEOUT_DEFAULT_VALUE) != HAL_OK)
	{
		return 0;
	}

	if (HAL_QSPI_Transmit(&QSPIHandle, buf, HAL_QPSI_TIMEOUT_DEFAULT_VALUE) != HAL_OK)
	{
		return 0;
	}

	if(QSPI_AutoPollingMemReady(&QSPIHandle, HAL_QPSI_TIMEOUT_DEFAULT_VALUE) != 1)
	{
		return 0;
	}

	
	return 1;
}


static int QSPI_WriteEnable(QSPI_HandleTypeDef *hqspi)
{
	/* Enable write operations ------------------------------------------ */
	sCommand.InstructionMode   = QSPI_INSTRUCTION_1_LINE;
	sCommand.Instruction       = CMD_WRITE_ENABLE;
	sCommand.AddressMode       = QSPI_ADDRESS_NONE;
	sCommand.AlternateByteMode = QSPI_ALTERNATE_BYTES_NONE;
	sCommand.DataMode          = QSPI_DATA_NONE;
	sCommand.DummyCycles       = 0;
	sCommand.DdrMode           = QSPI_DDR_MODE_DISABLE;
	sCommand.DdrHoldHalfCycle  = QSPI_DDR_HHC_ANALOG_DELAY;
	sCommand.SIOOMode          = QSPI_SIOO_INST_EVERY_CMD;

	if (HAL_QSPI_Command(&QSPIHandle, &sCommand, HAL_QPSI_TIMEOUT_DEFAULT_VALUE) != HAL_OK)
	{
		return 0;
	}

	/* Configure automatic polling mode to wait for write enabling ---- */    
	sConfig.Match           = 0x02;
	sConfig.Mask            = 0x02;
	sConfig.MatchMode       = QSPI_MATCH_MODE_AND;
	sConfig.StatusBytesSize = 1;
	sConfig.Interval        = 0x10;
	sConfig.AutomaticStop   = QSPI_AUTOMATIC_STOP_ENABLE;

	sCommand.Instruction    = CMD_READ_STATUS_REGISTER;
	sCommand.DataMode       = QSPI_DATA_1_LINE;
	sCommand.NbData         = 1;
	
	if (HAL_QSPI_AutoPolling(&QSPIHandle, &sCommand, &sConfig, HAL_QPSI_TIMEOUT_DEFAULT_VALUE) != HAL_OK)
	{
		return 0;
	}

	return 1;
}


static int QSPI_AutoPollingMemReady(QSPI_HandleTypeDef *hqspi, uint32_t Timeout)
{
	/* Configure automatic polling mode to wait for memory ready ------ */  
	sCommand.InstructionMode	= QSPI_INSTRUCTION_1_LINE;
	sCommand.Instruction		= CMD_READ_STATUS_REGISTER;
	sCommand.AddressMode		= QSPI_ADDRESS_NONE;
	sCommand.AlternateByteMode 	= QSPI_ALTERNATE_BYTES_NONE;
	sCommand.DataMode			= QSPI_DATA_1_LINE;
	sCommand.DummyCycles		= 0;
	sCommand.DdrMode			= QSPI_DDR_MODE_DISABLE;
	sCommand.DdrHoldHalfCycle	= QSPI_DDR_HHC_ANALOG_DELAY;
	sCommand.SIOOMode			= QSPI_SIOO_INST_EVERY_CMD;

	sConfig.Match           	= 0x00;
	sConfig.Mask            	= 0x01;
	sConfig.MatchMode       	= QSPI_MATCH_MODE_AND;
	sConfig.StatusBytesSize 	= 1;
	sConfig.Interval			= 0x10;
	sConfig.AutomaticStop		= QSPI_AUTOMATIC_STOP_ENABLE;

	if (HAL_QSPI_AutoPolling(&QSPIHandle, &sCommand, &sConfig, Timeout) != HAL_OK)
	{
		return 0;
	}

	return 1;
}


static int QSPI_ResetMemory(QSPI_HandleTypeDef *hqspi)
{
	QSPI_CommandTypeDef s_command;
	
	/* Initialize the reset enable command */
	s_command.InstructionMode   = QSPI_INSTRUCTION_1_LINE;
	s_command.Instruction       = CMD_RESET_ENABLE;
	s_command.AddressMode       = QSPI_ADDRESS_NONE;
	s_command.AlternateByteMode = QSPI_ALTERNATE_BYTES_NONE;
	s_command.DataMode          = QSPI_DATA_NONE;
	s_command.DummyCycles       = 0;
	s_command.DdrMode           = QSPI_DDR_MODE_DISABLE;
	s_command.DdrHoldHalfCycle  = QSPI_DDR_HHC_ANALOG_DELAY;
	s_command.SIOOMode          = QSPI_SIOO_INST_EVERY_CMD;

	if (HAL_QSPI_Command(&QSPIHandle, &s_command, HAL_QPSI_TIMEOUT_DEFAULT_VALUE) != HAL_OK)
	{
		return 0;
	}
	
	if (QSPI_AutoPollingMemReady(&QSPIHandle, HAL_QPSI_TIMEOUT_DEFAULT_VALUE) != 1)
	{
		return 0;
	}
	
	s_command.Instruction = CMD_RESET_DEVICE;
	
	if (HAL_QSPI_Command(&QSPIHandle, &s_command, HAL_QPSI_TIMEOUT_DEFAULT_VALUE) != HAL_OK)
	{
		return 0;
	}

	if (QSPI_AutoPollingMemReady(&QSPIHandle, HAL_QPSI_TIMEOUT_DEFAULT_VALUE) != 1)
	{
		return 0;
	}

	return 1;
}


static int QSPI_EnableMemoryMappedMode(void)
{
	char MemoryMappedMode = 0; 

	if (!MemoryMappedMode)
	{
		QSPI_MemoryMappedTypeDef sMemMappedCfg;
		
		uint8_t value = W25Q64_FSR_QE;
		  
		sCommand.Instruction       	= W25Q64_VOLATILE_SR_WRITE_ENABLE;
		sCommand.InstructionMode   	= QSPI_INSTRUCTION_1_LINE;
		sCommand.AddressSize		= QSPI_ADDRESS_24_BITS;
		sCommand.AddressMode		= QSPI_ADDRESS_NONE;
		sCommand.AlternateByteMode 	= QSPI_ALTERNATE_BYTES_NONE;
		sCommand.DataMode          	= QSPI_DATA_NONE;
		sCommand.DummyCycles       	= 0;
		sCommand.NbData            	= 1;
		sCommand.DdrMode			= QSPI_DDR_MODE_DISABLE;
		sCommand.DdrHoldHalfCycle	= QSPI_DDR_HHC_ANALOG_DELAY;
		sCommand.SIOOMode			= QSPI_SIOO_INST_EVERY_CMD;
		
		if (HAL_QSPI_Command(&QSPIHandle, &sCommand, HAL_QPSI_TIMEOUT_DEFAULT_VALUE) != HAL_OK)
		{
			return 0;
		}

		sCommand.Instruction       = W25Q64_WRITE_STATUS_REGISTER_2;
		sCommand.DataMode          = QSPI_DATA_1_LINE;
		
		if (HAL_QSPI_Command(&QSPIHandle, &sCommand, HAL_QPSI_TIMEOUT_DEFAULT_VALUE) != HAL_OK)
		{
			return 0;
		}
		
		if (HAL_QSPI_Transmit(&QSPIHandle, &value, HAL_QPSI_TIMEOUT_DEFAULT_VALUE) != HAL_OK)
		{
			return 0;
		}
		
		sCommand.Instruction       = W25Q64_ENTER_QUAD_MODE;
		sCommand.DataMode          = QSPI_DATA_NONE;
		
		if (HAL_QSPI_Command(&QSPIHandle, &sCommand, HAL_QPSI_TIMEOUT_DEFAULT_VALUE) != HAL_OK)
		{
			return 0;
		}

		value = 0x20;
		sCommand.Instruction        = W25Q64_SET_READ_PARAMETERS;
		sCommand.InstructionMode    = QSPI_INSTRUCTION_4_LINES;
		sCommand.DataMode           = QSPI_DATA_4_LINES;

		if (HAL_QSPI_Command(&QSPIHandle, &sCommand, HAL_QPSI_TIMEOUT_DEFAULT_VALUE) != HAL_OK)
		{
			return 0;
		}
		
		if (HAL_QSPI_Transmit(&QSPIHandle, &value, HAL_QPSI_TIMEOUT_DEFAULT_VALUE) != HAL_OK)
		{
			return 0;
		}
		
		
		sCommand.AddressSize 		= QSPI_ADDRESS_24_BITS;
		sCommand.AlternateByteMode 	= QSPI_ALTERNATE_BYTES_4_LINES;
		sCommand.AlternateBytesSize = QSPI_ALTERNATE_BYTES_8_BITS;
		sCommand.AlternateBytes 	= 0;	// Continuous read mode off
		sCommand.DdrMode 			= QSPI_DDR_MODE_DISABLE;
		sCommand.DdrHoldHalfCycle 	= QSPI_DDR_HHC_ANALOG_DELAY;
		sCommand.SIOOMode 			= QSPI_SIOO_INST_EVERY_CMD;
		sCommand.InstructionMode 	= QSPI_INSTRUCTION_4_LINES;
		sCommand.AddressMode 		= QSPI_ADDRESS_4_LINES;
		sCommand.DataMode 			= QSPI_DATA_4_LINES;
		sCommand.DummyCycles 		= 4; // Subtract alternate byte
		sCommand.Instruction 		= CMD_FAST_READ_QUAD_IN_OUT;

		sMemMappedCfg.TimeOutActivation = QSPI_TIMEOUT_COUNTER_DISABLE;

		if (HAL_QSPI_MemoryMapped(&QSPIHandle, &sCommand, &sMemMappedCfg) != HAL_OK)
		{
			return 0;
		}
	}
	return 1;
}


void SystemClock_Config(void)
{
	RCC_OscInitTypeDef RCC_OscInitStruct;
	RCC_ClkInitTypeDef RCC_ClkInitStruct;

	__HAL_RCC_PWR_CLK_ENABLE();
	__HAL_PWR_VOLTAGESCALING_CONFIG(PWR_REGULATOR_VOLTAGE_SCALE1);
	
	RCC_OscInitStruct.OscillatorType = RCC_OSCILLATORTYPE_HSE;
	RCC_OscInitStruct.HSEState = RCC_HSE_ON;
	RCC_OscInitStruct.PLL.PLLState = RCC_PLL_ON;
	RCC_OscInitStruct.PLL.PLLSource = RCC_PLLSOURCE_HSE;
	RCC_OscInitStruct.PLL.PLLM = 4;
	RCC_OscInitStruct.PLL.PLLN = 200;
	RCC_OscInitStruct.PLL.PLLP = RCC_PLLP_DIV2;
	RCC_OscInitStruct.PLL.PLLQ = 2;

	if (HAL_RCC_OscConfig(&RCC_OscInitStruct) != HAL_OK)
	{
		while(1) { ; }
	}
	
	if (HAL_PWREx_EnableOverDrive() != HAL_OK)
	{
		while(1) { ; }
	}

	RCC_ClkInitStruct.ClockType = RCC_CLOCKTYPE_HCLK|RCC_CLOCKTYPE_SYSCLK
					  |RCC_CLOCKTYPE_PCLK1|RCC_CLOCKTYPE_PCLK2;
	RCC_ClkInitStruct.SYSCLKSource = RCC_SYSCLKSOURCE_PLLCLK;
	RCC_ClkInitStruct.AHBCLKDivider = RCC_SYSCLK_DIV1;
	RCC_ClkInitStruct.APB1CLKDivider = RCC_HCLK_DIV4;
	RCC_ClkInitStruct.APB2CLKDivider = RCC_HCLK_DIV2;

	if (HAL_RCC_ClockConfig(&RCC_ClkInitStruct, FLASH_LATENCY_6) != HAL_OK)
	{
		while(1) { ; }
	}
	
//	HAL_SYSTICK_Config(HAL_RCC_GetHCLKFreq()/1000);
//	HAL_SYSTICK_CLKSourceConfig(SYSTICK_CLKSOURCE_HCLK);
}

/*******************************************************************************
Description :		       Initialisation of ticks counter 														       
Inputs :						     
TickPriority : Set tick priority 
outputs :																				           
NONE
********************************************************************************/
HAL_StatusTypeDef HAL_InitTick(uint32_t TickPriority)
{
	return HAL_OK;
}

/*******************************************************************************
Description :		       Delay in mS.														       
Inputs :						     
Delay : Time in mS	
outputs :																				           
NONE
********************************************************************************/
void HAL_Delay(__IO uint32_t Delay)
{
	uint32_t i;
	
	for(i = 0; i < Delay * 216000; i++)
	{
		
	}
}
/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
