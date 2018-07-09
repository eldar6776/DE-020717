/**
 ******************************************************************************
 * File Name          : main.c
 * Date               : 10.3.2018.
 * Description        : Hotel Room Thermostat Program Code
 ******************************************************************************
 *
 *
 ******************************************************************************
 */


/* Includes ------------------------------------------------------------------*/
#include "WM.h"
#include "GUI.h"
#include <math.h>
#include "main.h"
#include "common.h"
#include "display.h"
#include "one_wire.h"
#include "thermostat.h"
//#include "waveplayer.h"
#include "stm32746g.h"
#include "stm32746g_ts.h"
#include "stm32746g_qspi.h"
#include "stm32746g_sdram.h"
#include "stm32746g_audio.h"


/* Imported Type  ------------------------------------------------------------*/
/* Imported Variable  --------------------------------------------------------*/
/* Imported Function  --------------------------------------------------------*/
/* Private Type --------------------------------------------------------------*/
ADC_HandleTypeDef hadc3;
UART_HandleTypeDef huart2;
TIM_HandleTypeDef htim3;
TIM_HandleTypeDef htim9;
LTDC_HandleTypeDef  hltdc;
DMA2D_HandleTypeDef hdma2d;
CRC_HandleTypeDef hcrc;
RTC_HandleTypeDef hrtc;
RTC_TimeTypeDef time;
RTC_DateTypeDef date;


/* Private Define ------------------------------------------------------------*/
#define LED_STATUS_SYS_RUN_TIME				1234	// 1s led status toggle period
#define LED_STATUS_SYS_ERROR_TIME			123		// 100ms led status toggle period
#define TOUCH_SCREEN_UPDATE_TIME			5		// 5ms touch screen update period
#define NTC_RREF 							10000  	// 10k NTC value of at 25 degrees
#define NTC_B_VALUE 						3977 	// NTC resistance at 100 degrees
#define NTC_PULLUP							10000	// 10k pullup resistor

static enum
{
	ZERO_CROSS_TRIGGER_PENDING = 0,
	TRIAC_ON_IN_FIRST_HALF_PERIOD,
	TRIAC_OFF_IN_FIRST_HALF_PERIOD,
	TRIAC_ON_IN_SECOND_HALF_PERIOD,
	TRIAC_OFF_IN_SECOND_HALF_PERIOD
	
}TRIAC_ControlState;


/* Private Variable ----------------------------------------------------------*/
__IO uint32_t SystickCnt;

float ntc_calc;

uint32_t triac_timer;
uint32_t triac_on_timer;
uint32_t triac_on_time;

uint16_t ntc_temperature;
uint16_t ts_update_timer;
uint16_t rtc_bckp_tmr;
uint16_t anin_timer;
uint16_t led_timer;

uint8_t GUI_Initialized;
uint8_t uart_baudrate;
uint8_t SelLayer = 0;
uint8_t ntc_sample_cnt;
uint8_t zero_cross_cnt;

uint16_t ntc_sample_value[10] = {
	2100, 2100, 2100, 2100, 2100, 
	2100, 2100, 2100, 2100, 2100
};

uint8_t RTC_Months[2][12] = {
	{31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31},	/* Not leap year */
	{31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31}	/* Leap year */
};


/* Private Macro -------------------------------------------------------------*/
#define RTC_LEAP_YEAR(year)             ((((year) % 4 == 0) && ((year) % 100 != 0)) || ((year) % 400 == 0))
#define RTC_DAYS_IN_YEAR(x)             RTC_LEAP_YEAR(x) ? 366 : 365
#define RTC_BCD2BIN(x)                  ((((x) >> 4) & 0x0F) * 10 + ((x) & 0x0F))
#define RTC_CHAR2NUM(x)                 ((x) - '0')
#define RTC_CHARISNUM(x)                ((x) >= '0' && (x) <= '9')
#define FAN_CONTROL_LOOP_PERIOD			200	// fan speed control loop 


/* Private Function Prototype ------------------------------------------------*/
static void MPU_Config(void);
static void CACHE_Config(void);
static void SystemClock_Config(void);
static void MX_GPIO_Init(void);
static void MX_CRC_Init(void);
static void MX_RTC_Init(void);
static void MX_TIM3_Init(void);
static void MX_TIM9_Init(void);
static void MX_UART2_Init(void);
static void MX_ADC3_Init(void);
void TouchUpdate(void);
void BootloaderExe(void);
void Error_Handler(void);
float NTC_GetResistance(uint16_t adc_value);
float NTC_GetTemperature(float ntc_resistance);

/* Program Code  -------------------------------------------------------------*/
int main(void)
{
	MPU_Config();
	CACHE_Config();
	HAL_Init(); 
	SystemClock_Config();
	MX_RTC_Init();
	MX_ADC3_Init();
	MX_UART2_Init();
	MX_TIM3_Init();
	MX_TIM9_Init();
	MX_GPIO_Init();
	MX_QSPI_Init();
	SDRAM_Init();
	MX_CRC_Init();
	TOUCH_SCREEN_Init(480, 272);
	ONEWIRE_Init();
	THERMOSTAT_Init();
	DISPLAY_Init();
	
	while(1)
	{
		ONEWIRE_Service();
		THERMOSTAT_Service();
		DISPLAY_Service();
	}
}


