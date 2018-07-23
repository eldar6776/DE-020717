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
#include "stm32746g.h"


/* Imported Type  ------------------------------------------------------------*/
/* Imported Variable  --------------------------------------------------------*/
/* Imported Function  --------------------------------------------------------*/
/* Private Type --------------------------------------------------------------*/
/* Private Define ------------------------------------------------------------*/
/* Private Variable ----------------------------------------------------------*/
__IO uint32_t thermostat_timer;
__IO uint32_t thermostat_fan_timer;
__IO uint32_t valve_timer;
__IO uint32_t thermostat_flags;
__IO uint8_t fan_speed;
__IO uint8_t temperature_setpoint;
__IO uint8_t temperature_difference;
__IO uint16_t room_temperature;


/* Private Macro -------------------------------------------------------------*/
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

    temperature_setpoint = 20;
    temperature_difference = 10;
    THERMOSTAT_StartTimer(THERMOSTAT_POWER_ON_DELAY_TIME);
}


void THERMOSTAT_Service(void)
{
	static uint8_t old_fan_speed = 0;
	static uint8_t fan_pcnt = 10;
	static uint16_t temp_sp;
    /** ============================================================================*/
	/**		C H E C K       T I M E R    A N D      S Y S T E M     F L A G S	    */
	/** ============================================================================*/
    if(!IsTHERMOSTAT_TimerExpired()) return;
    
    if((fancoil_ntc_timer > FANCOIL_NTC_MEASURING_DELAY_TIME) && IsFANCOIL_NTC_SensorConnected())
    {
        fancoil_ntc_timer = 0;
        if(IsTemperatureRegulatorHeating() && (fancoil_ntc_temperature < FANCOIL_FLUID_MIN_HEATING_TEMPERATURE)) FANCOIL_LoTempErrorSet();
        else if(IsTemperatureRegulatorCooling() && (fancoil_ntc_temperature > FANCOIL_FLUID_MAX_COOLING_TEMPERATURE)) FANCOIL_HiTempErrorSet();
    }
    
    if((fancoil_ntc_temperature < FANCOIL_FREEZING_PROTECTION_TEMPERATURE) && IsFANCOIL_NTC_SensorConnected()) FANCOIL_FreezingAlarmSet();
    if((thermostat_flags & 0x00f0) != 0) ONEWIRE_UpdateThermostatParameterSet();
    /** ============================================================================*/
	/**		U P D A T E 	M E A S U R E D    T E M P E R A T U R E 	V A L U E	*/
	/** ============================================================================*/
    if(IsONEWIRE_SensorConnected())         
    {
        if(room_temperature != ds18b20_1.temperature)
        {
            room_temperature = ds18b20_1.temperature;
            ONEWIRE_UpdateThermostatParameterSet();
        }
    }
	else if(IsTHERMOSTAT_NTC_SensorConnected())
    {
        if(room_temperature != ambient_ntc_temperature)
        {
            room_temperature = ambient_ntc_temperature;
            ONEWIRE_UpdateThermostatParameterSet();
        }
    }
    else return;
    /** ============================================================================*/
	/**		    R U N       O N C E     R P M       S E N S O R     C H E C K	    */
	/** ============================================================================*/
    if(IsSYSTEM_StartupActiv())
    {
        if(fan_pcnt == 10)
        {
            THERMOSTAT_StartTimer(FANCOIL_RPM_MEASURE_TIME);
            FANCOIL_SetFanLowSpeed();
            ++fan_pcnt;
        }
        else if(fan_pcnt == 11)
        {
            THERMOSTAT_StartTimer(FANCOIL_RPM_MEASURE_TIME);
            FANCOIL_RPM_StartTimer(FANCOIL_RPM_MEASURE_TIME);
            ++fan_pcnt;
        }
        else if(fan_pcnt == 12)
        {
            THERMOSTAT_StartTimer(THERMOSTAT_POWER_ON_DELAY_TIME);
            FANCOIL_SetFanOff();
            fan_pcnt = 0;
        }
        return;
    }
	/** ============================================================================*/
	/**		S W I T C H		F A N		S P E E D		W I T H		D E L A Y		*/
	/** ============================================================================*/
	if((fan_speed != old_fan_speed) && IsTHERMOSTAT_FanTimerExpired())  // don't let fan motor goes to smoke if we like to touch too much 
	{
		if(fan_pcnt == 0) 
		{
			FANCOIL_FanOff();
			FANCOIL_SetFanOff();
			if(old_fan_speed != 0) THERMOSTAT_StartFanTimer(FANCOIL_FAN_MIN_ON_TIME);
			fan_pcnt++;
		}
		else if(fan_pcnt == 1)
		{
			if(fan_speed == 1) 
			{
				FANCOIL_FanLowSpeedOn();
				FANCOIL_SetFanLowSpeed();
			}
			else if(fan_speed == 2) 
			{
				FANCOIL_FanMiddleSpeedOn();
				FANCOIL_SetFanMiddleSpeed();
			}
			else if(fan_speed == 3) 
			{
				FANCOIL_FanHighSpeedOn();
				FANCOIL_SetFanHighSpeed();
			}
			
			if(fan_speed != 0) THERMOSTAT_StartFanTimer(FANCOIL_FAN_MIN_ON_TIME);
			old_fan_speed = fan_speed;
			fan_pcnt = 0;
		}
	}
	/** ============================================================================*/
	/**				T E M P E R A T U R E		C O N T R O L L E R					*/
	/** ============================================================================*/
	if(!IsTemperatureRegulatorOn() && !IsTemperatureRegulatorOneCycleOn())
	{
		fan_speed = 0;
		FANCOIL_FanOff();
		FANCOIL_SetFanOff();
        FANCOIL_CoolingValveOff();
        FANCOIL_CoolingValveReset();
        FANCOIL_LoTempErrorReset();
        FANCOIL_HiTempErrorReset();
        FANCOIL_FreezingAlarmReset();
        FANCOIL_RPM_SensorErrorReset();
        FANCOIL_NTC_SensorErrorReset();
        THERMOSTAT_NTC_SensorErrorReset();
	}
	else if(IsTemperatureRegulatorOn() || IsTemperatureRegulatorOneCycleOn())  
	{
        temp_sp = ((temperature_setpoint & 0x3f) * 10);
        
        if(IsTemperatureRegulatorCooling())
        {
            if      ((fan_speed == 0) && (room_temperature > (temp_sp + FAN_LOW_SPEED_DIFF)))                                               fan_speed = 1;
            else if ((fan_speed == 1) && (room_temperature > (temp_sp + FAN_MIDDLE_SPEED_DIFF)))                                            fan_speed = 2;
            else if ((fan_speed == 1) && (room_temperature <= temp_sp))                                                                     fan_speed = 0;
            else if ((fan_speed == 2) && (room_temperature > (temp_sp + FAN_MIDDLE_SPEED_DIFF + FAN_LOW_SPEED_DIFF)))                       fan_speed = 3;
            else if ((fan_speed == 2) && (room_temperature <=(temp_sp + FAN_MIDDLE_SPEED_DIFF - FAN_SPEED_TRESHOLD)))                       fan_speed = 1; 
            else if ((fan_speed == 3) && (room_temperature <=(temp_sp + FAN_MIDDLE_SPEED_DIFF + FAN_LOW_SPEED_DIFF - FAN_SPEED_TRESHOLD)))  fan_speed = 2;            
        }
        else if(IsTemperatureRegulatorHeating())
        {
            if      ((fan_speed == 0) && (room_temperature < (temp_sp - FAN_LOW_SPEED_DIFF)))                                               fan_speed = 1;
            else if ((fan_speed == 1) && (room_temperature < (temp_sp - FAN_MIDDLE_SPEED_DIFF)))                                            fan_speed = 2;
            else if ((fan_speed == 1) && (room_temperature >= temp_sp))                                                                     fan_speed = 0;
            else if ((fan_speed == 2) && (room_temperature < (temp_sp - FAN_MIDDLE_SPEED_DIFF - FAN_LOW_SPEED_DIFF)))                       fan_speed = 3;
            else if ((fan_speed == 2) && (room_temperature >=(temp_sp - FAN_MIDDLE_SPEED_DIFF + FAN_SPEED_TRESHOLD)))                       fan_speed = 1; 
            else if ((fan_speed == 3) && (room_temperature >=(temp_sp - FAN_MIDDLE_SPEED_DIFF - FAN_LOW_SPEED_DIFF + FAN_SPEED_TRESHOLD)))  fan_speed = 2; 
        }
        
        if (fan_speed == 0) TemperatureRegulatorOneCycleOff();
        FANCOIL_CoolingValveSet();
    }
    
    if(IsFANCOIL_ValveTimerExpired())
    {
        if(IsFANCOIL_CoolingValveActiv() && !IsFANCOIL_CoolingValveOn())
        {
            FANCOIL_CoolingValveOn();
            FANCOIL_StartValveTimer(FANCOIL_VALVE_MIN_ON_TIME);
        }       
        else if(!IsFANCOIL_CoolingValveActiv() && IsFANCOIL_CoolingValveOn())
        {
            FANCOIL_CoolingValveOff();
            FANCOIL_StartValveTimer(FANCOIL_VALVE_MIN_ON_TIME);
        } 
    }
}


/******************************   RAZLAZ SIJELA  ********************************/
