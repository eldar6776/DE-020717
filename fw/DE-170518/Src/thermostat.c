/**
 ******************************************************************************
 * File Name          : thermostat.c
 * Date               : 22/02/2018 06:59:00
 * Description        : temperature control processing modul 
 ******************************************************************************
 *
 *
 ******************************************************************************
 */
 
 
/* Includes ------------------------------------------------------------------*/
#include "main.h"
#include "thermostat.h"
#include "display.h"
#include "one_wire.h"
#include "common.h"


/* Imported Type  ------------------------------------------------------------*/
/* Imported Variable  --------------------------------------------------------*/
/* Imported Function  --------------------------------------------------------*/
/* Private Type --------------------------------------------------------------*/
THERMOSTAT_TypeDef Thermostat_1;


/* Private Define ------------------------------------------------------------*/
#define FANCOIL_FAN_MIN_ON_TIME				1560	// 1,5s between two or on/off fan speed switching
#define FANCOIL_VALVE_MIN_ON_TIME			5678	// cooling valve state swith 5,5s min. time	
	

/* Private Variable ----------------------------------------------------------*/
__IO uint32_t thermostat_timer;
__IO uint32_t thermostat_fan_timer;
__IO uint32_t thermostat_valve_timer;
uint32_t thermostat_flags;


/* Private Macro -------------------------------------------------------------*/
/** ============================================================================*/
/**   F A N C O I L   C O N T O L   W I T H   4   D I G I T A L   O U T P U T   */
/** ============================================================================*/
#define FANCOIL_FanLowSpeedOn()				(HAL_GPIO_WritePin(GPIOC, GPIO_PIN_10, GPIO_PIN_SET))
#define FANCOIL_FanLowSpeedOff()			(HAL_GPIO_WritePin(GPIOC, GPIO_PIN_10, GPIO_PIN_RESET))
#define FANCOIL_FanMiddleSpeedOn()			(HAL_GPIO_WritePin(GPIOC, GPIO_PIN_11, GPIO_PIN_SET))
#define FANCOIL_FanMiddleSpeedOff()			(HAL_GPIO_WritePin(GPIOC, GPIO_PIN_11, GPIO_PIN_RESET))
#define FANCOIL_FanHighSpeedOn()			(HAL_GPIO_WritePin(GPIOC, GPIO_PIN_12, GPIO_PIN_SET))
#define FANCOIL_FanHighSpeedOff()			(HAL_GPIO_WritePin(GPIOC, GPIO_PIN_12, GPIO_PIN_RESET))	
#define FANCOIL_FanOff()					(HAL_GPIO_WritePin(GPIOC, GPIO_PIN_10|GPIO_PIN_11|GPIO_PIN_12, GPIO_PIN_RESET))
#define FANCOIL_CoolValveOn()				(HAL_GPIO_WritePin(GPIOD, GPIO_PIN_2, GPIO_PIN_SET))
#define FANCOIL_CoolValveOff()				(HAL_GPIO_WritePin(GPIOD, GPIO_PIN_2, GPIO_PIN_RESET))


/** ============================================================================*/
/**   F A N C O I L   C O N T O L   W I T H   T R I A C   A N D		D O U T     */
/** ============================================================================*/
#define FANCOIL_SetFanOff()					(FAN_SetSpeed(FAN_OFF))
#define FANCOIL_SetFanLowSpeed()			(FAN_SetSpeed(FAN_SPEED_LOW))
#define FANCOIL_SetFanMiddleSpeed()			(FAN_SetSpeed(FAN_SPEED_MIDDLE))
#define FANCOIL_SetFanHighSpeed()			(FAN_SetSpeed(FAN_SPEED_HIGH))