static void MPU_Config(void)
{
	MPU_Region_InitTypeDef MPU_InitStruct;

	/* Disable the MPU */
	HAL_MPU_Disable();

	/* Configure the MPU attributes as WT for SRAM */
	MPU_InitStruct.Enable           = MPU_REGION_ENABLE;
	MPU_InitStruct.BaseAddress      = 0x20010000;
	MPU_InitStruct.Size             = MPU_REGION_SIZE_256KB;
	MPU_InitStruct.AccessPermission = MPU_REGION_FULL_ACCESS;
	MPU_InitStruct.IsBufferable     = MPU_ACCESS_NOT_BUFFERABLE;
	MPU_InitStruct.IsCacheable      = MPU_ACCESS_CACHEABLE;
	MPU_InitStruct.IsShareable      = MPU_ACCESS_SHAREABLE;
	MPU_InitStruct.Number           = MPU_REGION_NUMBER0;
	MPU_InitStruct.TypeExtField     = MPU_TEX_LEVEL0;
	MPU_InitStruct.SubRegionDisable = 0x00;
	MPU_InitStruct.DisableExec      = MPU_INSTRUCTION_ACCESS_ENABLE;
	HAL_MPU_ConfigRegion(&MPU_InitStruct);

	/* Configure the MPU attributes for Quad-SPI area to strongly ordered
	 This setting is essentially needed to avoid MCU blockings! 
	 See also STM Application Note AN4861 */
	MPU_InitStruct.Enable           = MPU_REGION_ENABLE;
	MPU_InitStruct.Number           = MPU_REGION_NUMBER2;
	MPU_InitStruct.BaseAddress      = 0x90000000;
	MPU_InitStruct.Size             = MPU_REGION_SIZE_256MB;
	MPU_InitStruct.SubRegionDisable = 0x0;
	MPU_InitStruct.TypeExtField     = MPU_TEX_LEVEL0;
	MPU_InitStruct.AccessPermission = MPU_REGION_NO_ACCESS;
	MPU_InitStruct.DisableExec      = MPU_INSTRUCTION_ACCESS_DISABLE;
	MPU_InitStruct.IsShareable      = MPU_ACCESS_SHAREABLE;
	MPU_InitStruct.IsCacheable      = MPU_ACCESS_NOT_CACHEABLE;
	MPU_InitStruct.IsBufferable     = MPU_ACCESS_NOT_BUFFERABLE;
	HAL_MPU_ConfigRegion(&MPU_InitStruct);

	/* Configure the MPU attributes for the QSPI 64MB to normal memory Cacheable, must reflect the real memory size */
	MPU_InitStruct.Enable           = MPU_REGION_ENABLE;
	MPU_InitStruct.Number           = MPU_REGION_NUMBER3;
	MPU_InitStruct.BaseAddress      = 0x90000000;
	MPU_InitStruct.Size             = MPU_REGION_SIZE_16MB; // Set region size according to the QSPI memory size
	MPU_InitStruct.SubRegionDisable = 0x0;
	MPU_InitStruct.TypeExtField     = MPU_TEX_LEVEL0;
	MPU_InitStruct.AccessPermission = MPU_REGION_FULL_ACCESS;
	MPU_InitStruct.DisableExec      = MPU_INSTRUCTION_ACCESS_DISABLE;
	MPU_InitStruct.IsShareable      = MPU_ACCESS_SHAREABLE;
	MPU_InitStruct.IsCacheable      = MPU_ACCESS_CACHEABLE;
	MPU_InitStruct.IsBufferable     = MPU_ACCESS_NOT_BUFFERABLE;
	HAL_MPU_ConfigRegion(&MPU_InitStruct);

	/* Configure the MPU attributes for SDRAM_Banks area to strongly ordered
	 This setting is essentially needed to avoid MCU blockings!
	 See also STM Application Note AN4861 */
	MPU_InitStruct.Enable           = MPU_REGION_ENABLE;
	MPU_InitStruct.Number           = MPU_REGION_NUMBER4;
	MPU_InitStruct.BaseAddress      = 0xC0000000;
	MPU_InitStruct.Size             = MPU_REGION_SIZE_512MB;
	MPU_InitStruct.SubRegionDisable = 0x0;
	MPU_InitStruct.TypeExtField     = MPU_TEX_LEVEL0;
	MPU_InitStruct.AccessPermission = MPU_REGION_NO_ACCESS;
	MPU_InitStruct.DisableExec      = MPU_INSTRUCTION_ACCESS_DISABLE;
	MPU_InitStruct.IsShareable      = MPU_ACCESS_SHAREABLE;
	MPU_InitStruct.IsCacheable      = MPU_ACCESS_NOT_CACHEABLE;
	MPU_InitStruct.IsBufferable     = MPU_ACCESS_NOT_BUFFERABLE;
	HAL_MPU_ConfigRegion(&MPU_InitStruct);

	/* Configure the MPU attributes for SDRAM 16MB to normal memory Cacheable */
	MPU_InitStruct.Enable           = MPU_REGION_ENABLE;
	MPU_InitStruct.Number           = MPU_REGION_NUMBER5;
	MPU_InitStruct.BaseAddress      = 0xC0000000;
	MPU_InitStruct.Size             = MPU_REGION_SIZE_8MB;
	MPU_InitStruct.SubRegionDisable = 0x0;
	MPU_InitStruct.TypeExtField     = MPU_TEX_LEVEL0;
	MPU_InitStruct.AccessPermission = MPU_REGION_FULL_ACCESS;
	MPU_InitStruct.DisableExec      = MPU_INSTRUCTION_ACCESS_ENABLE;
	MPU_InitStruct.IsShareable      = MPU_ACCESS_SHAREABLE;
	MPU_InitStruct.IsCacheable      = MPU_ACCESS_CACHEABLE;
	MPU_InitStruct.IsBufferable     = MPU_ACCESS_NOT_BUFFERABLE;
	HAL_MPU_ConfigRegion(&MPU_InitStruct);

	/* Enable the MPU */
	HAL_MPU_Enable(MPU_PRIVILEGED_DEFAULT);
	
	/* Disable FMC bank1 (0x6000 0000 - 0x6FFF FFFF), since it is not used.
	This setting avoids unnedded speculative access to the first FMC bank.
	See also STM Application Note AN4861 */
	FMC_Bank1->BTCR[0] = 0x000030D2;
}

