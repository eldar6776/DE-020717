/**
 ******************************************************************************
 * File Name          : one_wire.h
 * Date               : 17/11/2016 00:59:00
 * Description        : one wire communication modul header
 ******************************************************************************
 */
 
 
/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef ONEWIRE_H
#define ONEWIRE_H     							240	// version


/* Includes ------------------------------------------------------------------*/
#include "stm32f7xx.h"


/* Exporeted Types   ---------------------------------------------------------*/
typedef enum
{
	ONEWIRE_INIT    = 0,
    ONEWIRE_RECEIVE,
	ONEWIRE_PACKET_PENDING,
	ONEWIRE_PACKET_RECEIVED,
	ONEWIRE_PACKET_SEND,
	ONEWIRE_ERROR
	
}OnewireStateTypeDef;


typedef struct
{
	uint8_t	sensor_id;
	uint8_t rom_code[8];
	int temperature;
	
}TempSensorTypeDef;

extern OnewireStateTypeDef OnewireState;
extern TempSensorTypeDef ds18b20_1;
extern TempSensorTypeDef ds18b20_2;
extern TempSensorTypeDef ds18b20_3;
extern TempSensorTypeDef ds18b20_4;
extern TempSensorTypeDef ds18b20_5;
extern TempSensorTypeDef ds18b20_6;
extern TempSensorTypeDef ds18b20_7;
extern TempSensorTypeDef ds18b20_8;


/* Exporeted Define   --------------------------------------------------------*/
#define ONEWIRE_BUF_SIZE                        96
#define ONEWIRE_PACKET_SIZE                     64
#define ONEWIRE_TRANSFER_TIMEOUT                123
#define ONEWIRE_UPDATE_TIME                     1234
#define ONEWIRE_PENDING_TIMEOUT				    1567
#define ONEWIRE_RX_TX_DELAY                     5
#define ONEWIRE_ROOM_CONTROLLER_ADDRESS         21
#define ONEWIRE_THERMOSTAT_ADDRESS              22
#define ONEWIRE_2400                ((uint32_t)2400)
#define ONEWIRE_4800                ((uint32_t)4800)
#define ONEWIRE_9600                ((uint32_t)9600)
#define ONEWIRE_19200               ((uint32_t)19200)
#define ONEWIRE_38400               ((uint32_t)38400)
#define ONEWIRE_57600               ((uint32_t)57600)
#define ONEWIRE_115200              ((uint32_t)115200)
#define SOH                         ((uint8_t)0x01) 	/* start of command packet */
#define STX                         ((uint8_t)0x02) 	/* start of data packet */
#define EOT                         ((uint8_t)0x04) 	/* end of transmission */
#define ACK                         ((uint8_t)0x06) 	/* acknowledge */
#define NAK                         ((uint8_t)0x15) 	/* negative acknowledge */


/* Log event defines    -------------------------------------------------------*/
#define FANCOIL_RPM_SENSOR_ERROR    ((uint8_t)0xc0)
#define FANCOIL_NTC_SENSOR_ERROR    ((uint8_t)0xc1)
#define FANCOIL_LO_TEMP_ERROR       ((uint8_t)0xc2)
#define FANCOIL_HI_TEMP_ERROR       ((uint8_t)0xc3)
#define FANCOIL_FREEZING_PROTECTION ((uint8_t)0xc4)
#define THERMOSTAT_NTC_SENSOR_ERROR ((uint8_t)0xc5)
#define THERMOSTAT_ERROR            ((uint8_t)0xc6) // + 0-e = event (0xd0-0xde)

#define PIN_RESET					((uint8_t)0xd0)
#define POWER_ON_RESET				((uint8_t)0xd1)
#define SOFTWARE_RESET				((uint8_t)0xd2)
#define IWDG_RESET					((uint8_t)0xd3)
#define WWDG_RESET					((uint8_t)0xd4)
#define LOW_POWER_RESET				((uint8_t)0xd5)
#define FIRMWARE_UPDATED			((uint8_t)0xd6)
#define FIRMWARE_UPDATE_FAIL		((uint8_t)0xd7)
#define BOOTLOADER_UPDATED			((uint8_t)0xd8)
#define BOOTLOADER_UPDATE_FAIL		((uint8_t)0xd9)
#define IMAGE_UPDATED				((uint8_t)0xda)
#define IMAGE_UPDATE_FAIL			((uint8_t)0xdb)
#define DISPLAY_FAIL				((uint8_t)0xdc)
#define DRIVER_OR_FUNCTION_FAIL     ((uint8_t)0xdd)
#define ONEWIRE_BUS_EXCESSIVE_ERROR ((uint8_t)0xde)

