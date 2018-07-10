/**
 ******************************************************************************
 * File Name          : display.c
 * Date               : 10.3.2018
 * Description        : GUI Display Module
 ******************************************************************************
 *
 *
 ******************************************************************************
 */
 
 
/* Include  ------------------------------------------------------------------*/
#include <math.h>
#include <stdlib.h>
#include <string.h>
#include "main.h"
#include "display.h"
#include "Resource.h"
#include "one_wire.h"
#include "common.h"
#include "thermostat.h"
#include "LCDConf.h"
#include "DIALOG.h"
#include "waveplayer.h"


/* Imported Type  ------------------------------------------------------------*/
/* Imported Variable  --------------------------------------------------------*/
/* Imported Function  --------------------------------------------------------*/
/* Private Type --------------------------------------------------------------*/
BUTTON_Handle hBUTTON_Dnd;
BUTTON_Handle hBUTTON_Sos;
BUTTON_Handle hBUTTON_Maid;
KNOB_Handle hKNOB_Temperature;
GUI_HSPRITE SPRITE_DoorBell;

eActivDisplayTypeDef ActivDisplay;



/* Private Define ------------------------------------------------------------*/
#ifndef PI
#define PI							3.14159265358979f
#endif
#define TIME_WAIT          			3000 
#define FACTOR_MIN   				100
#define FACTOR_MAX 					20000


/* Private Variable ----------------------------------------------------------*/
__IO uint32_t display_timer;
__IO uint32_t display_date_time_timer;
__IO uint32_t display_doorbell_timer;
uint32_t display_flags;

uint8_t display_buffer[DISPLAY_BUFFER_SIZE];
uint8_t btn_alarm_clock_state, btn_alarm_clock_old_state;
uint8_t btn_alarm_on_off_state, btn_alarm_on_off_old_state;
uint8_t btn_alarm_set_time_state, btn_alarm_set_time_old_state;
uint8_t btn_home_state, btn_home_old_state;
uint8_t btn_weather_state, btn_weather_old_state;
uint8_t btn_dnd_state, btn_dnd_old_state;
uint8_t btn_sos_state, btn_sos_old_state;
uint8_t btn_maid_state, btn_maid_old_state;
uint8_t btn_fan_mode_state, btn_fan_mode_old_state;
uint8_t btn_ctrl_mode_state, btn_ctrl_mode_old_state;
uint8_t alarm_hour, alarm_minute;

GUI_RECT Rect1 = {5,  65, 215, 115};
GUI_RECT Rect2 = {5, 110, 215, 160};
GUI_RECT Rect3 = {5, 155, 215, 205};



static char * _apMinute[] = {
	"00", "01", "02", "03", "04", "05", "06", "07", "08", "09",  
	"10", "11", "12", "13", "14", "15", "16", "17", "18", "19",  
	"20", "21", "22", "23", "24", "25", "26", "27", "28", "29", 
	"30", "31", "32", "33", "34", "35", "36", "37", "38", "39", 
	"40", "41", "42", "43", "44", "45", "46", "47", "48", "49", 
	"50", "51", "52", "53", "54", "55", "56", "57", "58", "59",
};

static char * _apHour[] = {
	"00", "01", "02", "03", "04", "05", "06", "07", "08", "09",  
	"10", "11", "12", "13", "14", "15", "16", "17", "18", "19",  
	"20", "21", "22", "23" 
};

static char * _apDays[] = {
	"0", "MON", "TUE", "WED", "THU", "FRE", "SAT", "SUN"
};

/* Private Macro -------------------------------------------------------------*/
/* Private Function Prototype ------------------------------------------------*/
static void PID_Hook(GUI_PID_STATE * pState);
static void DISPLAY_DateTime(void);
static void DISPLAY_RoomTemperature(void);


/* Program Code  -------------------------------------------------------------*/
void DISPLAY_Init(void)
{
	GUI_Initialized = 0;
	GUI_Init();
	GUI_PID_SetHook(PID_Hook);
	WM_MULTIBUF_Enable(1);
	LCD_SetVisEx(0, 1);
	LCD_SetVisEx(1, 1);
	GUI_SelectLayer(0);
	GUI_Clear();
	GUI_DrawBitmap(&bmbackground_0, 0, 0);
	hBUTTON_Dnd  = BUTTON_Create(	5,  65, 210,  45, GUI_ID_BUTTON_Dnd,    WM_CF_SHOW);
	hBUTTON_Sos  = BUTTON_Create(	5, 110, 210,  45, GUI_ID_BUTTON_Sos,    WM_CF_SHOW);
	hBUTTON_Maid = BUTTON_Create(	5, 155, 210,  45, GUI_ID_BUTTON_Maid,   WM_CF_SHOW);
	GUI_Exec();
	GUI_SelectLayer(1);
	GUI_SetBkColor(GUI_TRANSPARENT); 
	GUI_Clear();
	ActivDisplay = DISPLAY_THERMOSTAT;
	DISPLAY_DateTime();
	GUI_Initialized = 1;
	GUI_SelectLayer(0);
}