static void CACHE_Config(void)
{
//	SCB_InvalidateICache();
//	SCB->CCR |= (1 <<18);
//	__DSB();
//	SCB_InvalidateICache();
	SCB_EnableICache();
//	SCB_InvalidateDCache();
	SCB_EnableDCache();	
	
//	__HAL_RCC_BKPSRAM_CLK_ENABLE();
}


void HAL_SYSTICK_Callback(void)
{
	uint8_t t;
	static int i = 0;
	
	if(++rtc_bckp_tmr > 999U)
	{
		rtc_bckp_tmr = 0;
		HAL_RTC_GetDate(&hrtc, &date, RTC_FORMAT_BCD);
		HAL_RTCEx_BKUPWrite(&hrtc, RTC_BKP_DR2, date.Date);
		HAL_RTCEx_BKUPWrite(&hrtc, RTC_BKP_DR3, date.Month);
		HAL_RTCEx_BKUPWrite(&hrtc, RTC_BKP_DR4, date.WeekDay);
		HAL_RTCEx_BKUPWrite(&hrtc, RTC_BKP_DR5, date.Year);
	}
	
	if(hadc3.Instance == ADC3)
	{
		if (++anin_timer >= 123)
		{
			anin_timer = 0;			
			HAL_ADC_Start(&hadc3);
			HAL_ADC_PollForConversion(&hadc3, 10);
			ntc_sample_value[ntc_sample_cnt] = HAL_ADC_GetValue(&hadc3);
			if(++ntc_sample_cnt >  9) ntc_sample_cnt = 0;
			ntc_temperature = 0;
			for(t = 0; t < 10; t++) ntc_temperature += ntc_sample_value[t];
			ntc_temperature = ntc_temperature / 10;
			ntc_calc = NTC_GetResistance(ntc_temperature);
			ntc_calc = NTC_GetTemperature(ntc_calc);
			if(ntc_calc < 0) 
			{
				ntc_calc *= -1;
				ntc_temperature = (uint16_t) ntc_calc * 10;
				ntc_temperature |= 0x8000;
			}
			else ntc_temperature = (uint16_t) ntc_calc * 10;
		}
	}

	
	if(GUI_Initialized == 1)
	{
		if(ts_update_timer == 0)
		{
//			__HAL_GPIO_EXTI_CLEAR_IT(GPIO_PIN_3);
//			HAL_NVIC_EnableIRQ(EXTI3_IRQn);
			TouchUpdate();
			ts_update_timer = TOUCH_SCREEN_UPDATE_TIME;
		}
        else --ts_update_timer;
	}	
	
	if(onewire_timer) --onewire_timer;
	if(thermostat_timer) --thermostat_timer;
	if(thermostat_fan_timer) --thermostat_fan_timer;
	if(thermostat_valve_timer) --thermostat_valve_timer;
	if(display_timer) --display_timer;
	if(display_date_time_timer) --display_date_time_timer;
	if(display_doorbell_animation_timer) --display_doorbell_animation_timer;
	
	if(++i > 1000)
	{
		i = 0;
		HAL_GPIO_TogglePin(GPIOD, GPIO_PIN_7);
	}
}

static void SystemClock_Config(void)
{
	RCC_OscInitTypeDef RCC_OscInitStruct;
	RCC_ClkInitTypeDef RCC_ClkInitStruct;
	RCC_PeriphCLKInitTypeDef PeriphClkInitStruct;

	/**Configure the main internal regulator output voltage 
	*/
	__HAL_RCC_PWR_CLK_ENABLE();

	__HAL_PWR_VOLTAGESCALING_CONFIG(PWR_REGULATOR_VOLTAGE_SCALE1);

	/**Initializes the CPU, AHB and APB busses clocks 
	*/
	RCC_OscInitStruct.OscillatorType = RCC_OSCILLATORTYPE_HSE|RCC_OSCILLATORTYPE_LSE;
	RCC_OscInitStruct.HSEState = RCC_HSE_ON;
	RCC_OscInitStruct.LSEState = RCC_LSE_ON;
	RCC_OscInitStruct.PLL.PLLState = RCC_PLL_ON;
	RCC_OscInitStruct.PLL.PLLSource = RCC_PLLSOURCE_HSE;
	RCC_OscInitStruct.PLL.PLLM = 4;
	RCC_OscInitStruct.PLL.PLLN = 200;
	RCC_OscInitStruct.PLL.PLLP = RCC_PLLP_DIV2;
	RCC_OscInitStruct.PLL.PLLQ = 2;
	
	if (HAL_RCC_OscConfig(&RCC_OscInitStruct) != HAL_OK)
	{
		Error_Handler();
	}

	/**Activate the Over-Drive mode 
	*/
	if (HAL_PWREx_EnableOverDrive() != HAL_OK)
	{
		Error_Handler();
	}

	/**Initializes the CPU, AHB and APB busses clocks 
	*/
	RCC_ClkInitStruct.ClockType = RCC_CLOCKTYPE_HCLK|RCC_CLOCKTYPE_SYSCLK
							  |RCC_CLOCKTYPE_PCLK1|RCC_CLOCKTYPE_PCLK2;
	RCC_ClkInitStruct.SYSCLKSource = RCC_SYSCLKSOURCE_PLLCLK;
	RCC_ClkInitStruct.AHBCLKDivider = RCC_SYSCLK_DIV1;
	RCC_ClkInitStruct.APB1CLKDivider = RCC_HCLK_DIV4;
	RCC_ClkInitStruct.APB2CLKDivider = RCC_HCLK_DIV2;

	if (HAL_RCC_ClockConfig(&RCC_ClkInitStruct, FLASH_LATENCY_6) != HAL_OK)
	{
		Error_Handler();
	}

	PeriphClkInitStruct.PeriphClockSelection = RCC_PERIPHCLK_LTDC|RCC_PERIPHCLK_RTC
							  |RCC_PERIPHCLK_USART1|RCC_PERIPHCLK_USART2
							  |RCC_PERIPHCLK_SAI2|RCC_PERIPHCLK_I2C3
							  |RCC_PERIPHCLK_I2C4;
	PeriphClkInitStruct.PLLSAI.PLLSAIN = 57;
	PeriphClkInitStruct.PLLSAI.PLLSAIR = 3;
	PeriphClkInitStruct.PLLSAI.PLLSAIQ = 2;
	PeriphClkInitStruct.PLLSAI.PLLSAIP = RCC_PLLSAIP_DIV2;
	PeriphClkInitStruct.PLLSAIDivQ = 1;
	PeriphClkInitStruct.PLLSAIDivR = RCC_PLLSAIDIVR_4;
	PeriphClkInitStruct.RTCClockSelection = RCC_RTCCLKSOURCE_LSE;
	PeriphClkInitStruct.Sai2ClockSelection = RCC_SAI2CLKSOURCE_PLLSAI;
	PeriphClkInitStruct.Usart1ClockSelection = RCC_USART1CLKSOURCE_PCLK2;
	PeriphClkInitStruct.Usart2ClockSelection = RCC_USART2CLKSOURCE_PCLK1;
	PeriphClkInitStruct.I2c3ClockSelection = RCC_I2C3CLKSOURCE_PCLK1;
	PeriphClkInitStruct.I2c4ClockSelection = RCC_I2C4CLKSOURCE_PCLK1;
	
	if (HAL_RCCEx_PeriphCLKConfig(&PeriphClkInitStruct) != HAL_OK)
	{
		Error_Handler();
	}

	/**Configure the Systick interrupt time 
	*/
	HAL_SYSTICK_Config(HAL_RCC_GetHCLKFreq()/1000);

	/**Configure the Systick 
	*/
	HAL_SYSTICK_CLKSourceConfig(SYSTICK_CLKSOURCE_HCLK);

	/* SysTick_IRQn interrupt configuration */
	HAL_NVIC_SetPriority(SysTick_IRQn, 0, 0);
}