#define NO_EVENT                	((uint8_t)0xe0)
#define GUEST_CARD_VALID        	((uint8_t)0xe1)
#define GUEST_CARD_INVALID      	((uint8_t)0xe2)
#define HANDMAID_CARD_VALID     	((uint8_t)0xe3)
#define ENTRY_DOOR_CLOSED			((uint8_t)0xe4)
#define PRESET_CARD					((uint8_t)0xe5)
#define HANDMAID_SERVICE_END    	((uint8_t)0xe6)
#define MANAGER_CARD            	((uint8_t)0xe7)
#define SERVICE_CARD            	((uint8_t)0xe8)
#define ENTRY_DOOR_OPENED          	((uint8_t)0xe9)
#define MINIBAR_USED            	((uint8_t)0xea)
#define BALCON_DOOR_OPENED			((uint8_t)0xeb)
#define BALCON_DOOR_CLOSED			((uint8_t)0xec)
#define CARD_STACKER_ON				((uint8_t)0xed)		
#define CARD_STACKER_OFF			((uint8_t)0xee)
#define DO_NOT_DISTURB_SWITCH_ON 	((uint8_t)0xef)
#define DO_NOT_DISTURB_SWITCH_OFF	((uint8_t)0xf0)
#define HANDMAID_SWITCH_ON			((uint8_t)0xf1)
#define HANDMAID_SWITCH_OFF			((uint8_t)0xf2)
#define SOS_ALARM_TRIGGER			((uint8_t)0xf3)
#define SOS_ALARM_RESET				((uint8_t)0xf4)
#define FIRE_ALARM_TRIGGER			((uint8_t)0xf5)
#define FIRE_ALARM_RESET          	((uint8_t)0xf6)
#define UNKNOWN_CARD				((uint8_t)0xf7)
#define CARD_EXPIRED				((uint8_t)0xf8)
#define WRONG_ROOM					((uint8_t)0xf9)
#define WRONG_SYSTEM_ID				((uint8_t)0xfa)
#define CONTROLLER_RESET			((uint8_t)0xfb)
#define ENTRY_DOOR_NOT_CLOSED		((uint8_t)0xfc)
#define	DOOR_BELL_ACTIVE			((uint8_t)0xfd)
#define	DOOR_LOCK_USER_OPEN			((uint8_t)0xfe)

/* Exporeted Variable   ------------------------------------------------------*/
extern __IO uint32_t onewire_timer;
extern __IO uint32_t onewire_timeout_timer;
extern uint32_t onewire_flags;
extern uint8_t onewire_buffer[ONEWIRE_BUF_SIZE];


/* Exporeted  Macro  ---------------------------------------------------------*/
#define ONEWIRE_StartTimer(TIME)   					(onewire_timer = TIME)
#define ONEWIRE_StopTimer()							(onewire_timer = 0)
#define IsONEWIRE_TimerExpired()					(onewire_timer == 0)

#define ONEWIRE_StartTimeoutTimer(TIME)   			(onewire_timeout_timer = TIME)
#define ONEWIRE_StopTimeoutTimer()					(onewire_timeout_timer = 0)
#define IsONEWIRE_TimeoutTimerExpired()				(onewire_timeout_timer == 0)

#define ONEWIRE_SensorConnected()					(onewire_flags |= (1 << 0))
#define ONEWIRE_SensorNotConnected()				(onewire_flags &= (~ (1 << 0)))
#define IsONEWIRE_SensorConnected()					((onewire_flags & (1 << 0)) != 0)

#define ONEWIRE_TemperatureControllerOn()			(onewire_flags |= (1 << 1))
#define ONEWIRE_TemperatureControllerOff()			(onewire_flags &= (~ (1 << 1)))
#define IsONEWIRE_TemperatureControllerActiv()		((onewire_flags & (1 << 1)) != 0)

#define ONEWIRE_UpdateSet()							(onewire_flags |= (1 << 2))
#define ONEWIRE_UpdateReset()						(onewire_flags &= (~ (1 << 2)))
#define IsONEWIRE_Updated()							((onewire_flags & (1 << 2)) != 0)

#define ONEWIRE_RoomControllerConnectedSet()        (onewire_flags |= (1 << 3))
#define ONEWIRE_RoomControllerConnectedReset()      (onewire_flags &= (~ (1 << 3)))
#define IsONEWIRE_RoomControllerConnected()         ((onewire_flags & (1 << 3)) != 0)

#define ONEWIRE_UpdateThermostatParameterSet()      (onewire_flags |= (1 << 4))
#define ONEWIRE_UpdateThermostatParameterReset()    (onewire_flags &= (~ (1 << 4)))
#define IsONEWIRE_UpdateThermostatParameterActiv()  ((onewire_flags & (1 << 4)) != 0)

#define ONEWIRE_UpdateDisplayImageSet()             (onewire_flags |= (1 << 5))
#define ONEWIRE_UpdateDisplayImageReset()           (onewire_flags &= (~ (1 << 5)))
#define IsONEWIRE_UpdateDisplayImageActiv()         ((onewire_flags & (1 << 5)) != 0)

#define TemperatureRegulatorOn()					(temperature_setpoint |= 0x80)
#define TemperatureRegulatorOff()					(temperature_setpoint &= 0x7f)
#define IsTemperatureRegulatorOn()					(temperature_setpoint & 0x80)
#define TemperatureRegulatorSetHeating()            (temperature_setpoint |= 0x40)
#define IsTemperatureRegulatorHeating()				(temperature_setpoint & 0x40)
#define IsTemperatureRegulatorCooling()				((temperature_setpoint & 0x40) == 0)
#define TemperatureRegulatorSetCooling()            (temperature_setpoint &= 0xbf)
#define TemperatureRegulatorOneCycleOn()			(temperature_difference |= 0x80)
#define TemperatureRegulatorOneCycleOff()			(temperature_difference &= 0x7f)
#define IsTemperatureRegulatorOneCycleOn()			(temperature_difference & 0x80)

/* Exported Function   -------------------------------------------------------*/
void ONEWIRE_Init(void);
void ONEWIRE_Service(void);
void ONEWIRE_SetUsart(uint32_t setup);


#endif
/******************************   END OF FILE  **********************************/

