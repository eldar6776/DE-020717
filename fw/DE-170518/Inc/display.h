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
	RELEASED    = 0,
	PRESSED     = 1,
    BUTTON_SHIT = 2
	
}BUTTON_StateTypeDef;



/* Exported Define -----------------------------------------------------------*/
#define DISPLAY_BUFFER_SIZE				32		// maximum display string size
#define GUI_REFRESH_TIME				50		// refresh gui 20 time in second
#define DATE_TIME_REFRESH_TIME			60000	// refresh date & time info every 1 min
#define DISPLAY_SCREENSAVER_TIME        30000   // 30 sec display low brigntnes timeout
#define DISPLAY_BRIGHTNESS_HIGH         500
#define DISPLAY_BRIGHTNESS_LOW          50

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
extern __IO uint32_t display_message_timer;
extern __IO uint32_t display_screensaver_timer;
extern uint8_t display_buffer[DISPLAY_BUFFER_SIZE];
extern uint8_t display_message_id, display_message_time;


/* Exported macros     -------------------------------------------------------*/
#define DISPLAY_StartTimer(TIME)			(display_timer = TIME)
#define DISPLAY_StopTimer()					(display_timer = 0)
#define IsDISPLAY_TimerExpired()			(display_timer == 0)

#define DISPLAY_DateTimeStartTimer(TIME)	(display_date_time_timer = TIME)
#define DISPLAY_DateTimeStopTimer()			(display_date_time_timer = 0)
#define IsDISPLAY_DateTimeTimerExpired()	(display_date_time_timer == 0)

#define DISPLAY_MessageStartTimer(TIME)	    (display_message_timer = TIME)
#define DISPLAY_StopMessageTimer()			(display_message_timer = 0)
#define IsDISPLAY_MessageTimerExpired()	    (display_message_timer == 0)

#define DISPLAY_StartScreenSaverTimer(TIME) (display_screensaver_timer = TIME)
#define DISPLAY_StopScreenSaverTimer()      (display_screensaver_timer = 0)
#define IsDISPLAY_ScreenSaverTimerExpirerd()(display_screensaver_timer == 0)

#define DISPLAY_UpdateSet()		            (display_flags |= (1 << 0))
#define DISPLAY_UpdateReset()	            (display_flags &= (~ (1 << 0)))
#define IsDISPLAY_UpdateActiv()		        ((display_flags & (1 << 0)) != 0)

#define BUTTON_DndActivSet()				(display_flags |= (1 << 1)) 
#define BUTTON_DndActivReset()				(display_flags &= (~ (1 << 1)))
#define IsBUTTON_DndActiv()					((display_flags & (1 << 1)) != 0)

#define BUTTON_SosActivSet()				(display_flags |= (1 << 2)) 
#define BUTTON_SosActivReset()				(display_flags &= (~ (1 << 2)))
#define IsBUTTON_SosResetActiv()			((display_flags & (1 << 2)) != 0)

#define BUTTON_CallMaidActivSet()			(display_flags |= (1 << 3)) 
#define BUTTON_CallMaidActivReset()			(display_flags &= (~ (1 << 3)))
#define IsBUTTON_CallMaidActiv()			((display_flags & (1 << 3)) != 0)

#define DISPLAY_SetpointUpdateSet()			(display_flags |= (1 << 4)) 
#define DISPLAY_SetpointUpdateReset()		(display_flags &= (~ (1 << 4)))
#define IsDISPLAY_SetpointUpdated()			((display_flags & (1 << 4)) != 0)

#define BUTTON_OpenDoorSet()                (display_flags |= (1 << 5)) 
#define BUTTON_OpenDoorReset()              (display_flags &= (~ (1 << 5)))
#define IsBUTTON_OpenDoorActiv()            ((display_flags & (1 << 5)) != 0)

#define DISPLAY_MessageTimerSet()           (display_flags |= (1 << 6)) 
#define DISPLAY_MessageTimerReset()         (display_flags &= (~ (1 << 6)))
#define IsDISPLAY_MessageTimerActiv()       ((display_flags & (1 << 6)) != 0)

#define DISPLAY_BrightnessSet()             (display_flags |= (1 << 7)) 
#define DISPLAY_BrightnessReset()           (display_flags &= (~ (1 << 7)))
#define IsDISPLAY_BrightnessSet()           ((display_flags & (1 << 7)) != 0)

#define BUTTON_StateChangedSet()            (display_flags |= (1 << 8)) 
#define BUTTON_StateChangedReset()          (display_flags &= (~ (1 << 8)))
#define IsBUTTON_StateChangedActiv()        ((display_flags & (1 << 8)) != 0)


/* Exported functions  -------------------------------------------------------*/
void DISPLAY_Init(void);
void DISPLAY_Service(void);
void BUTTON_SetNewState(uint16_t button_id, BUTTON_StateTypeDef new_state);
BUTTON_StateTypeDef BUTTON_GetState(uint16_t button_id);


#endif
/******************************   END OF FILE  **********************************/