void RTC_GetDateTime(RTC_t* data, uint32_t format) 
{
	uint32_t unix;

	/* Get time */
	if (format == RTC_FORMAT_BIN) 
	{
		HAL_RTC_GetTime(&hrtc, &time, RTC_FORMAT_BIN);
	} 
	else 
	{
		HAL_RTC_GetTime(&hrtc, &time, RTC_FORMAT_BCD);
	}
	
	/* Format hours */
	data->hours = time.Hours;
	data->minutes = time.Minutes;
	data->seconds = time.Seconds;
	
	/* Get subseconds */
	data->subseconds = RTC->SSR;
	
	/* Get date */
	if (format == RTC_FORMAT_BIN) 
	{
		HAL_RTC_GetDate(&hrtc, &date, RTC_FORMAT_BIN);
	} 
	else 
	{
		HAL_RTC_GetDate(&hrtc, &date, RTC_FORMAT_BCD);
	}
	
	/* Format date */
	data->year = date.Year;
	data->month = date.Month;
	data->date = date.Date;
	data->day = date.WeekDay;
	
	/* Calculate unix offset */
	unix = RTC_GetUnixTimeStamp(data);
	data->unix = unix;
}


uint32_t RTC_GetUnixTimeStamp(RTC_t* data) 
{
	uint32_t days = 0, seconds = 0;
	uint16_t i;
	uint16_t year = (uint16_t) (data->year + 2000);
	
	/* Year is below offset year */
	if (year < RTC_OFFSET_YEAR) 
	{
		return 0;
	}
	
	/* Days in back years */
	for (i = RTC_OFFSET_YEAR; i < year; i++) 
	{
		days += RTC_DAYS_IN_YEAR(i);
	}
	
	/* Days in current year */
	for (i = 1; i < data->month; i++) 
	{
		days += RTC_Months[RTC_LEAP_YEAR(year)][i - 1];
	}
	
	/* Day starts with 1 */
	days += data->date - 1;
	seconds = days * RTC_SECONDS_PER_DAY;
	seconds += data->hours * RTC_SECONDS_PER_HOUR;
	seconds += data->minutes * RTC_SECONDS_PER_MINUTE;
	seconds += data->seconds;
	
	/* seconds = days * 86400; */
	return seconds;
}


void RTC_GetDateTimeFromUnix(RTC_t* data, uint32_t unix) 
{
	uint16_t year;
	
	/* Store unix time to unix in struct */
	data->unix = unix;
	/* Get seconds from unix */
	data->seconds = unix % 60;
	/* Go to minutes */
	unix /= 60;
	/* Get minutes */
	data->minutes = unix % 60;
	/* Go to hours */
	unix /= 60;
	/* Get hours */
	data->hours = unix % 24;
	/* Go to days */
	unix /= 24;
	
	/* Get week day */
	/* Monday is day one */
	data->day = (unix + 3) % 7 + 1;

	/* Get year */
	year = 1970;
	while (1) 
	{
		if (RTC_LEAP_YEAR(year)) 
		{
			if (unix >= 366) 
			{
				unix -= 366;
			} 
			else 
			{
				break;
			}
		} 
		else if (unix >= 365) 
		{
			unix -= 365;
		} 
		else 
		{
			break;
		}
		year++;
	}
	
	/* Get year in xx format */
	data->year = (uint8_t) (year - 2000);
	
	/* Get month */
	for (data->month = 0; data->month < 12; data->month++) 
	{
		if (RTC_LEAP_YEAR(year)) 
		{
			if (unix >= (uint32_t)RTC_Months[1][data->month]) 
			{
				unix -= RTC_Months[1][data->month];
			}
			else 
			{
				break;
			}
		} 
		else if (unix >= (uint32_t)RTC_Months[0][data->month]) 
		{
			unix -= RTC_Months[0][data->month];
		} 
		else
		{
			break;
		}
	}
	
	/* Get month */
	/* Month starts with 1 */
	data->month++;
	/* Get date */
	/* Date starts with 1 */
	data->date = unix + 1;
}


