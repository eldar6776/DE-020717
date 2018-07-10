/**
 ******************************************************************************
 * File Name          : display.h
 * Date               : 10.3.2018
 * Description        : GUI Display Module Header
 ******************************************************************************
 *
 *
 ******************************************************************************
 */
 
 
 /* Define to prevent recursive inclusion -------------------------------------*/
#ifndef _DISPLAY_H_
#define _DISPLAY_H_  				227		// version


/* Includes ------------------------------------------------------------------*/
#include "stm32f7xx.h"


/* Exported types ------------------------------------------------------------*/
typedef enum	// display screen activ status
{
	DISPLAY_INIT,
	DISPLAY_THERMOSTAT,
	DISPLAY_FORECAST,
	DISPLAY_ALARM_CLOCK
	
}eActivDisplayTypeDef;

typedef enum	// display button states
{
	RELEASED = 0,
	PRESSED
	
}BUTTON_StateTypeDef;


typedef union	// weather forecast display info
{
	uint8_t forecast[5];
	
	struct{
		uint8_t week_day;	// or current temperature 
		uint8_t low_temp;
		uint8_t high_temp;
		uint8_t humidity;
		uint8_t cloudness;
	}para;
	
}FORECAST_DayTypeDef;

extern eActivDisplayTypeDef ActivDisplay;
extern FORECAST_DayTypeDef FORECAST_Monday;
extern FORECAST_DayTypeDef FORECAST_Tuesday;
extern FORECAST_DayTypeDef FORECAST_Wednesday;
extern FORECAST_DayTypeDef FORECAST_Thurstday;
extern FORECAST_DayTypeDef FORECAST_Freeday;
extern FORECAST_DayTypeDef FORECAST_Saturday;
extern FORECAST_DayTypeDef FORECAST_Sunday;


/* Exported Define -----------------------------------------------------------*/
#define DISPLAY_BUFFER_SIZE				32		// maximum display string size
#define GUI_REFRESH_TIME				33		// refresh gui 30 time in second
#define DATE_TIME_REFRESH_TIME			60000	// refresh date & time info every 1 min
#define DISPLAY_DOORBELL_TIME			4321	// 4s doorbell animation activ
#define KNOB_X0 						250		// temperature set knob touch monitor area x start point
#define KNOB_Y0 						40		// temperature set knob touch monitor area y start point
#define GUI_ID_BUTTON_Home   			0x801	
#define GUI_ID_BUTTON_AlarmClock		0x802
#define GUI_ID_BUTTON_Dnd   			0x803
#define GUI_ID_BUTTON_Sos   			0x804
#define GUI_ID_BUTTON_Maid   			0x805
#define GUI_ID_BUTTON_Weather   		0x806
#define GUI_ID_BUTTON_FanSpeed  		0x807
#define GUI_ID_BUTTON_CtrlMode   		0x808
#define GUI_ID_BUTTON_AlarmOnOff		0x809
#define GUI_ID_BUTTON_AlarmSetTime		0x80a
#define GUI_ID_KNOB_Temperature			0x820
#define GUI_ID_LISTWHEEL_TimeMinute		0x835
#define GUI_ID_LISTWHEEL_TimeHour		0x836
#define GUI_ID_LISTWHEEL_Window			0x837
#define DARK_BLUE   					GUI_MAKE_COLOR(0x613600)
#define LIGHT_BLUE  					GUI_MAKE_COLOR(0xaa7d67)
#define BLUE        					GUI_MAKE_COLOR(0x855a41)
#define LEMON       					GUI_MAKE_COLOR(0x00d6d3)


/* Exported variables  -------------------------------------------------------*/
extern uint32_t display_flags;
extern __IO uint32_t display_timer;
extern __IO uint32_t display_date_time_timer;
extern __IO uint32_t display_doorbell_timer;
extern uint8_t display_buffer[DISPLAY_BUFFER_SIZE];


