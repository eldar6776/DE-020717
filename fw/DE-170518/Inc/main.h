/**
 ******************************************************************************
 * File Name          : main.c
 * Date               : 10.3.2018.
 * Description        : Hotel Room Thermostat Program Header
 ******************************************************************************
 *
 *
 ******************************************************************************
 */


/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __MAIN_H
#define __MAIN_H

/* Includes ------------------------------------------------------------------*/
#include "stm32f7xx.h"

/* Code switch define --------------------------------------------------------*/
//#define USE_FULL_ASSERT	1U	// use for full assert and debug of hal parameters 
#define USE_DEBUGGER		2U	// if using serial wire debugger remap PA13 & PA14 to swdio & swclk 
//#define WRITE_DEFAULT		3U	// used for firs time flash and eeprom initialization
//#define DEMO_MODE			4U	// used for room controller demo presentation

#define EE_THERMOSTAT_SET_POINT                 0x0010
#define EE_THERMOSTAT_SET_POINT_DIFF            0x0012
#define EE_THERMOSTAT_CTRL_MODE                 0x0013
#define EE_THERMOSTAT_FAN_LOW_SPEED_BAND        0x0014
#define EE_THERMOSTAT_FAN_MIDDLE_SPEED_BAND     0x0015
#define EE_THERMOSTAT_FAN_SPEED_DIFF            0x0016
#define EE_FANCOIL_CONTROL_TYPE                 0x0017
#define EE_AMBIENT_TEMPERATURE_NTC_BETA         0x0020
#define EE_FANCOIL_TEMPERATURE_NTC_BETA         0x0022


/* Exported types ------------------------------------------------------------*/
extern UART_HandleTypeDef huart2;
extern TIM_HandleTypeDef htim3;
extern TIM_HandleTypeDef htim9;
extern I2C_HandleTypeDef hi2c4;
extern I2C_HandleTypeDef hi2c3;
extern RTC_HandleTypeDef hrtc;
extern RTC_TimeTypeDef time;
extern RTC_DateTypeDef date;
extern LTDC_HandleTypeDef  hltdc;
extern DMA2D_HandleTypeDef hdma2d;
#ifndef	USE_DEBUGGER
extern IWDG_HandleTypeDef hiwdg;
#endif

typedef struct 
{
	uint8_t seconds;     	/*!< Seconds parameter, from 00 to 59 */
	uint16_t subseconds; 	/*!< Subsecond downcounter. When it reaches zero, it's reload value is the same as */
	uint8_t minutes;     	/*!< Minutes parameter, from 00 to 59 */
	uint8_t hours;       	/*!< Hours parameter, 24Hour mode, 00 to 23 */
	uint8_t day;         	/*!< Day in a week, from 1 to 7 */
	uint8_t date;        	/*!< Date in a month, 1 to 31 */
	uint8_t month;       	/*!< Month in a year, 1 to 12 */
	uint8_t year;        	/*!< Year parameter, 00 to 99, 00 is 2000 and 99 is 2099 */
	uint32_t unix;       	/*!< Seconds from 01.01.1970 00:00:00 */
	
} RTC_t;


/* Exported constants --------------------------------------------------------*/
#define RTC_STATUS_REG                  RTC_BKP_DR19 /* Status Register */
#define RTC_STATUS_INIT_OK              0x1234       /* RTC initialised */
#define RTC_STATUS_TIME_OK              0x4321       /* RTC time OK */
#define RTC_STATUS_ZERO                 0x0000
#define RTC_OFFSET_YEAR                 1970
#define RTC_SECONDS_PER_DAY             86400
#define RTC_SECONDS_PER_HOUR            3600
#define RTC_SECONDS_PER_MINUTE          60

#define FAN_OFF							0
#define FAN_CONST_SPEED_LOW				75
#define FAN_CONST_SPEED_MIDDLE			70
#define FAN_CONST_SPEED_HIGH			60
#define FAN_PID_SPEED_MIN               78
#define FAN_PID_SPEED_MAX               20
#define FAN_RPM_MEASURE_TIME            1234

#define BUZZER_MODE_OFF                 0
#define BUZZER_MODE_SHORT               1
#define BUZZER_MODE_LONG                2
#define BUZZER_MODE_BIP                 3
#define BUZZER_BUTTON_PRESSED           4
    
/* Defines related to Clock configuration */
#define RTC_ASYNCH_PREDIV  0x7F   /* LSE as RTC clock */
#define RTC_SYNCH_PREDIV   0x00FF /* LSE as RTC clock */