void HAL_RTC_MspInit(RTC_HandleTypeDef *hrtc)
{
	RCC_OscInitTypeDef        RCC_OscInitStruct;
	RCC_PeriphCLKInitTypeDef  PeriphClkInitStruct;

	RCC_OscInitStruct.OscillatorType =  RCC_OSCILLATORTYPE_LSI | RCC_OSCILLATORTYPE_LSE;
	RCC_OscInitStruct.PLL.PLLState = RCC_PLL_NONE;
	RCC_OscInitStruct.LSEState = RCC_LSE_ON;
	RCC_OscInitStruct.LSIState = RCC_LSI_OFF;
	
	if(HAL_RCC_OscConfig(&RCC_OscInitStruct) != HAL_OK)
	{ 
		return;
	}

	PeriphClkInitStruct.PeriphClockSelection = RCC_PERIPHCLK_RTC;
	PeriphClkInitStruct.RTCClockSelection = RCC_RTCCLKSOURCE_LSE;
	
	if(HAL_RCCEx_PeriphCLKConfig(&PeriphClkInitStruct) != HAL_OK)
	{ 
		return;
	}

	__HAL_RCC_RTC_ENABLE(); 
}


void HAL_RTC_MspDeInit(RTC_HandleTypeDef *hrtc)
{
	__HAL_RCC_RTC_DISABLE();
}


static void MX_RTC_Init(void)
{
	hrtc.Instance = RTC; 
	hrtc.Init.HourFormat = RTC_HOURFORMAT_24;
	hrtc.Init.AsynchPrediv = RTC_ASYNCH_PREDIV;
	hrtc.Init.SynchPrediv = RTC_SYNCH_PREDIV;
	hrtc.Init.OutPut = RTC_OUTPUT_DISABLE;
	hrtc.Init.OutPutPolarity = RTC_OUTPUT_POLARITY_HIGH;
	hrtc.Init.OutPutType = RTC_OUTPUT_TYPE_OPENDRAIN;

	if (HAL_RTC_Init(&hrtc) != HAL_OK)
	{
		Error_Handler();
	}
	
	if (HAL_RTCEx_BKUPRead(&hrtc, RTC_BKP_DR1) != 0xA3A5)
	{
		time.Hours = 0x08;
		time.Minutes = 0x40;
		time.Seconds = 0;
		date.Date = 0x21;
		date.Month = 0x05;
		date.WeekDay = 0x01;
		date.Year = 0x18;
		HAL_RTC_SetTime(&hrtc, &time, RTC_FORMAT_BCD);
		HAL_RTC_SetDate(&hrtc, &date, RTC_FORMAT_BCD);
		HAL_RTC_WaitForSynchro(&hrtc);
		HAL_RTCEx_BKUPWrite(&hrtc, RTC_BKP_DR1, 0xA3A5);
	}
	else 
	{
		date.Date = HAL_RTCEx_BKUPRead(&hrtc, RTC_BKP_DR2);
		date.Month = HAL_RTCEx_BKUPRead(&hrtc, RTC_BKP_DR3);
		date.WeekDay = HAL_RTCEx_BKUPRead(&hrtc, RTC_BKP_DR4);
		date.Year = HAL_RTCEx_BKUPRead(&hrtc, RTC_BKP_DR5);
		HAL_RTC_SetDate(&hrtc, &date, RTC_FORMAT_BCD);
		HAL_RTC_WaitForSynchro(&hrtc);
	}
}


void HAL_TIM_PeriodElapsedCallback(TIM_HandleTypeDef *htim)
{
	__HAL_TIM_CLEAR_FLAG(&htim3, TIM_FLAG_UPDATE);
	
	if(triac_on_time == 0) 
	{
		HAL_GPIO_WritePin(GPIOC, GPIO_PIN_8, GPIO_PIN_RESET);
		return;
	}
	else if(++triac_timer < triac_on_timer) return;
	
	triac_timer = 0;
	triac_on_timer = 1;
	HAL_GPIO_WritePin(GPIOC, GPIO_PIN_8, GPIO_PIN_RESET);
		
	if(TRIAC_ControlState == TRIAC_ON_IN_FIRST_HALF_PERIOD)
	{
		HAL_GPIO_WritePin(GPIOC, GPIO_PIN_8, GPIO_PIN_SET);
		TRIAC_ControlState = TRIAC_OFF_IN_FIRST_HALF_PERIOD;
	}
	else if(TRIAC_ControlState == TRIAC_OFF_IN_FIRST_HALF_PERIOD)
	{
		triac_on_timer = 99;
		TRIAC_ControlState = TRIAC_ON_IN_SECOND_HALF_PERIOD;
	}
	else if(TRIAC_ControlState == TRIAC_ON_IN_SECOND_HALF_PERIOD)
	{
		HAL_GPIO_WritePin(GPIOC, GPIO_PIN_8, GPIO_PIN_SET);
		TRIAC_ControlState = TRIAC_OFF_IN_SECOND_HALF_PERIOD;
	}
	else if(TRIAC_ControlState == TRIAC_OFF_IN_SECOND_HALF_PERIOD)
	{
		TRIAC_ControlState = ZERO_CROSS_TRIGGER_PENDING;
		HAL_TIM_Base_Stop_IT(&htim3);
		HAL_NVIC_DisableIRQ(TIM3_IRQn);
		__HAL_GPIO_EXTI_CLEAR_IT(GPIO_PIN_13);
		HAL_NVIC_EnableIRQ(EXTI15_10_IRQn);
	}
}