void DISPLAY_Service(void)
{
	uint8_t i;
	static uint8_t fl = 0;
	static uint8_t audio_cnt = 0;
	/** ==========================================================================*/
	/**    D R A W     D I S P L A Y	G U I	O N	   U P D A T E    E V E N T   */
	/** ==========================================================================*/
	if(IsDISPLAY_TimerExpired())			// display gui update
	{
		DISPLAY_StartTimer(GUI_REFRESH_TIME);
		GUI_Exec();
	}
	else 									// wait for gui refresh timer
	{
		return;
	}
	
	if(IsDISPLAY_DateTimeTimerExpired())	// date & time info update 
	{
		DISPLAY_DateTimeStartTimer(DATE_TIME_REFRESH_TIME);
		GUI_MULTIBUF_BeginEx(1);
		DISPLAY_DateTime();
		GUI_MULTIBUF_EndEx(1);
	}
	
	if(IsDISPLAY_TemperatureUpdated())		// room temperature changed
	{
		DISPLAY_TemperatureUpdateReset();
		GUI_MULTIBUF_BeginEx(1);
		DISPLAY_RoomTemperature();
		GUI_MULTIBUF_EndEx(1);
	}
	
	if(IsDISPLAY_SetpointUpdated())			// setpoint temperature changed
	{
		DISPLAY_SetpointUpdateReset();
		//GUI_MULTIBUF_BeginEx(1);
        //DISPLAY_TemperatureSet();
		//GUI_MULTIBUF_EndEx(1);
	}
	
	if(IsDOORBELL_Activ() && (!IsDISPLAY_DoorBellActiv()) && (!IsBUTTON_DndActiv()))
	{
		
	}
	else if(!IsDOORBELL_Activ() && (IsDISPLAY_DoorBellActiv()) && (IsDISPLAY_DoorBellTimerExpired()))
	{
		
	}
	/** ==========================================================================*/
	/**		C H E C K   S O F T W A R E   B U T T O N   T O U C H   E V E N T	  */
	/** ==========================================================================*/
	if(ActivDisplay == DISPLAY_THERMOSTAT)
	{
		if(BUTTON_IsPressed(hBUTTON_Dnd) && !btn_dnd_old_state)
		{
			btn_dnd_old_state = 1;
			
			if(btn_dnd_state == 0) 
			{
				btn_dnd_state = 1;
				GUI_SelectLayer(1);
				GUI_MULTIBUF_BeginEx(1);
				
				GUI_MULTIBUF_EndEx(1);
				GUI_SelectLayer(0);
				BUTTON_DndActivSet();
				if(IsBUTTON_CallMaidActiv()) BUTTON_SetPressed(hBUTTON_Maid, BUTTON_BI_PRESSED);
			}
			else if(btn_dnd_state == 1) 
			{
				btn_dnd_state = 0;
				GUI_SelectLayer(1);
				GUI_MULTIBUF_BeginEx(1);
				
				GUI_MULTIBUF_EndEx(1);
				GUI_SelectLayer(0);
				BUTTON_DndActivReset();
			}	
			
		}
		else if(!BUTTON_IsPressed(hBUTTON_Dnd) && btn_dnd_old_state) btn_dnd_old_state = 0;
		
		if(BUTTON_IsPressed(hBUTTON_Sos) && !btn_sos_old_state && IsBUTTON_SosActiv())
		{
			btn_sos_old_state = 1;	
			
			if(btn_sos_state == 1) 
			{
				btn_sos_state = 0;
				GUI_SelectLayer(1);
				GUI_MULTIBUF_BeginEx(1);
				
				GUI_MULTIBUF_EndEx(1);
				GUI_SelectLayer(0);
				BUTTON_SosActivReset();
			}	
		}
		if(!BUTTON_IsPressed(hBUTTON_Sos) && btn_sos_old_state) btn_sos_old_state = 0;
		
		if(BUTTON_IsPressed(hBUTTON_Maid) && !btn_maid_old_state)
		{
			btn_maid_old_state = 1;	
			
			if(btn_maid_state == 0) 
			{
				btn_maid_state = 1;
				GUI_SelectLayer(1);
				GUI_MULTIBUF_BeginEx(1);
				
				GUI_MULTIBUF_EndEx(1);
				GUI_SelectLayer(0);
				BUTTON_CallMaidActivSet();
				if(IsBUTTON_DndActiv()) BUTTON_SetPressed(hBUTTON_Dnd, BUTTON_BI_PRESSED);
			}
			else if(btn_maid_state == 1) 
			{
				btn_maid_state = 0;
				GUI_SelectLayer(1);
				GUI_MULTIBUF_BeginEx(1);
				
				GUI_MULTIBUF_EndEx(1);
				GUI_SelectLayer(0);
				BUTTON_CallMaidActivReset();
			}
		}
		else if(!BUTTON_IsPressed(hBUTTON_Maid) && btn_maid_old_state) btn_maid_old_state = 0;
	}
}


