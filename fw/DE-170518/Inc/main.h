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


/* Exported types ------------------------------------------------------------*/
extern UART_HandleTypeDef huart2;
extern TIM_HandleTypeDef htim3;
extern RTC_HandleTypeDef hrtc;
extern RTC_TimeTypeDef time;
extern RTC_DateTypeDef date;
extern LTDC_HandleTypeDef  hltdc;
extern DMA2D_HandleTypeDef hdma2d;


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
#define FAN_SPEED_LOW					52
#define FAN_SPEED_MIDDLE				47
#define FAN_SPEED_HIGH					42

#define BUZZER_MODE_OFF                 0
#define BUZZER_MODE_SHORT               1
#define BUZZER_MODE_LONG                2
#define BUZZER_MODE_BIP                 3
    
/* Defines related to Clock configuration */
#define RTC_ASYNCH_PREDIV  0x7F   /* LSE as RTC clock */
#define RTC_SYNCH_PREDIV   0x00FF /* LSE as RTC clock */

extern __IO uint32_t sys_flags;
extern __IO uint32_t SystickCnt;
extern uint16_t ntc_temperature;
extern uint8_t GUI_Initialized;
extern uint32_t triac_on_time;
extern uint32_t buzzer_repeat_timer;
extern uint32_t buzzer_mode_timer;
extern uint8_t buzzer_repeat_time;
extern uint8_t buzzer_mode;
extern uint8_t buzzer_pcnt;


#define BUZZER_StartRepeatTimer(TIME)   (buzzer_repeat_timer = TIME)
#define BUZZER_StopRepeatTimer()        (buzzer_repeat_timer = 0)
#define IsBUZZER_RepeatTimerExpired()   (buzzer_repeat_timer == 0)
#define BUZZER_StartModeTimer(TIME)     (buzzer_mode_timer = TIME)
#define BUZZER_StopModeTimer()          (buzzer_mode_timer = 0)
#define IsBUZZER_ModeTimerExpired()     (buzzer_mode_timer == 0)

#define BUZZER_SignalOn()               (sys_flags |= (1 << 0))
#define BUZZER_SignalOff()              (sys_flags &= (~ (1 << 0)))
#define IsBUZZER_SignalActiv()          ((sys_flags & (1 << 0)) != 0)
#define BUZZER_RepeatTimerSet()         (sys_flags |= (1 << 1)) 
#define BUZZER_RepeatTimerReset()       (sys_flags &= (~ (1 << 1)))
#define IsBUZZER_RepeatTimerActiv()     ((sys_flags & (1 << 1)) != 0)


#define BUZZER_On()				        (HAL_GPIO_WritePin(GPIOD, GPIO_PIN_4, GPIO_PIN_SET))
#define BUZZER_Off()				    (HAL_GPIO_WritePin(GPIOD, GPIO_PIN_4, GPIO_PIN_RESET))
#define IsBUZZER_On()                   (HAL_GPIO_ReadPin(GPIOD, GPIO_PIN_4) == GPIO_PIN_SET)

void Error_Handler(void);
uint32_t RTC_GetUnixTimeStamp(RTC_t* data);
void RTC_GetDateTimeFromUnix(RTC_t* data, uint32_t unix);
void RTC_GetDateTime(RTC_t* data, uint32_t format);
void FAN_SetSpeed(uint8_t fan_speed);

#endif /* __MAIN_H */

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