void HAL_TIM_Base_MspInit(TIM_HandleTypeDef *htim)
{
	__HAL_RCC_TIM3_CLK_ENABLE();
	HAL_NVIC_SetPriority(TIM3_IRQn, 0, 0);
	HAL_NVIC_EnableIRQ(TIM3_IRQn);
}


static void MX_TIM3_Init(void)
{
	/**
	*	SYSCLK=200MHz => AHB prescaler/1 => HCLK=200MHz =>APB1 prescaler/4 => x2 => APB1 timer clock=100MHz
	*/
	htim3.Instance = TIM3;
	htim3.Init.Period = 9999;		// 100us 
	htim3.Init.Prescaler = 0;			
	htim3.Init.ClockDivision = 0;
	htim3.Init.CounterMode = TIM_COUNTERMODE_UP;

	if(HAL_TIM_Base_Init(&htim3) != HAL_OK)
	{
		Error_Handler();
	}
}


static void MX_TIM9_Init(void)
{
	TIM_ClockConfigTypeDef sClockSourceConfig;
	TIM_OC_InitTypeDef sConfigOC;
	GPIO_InitTypeDef GPIO_InitStruct;
	
	__HAL_RCC_TIM9_CLK_ENABLE();
	__HAL_RCC_GPIOE_CLK_ENABLE();
	
	htim9.Instance = TIM9;
	htim9.Init.Prescaler = 200;
	htim9.Init.CounterMode = TIM_COUNTERMODE_UP;
	htim9.Init.Period = 1000;
	htim9.Init.ClockDivision = TIM_CLOCKDIVISION_DIV1;
	htim9.Init.AutoReloadPreload = TIM_AUTORELOAD_PRELOAD_DISABLE;
	
	if (HAL_TIM_PWM_Init(&htim9) != HAL_OK)
	{
		Error_Handler();
	}

	sConfigOC.OCMode = TIM_OCMODE_PWM1;
	sConfigOC.Pulse = 500;
	sConfigOC.OCPolarity = TIM_OCPOLARITY_HIGH;
	sConfigOC.OCFastMode = TIM_OCFAST_DISABLE;
	
	if (HAL_TIM_PWM_ConfigChannel(&htim9, &sConfigOC, TIM_CHANNEL_1) != HAL_OK)
	{
		Error_Handler();
	}

	/**TIM9 GPIO Configuration    
    PE5     ------> TIM9_CH1 
    */
    GPIO_InitStruct.Pin = GPIO_PIN_5;
    GPIO_InitStruct.Mode = GPIO_MODE_AF_PP;
    GPIO_InitStruct.Pull = GPIO_NOPULL;
    GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
    GPIO_InitStruct.Alternate = GPIO_AF3_TIM9;
    HAL_GPIO_Init(GPIOE, &GPIO_InitStruct);
	
	HAL_TIM_PWM_Start(&htim9, TIM_CHANNEL_1);
}


void HAL_UART_TxCpltCallback(UART_HandleTypeDef* huart)
{
	if(huart->Instance == USART2)
	{

	}
}


void HAL_UART_RxCpltCallback(UART_HandleTypeDef* huart)
{
	if(huart->Instance == USART2)
	{
		if	((onewire_buffer[0] == ONEWIRE_THERMOSTAT_ADDRESS) &&
			(onewire_buffer[1] == ONEWIRE_CONTROLLER_ADDRESS) &&
			(onewire_buffer[63] == CalcCRC(onewire_buffer, 63)))
		{
			onewire_buffer[64] = CalcCRC(onewire_buffer, 63);
			OnewireState = ONEWIRE_PACKET_RECEIVED;
		}
		else 
		{
			HAL_Delay(50);
			__HAL_UART_FLUSH_DRREGISTER(&huart2);
			HAL_UART_Receive_IT(&huart2, onewire_buffer, ONEWIRE_PACKET_SIZE);
			OnewireState = ONEWIRE_PACKET_PENDING;
		}			
	}
}


void HAL_UART_ErrorCallback(UART_HandleTypeDef* huart)
{
	if(huart->Instance == USART2)
	{
		__HAL_UART_CLEAR_PEFLAG(&huart2);
		__HAL_UART_CLEAR_FEFLAG(&huart2);
		__HAL_UART_CLEAR_NEFLAG(&huart2);
		__HAL_UART_CLEAR_IDLEFLAG(&huart2);
		__HAL_UART_CLEAR_OREFLAG(&huart2);
		HAL_Delay(50);
		__HAL_UART_FLUSH_DRREGISTER(&huart2);
		HAL_UART_Receive_IT(&huart2, onewire_buffer, ONEWIRE_PACKET_SIZE);
		OnewireState = ONEWIRE_PACKET_PENDING;
	}
}


static void MX_UART2_Init(void)
{
	GPIO_InitTypeDef  GPIO_InitStruct;
	
	__HAL_RCC_GPIOD_CLK_ENABLE();
	__HAL_RCC_USART2_CLK_ENABLE();

	
	/**USART2 GPIO Configuration    
	PD5     ------> USART2_TX
	PD6     ------> USART2_RX 
	*/
	GPIO_InitStruct.Pin = GPIO_PIN_5|GPIO_PIN_6;
	GPIO_InitStruct.Mode = GPIO_MODE_AF_PP;
	GPIO_InitStruct.Pull = GPIO_NOPULL;
	GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_VERY_HIGH;
	GPIO_InitStruct.Alternate = GPIO_AF7_USART2;
	HAL_GPIO_Init(GPIOD, &GPIO_InitStruct);

	HAL_NVIC_SetPriority(USART2_IRQn, 3,0);
	HAL_NVIC_EnableIRQ(USART2_IRQn);

	huart2.Instance = USART2;
	huart2.Init.BaudRate = 115200;
	huart2.Init.WordLength = UART_WORDLENGTH_7B;
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
}