static void PID_Hook(GUI_PID_STATE * pState) 
{

}


static void DISPLAY_RoomTemperature(void)
{	
	if(ActivDisplay == DISPLAY_THERMOSTAT)
	{
		GUI_SelectLayer(1);
		GUI_SetBkColor(GUI_TRANSPARENT); 
		GUI_ClearRect(320,5,480,40);
		GUI_GotoXY(370, 20);
		GUI_SetFont(GUI_FONT_20_1);
		GUI_SetColor(GUI_YELLOW);
		GUI_SetTextMode(GUI_TM_TRANS);
		GUI_SetTextAlign(GUI_TA_RIGHT|GUI_TA_VCENTER);
		GUI_DispString("INDOOR:");	
		GUI_GotoXY(400, 20);
		GUI_SetFont(GUI_FONT_32_1);
		GUI_SetColor(GUI_YELLOW);
		GUI_SetTextMode(GUI_TM_TRANS);
		GUI_SetTextAlign(GUI_TA_LEFT|GUI_TA_VCENTER);
		if(Thermostat_1.actual_temperature & 0x8000) GUI_DispString("-");
		GUI_DispDecSpace(((Thermostat_1.actual_temperature & 0x0fff) / 10), 2);
		GUI_DispString("°C");
		GUI_SelectLayer(0);
	}
}

static void DISPLAY_DateTime(void)
{
	uint8_t	buff_bcnt;
	
	HAL_RTC_GetTime(&hrtc, &time, RTC_FORMAT_BCD);
	HAL_RTC_GetDate(&hrtc, &date, RTC_FORMAT_BCD);
	ClearBuffer(display_buffer,  sizeof(display_buffer));
	GUI_SelectLayer(1);
	
	if(ActivDisplay == DISPLAY_THERMOSTAT)
	{
		GUI_ClearRect(65, 5, 245, 60);
		GUI_ClearRect(5, 230, 245, 270);
		GUI_SetFont(GUI_FONT_32_1);
		GUI_SetColor(GUI_YELLOW);
		GUI_SetTextMode(GUI_TM_TRANS);
		GUI_SetTextAlign(GUI_TA_LEFT|GUI_TA_VCENTER);
		
		switch (date.WeekDay)
		{
			case 1:
				GUI_DispStringAt("MON", 5, 240);
				break;
			
			case 2:
				GUI_DispStringAt("TUE", 5, 240);
				break;
			
			case 3:
				GUI_DispStringAt("WED", 5, 240);
				break;
			
			case 4:
				GUI_DispStringAt("THU", 5, 240);
				break;
			
			case 5:
				GUI_DispStringAt("FRI", 5, 240);
				break;
			
			case 6:
				GUI_DispStringAt("SAT", 5, 240);
				break;
			
			case 7:
				GUI_DispStringAt("SUN", 5, 240);
				break;
			
			default:
				date.WeekDay = 7;
				GUI_DispStringAt("SUN", 5, 240);
				break;				
		}

		buff_bcnt = 0;
		display_buffer[buff_bcnt++] = (date.Date >> 4) + 48;
		display_buffer[buff_bcnt++] = (date.Date & 0x0f) + 48;
		display_buffer[buff_bcnt++] = '.';
		display_buffer[buff_bcnt++] = (date.Month >> 4) + 48;
		display_buffer[buff_bcnt++] = (date.Month & 0x0f) + 48;
		display_buffer[buff_bcnt++] = '.';
		display_buffer[buff_bcnt++] = '2';
		display_buffer[buff_bcnt++] = '0';
		display_buffer[buff_bcnt++] = (date.Year >> 4) + 48;
		display_buffer[buff_bcnt++] = (date.Year & 0x0f) + 48;
		GUI_SetFont(GUI_FONT_32_1);
		GUI_SetColor(GUI_YELLOW);
		GUI_SetTextMode(GUI_TM_TRANS);
		GUI_SetTextAlign(GUI_TA_RIGHT|GUI_TA_VCENTER);
		GUI_GotoXY(220, 240);
		GUI_DispString((const char *)display_buffer);			
		ClearBuffer(display_buffer, sizeof(display_buffer));	
		buff_bcnt = 0;
		display_buffer[buff_bcnt++] =  (time.Hours >> 4) + 48;
		display_buffer[buff_bcnt++] =  (time.Hours & 0x0f) + 48;
		display_buffer[buff_bcnt++] = ':';
		display_buffer[buff_bcnt++] =  (time.Minutes >> 4) + 48;
		display_buffer[buff_bcnt++] =  (time.Minutes & 0x0f) + 48;	
		GUI_SetFont(GUI_FONT_32_1);
		GUI_SetColor(GUI_YELLOW);
		GUI_SetTextMode(GUI_TM_TRANS);
		GUI_SetTextAlign(GUI_TA_RIGHT);
		GUI_GotoXY(220, 20);
		GUI_DispString((const char *)display_buffer);
	}

	GUI_SelectLayer(0);
}


