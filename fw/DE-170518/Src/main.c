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
#include "stm32746g_eeprom.h"


/* Imported Type  ------------------------------------------------------------*/
/* Imported Variable  --------------------------------------------------------*/
/* Imported Function  --------------------------------------------------------*/
/* Private Type --------------------------------------------------------------*/
ADC_HandleTypeDef hadc3;
UART_HandleTypeDef huart2;
TIM_HandleTypeDef htim3;
TIM_HandleTypeDef htim9;
I2C_HandleTypeDef hi2c4;
I2C_HandleTypeDef hi2c3;
LTDC_HandleTypeDef hltdc;
DMA2D_HandleTypeDef hdma2d;
CRC_HandleTypeDef hcrc;
RTC_HandleTypeDef hrtc;
RTC_TimeTypeDef time;
RTC_DateTypeDef date;
#ifndef	USE_DEBUGGER
IWDG_HandleTypeDef hiwdg;
#endif

/* Private Define ------------------------------------------------------------*/
#define TOUCH_SCREEN_UPDATE_TIME			22		// 5ms touch screen update period
#define TOUCH_SCREEN_LAYER                  1       // touch screen layer event
#define AMBIENT_NTC_RREF                    10000  	// 10k NTC value of at 25 degrees
#define AMBIENT_NTC_B_VALUE                 3977 	// NTC beta parameter
#define AMBIENT_NTC_PULLUP                  10000	// 10k pullup resistor
#define FANCOIL_NTC_RREF                    2000  	// 2k fancoil NTC value of at 25 degrees
#define FANCOIL_NTC_B_VALUE                 3950 	// NTC beta parameter
#define FANCOIL_NTC_PULLUP                  2200	// 2k2 pullup resistor
#define ADC_READOUT_PERIOD                  123      // 89 ms ntc conversion rate
#define FAN_CONTROL_LOOP_PERIOD			    200	    // fan speed control loop 
#define BUZZER_BUTTON_TIME                  50
#define BUZZER_BIP_TIME                     100
#define BUZZER_SHORT_TIME                   500 
#define BUZZER_LONG_TIME                    1000
#define TRIAC_ON_PULSE                      5       // 500 us triac on pulse duration
#define SYSTEM_STARTUP_TIME                 10000    // 12s system startup config check


/* Private Variable ----------------------------------------------------------*/
__IO uint32_t SystickCnt;
__IO uint32_t sys_flags;
__IO uint32_t sys_timer;
__IO uint32_t anin_timer;
__IO uint32_t fancoil_ntc_timer;

uint32_t triac_timer;
uint32_t triac_on_time;
uint32_t fan_rpm_timer;
uint32_t fan_rpm_pulse;

uint16_t ambient_ntc_b_value = AMBIENT_NTC_B_VALUE;
uint16_t fancoil_ntc_b_value = FANCOIL_NTC_B_VALUE;
uint16_t fancoil_ntc_temperature;
uint16_t ambient_ntc_temperature;
uint16_t ambient_light;
uint16_t ts_update_timer;
uint16_t rtc_bckp_tmr;


uint32_t buzzer_repeat_timer;
uint32_t buzzer_mode_timer;
uint8_t buzzer_repeat_time;
uint8_t buzzer_mode;
uint8_t buzzer_pcnt;

uint8_t ambient_ntc_temperature_sample_cnt;
uint8_t fancoil_ntc_temperature_sample_cnt;
uint8_t ambient_light_sample_cnt;
uint8_t zero_cross_cnt;


uint16_t ambient_ntc_temperature_sample_value[10] = {
	2100, 2100, 2100, 2100, 2100, 
	2100, 2100, 2100, 2100, 2100
};

uint16_t fancoil_ntc_temperature_sample_value[10] = {
	2100, 2100, 2100, 2100, 2100, 
	2100, 2100, 2100, 2100, 2100
};