void HAL_CRC_MspInit(CRC_HandleTypeDef* hcrc)
{
	if(hcrc->Instance == CRC)
	{
		__HAL_RCC_CRC_CLK_ENABLE();
	}
}


void HAL_CRC_MspDeInit(CRC_HandleTypeDef* hcrc)
{
	if(hcrc->Instance == CRC)
	{
		__HAL_RCC_CRC_CLK_DISABLE();
	}
}

static void MX_CRC_Init(void)
{
	hcrc.Instance = CRC;
	
	if (HAL_CRC_Init(&hcrc) != HAL_OK)
	{
		Error_Handler();
	}
}


static void MX_ADC3_Init(void)
{
	ADC_ChannelConfTypeDef sConfig;
	GPIO_InitTypeDef GPIO_InitStruct;

	__HAL_RCC_ADC3_CLK_ENABLE();
	__HAL_RCC_GPIOC_CLK_ENABLE();
	
	GPIO_InitStruct.Pin = GPIO_PIN_1|GPIO_PIN_2|GPIO_PIN_3;
	GPIO_InitStruct.Mode = GPIO_MODE_ANALOG;
	GPIO_InitStruct.Pull = GPIO_NOPULL;
	HAL_GPIO_Init(GPIOC, &GPIO_InitStruct);
	
	
	hadc3.Instance = ADC3;
	hadc3.Init.ClockPrescaler = ADC_CLOCK_SYNC_PCLK_DIV4;
	hadc3.Init.Resolution = ADC_RESOLUTION_12B;
	hadc3.Init.ScanConvMode = DISABLE;
	hadc3.Init.ContinuousConvMode = DISABLE;
	hadc3.Init.DiscontinuousConvMode = DISABLE;
	hadc3.Init.NbrOfDiscConversion = 0;
	hadc3.Init.ExternalTrigConvEdge = ADC_EXTERNALTRIGCONVEDGE_NONE;
	hadc3.Init.DataAlign = ADC_DATAALIGN_RIGHT;
	hadc3.Init.NbrOfConversion = 1;
	hadc3.Init.DMAContinuousRequests = DISABLE;
	hadc3.Init.EOCSelection = ADC_EOC_SINGLE_CONV;

	if(HAL_ADC_Init(&hadc3) != HAL_OK)
	{
		Error_Handler();
	}
	
	sConfig.Channel = ADC_CHANNEL_11;
	sConfig.Rank = ADC_REGULAR_RANK_1;
	sConfig.SamplingTime = ADC_SAMPLETIME_15CYCLES;
	sConfig.Offset = 0;
	HAL_ADC_ConfigChannel(&hadc3, &sConfig);

}


void HAL_GPIO_EXTI_Callback(uint16_t GPIO_Pin)
{
	if(GPIO_Pin == GPIO_PIN_3)
	{
		HAL_NVIC_DisableIRQ(EXTI3_IRQn);
		__HAL_GPIO_EXTI_CLEAR_IT(GPIO_PIN_3);
		
//		if(GUI_Initialized == 1) TouchUpdate();
//		ts_update_timer = TOUCH_SCREEN_UPDATE_TIME;
	}
	else if(GPIO_Pin == GPIO_PIN_13)
	{
		HAL_NVIC_DisableIRQ(EXTI15_10_IRQn);
		__HAL_GPIO_EXTI_CLEAR_IT(GPIO_PIN_13);
		
		if(TRIAC_ControlState == ZERO_CROSS_TRIGGER_PENDING)
		{	
			triac_timer = 0;
			triac_on_timer = triac_on_time;			
			TRIAC_ControlState = TRIAC_ON_IN_FIRST_HALF_PERIOD;
			__HAL_TIM_SET_COUNTER(&htim3, 0);
			HAL_NVIC_EnableIRQ(TIM3_IRQn);
			HAL_TIM_Base_Start_IT(&htim3);
		}
	}
	else if(GPIO_Pin == GPIO_PIN_14)
	{
		HAL_NVIC_DisableIRQ(EXTI15_10_IRQn);
		__HAL_GPIO_EXTI_CLEAR_IT(GPIO_PIN_14);
		
		// fancoil rpm
	}
}