/* Exported macros     -------------------------------------------------------*/
#define DISPLAY_StartTimer(TIME)			(display_timer = TIME)
#define DISPLAY_StopTimer()					(display_timer = 0)
#define IsDISPLAY_TimerExpired()			(display_timer == 0)
#define DISPLAY_DateTimeStartTimer(TIME)	(display_date_time_timer = TIME)
#define DISPLAY_DateTimeStopTimer()			(display_date_time_timer = 0)
#define IsDISPLAY_DateTimeTimerExpired()	(display_date_time_timer == 0)
#define DISPLAY_StartDoorBellTimer(TIME)	(display_doorbell_timer = TIME)
#define DISPLAY_StopDoorBellTimer()			(display_doorbell_timer = 0)
#define IsDISPLAY_DoorBellTimerExpired()	(display_doorbell_timer == 0)


#define DOORBELL_On()						(display_flags |= (1 << 0))
#define DOORBELL_Off()						(display_flags &= (~ (1 << 0)))
#define IsDOORBELL_Activ()					((display_flags & (1 << 0)) != 0)
#define HANDMAID_TasterOn()					(display_flags |= (1 << 1))
#define HANDMAID_TasterOff()				(display_flags &= (~ (1 << 1)))
#define IsHANDMAID_TasterActiv()			((display_flags & (1 << 1)) != 0)
#define DISPLAY_TemperatureUpdateSet()		(display_flags |= (1 << 2))
#define DISPLAY_TemperatureUpdateReset()	(display_flags &= (~ (1 << 2)))
#define IsDISPLAY_TemperatureUpdated()		((display_flags & (1 << 2)) != 0)
#define DISPLAY_DoorBellSet()		        (display_flags |= (1 << 3))
#define DISPLAY_DoorBellReset()	            (display_flags &= (~ (1 << 3)))
#define IsDISPLAY_DoorBellActiv()	        ((display_flags & (1 << 3)) != 0)
#define BUTTON_DndActivSet()				(display_flags |= (1 << 4)) 
#define BUTTON_DndActivReset()				(display_flags &= (~ (1 << 4)))
#define IsBUTTON_DndActiv()					((display_flags & (1 << 4)) != 0)
#define BUTTON_SosActivSet()				(display_flags |= (1 << 5)) 
#define BUTTON_SosActivReset()				(display_flags &= (~ (1 << 5)))
#define IsBUTTON_SosActiv()					((display_flags & (1 << 5)) != 0)
#define BUTTON_CallMaidActivSet()			(display_flags |= (1 << 6)) 
#define BUTTON_CallMaidActivReset()			(display_flags &= (~ (1 << 6)))
#define IsBUTTON_CallMaidActiv()			((display_flags & (1 << 6)) != 0)
#define ALARM_CLOCK_ActivSet()				(display_flags |= (1 << 7)) 
#define ALARM_CLOCK_ActivReset()			(display_flags &= (~ (1 << 7)))
#define IsALARM_CLOCK_Activ()				((display_flags & (1 << 7)) != 0)
#define BUTTON_AlarmClockActivSet()			(display_flags |= (1 << 8)) 
#define BUTTON_AlarmClockActivReset()		(display_flags &= (~ (1 << 8)))
#define IsBUTTON_AlarmClockActiv()			((display_flags & (1 << 8)) != 0)
#define DISPLAY_SetpointUpdateSet()			(display_flags |= (1 << 9)) 
#define DISPLAY_SetpointUpdateReset()		(display_flags &= (~ (1 << 9)))
#define IsDISPLAY_SetpointUpdated()			((display_flags & (1 << 9)) != 0)


/* Exported functions  -------------------------------------------------------*/
void DISPLAY_Init(void);
void DISPLAY_Service(void);
void BUTTON_SetNewState(uint16_t button_id, BUTTON_StateTypeDef new_state);
BUTTON_StateTypeDef BUTTON_GetState(uint16_t button_id);


#endif
/******************************   END OF FILE  **********************************/
