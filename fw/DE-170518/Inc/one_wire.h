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
#define ONEWIRE_BUF_SIZE							96
#define ONEWIRE_PACKET_SIZE							64
#define ONEWIRE_TRANSFER_TIMEOUT					123
#define ONEWIRE_UPDATE_TIME                         1234
#define ONEWIRE_PENDING_TIMEOUT						1567
#define ONEWIRE_POWER_ON_DELAY_TIME                 5678  
#define ONEWIRE_RX_TX_DELAY							5
#define ONEWIRE_ROOM_CONTROLLER_ADDRESS             21
#define ONEWIRE_THERMOSTAT_ADDRESS					22
#define ONEWIRE_2400								((uint32_t)2400)
#define ONEWIRE_4800								((uint32_t)4800)
#define ONEWIRE_9600								((uint32_t)9600)
#define ONEWIRE_19200								((uint32_t)19200)
#define ONEWIRE_38400								((uint32_t)38400)
#define ONEWIRE_57600								((uint32_t)57600)
#define ONEWIRE_115200								((uint32_t)115200)
#define SOH                         				((uint8_t)0x01) 	/* start of command packet */
#define STX                         				((uint8_t)0x02) 	/* start of 1024-byte data packet */
#define EOT                         				((uint8_t)0x04) 	/* end of transmission */
#define ACK                         				((uint8_t)0x06) 	/* acknowledge */
#define NAK                         				((uint8_t)0x15) 	/* negative acknowledge */


/* Exporeted Variable   ------------------------------------------------------*/
extern __IO uint32_t onewire_timer;
extern __IO uint32_t onewire_timeout_timer;
extern uint32_t onewire_flags;
extern uint8_t onewire_buffer[ONEWIRE_BUF_SIZE];
extern uint8_t temperature_setpoint;
extern uint8_t temperature_difference;
extern uint16_t temperature_measured;

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
#define IsTemperatureRegulatorHeating()				(temperature_setpoint & 0x40)
#define IsTemperatureRegulatorCooling()				((temperature_setpoint & 0x40) == 0)
#define TemperatureRegulatorOneCycleOn()			(temperature_difference |= 0x80)
#define TemperatureRegulatorOneCycleOff()			(temperature_difference &= 0x7f)
#define IsTemperatureRegulatorOneCycleOn()			(temperature_difference & 0x80)

/* Exported Function   -------------------------------------------------------*/
void ONEWIRE_Init(void);
void ONEWIRE_Service(void);
void ONEWIRE_SetUsart(uint32_t setup);


#endif
/******************************   END OF FILE  **********************************/