void BUTTON_SetNewState(uint16_t button_id, BUTTON_StateTypeDef new_state)
{
	switch(button_id)
	{
		case  GUI_ID_BUTTON_Dnd:
		{
			if(new_state == RELEASED)
			{
				btn_dnd_state = 0;
				GUI_SelectLayer(1);
				GUI_MULTIBUF_BeginEx(1);
				
				GUI_MULTIBUF_EndEx(1);
				GUI_SelectLayer(0);
				BUTTON_DndActivReset();
			}
			else if(new_state == PRESSED)
			{
				btn_dnd_state = 1;
				GUI_SelectLayer(1);
				GUI_MULTIBUF_BeginEx(1);
				
				GUI_MULTIBUF_EndEx(1);
				GUI_SelectLayer(0);
				BUTTON_DndActivSet();
			}
			break;
		}
		
		
		case  GUI_ID_BUTTON_Sos:
		{
			if(new_state == RELEASED)
			{
				btn_sos_state = 0;
				GUI_SelectLayer(1);
				GUI_MULTIBUF_BeginEx(1);
				
				GUI_MULTIBUF_EndEx(1);
				GUI_SelectLayer(0);
				BUTTON_SosActivReset();
			}
			else if(new_state == PRESSED)
			{
				btn_sos_state = 1;
				GUI_SelectLayer(1);
				GUI_MULTIBUF_BeginEx(1);
				
				GUI_MULTIBUF_EndEx(1);
				GUI_SelectLayer(0);
				BUTTON_SosActivSet();
			}
			break;
		}
		
		
		case  GUI_ID_BUTTON_Maid:
		{
			if(new_state == RELEASED)
			{
				btn_maid_state = 0;
				GUI_SelectLayer(1);
				GUI_MULTIBUF_BeginEx(1);
				
				GUI_MULTIBUF_EndEx(1);
				GUI_SelectLayer(0);
				BUTTON_CallMaidActivReset();
			}
			else if(new_state == PRESSED)
			{
				btn_maid_state = 1;
				GUI_SelectLayer(1);
				GUI_MULTIBUF_BeginEx(1);
				
				GUI_MULTIBUF_EndEx(1);
				GUI_SelectLayer(0);
				BUTTON_CallMaidActivSet();
			}
			break;
		}
	}
}


BUTTON_StateTypeDef BUTTON_GetState(uint16_t button_id)
{
	switch(button_id)
	{
		case  GUI_ID_BUTTON_Dnd:
			return (btn_dnd_state);
		
		case  GUI_ID_BUTTON_Sos:
			return (btn_sos_state);
		
		case  GUI_ID_BUTTON_Maid:
			return (btn_maid_state);
	}
	return(2);
}


/*************************** End of file ****************************/
