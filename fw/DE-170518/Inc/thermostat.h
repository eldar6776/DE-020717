/**
 ******************************************************************************
 * File Name          : thermostat.h
 * Date               : 22/02/2018 07:03:00
 * Description        : temperature controller header
 ******************************************************************************
 */
 
 
 /* Define to prevent recursive inclusion -------------------------------------*/
#ifndef TEMP_CTRL_H
#define TEMP_CTRL_H     			211		// version


/* Includes ------------------------------------------------------------------*/
#include "stm32f7xx.h"


/* Exported Type  ------------------------------------------------------------*/
/* Exported Define  ----------------------------------------------------------*/
#define FAN_SPEED_TRESHOLD                          3   // +/-0,3°C treshold for fan speed change 
#define FAN_LOW_SPEED_DIFF                          8  // set point +/- 1,0°C low speed fan zone
#define FAN_MIDDLE_SPEED_DIFF                       18  // set point +/- 2,5°C middle speed fan zone

#define THERMOSTAT_MAX_TEMPERATURE			        32		// 32,0°C max. thermostat setup temperature
#define THERMOSTAT_MIN_TEMPERATURE			        14		// 14,0°C min. thermostat setup temperature
#define FANCOIL_FLUID_MIN_HEATING_TEMPERATURE       400     // min. fancoil fluid temperature for heating operation
#define FANCOIL_FLUID_MAX_COOLING_TEMPERATURE       120     // max. fancoil fluid temperature for cooling operation
#define FANCOIL_FREEZING_PROTECTION_TEMPERATURE     40      // 4,0*C min. fancoil temperature
#define FANCOIL_FREEZING_PROTECTION_SETPOINT        8       // 8,0*C set point when freezing protection activated
#define THERMOSTAT_POWER_ON_DELAY_TIME              2345    // 2,5 sec. power on startup time
#define FANCOIL_NTC_MEASURING_DELAY_TIME            900000  // 15 min. (x60 sec x 1000 ms)      
#define FANCOIL_FAN_MIN_ON_TIME				        1560	// 1,5s between two or on/off fan speed switching
#define FANCOIL_VALVE_MIN_ON_TIME			        5678	// cooling valve state swith 5,5s min. time	

#define FAN_OFF							            0
#define FAN_CONST_SPEED_LOW				            72
#define FAN_CONST_SPEED_MIDDLE			            66
#define FAN_CONST_SPEED_HIGH			            60
#define FAN_PID_SPEED_MIN                           78
#define FAN_PID_SPEED_MAX                           20
#define FANCOIL_RPM_MEASURE_TIME                    1234

/* Exported Variable   -------------------------------------------------------*/
extern __IO uint32_t thermostat_timer;
extern __IO uint32_t thermostat_fan_timer;
extern __IO uint32_t valve_timer;
extern __IO uint32_t thermostat_flags;
extern __IO uint8_t fan_speed;
extern __IO uint8_t temperature_setpoint;
extern __IO uint8_t temperature_difference;
extern __IO uint16_t room_temperature;


/* Exported Macro ------------------------------------------------------------*/
#define THERMOSTAT_StartTimer(TIME)			(thermostat_timer = TIME)
#define THERMOSTAT_StopTimer()				(thermostat_timer = 0)
#define IsTHERMOSTAT_TimerExpired()			(thermostat_timer == 0)

#define THERMOSTAT_StartFanTimer(TIME)		(thermostat_fan_timer = TIME)
#define THERMOSTAT_StopFanTimer()			(thermostat_fan_timer = 0)
#define IsTHERMOSTAT_FanTimerExpired()		(thermostat_fan_timer == 0)

#define FANCOIL_StartValveTimer(TIME)       (valve_timer = TIME)
#define FANCOIL_StopValveTimer()			(valve_timer = 0)
#define IsFANCOIL_ValveTimerExpired()       (valve_timer == 0)

#define THERMOSTAT_ActivSet()               (thermostat_flags |= (1 << 0))
#define THERMOSTAT_ActivReset()             (thermostat_flags &= (~ (1 << 0)))
#define IsTHERMOSTAT_Activ()                ((thermostat_flags & (1 << 0)) != 0)

#define THERMOSTAT_NTC_SensorConnected()    (thermostat_flags |= (1 << 1))
#define THERMOSTAT_NTC_SensorNotConnected() (thermostat_flags &= (~ (1 << 1)))
#define IsTHERMOSTAT_NTC_SensorConnected()  ((thermostat_flags & (1 << 1)) != 0)

#define FANCOIL_NTC_SensorConnected()       (thermostat_flags |= (1 << 2))
#define FANCOIL_NTC_SensorNotConnected()    (thermostat_flags &= (~ (1 << 2)))
#define IsFANCOIL_NTC_SensorConnected()     ((thermostat_flags & (1 << 2)) != 0)

#define FANCOIL_CoolingValveSet()           (thermostat_flags |= (1 << 3))
#define FANCOIL_CoolingValveReset()         (thermostat_flags &= (~ (1 << 3)))
#define IsFANCOIL_CoolingValveActiv()       ((thermostat_flags & (1 << 3)) != 0)

