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
	DISPLAY_MESSAGE
	
}eActivDisplayTypeDef;

typedef enum	// display button states
{
	RELEASED = 0,
	PRESSED
	
}BUTTON_StateTypeDef;



/* Exported Define -----------------------------------------------------------*/
#define DISPLAY_BUFFER_SIZE				32		// maximum display string size
#define GUI_REFRESH_TIME				50		// refresh gui 30 time in second
#define DATE_TIME_REFRESH_TIME			60000	// refresh date & time info every 1 min
#define DISPLAY_DOORBELL_TIME			4321	// 4s doorbell animation activ

#define GUI_ID_BUTTON_Dnd   			0x801
#define GUI_ID_BUTTON_Sos   			0x802
#define GUI_ID_BUTTON_Maid   			0x803
#define GUI_ID_BUTTON_Increase          0x804
#define GUI_ID_BUTTON_Decrease          0x805
#define GUI_ID_BUTTON_Ok   			    0x806
#define GUI_ID_BUTTON_DoorOpen          0x807

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
#define IsBUTTON_SosResetActiv()					((display_flags & (1 << 5)) != 0)
#define BUTTON_CallMaidActivSet()			(display_flags |= (1 << 6)) 
#define BUTTON_CallMaidActivReset()			(display_flags &= (~ (1 << 6)))
#define IsBUTTON_CallMaidActiv()			((display_flags & (1 << 6)) != 0)

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