uint16_t ambient_light_sample_value[10] = {
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


/* Private Function Prototype ------------------------------------------------*/
static void MPU_Config(void);
static void CACHE_Config(void);
static void SystemClock_Config(void);
#ifndef	USE_DEBUGGER
void MX_IWDG_Init(void);
#endif
static void MX_GPIO_Init(void);
static void MX_CRC_Init(void);
static void MX_RTC_Init(void);
static void MX_TIM3_Init(void);
static void MX_TIM9_Init(void);
static void MX_UART2_Init(void);
static void MX_ADC3_Init(void);
static void ADC3_Read(void);
void TouchUpdate(void);
void BootloaderExe(void);
void Error_Handler(void);
float AMBIENT_NTC_GetResistance(uint16_t adc_value);
float AMBIENT_NTC_GetTemperature(float ntc_resistance);
float FANCOIL_NTC_GetResistance(uint16_t adc_value);
float FANCOIL_NTC_GetTemperature(float ntc_resistance);


/* Program Code  -------------------------------------------------------------*/
int main(void)
{
    SYSTEM_StartTimer(SYSTEM_STARTUP_TIME);
	MPU_Config();
	CACHE_Config();
	HAL_Init(); 
	SystemClock_Config();
#ifndef	USE_DEBUGGER
	MX_IWDG_Init();
#endif	
    MX_CRC_Init();
	MX_RTC_Init();
	MX_ADC3_Init();
	MX_UART2_Init();
	MX_TIM3_Init();
	MX_TIM9_Init();
	MX_GPIO_Init();
	MX_QSPI_Init();
    BSP_EEPROM_Init();
    TOUCH_SCREEN_Init(480, 272);
	SDRAM_Init();
	DISPLAY_Init();
	ONEWIRE_Init();
	THERMOSTAT_Init();
    
    
#ifndef	USE_DEBUGGER
	HAL_IWDG_Refresh(&hiwdg);
#endif

	while(1)
	{
        ADC3_Read();
		ONEWIRE_Service();
		THERMOSTAT_Service();
		DISPLAY_Service();
#ifndef	USE_DEBUGGER
        HAL_IWDG_Refresh(&hiwdg);
#endif
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
	SCB_EnableICache();
	SCB_EnableDCache();	
}


void HAL_SYSTICK_Callback(void)
{
    if(sys_timer) --sys_timer;
    else SYSTEM_StartupReset();
    
    if(IsBUZZER_SignalActiv())
	{
        switch (buzzer_mode)
        {
            case BUZZER_MODE_OFF:
            {
                buzzer_pcnt = 0;
                BUZZER_SignalOff();
                break;
            }
            
            case BUZZER_MODE_BIP:
            {
                if((buzzer_pcnt == 0) && IsBUZZER_ModeTimerExpired())
                {
                    if(IsBUZZER_RepeatTimerExpired())
                    {
                        BUZZER_On();
                        BUZZER_StartModeTimer(BUZZER_BIP_TIME);
                        ++buzzer_pcnt;                        
                    }
                }
                else if((buzzer_pcnt == 1) && IsBUZZER_ModeTimerExpired())
                {
                    BUZZER_Off();
                    buzzer_pcnt = 0;
                    if(buzzer_repeat_time == 0) BUZZER_StartModeTimer(BUZZER_BIP_TIME);
                    else BUZZER_StartRepeatTimer(buzzer_repeat_time * 1000);
                }
                break;
            }
            
            case BUZZER_MODE_SHORT:
            {
                if((buzzer_pcnt == 0) && IsBUZZER_ModeTimerExpired())
                {
                    if(IsBUZZER_RepeatTimerExpired())
                    {
                        BUZZER_On();
                        BUZZER_StartModeTimer(BUZZER_SHORT_TIME);
                        ++buzzer_pcnt;                        
                    }
                }
                else if((buzzer_pcnt == 1) && IsBUZZER_ModeTimerExpired())
                {
                    BUZZER_Off();
                    buzzer_pcnt = 0;
                    if(buzzer_repeat_time == 0) BUZZER_StartModeTimer(BUZZER_SHORT_TIME);
                    else BUZZER_StartRepeatTimer(buzzer_repeat_time * 1000);
                }
                break;
            }
            
            case BUZZER_MODE_LONG:
            {
                if((buzzer_pcnt == 0) && IsBUZZER_ModeTimerExpired())
                {
                    if(IsBUZZER_RepeatTimerExpired())
                    {
                        BUZZER_On();
                        BUZZER_StartModeTimer(BUZZER_LONG_TIME);
                        ++buzzer_pcnt;                        
                    }
                }
                else if((buzzer_pcnt == 1) && IsBUZZER_ModeTimerExpired())
                {
                    BUZZER_Off();
                    buzzer_pcnt = 0;
                    if(buzzer_repeat_time == 0) BUZZER_StartModeTimer(BUZZER_LONG_TIME);
                    else BUZZER_StartRepeatTimer(buzzer_repeat_time * 1000);
                }
                break;
            }
            
            case BUZZER_BUTTON_PRESSED:
            {
                if(buzzer_pcnt == 0)
                {
                    BUZZER_On();
                    BUZZER_StartModeTimer(BUZZER_BUTTON_TIME);
                    ++buzzer_pcnt;
                }
                else if((buzzer_pcnt == 1) && IsBUZZER_ModeTimerExpired())
                {
                    BUZZER_Off();
                    buzzer_mode = BUZZER_MODE_OFF;
                }
                break;
            }
            default:
            {
                BUZZER_SignalOff();
                break;
            }
        }
	}
    else
    {
        BUZZER_StopRepeatTimer();
        BUZZER_StopModeTimer();
        BUZZER_SignalOff();
        BUZZER_RepeatTimerReset();
        buzzer_pcnt = 0;
        BUZZER_Off();
    }
    
    if (IsFANCOIL_CoolingValveOn()) ++fancoil_ntc_timer;
    else fancoil_ntc_timer = 0;
	
	if(hadc3.Instance == ADC3)
	{
		if (anin_timer) --anin_timer;
	}
	
	if(IsTOUCH_SCREEN_Enabled())
	{
		if(ts_update_timer == 0)
		{
			TouchUpdate();
			ts_update_timer = TOUCH_SCREEN_UPDATE_TIME;
		}
        else --ts_update_timer;
	}	
	
	if(onewire_timer) --onewire_timer;
	if(thermostat_timer) --thermostat_timer;
	if(thermostat_fan_timer) --thermostat_fan_timer;
	if(valve_timer) --valve_timer;
	if(display_timer) --display_timer;
	if(display_date_time_timer) --display_date_time_timer;
    if(display_screensaver_timer) --display_screensaver_timer;
	if(display_message_timer) --display_message_timer;
	if(buzzer_mode_timer) --buzzer_mode_timer;
    if(buzzer_repeat_timer) --buzzer_repeat_timer;
    
    if(onewire_timeout_timer)
    {
        if(--onewire_timeout_timer == 0) OnewireState = ONEWIRE_RECEIVE;
    }
    
    
    if(fan_rpm_timer) 
    {
        if(--fan_rpm_timer == 0)
        {
            /*  run fancoil fan motor shortly with triac driver to sense hall rpm sensor if available, 
            *   this will define functions used to controll hardware interface and type of temperature controller
            *   rpm sensor will be also used for cleaning request when motor start to slow down due to dust collect
            *   if sensor not available,than tree speed motor is used for fancoil fan, and controller is simpler without
            *   precise timings for triac triggering releasing from runtime code two interrupt request services
            */ 
            if(IsSYSTEM_StartupActiv() && (fan_rpm_pulse > 10)) FANCOIL_RPM_SensorConnected();
            else if(IsFANCOIL_RPM_SensorConnected() && (fan_rpm_pulse < 10)) FANCOIL_RPM_SensorErrorSet();            
        }
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


#ifndef	USE_DEBUGGER
void MX_IWDG_Init(void)
{
    hiwdg.Instance = IWDG;
    hiwdg.Init.Prescaler = IWDG_PRESCALER_32;
    hiwdg.Init.Reload = 4095;
    HAL_IWDG_Init(&hiwdg);
}
#endif
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

	if (HAL_RTC_Init(&hrtc) != HAL_OK) Error_Handler();

    time.Hours = 0x12;
    time.Minutes = 0x00;
    time.Seconds = 0x00;
    date.Date = 0x01;
    date.Month = 0x01;
    date.WeekDay = 0x01;
    date.Year = 0x18;
    HAL_RTC_SetTime(&hrtc, &time, RTC_FORMAT_BCD);
    HAL_RTC_SetDate(&hrtc, &date, RTC_FORMAT_BCD);
    HAL_RTC_WaitForSynchro(&hrtc);
}


void HAL_TIM_PeriodElapsedCallback(TIM_HandleTypeDef *htim)
{
	__HAL_TIM_CLEAR_FLAG(&htim3, TIM_FLAG_UPDATE);
	++triac_timer;
	if(triac_on_time == 0) HAL_GPIO_WritePin(GPIOC, GPIO_PIN_8, GPIO_PIN_RESET);
	else if(triac_timer < triac_on_time) HAL_GPIO_WritePin(GPIOC, GPIO_PIN_8, GPIO_PIN_RESET);
    else if(triac_timer > (triac_on_time + TRIAC_ON_PULSE)) HAL_GPIO_WritePin(GPIOC, GPIO_PIN_8, GPIO_PIN_RESET);
	else HAL_GPIO_WritePin(GPIOC, GPIO_PIN_8, GPIO_PIN_SET);
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
	//TIM_ClockConfigTypeDef sClockSourceConfig;
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
	sConfigOC.Pulse = DISPLAY_BRIGHTNESS_HIGH;
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
        OnewireState = ONEWIRE_RECEIVE;
	}
}


void HAL_UART_RxCpltCallback(UART_HandleTypeDef* huart)
{
    if(huart->Instance == USART2)
	{
		if	((onewire_buffer[0] == ONEWIRE_THERMOSTAT_ADDRESS) &&
			(onewire_buffer[1] == ONEWIRE_ROOM_CONTROLLER_ADDRESS) &&
			(onewire_buffer[24] == CalcCRC(onewire_buffer, 24)))
		{
			OnewireState = ONEWIRE_PACKET_RECEIVED;
            ONEWIRE_StopTimer();
		}
		else 
		{
            OnewireState = ONEWIRE_RECEIVE;
			ONEWIRE_StartTimer(ONEWIRE_UPDATE_TIME);
            
		}
        
        ONEWIRE_StartTimeoutTimer(ONEWIRE_PENDING_TIMEOUT);
	}
}


void HAL_UART_ErrorCallback(UART_HandleTypeDef* huart)
{
	if(huart->Instance == USART2)
	{
		OnewireState = ONEWIRE_RECEIVE;
        ONEWIRE_StartTimer(ONEWIRE_UPDATE_TIME);
        ONEWIRE_StartTimeoutTimer(ONEWIRE_PENDING_TIMEOUT);
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
	huart2.Init.BaudRate = 9600;
	huart2.Init.WordLength = UART_WORDLENGTH_8B;
	huart2.Init.StopBits = UART_STOPBITS_1;
	huart2.Init.Parity = UART_PARITY_NONE;
	huart2.Init.Mode = UART_MODE_TX_RX;
	huart2.Init.HwFlowCtl = UART_HWCONTROL_NONE;
	huart2.Init.OverSampling = UART_OVERSAMPLING_16;
	huart2.Init.OneBitSampling = UART_ONE_BIT_SAMPLE_ENABLE;
	huart2.AdvancedInit.AdvFeatureInit = UART_ADVFEATURE_NO_INIT;
	
    if (HAL_UART_DeInit(&huart2) != HAL_OK) Error_Handler();
	if (HAL_UART_Init(&huart2) != HAL_OK) Error_Handler();
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


static void ADC3_Read(void)
{
    ADC_ChannelConfTypeDef sConfig;
	static uint8_t adc_cnt = 0;
    float adc_calc;
    
    if(!IsADC_TimerExpired()) return;
    else ADC_StartTimer(ADC_READOUT_PERIOD);
    
    if(adc_cnt == 0)
    {
        sConfig.Channel = ADC_CHANNEL_11;
        sConfig.Rank = ADC_REGULAR_RANK_1;
        sConfig.SamplingTime = ADC_SAMPLETIME_15CYCLES;
        HAL_ADC_ConfigChannel(&hadc3, &sConfig);
        HAL_ADC_Start(&hadc3);
        HAL_ADC_PollForConversion(&hadc3, 10);
        ambient_ntc_temperature_sample_value[ambient_ntc_temperature_sample_cnt] = HAL_ADC_GetValue(&hadc3);
        if(++ambient_ntc_temperature_sample_cnt >  9) ambient_ntc_temperature_sample_cnt = 0;
        ambient_ntc_temperature = 0;
        for(uint8_t t = 0; t < 10; t++) ambient_ntc_temperature += ambient_ntc_temperature_sample_value[t];
        ambient_ntc_temperature = ambient_ntc_temperature / 10;
        
        if((ambient_ntc_temperature < 100) || (ambient_ntc_temperature > 4000)) 
        {
            if(IsTHERMOSTAT_NTC_SensorConnected()) THERMOSTAT_NTC_SensorErrorSet();
            THERMOSTAT_NTC_SensorNotConnected();
        }
        else 
        {
            THERMOSTAT_NTC_SensorConnected();
            adc_calc = AMBIENT_NTC_GetResistance(ambient_ntc_temperature);
            adc_calc = AMBIENT_NTC_GetTemperature(adc_calc);
            
            if(adc_calc < 0) 
            {
                adc_calc *= -1;
                ambient_ntc_temperature = (uint16_t) (adc_calc * 10);
                ambient_ntc_temperature |= 0x8000;
            }
            else ambient_ntc_temperature = (uint16_t) (adc_calc * 10);
        }
        
        ++adc_cnt;
    }
    else if(adc_cnt == 1)
    {
        sConfig.Channel = ADC_CHANNEL_12;
        sConfig.Rank = ADC_REGULAR_RANK_1;
        sConfig.SamplingTime = ADC_SAMPLETIME_15CYCLES;
        HAL_ADC_ConfigChannel(&hadc3, &sConfig);
        HAL_ADC_Start(&hadc3);
        HAL_ADC_PollForConversion(&hadc3, 10);
        fancoil_ntc_temperature_sample_value[fancoil_ntc_temperature_sample_cnt] = HAL_ADC_GetValue(&hadc3);
        if(++fancoil_ntc_temperature_sample_cnt >  9) fancoil_ntc_temperature_sample_cnt = 0;
        fancoil_ntc_temperature = 0;
        for(uint8_t t = 0; t < 10; t++) fancoil_ntc_temperature += fancoil_ntc_temperature_sample_value[t];
        fancoil_ntc_temperature = fancoil_ntc_temperature / 10;
        
        if((fancoil_ntc_temperature < 100) || (fancoil_ntc_temperature > 4000)) 
        {
            if(IsFANCOIL_NTC_SensorConnected()) FANCOIL_NTC_SensorErrorSet();
            FANCOIL_NTC_SensorNotConnected();
        }
        else 
        {
            FANCOIL_NTC_SensorConnected();
            adc_calc = FANCOIL_NTC_GetResistance(fancoil_ntc_temperature);
            adc_calc = FANCOIL_NTC_GetTemperature(adc_calc);
            
            if(adc_calc < 0) 
            {
                adc_calc *= -1;
                fancoil_ntc_temperature = (uint16_t) (adc_calc * 10);
                fancoil_ntc_temperature |= 0x8000;
            }
            else fancoil_ntc_temperature = (uint16_t) (adc_calc * 10);
        }
        
        adc_cnt = 0;
    }
//    else if(adc_cnt == 2)
//    {
//        sConfig.Channel = ADC_CHANNEL_13;
//        sConfig.Rank = ADC_REGULAR_RANK_1;
//        sConfig.SamplingTime = ADC_SAMPLETIME_15CYCLES;
//        HAL_ADC_ConfigChannel(&hadc3, &sConfig);
//        HAL_ADC_Start(&hadc3);
//        HAL_ADC_PollForConversion(&hadc3, 10);
//        ambient_light_sample_value[ambient_light_sample_cnt] = HAL_ADC_GetValue(&hadc3);
//        if(++ambient_light_sample_cnt >  5) ambient_light_sample_cnt = 0;
//        ambient_light = 0;
//        for(uint8_t t = 0; t < 5; t++) ambient_light += ambient_light_sample_value[t];
//        ambient_light = ambient_light / 5;
//        
//        if((ambient_light > 100) && (ambient_light < 4000))  AMBIENT_LIGHT_SensorConnected();
//        else AMBIENT_LIGHT_SensorNotConnected();
//        adc_cnt = 0;
//    }
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
	hadc3.Init.NbrOfConversion = 2;
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
	}
	else if(GPIO_Pin == GPIO_PIN_13)
	{
        HAL_TIM_Base_Stop_IT(&htim3);
        HAL_NVIC_DisableIRQ(TIM3_IRQn);
		__HAL_GPIO_EXTI_CLEAR_IT(GPIO_PIN_13);
        HAL_GPIO_WritePin(GPIOC, GPIO_PIN_8, GPIO_PIN_RESET);
        triac_timer = 0;
        __HAL_TIM_SET_COUNTER(&htim3, 0);
        HAL_NVIC_EnableIRQ(TIM3_IRQn);
        HAL_TIM_Base_Start_IT(&htim3);
	}
	else if(GPIO_Pin == GPIO_PIN_14)
	{
		__HAL_GPIO_EXTI_CLEAR_IT(GPIO_PIN_14);
		++fan_rpm_pulse;
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
	GPIO_InitStruct.Mode = GPIO_MODE_IT_FALLING;
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
	HAL_NVIC_SetPriority(EXTI15_10_IRQn, 1, 0);
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
		TS_State.Layer = TOUCH_SCREEN_LAYER;
		
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
    HAL_ADC_MspDeInit(&hadc3);
	HAL_CRC_MspDeInit(&hcrc);
    HAL_I2C_MspDeInit(&hi2c4);
    HAL_RTC_MspDeInit(&hrtc);
//    HAL_SPI_MspDeInit(&hspi2);
//    HAL_TIM_PWM_MspDeInit(&htim1);
//	HAL_TIM_PWM_MspDeInit(&htim2);
	HAL_TIM_PWM_MspDeInit(&htim3);
//    HAL_UART_MspDeInit(&huart1);
    HAL_UART_MspDeInit(&huart2);	
    HAL_NVIC_DisableIRQ(USART2_IRQn);
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
    HAL_TIM_Base_Stop_IT(&htim3);
    HAL_NVIC_DisableIRQ(TIM3_IRQn);
	HAL_NVIC_DisableIRQ(EXTI15_10_IRQn);
    __HAL_GPIO_EXTI_CLEAR_IT(GPIO_PIN_13);
	__HAL_TIM_CLEAR_FLAG(&htim3, TIM_FLAG_UPDATE);
    HAL_GPIO_WritePin(GPIOC, GPIO_PIN_8, GPIO_PIN_RESET);
    
    fan_rpm_pulse = 0;
	triac_on_time = 0;
	triac_timer = 0;
    
	if(fan_speed != FAN_OFF)
	{
		triac_on_time = fan_speed;
		HAL_NVIC_EnableIRQ(EXTI15_10_IRQn);
	}
}


float AMBIENT_NTC_GetResistance(uint16_t adc_value)
{
	float ntc_res;
	ntc_res = (float) (AMBIENT_NTC_PULLUP * adc_value / (4095.0  - adc_value));
	return(ntc_res);
}


float AMBIENT_NTC_GetTemperature(float ntc_resistance)
{
	float temperature;
	temperature = (1.0 / ((log (ntc_resistance / AMBIENT_NTC_RREF)) / ambient_ntc_b_value  + 1.0 / 298.0)) - 273.0; 
	return(temperature);
}


float FANCOIL_NTC_GetResistance(uint16_t adc_value)
{
	float ntc_res;
	ntc_res = (float) (FANCOIL_NTC_PULLUP * adc_value / (4095.0  - adc_value));
	return(ntc_res);
}


float FANCOIL_NTC_GetTemperature(float ntc_resistance)
{
	float temperature;
	temperature = (1.0 / ((log (ntc_resistance / FANCOIL_NTC_RREF)) / fancoil_ntc_b_value  + 1.0 / 298.0)) - 273.0; 
	return(temperature);
}

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