#define FANCOIL_NTC_SensorErrorSet()        (thermostat_flags |= (1 << 4))
#define FANCOIL_NTC_SensorErrorReset()      (thermostat_flags &= (~ (1 << 4)))
#define IsFANCOIL_NTC_SensorErrorActiv()    ((thermostat_flags & (1 << 4)) != 0)

#define FANCOIL_LoTempErrorSet()            (thermostat_flags |= (1 << 5))
#define FANCOIL_LoTempErrorReset()          (thermostat_flags &= (~ (1 << 5)))
#define IsFANCOIL_LoTempErrorActiv()        ((thermostat_flags & (1 << 5)) != 0)

#define FANCOIL_HiTempErrorSet()            (thermostat_flags |= (1 << 6))
#define FANCOIL_HiTempErrorReset()          (thermostat_flags &= (~ (1 << 6)))
#define IsFANCOIL_HiTempErrorActiv()        ((thermostat_flags & (1 << 6)) != 0)

#define FANCOIL_FreezingAlarmSet()          (thermostat_flags |= (1 << 7))
#define FANCOIL_FreezingAlarmReset()        (thermostat_flags &= (~ (1 << 7)))
#define IsFANCOIL_FreezingAlarmActiv()      ((thermostat_flags & (1 << 7)) != 0)

#define THERMOSTAT_NTC_SensorErrorSet()     (thermostat_flags |= (1 << 8))
#define THERMOSTAT_NTC_SensorErrorReset()   (thermostat_flags &= (~ (1 << 8)))
#define IsTHERMOSTAT_NTC_SensorErrorActiv() ((thermostat_flags & (1 << 8)) != 0)
/** ============================================================================*/
/**   F A N C O I L   C O N T O L   W I T H   4   D I G I T A L   O U T P U T   */
/** ============================================================================*/
#define FANCOIL_FanLowSpeedOn()				(HAL_GPIO_WritePin(GPIOC, GPIO_PIN_10, GPIO_PIN_SET))
#define FANCOIL_FanLowSpeedOff()			(HAL_GPIO_WritePin(GPIOC, GPIO_PIN_10, GPIO_PIN_RESET))
#define IsFANCOIL_FanLowSpeedOn()           (HAL_GPIO_ReadPin(GPIOC, GPIO_PIN_10) == GPIO_PIN_SET)
#define FANCOIL_FanMiddleSpeedOn()			(HAL_GPIO_WritePin(GPIOC, GPIO_PIN_11, GPIO_PIN_SET))
#define FANCOIL_FanMiddleSpeedOff()			(HAL_GPIO_WritePin(GPIOC, GPIO_PIN_11, GPIO_PIN_RESET))
#define IsFANCOIL_FanMiddleSpeedOn()        (HAL_GPIO_ReadPin(GPIOC, GPIO_PIN_11) == GPIO_PIN_SET)
#define FANCOIL_FanHighSpeedOn()			(HAL_GPIO_WritePin(GPIOC, GPIO_PIN_12, GPIO_PIN_SET))
#define FANCOIL_FanHighSpeedOff()			(HAL_GPIO_WritePin(GPIOC, GPIO_PIN_12, GPIO_PIN_RESET))	
#define IsFANCOIL_FanHighSpeedOn()          (HAL_GPIO_ReadPin(GPIOC, GPIO_PIN_12) == GPIO_PIN_SET)
#define FANCOIL_FanOff()					(HAL_GPIO_WritePin(GPIOC, GPIO_PIN_10|GPIO_PIN_11|GPIO_PIN_12, GPIO_PIN_RESET))
#define FANCOIL_CoolingValveOn()            (HAL_GPIO_WritePin(GPIOD, GPIO_PIN_2, GPIO_PIN_SET))
#define FANCOIL_CoolingValveOff()           (HAL_GPIO_WritePin(GPIOD, GPIO_PIN_2, GPIO_PIN_RESET))
#define IsFANCOIL_CoolingValveOn()          (HAL_GPIO_ReadPin(GPIOD, GPIO_PIN_2) == GPIO_PIN_SET)

/** ============================================================================*/
/**   F A N C O I L   C O N T O L   W I T H   T R I A C   A N D		D O U T     */
/** ============================================================================*/
#define FANCOIL_SetFanOff()					(FAN_SetSpeed(FAN_OFF))
#define FANCOIL_SetFanLowSpeed()			(FAN_SetSpeed(FAN_CONST_SPEED_LOW))
#define FANCOIL_SetFanMiddleSpeed()			(FAN_SetSpeed(FAN_CONST_SPEED_MIDDLE))
#define FANCOIL_SetFanHighSpeed()			(FAN_SetSpeed(FAN_CONST_SPEED_HIGH))


/* Exported Function  ------------------------------------------------------- */
void THERMOSTAT_Init(void);
void THERMOSTAT_Service(void);


#endif
/******************************   END OF FILE  ********************************/