/* Private Function Prototype ------------------------------------------------*/
/* Program Code  -------------------------------------------------------------*/
void THERMOSTAT_Init(void)
{
	GPIO_InitTypeDef  GPIO_InitStruct;
	
	__HAL_RCC_GPIOC_CLK_ENABLE();
	__HAL_RCC_GPIOD_CLK_ENABLE();
	
	HAL_GPIO_WritePin(GPIOC, GPIO_PIN_10|GPIO_PIN_11|GPIO_PIN_12, GPIO_PIN_RESET);
	HAL_GPIO_WritePin(GPIOD, GPIO_PIN_2|GPIO_PIN_4, GPIO_PIN_RESET);
	
    GPIO_InitStruct.Pin = GPIO_PIN_10|GPIO_PIN_11|GPIO_PIN_12;
    GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
    GPIO_InitStruct.Pull = GPIO_NOPULL;
    GPIO_InitStruct.Speed = GPIO_SPEED_LOW;
    HAL_GPIO_Init(GPIOC, &GPIO_InitStruct);
	
	GPIO_InitStruct.Pin = GPIO_PIN_2|GPIO_PIN_4;
    GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
    GPIO_InitStruct.Pull = GPIO_NOPULL;
    GPIO_InitStruct.Speed = GPIO_SPEED_LOW;
    HAL_GPIO_Init(GPIOD, &GPIO_InitStruct);
	
	Thermostat_1.valve = 0;						// cooling/heating valve on/off/proportion
	Thermostat_1.fan_mode = 0;					// fan auto control
	Thermostat_1.fan_speed = 0;					// fan off
	Thermostat_1.ctrl_mode = 0;					// thermostat off
	Thermostat_1.actual_temperature = 210;		// proces variable
	Thermostat_1.set_temperature = 210;			// thermostat set point 23,0°C
	Thermostat_1.set_temperature_diff = 15;		// actual = set point => controller off, actual = set point +/- difference => controller on
	Thermostat_1.fan_low_speed_band = 10;		// set point +/- 1,0°C low speed fan zone
	Thermostat_1.fan_middle_speed_band = 20;	// set point +/- 2,0°C middle speed fan zone
	Thermostat_1.fan_speed_diff = 3;			// 0,3°C treshold for fan speed change
    
    THERMOSTAT_StartTimer(THERMOSTAT_STARTUP_DELAY);
}


