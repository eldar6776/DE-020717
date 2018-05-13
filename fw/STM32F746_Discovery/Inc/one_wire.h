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
	ONEWIRE_INIT				= 0x00,
	ONEWIRE_PACKET_PENDING		= 0x01,
	ONEWIRE_PACKET_RECEIVED		= 0x02,
	ONEWIRE_PACKET_SEND			= 0x03,
	ONEWIRE_ERROR				= 0x04
	
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
#define ONEWIRE_TRANSFER_TIMEOUT					345
#define ONEWIRE_PENDING_TIMEOUT						6789
#define ONEWIRE_RX_TX_DELAY							5
#define ONEWIRE_UPDATE_TIME							3450
#define ONEWIRE_THERMOSTAT_ADDRESS					0x11
#define ONEWIRE_CONTROLLER_ADDRESS					0x22
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
/** ==========================================================================*/
/**			O N E W I R E		P A C K E T			F O R M A T				  */
/** ==========================================================================*/
/* 	
 *	1 	RECIPIENT_ADDRESS							(REMOTE ONEWIRE INTERFACE ADDRESS)
 *	2 	SENDER_ADDRESS								(THIS ONEWIRE INTERFACE ADDRESS)	
 *	3	SET NEW BUTTON STATES						(ACK = SET; NAK = SKEEP)
 *	4	DND BUTTON STATE							(1 = PRESSED: 2 = RELEASED)
 *	5	SOS BUTTON STATE							(1 = PRESSED: 2 = RELEASED)
 *	6	HM CALL BUTTON STATE						(1 = PRESSED: 2 = RELEASED)
 *	7	SET NEW DATE TIME							(ACK = SET; NAK = SKEEP)
 *	8	DATE DAY									(0x01 - 0x31)
 *	9	DATE DAY IN WEEK							(0x01 - 0x07)
 *	10	DATE MONTH									(0x01 - 0x12)
 * 	11	DATE YEAR									(0x00 - 0x99)
 *	12	TIME HOURS									(0x00 - 0x23)
 *	13	TIME MINUTE									(0x00 - 0x59)
 *	14	TIME SECONDS								(0x00 - 0x59)
 *	15	SET NEW THERMOSTAT VALUE					(ACK = SET; NAK = SKEEP)
 *	16	THERMOSTAT VALVE							(0 = OFF; 1 = COOLING VALVE ON)
 *	17	THERMOSTAT FAN_MODE							(0 = AUTO; 1 = LOW; 2 = MIDDLE; 3 = HIGH)
 *	18	THERMOSTAT FAN_SPEED						(0 = OFF; 1 = LOW; 2 = MIDDLE; 3 = HIGH)
 *	19	THERMOSTAT CONTROL MODE						(0 = OFF; 1 = COOLING; 2 = HEATING)
 *	20	THERMOSTAT ACTUAL TEMPERATURE MSB			(MEASURED TEMPERATURE HIGH BYTE)
 *	21	THERMOSTAT ACTUAL TEMPERATURE LSB			(MEASURED TEMPERATURE LOW BYTE)
 *	22	THERMOSTAT SETPOINT MSB						(SETPOINT TEMPERATURE HIGH BYTE)
 * 	23	THERMOSTAT SETPOINT LSB						(SETPOINT TEMPERATURE LOW BYTE)
 *	24	THERMOSTAT SETPOINT DIFFERENCE				(TEMPERATURE CONTROLLER SETPOINT DIFFERENCE)
 *	25	THERMOSTAT FAN LOW SPEED BAND				(FAN LOW SPEED SETPOINT DIFFERENCE) 
 *	26	THERMOSTAT FAN MIDDLE SPEED BAND			(FAN MIDDLE SPEED SETPOINT DIFFERENCE) 
 *	27	THERMOSTAT FAN SPEED DIFFERENCE				(FAN HIGH SPEED SETPOINT DIFFERENCE) 
 *	28	SET NEW WEATHER FORECAST					(ACK = SET; NAK = SKEEP)
 *	29	WEATHER MONDAY LOW TEMPERATURE				(MORNING TEMPERATURE VALUE)
 *	30	WEATHER MONDAY HIGH TEMPERATURE				(DAILY TEMPERATURE VALUE)
 *	31	WEATHER MONDAY HUMIDITY						(AVERAGE HUMIDITY VALUE)
 *	32	WEATHER MONDAY CLOUDNESS AND WIND			(0=CLEAR;1=MIST;2=PARTLY CLOUDY;3=CLOUDY;4=PARTLY RAIN;5=RAIN;6=HEAVY RAIN...20=HEAVY SNOW) 
 *	33	WEATHER TUESDAY LOW TEMPERATURE				(MORNING TEMPERATURE VALUE)
 *	34	WEATHER TUESDAY HIGH TEMPERATURE			(DAILY TEMPERATURE VALUE)
 *	35	WEATHER TUESDAY HUMIDITY					(AVERAGE HUMIDITY VALUE)	
 *	36	WEATHER TUESDAY CLOUDNESS AND WIND			(0=CLEAR;1=MIST;2=PARTLY CLOUDY;3=CLOUDY;4=PARTLY RAIN;5=RAIN;6=HEAVY RAIN...20=HEAVY SNOW) 
 *	37	WEATHER WEDNESDAY LOW TEMPERATURE			(MORNING TEMPERATURE VALUE)	
 *	38	WEATHER WEDNESDAY HIGH TEMPERATURE			(DAILY TEMPERATURE VALUE)
 *	39	WEATHER WEDNESDAY HUMIDITY					(AVERAGE HUMIDITY VALUE)
 *	40	WEATHER WEDNESDAY CLOUDNESS & WIND			(0=CLEAR;1=MIST;2=PARTLY CLOUDY;3=CLOUDY;4=PARTLY RAIN;5=RAIN;6=HEAVY RAIN...20=HEAVY SNOW)  	
 *	41	WEATHER THURSTDAY LOW TEMPERATURE			(MORNING TEMPERATURE VALUE)
 *	42	WEATHER THURSTDAY HIGH TEMPERATURE			(DAILY TEMPERATURE VALUE)
 *	43	WEATHER THURSTDAY HUMIDITY					(AVERAGE HUMIDITY VALUE)	
 *	44	WEATHER THURSTDAY CLOUDNESS & WIND			(0=CLEAR;1=MIST;2=PARTLY CLOUDY;3=CLOUDY;4=PARTLY RAIN;5=RAIN;6=HEAVY RAIN...20=HEAVY SNOW)  
 *	45	WEATHER FREEDAY LOW TEMPERATURE				(MORNING TEMPERATURE VALUE)
 *	46	WEATHER FREEDAY HIGH TEMPERATURE			(DAILY TEMPERATURE VALUE)
 *	47	WEATHER FREEDAY HUMIDITY					(AVERAGE HUMIDITY VALUE)
 *	48	WEATHER FREEDAY CLOUDNESS AND WIND			(0=CLEAR;1=MIST;2=PARTLY CLOUDY;3=CLOUDY;4=PARTLY RAIN;5=RAIN;6=HEAVY RAIN...20=HEAVY SNOW) 
 *	49	WEATHER SATURDAY LOW TEMPERATURE			(MORNING TEMPERATURE VALUE)	
 *	50	WEATHER SATURDAY HIGH TEMPERATURE			(DAILY TEMPERATURE VALUE)
 *	51	WEATHER SATURDAY HUMIDITY					(AVERAGE HUMIDITY VALUE)	
 *	52	WEATHER SATURDAY CLOUDNESS & WIND			(0=CLEAR;1=MIST;2=PARTLY CLOUDY;3=CLOUDY;4=PARTLY RAIN;5=RAIN;6=HEAVY RAIN...20=HEAVY SNOW)  
 *	53	WEATHER SUNDAY LOW TEMPERATURE				(MORNING TEMPERATURE VALUE)
 *	54	WEATHER SUNDAY HIGH TEMPERATURE				(DAILY TEMPERATURE VALUE)
 *	55	WEATHER SUNDAY HUMIDITY						(AVERAGE HUMIDITY VALUE)
 *	56	WEATHER SUNDAY CLOUDNESS & WIND				(0=CLEAR;1=MIST;2=PARTLY CLOUDY;3=CLOUDY;4=PARTLY RAIN;5=RAIN;6=HEAVY RAIN...20=HEAVY SNOW)  
 *	57	SET NEW DORBELL STATE						(ACK = SET; NAK = SKEEP)
 *	58	DORBELL TASTER								(1 = PRESSED: 2 = RELEASED)
 *	59	NULL
 *	60	NULL
 *	61	NULL
 *	62	NULL
 *	63	NULL
 *	64	PACKET_CRC	
 *
 */ 
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
#define ONEWIRE_SensorConnected()					(onewire_flags |= 0x00000002)
#define ONEWIRE_SensorNotConnected()				(onewire_flags &= 0xfffffffd)
#define IsONEWIRE_SensorConnected()					(onewire_flags &  0x00000002)
#define ONEWIRE_TemperatureControllerOn()			(onewire_flags |= 0x00000004)
#define ONEWIRE_TemperatureControllerOff()			(onewire_flags &= 0xfffffffb)
#define IsONEWIRE_TemperatureControllerActiv()		(onewire_flags &  0x00000004)
#define ONEWIRE_UpdateSet()							(onewire_flags |= 0x00000008)
#define ONEWIRE_UpdateReset()						(onewire_flags &= 0xfffffff7)
#define IsONEWIRE_Updated()							(onewire_flags &  0x00000008)


/* Exported Function   -------------------------------------------------------*/
void ONEWIRE_Init(void);
void ONEWIRE_Service(void);
void ONEWIRE_SetUsart(uint32_t setup);


#endif
/******************************   END OF FILE  **********************************/