static void MX_GPIO_Init(void)
{
	GPIO_InitTypeDef GPIO_InitStruct;

	/* GPIO Ports Clock Enable */
	__HAL_RCC_GPIOC_CLK_ENABLE();
	__HAL_RCC_GPIOD_CLK_ENABLE();
//	__HAL_RCC_GPIOE_CLK_ENABLE();
	__HAL_RCC_GPIOG_CLK_ENABLE();

	/*Configure GPIO pin Output Level */
	HAL_GPIO_WritePin(GPIOC, GPIO_PIN_8, GPIO_PIN_RESET);
	HAL_GPIO_WritePin(GPIOD, GPIO_PIN_7, GPIO_PIN_RESET);
//	HAL_GPIO_WritePin(GPIOE, GPIO_PIN_5, GPIO_PIN_RESET);
	
	/*Configure GPIO pin : FAN_SPEED_SENSOR_Pin and FANCOIL_MAINS_ZERO_CROSS*/
	GPIO_InitStruct.Pin = GPIO_PIN_13|GPIO_PIN_14;
	GPIO_InitStruct.Mode = GPIO_MODE_IT_RISING;
	GPIO_InitStruct.Pull = GPIO_NOPULL;
	HAL_GPIO_Init(GPIOG, &GPIO_InitStruct);

	GPIO_InitStruct.Pin = GPIO_PIN_8;
	GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
	GPIO_InitStruct.Pull = GPIO_NOPULL;
	GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
	HAL_GPIO_Init(GPIOC, &GPIO_InitStruct);

	GPIO_InitStruct.Pin = GPIO_PIN_7;
	GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
	GPIO_InitStruct.Pull = GPIO_NOPULL;
	GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
	HAL_GPIO_Init(GPIOD, &GPIO_InitStruct);

//	GPIO_InitStruct.Pin = GPIO_PIN_5;
//	GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
//	GPIO_InitStruct.Pull = GPIO_NOPULL;
//	GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
//	HAL_GPIO_Init(GPIOE, &GPIO_InitStruct);
	
	/* EXTI interrupt init*/
	HAL_NVIC_SetPriority(EXTI15_10_IRQn, 0, 0);
	HAL_NVIC_EnableIRQ(EXTI15_10_IRQn);

}


void TouchUpdate(void)
{
	static GUI_PID_STATE TS_State = {0, 0, 0, 0};
	__IO TS_StateTypeDef  ts;
	uint16_t xDiff, yDiff;  

	BSP_TS_GetState((TS_StateTypeDef *)&ts);

	if((ts.touchX[0] >= LCD_GetXSize()) ||(ts.touchY[0] >= LCD_GetYSize()) ) 
	{
		ts.touchX[0] = 0;
		ts.touchY[0] = 0;
		ts.touchDetected =0;
	}

	xDiff = (TS_State.x > ts.touchX[0]) ? (TS_State.x - ts.touchX[0]) : (ts.touchX[0] - TS_State.x);
	yDiff = (TS_State.y > ts.touchY[0]) ? (TS_State.y - ts.touchY[0]) : (ts.touchY[0] - TS_State.y);


	if((TS_State.Pressed != ts.touchDetected ) || (xDiff > 30 ) || (yDiff > 30))
	{
		TS_State.Pressed = ts.touchDetected;
		TS_State.Layer = SelLayer;
		
		if(ts.touchDetected) 
		{
			TS_State.x = ts.touchX[0];
			TS_State.y = ts.touchY[0];
			GUI_TOUCH_StoreStateEx(&TS_State);
		}
		else
		{
			GUI_TOUCH_StoreStateEx(&TS_State);
			TS_State.x = 0;
			TS_State.y = 0;
		}
	}
}

void BootloaderExe(void)
{
//    HAL_ADC_MspDeInit(&hadc1);
	HAL_CRC_MspDeInit(&hcrc);
//    HAL_I2C_MspDeInit(&hi2c1);
    HAL_RTC_MspDeInit(&hrtc);
//    HAL_SPI_MspDeInit(&hspi2);
//    HAL_TIM_PWM_MspDeInit(&htim1);
//	HAL_TIM_PWM_MspDeInit(&htim2);
	HAL_TIM_PWM_MspDeInit(&htim3);
//    HAL_UART_MspDeInit(&huart1);
//    HAL_UART_MspDeInit(&huart2);	
    HAL_NVIC_DisableIRQ(USART1_IRQn);
	HAL_NVIC_DisableIRQ(PVD_IRQn);
    HAL_DeInit();
    HAL_FLASH_OB_Launch();
}


void Error_Handler(void)
{
   // BootloaderExe();
}


void FAN_SetSpeed(uint8_t fan_speed)
{
	if(fan_speed == FAN_OFF)
	{
		HAL_NVIC_DisableIRQ(EXTI15_10_IRQn);
		HAL_NVIC_DisableIRQ(TIM3_IRQn);
		__HAL_TIM_CLEAR_FLAG(&htim3, TIM_FLAG_UPDATE);
		__HAL_GPIO_EXTI_CLEAR_IT(GPIO_PIN_13);
		HAL_TIM_Base_Stop_IT(&htim3);
		HAL_GPIO_WritePin(GPIOC, GPIO_PIN_8, GPIO_PIN_RESET);
		TRIAC_ControlState = ZERO_CROSS_TRIGGER_PENDING;
		triac_on_timer = 0;
		triac_on_time = 0;
		triac_timer = 0;
	}
	else 
	{
		HAL_TIM_Base_Stop_IT(&htim3);
		HAL_NVIC_DisableIRQ(TIM3_IRQn);
		HAL_NVIC_DisableIRQ(EXTI15_10_IRQn);
		__HAL_GPIO_EXTI_CLEAR_IT(GPIO_PIN_13);
		__HAL_TIM_CLEAR_FLAG(&htim3, TIM_FLAG_UPDATE);
		HAL_GPIO_WritePin(GPIOC, GPIO_PIN_8, GPIO_PIN_RESET);
		TRIAC_ControlState = ZERO_CROSS_TRIGGER_PENDING;
		triac_on_time = fan_speed;
		triac_on_timer = 0;		
		triac_timer = 0;
		__HAL_GPIO_EXTI_CLEAR_IT(GPIO_PIN_13);
		HAL_NVIC_EnableIRQ(EXTI15_10_IRQn);
	}
}


float NTC_GetResistance(uint16_t adc_value)
{
	float ntc_res;
	ntc_res = NTC_PULLUP *  (float) adc_value / ( 4095.0  - (float) adc_value);
	return(ntc_res);
}


float NTC_GetTemperature(float ntc_resistance)
{
	float temperature;
	temperature = (1.0 / ((log (ntc_resistance / NTC_RREF)) / NTC_B_VALUE  + 1.0 / 298.0)) - 273.0; 
	return(temperature);
}



/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