void THERMOSTAT_Service(void)
{
	static uint8_t old_fan_speed = 0;
	static uint8_t fan_pcnt = 0;
	
    /** ============================================================================*/
	/**		U P D A T E 	M E A S U R E D    T E M P E R A T U R E 	V A L U E	*/
	/** ============================================================================*/
    if(!IsTHERMOSTAT_TimerExpired()) return;
	else if(IsONEWIRE_SensorConnected())    Thermostat_1.actual_temperature = ds18b20_1.temperature;
	else if(IsNTC_SensorConnected())        Thermostat_1.actual_temperature = ntc_temperature;	
    else if(IsTHERMOSTAT_SensorErrorActiv())
    {
        if((ntc_temperature & 0x0fff) < 600) 
        {
            NTC_SensorConnected();
            THERMOSTAT_SensorErrorReset();
        }
        else return;
    }
	/** ============================================================================*/
	/**		S W I T C H		F A N		S P E E D		W I T H		D E L A Y		*/
	/** ============================================================================*/
	if(Thermostat_1.fan_speed != old_fan_speed)	// don't let fan motor goes to smoke if we like to touch too much 
	{
		if((fan_pcnt == 0) && IsTHERMOSTAT_FanTimerExpired())
		{
			FANCOIL_FanOff();
			FANCOIL_SetFanOff();
			if(old_fan_speed != 0) THERMOSTAT_StartFanTimer(FANCOIL_FAN_MIN_ON_TIME);
			fan_pcnt++;
		}
		else if((fan_pcnt == 1) && IsTHERMOSTAT_FanTimerExpired())
		{
			if(Thermostat_1.fan_speed == 1) 
			{
				FANCOIL_FanLowSpeedOn();
				FANCOIL_SetFanLowSpeed();
			}
			else if(Thermostat_1.fan_speed == 2) 
			{
				FANCOIL_FanMiddleSpeedOn();
				FANCOIL_SetFanMiddleSpeed();
			}
			else if(Thermostat_1.fan_speed == 3) 
			{
				FANCOIL_FanHighSpeedOn();
				FANCOIL_SetFanHighSpeed();
			}
			
			if(Thermostat_1.fan_speed != 0) THERMOSTAT_StartFanTimer(FANCOIL_FAN_MIN_ON_TIME);
			old_fan_speed = Thermostat_1.fan_speed;
			fan_pcnt = 0;
		}
	}
	/** ============================================================================*/
	/**			C O O L I N G			V A L V E			S T A T E 				*/
	/** ============================================================================*/
	if(Thermostat_1.valve != Thermostat_1.ctrl_mode) // don't let cooling valve burn in flame too 
	{
		if(IsTHERMOSTAT_ValveTimerExpired())
		{
			if(Thermostat_1.ctrl_mode == THERMOSTAT_CONTROL_MODE_COOLING) FANCOIL_CoolValveOn();
			else FANCOIL_CoolValveOff();
			THERMOSTAT_StartValveTimer(FANCOIL_VALVE_MIN_ON_TIME);
			Thermostat_1.valve = Thermostat_1.ctrl_mode;			
		}
	}
	/** ============================================================================*/
	/**				T E M P E R A T U R E		C O N T R O L L E R					*/
	/** ============================================================================*/
	if(Thermostat_1.ctrl_mode == THERMOSTAT_CONTROL_MODE_OFF)
	{
		Thermostat_1.valve = 0;
		Thermostat_1.fan_speed = 0;
		FANCOIL_FanOff();
		FANCOIL_SetFanOff();
	}
	else if(Thermostat_1.ctrl_mode == THERMOSTAT_CONTROL_MODE_COOLING)
	{
		if(Thermostat_1.fan_mode == 0)		// automatic fan speed with 3 band proportional temperature controller
		{
			if((Thermostat_1.fan_speed == 0) && 
				(Thermostat_1.actual_temperature > 
				(Thermostat_1.set_temperature + 
				Thermostat_1.fan_low_speed_band)))
			{
				Thermostat_1.fan_speed = 1;
			}
			
			if(Thermostat_1.fan_speed == 1) 
			{	
				if (Thermostat_1.actual_temperature > 
					(Thermostat_1.set_temperature + 
					Thermostat_1.fan_middle_speed_band))
				{
					Thermostat_1.fan_speed = 2;
				}
				else if(Thermostat_1.actual_temperature <= 
					 Thermostat_1.set_temperature)
				{
					Thermostat_1.fan_speed = 0;
				}
			}
			
			if(Thermostat_1.fan_speed == 2) 
			{	
				if (Thermostat_1.actual_temperature > 
					(Thermostat_1.set_temperature + 
					Thermostat_1.fan_low_speed_band + 
					Thermostat_1.fan_middle_speed_band))
				{
					Thermostat_1.fan_speed = 3;
				}
				else if (Thermostat_1.actual_temperature <= 
						(Thermostat_1.set_temperature + 
						Thermostat_1.fan_low_speed_band))
				{
					Thermostat_1.fan_speed = 1;
				}
			}
			
			if((Thermostat_1.fan_speed == 3) &&
				(Thermostat_1.actual_temperature <= 
				(Thermostat_1.set_temperature + 
				Thermostat_1.fan_middle_speed_band)))
			{
				Thermostat_1.fan_speed = 2;
			}			
		}
		else if(Thermostat_1.fan_mode > 0) 	// manual fan speed with on/off temperature controller
		{
			if (Thermostat_1.actual_temperature <= Thermostat_1.set_temperature)
			{
				Thermostat_1.fan_speed = 0;
			}
			else if(Thermostat_1.actual_temperature > 
					(Thermostat_1.set_temperature + Thermostat_1.set_temperature_diff))
			{
				Thermostat_1.fan_speed = Thermostat_1.fan_mode;
			}
		}
	}
	else if(Thermostat_1.ctrl_mode == THERMOSTAT_CONTROL_MODE_HEATING)
	{
		if(Thermostat_1.fan_mode == 0) 		// automatic fan speed with 3 band proportional temperature controller 
		{
			if((Thermostat_1.fan_speed == 0) && 
				(Thermostat_1.actual_temperature < 
				(Thermostat_1.set_temperature - 
				Thermostat_1.fan_low_speed_band)))
			{
				Thermostat_1.fan_speed = 1;
			}
			
			if(Thermostat_1.fan_speed == 1) 
			{	
				if (Thermostat_1.actual_temperature < 
					(Thermostat_1.set_temperature - 
					Thermostat_1.fan_middle_speed_band))
				{
					Thermostat_1.fan_speed = 2;
				}
				else if(Thermostat_1.actual_temperature >= 
					 Thermostat_1.set_temperature)
				{
					Thermostat_1.fan_speed = 0;
				}
			}
			
			if(Thermostat_1.fan_speed == 2) 
			{	
				if (Thermostat_1.actual_temperature < 
					(Thermostat_1.set_temperature - 
					Thermostat_1.fan_low_speed_band -
					Thermostat_1.fan_middle_speed_band))
				{
					Thermostat_1.fan_speed = 3;
				}
				else if (Thermostat_1.actual_temperature >= 
						(Thermostat_1.set_temperature - 
						Thermostat_1.fan_low_speed_band))
				{
					Thermostat_1.fan_speed = 1;
				}
			}
			
			if((Thermostat_1.fan_speed == 3) &&
				(Thermostat_1.actual_temperature >= 
				(Thermostat_1.set_temperature - 
				Thermostat_1.fan_middle_speed_band)))
			{
				Thermostat_1.fan_speed = 2;
			}
			
		}
		else if(Thermostat_1.fan_mode > 0)	// manual fan speed with on/off temperature controller
		{
			if (Thermostat_1.actual_temperature >= Thermostat_1.set_temperature)
			{
				Thermostat_1.fan_speed = 0;
			}
			else if(Thermostat_1.actual_temperature < 
					(Thermostat_1.set_temperature - Thermostat_1.set_temperature_diff))
			{
				Thermostat_1.fan_speed = Thermostat_1.fan_mode;
			}
		}
	}
}


/******************************   RAZLAZ SIJELA  ********************************/