extern __IO uint32_t sys_flags;
extern __IO uint32_t sys_timer;
extern __IO uint32_t SystickCnt;
extern __IO uint32_t anin_timer;

extern uint16_t ambient_ntc_b_value;
extern uint16_t fancoil_ntc_b_value;
extern uint16_t fancoil_ntc_temperature;
extern uint16_t ambient_ntc_temperature;
extern uint16_t ambient_light;

extern uint32_t triac_on_time;
extern uint32_t buzzer_repeat_timer;
extern uint32_t buzzer_mode_timer;
extern uint8_t buzzer_repeat_time;
extern uint8_t buzzer_mode;
extern uint8_t buzzer_pcnt;
extern uint32_t fan_rpm_timer;
extern uint32_t fan_rpm_pulse;
extern uint32_t fan_rpm_actual;


#define SYSTEM_StartTimer(TIME)             (sys_timer = TIME)
#define SYSTEM_StopTimer()                  (sys_timer = 0)
#define IsSYSTEM_TimerExpired()             (sys_timer == 0)

#define FAN_RPM_StartTimer(TIME)            (fan_rpm_timer = TIME)
#define FAN_RPM_StopTimer()                 (fan_rpm_timer = 0)
#define IsFAN_RPM_TimerExpired()            (fan_rpm_timer == 0)

#define BUZZER_StartRepeatTimer(TIME)       (buzzer_repeat_timer = TIME)
#define BUZZER_StopRepeatTimer()            (buzzer_repeat_timer = 0)
#define IsBUZZER_RepeatTimerExpired()       (buzzer_repeat_timer == 0)

#define BUZZER_StartModeTimer(TIME)         (buzzer_mode_timer = TIME)
#define BUZZER_StopModeTimer()              (buzzer_mode_timer = 0)
#define IsBUZZER_ModeTimerExpired()         (buzzer_mode_timer == 0)

#define ADC_StartTimer(TIME)                (anin_timer = TIME)
#define ADC_StopTimer()                     (anin_timer = 0)
#define IsADC_TimerExpired()                (anin_timer == 0)


#define BUZZER_SignalOn()                   (sys_flags |= (1 << 0))
#define BUZZER_SignalOff()                  (sys_flags &= (~ (1 << 0)))
#define IsBUZZER_SignalActiv()              ((sys_flags & (1 << 0)) != 0)

#define BUZZER_RepeatTimerSet()             (sys_flags |= (1 << 1)) 
#define BUZZER_RepeatTimerReset()           (sys_flags &= (~ (1 << 1)))
#define IsBUZZER_RepeatTimerActiv()         ((sys_flags & (1 << 1)) != 0)

#define FAN_RPM_SensorConnected()           (sys_flags |= (1 << 2)) 
#define FAN_RPM_SensorNotConnected()        (sys_flags &= (~ (1 << 2)))
#define IsFAN_RPM_SensorConnected()         ((sys_flags & (1 << 2)) != 0)

#define AMBIENT_LIGHT_SensorConnected()     (sys_flags |= (1 << 3)) 
#define AMBIENT_LIGHT_SensorNotConnected()  (sys_flags &= (~ (1 << 3)))
#define IsAMBIENT_LIGHT_SensorConnected()   ((sys_flags & (1 << 3)) != 0)

#define SYSTEM_StartupReset()               (sys_flags |= (1 << 4)) 
#define SYSTEM_StartupSet()                 (sys_flags &= (~ (1 << 4)))
#define IsSYSTEM_StartupActiv()             ((sys_flags & (1 << 4)) == 0)

#define TOUCH_SCREEN_Enable()               (sys_flags |= (1 << 5)) 
#define TOUCH_SCREEN_Disable()              (sys_flags &= (~ (1 << 5)))
#define IsTOUCH_SCREEN_Enabled()            ((sys_flags & (1 << 5)) != 0)

#define BUZZER_On()                         (HAL_GPIO_WritePin(GPIOD, GPIO_PIN_4, GPIO_PIN_SET))
#define BUZZER_Off()				        (HAL_GPIO_WritePin(GPIOD, GPIO_PIN_4, GPIO_PIN_RESET))
#define IsBUZZER_On()                       (HAL_GPIO_ReadPin(GPIOD, GPIO_PIN_4) == GPIO_PIN_SET)

void Error_Handler(void);
uint32_t RTC_GetUnixTimeStamp(RTC_t* data);
void RTC_GetDateTimeFromUnix(RTC_t* data, uint32_t unix);
void RTC_GetDateTime(RTC_t* data, uint32_t format);
void FAN_SetSpeed(uint8_t fan_speed);

#endif /* __MAIN_H */

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
