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
BUTTON_Handle hBUTTON_SosReset;
BUTTON_Handle hBUTTON_Maid;
BUTTON_Handle hBUTTON_Ok;
BUTTON_Handle hBUTTON_DoorOpen;
BUTTON_Handle hBUTTON_Increase;
BUTTON_Handle hBUTTON_Decrease;
eActivDisplayTypeDef ActivDisplay;



/* Private Define ------------------------------------------------------------*/
#define TIME_WAIT          			3000 
#define FACTOR_MIN   				100
#define FACTOR_MAX 					20000


/* Private Variable ----------------------------------------------------------*/
__IO uint32_t display_timer;
__IO uint32_t display_date_time_timer;
__IO uint32_t display_doorbell_timer;
uint32_t display_flags;

uint8_t display_buffer[DISPLAY_BUFFER_SIZE];
uint8_t btn_dnd_state, btn_dnd_old_state;
uint8_t btn_sos_state, btn_sos_old_state;
uint8_t btn_maid_state, btn_maid_old_state;
uint8_t btn_increase_state, btn_increase_old_state, btn_increase_timer, btn_increase_rate;
uint8_t btn_decrease_state, btn_decrease_old_state, btn_decrease_timer, btn_decrease_rate;

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
static void DISPLAY_TemperatureSetPoint(void);


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
	hBUTTON_Dnd         = BUTTON_Create( 355,   5, 120,  50, GUI_ID_BUTTON_Dnd,      WM_CF_SHOW);
	hBUTTON_Maid        = BUTTON_Create( 355,  75, 120,  50, GUI_ID_BUTTON_Maid,     WM_CF_SHOW);
	hBUTTON_SosReset         = BUTTON_Create( 355, 145, 120,  50, GUI_ID_BUTTON_Sos,      WM_CF_SHOW);
    hBUTTON_Decrease    = BUTTON_Create(   3,  87, 103, 160, GUI_ID_BUTTON_Decrease, WM_CF_SHOW);
    hBUTTON_Increase    = BUTTON_Create( 220,  90, 114, 156, GUI_ID_BUTTON_Increase, WM_CF_SHOW);
    BUTTON_SetBitmap(hBUTTON_Dnd, BUTTON_BI_PRESSED, &bmbtn_dnd_1);
    BUTTON_SetBitmap(hBUTTON_Dnd, BUTTON_BI_UNPRESSED, &bmbtn_dnd_0);
    BUTTON_SetBitmap(hBUTTON_Maid, BUTTON_BI_PRESSED, &bmbtn_maid_1);
    BUTTON_SetBitmap(hBUTTON_Maid, BUTTON_BI_UNPRESSED, &bmbtn_maid_0);
    BUTTON_SetBitmap(hBUTTON_SosReset, BUTTON_BI_PRESSED, &bmbtn_rst_sos_0);
    BUTTON_SetBitmap(hBUTTON_SosReset, BUTTON_BI_UNPRESSED, &bmbtn_rst_sos_0);
    BUTTON_SetBitmap(hBUTTON_Decrease, BUTTON_BI_PRESSED, &bmbtn_decrease);
    BUTTON_SetBitmap(hBUTTON_Decrease, BUTTON_BI_UNPRESSED, &bmbtn_decrease);
    BUTTON_SetBitmap(hBUTTON_Increase, BUTTON_BI_PRESSED, &bmbtn_increase);
    BUTTON_SetBitmap(hBUTTON_Increase, BUTTON_BI_UNPRESSED, &bmbtn_increase);
	GUI_Exec();
	GUI_SelectLayer(1);
	GUI_SetBkColor(GUI_TRANSPARENT); 
	GUI_Clear();
    DISPLAY_SetpointUpdateSet();
	ActivDisplay = DISPLAY_THERMOSTAT;
	DISPLAY_DateTime();
	GUI_Initialized = 1;
	GUI_SelectLayer(0);
}


void DISPLAY_Service(void)
{
	uint8_t i;
	static uint8_t fl = 0;
	static uint8_t au_cnt = 0;
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
        
        if(++au_cnt == 2)
        {
            GUI_SelectLayer(1);
			GUI_Clear();
            GUI_SelectLayer(0);
            WM_DeleteWindow(hBUTTON_Dnd);
            WM_DeleteWindow(hBUTTON_Maid);
            WM_DeleteWindow(hBUTTON_SosReset);
            WM_DeleteWindow(hBUTTON_Decrease);
            WM_DeleteWindow(hBUTTON_Increase);
            GUI_SetBkColor(GUI_BLACK);
			GUI_Clear();
            GUI_DrawBitmap(&bmmessage_1, 0, 0);
            hBUTTON_DoorOpen    = BUTTON_Create(  20, 210, 155,  50, GUI_ID_BUTTON_DoorOpen,    WM_CF_SHOW);
            hBUTTON_Ok          = BUTTON_Create( 320, 200, 133,  55, GUI_ID_BUTTON_Ok,          WM_CF_SHOW);
            BUTTON_SetBitmap(hBUTTON_DoorOpen, BUTTON_BI_PRESSED, &bmbtn_open_door);
            BUTTON_SetBitmap(hBUTTON_DoorOpen, BUTTON_BI_UNPRESSED, &bmbtn_open_door);
            BUTTON_SetBitmap(hBUTTON_Ok, BUTTON_BI_PRESSED, &bmbtn_ok);
            BUTTON_SetBitmap(hBUTTON_Ok, BUTTON_BI_UNPRESSED, &bmbtn_ok);
            GUI_Exec();
            ActivDisplay = DISPLAY_MESSAGE;
        }
        else if(au_cnt == 3)
        {
            GUI_SelectLayer(0);
            WM_DeleteWindow(hBUTTON_DoorOpen);
            WM_DeleteWindow(hBUTTON_Ok);
            GUI_SetBkColor(GUI_BLACK);
			GUI_Clear();
            DISPLAY_Init();
        }
        else if(au_cnt == 4)
        {
            GUI_SelectLayer(1);
			GUI_Clear();
            GUI_SelectLayer(0);
            WM_DeleteWindow(hBUTTON_Dnd);
            WM_DeleteWindow(hBUTTON_Maid);
            WM_DeleteWindow(hBUTTON_SosReset);
            WM_DeleteWindow(hBUTTON_Decrease);
            WM_DeleteWindow(hBUTTON_Increase);
            GUI_SetBkColor(GUI_BLACK);
			GUI_Clear();
            GUI_DrawBitmap(&bmmessage_2, 0, 0);
            hBUTTON_Ok = BUTTON_Create( 320, 200, 133,  55, GUI_ID_BUTTON_Ok, WM_CF_SHOW);
            BUTTON_SetBitmap(hBUTTON_Ok, BUTTON_BI_PRESSED, &bmbtn_ok);
            BUTTON_SetBitmap(hBUTTON_Ok, BUTTON_BI_UNPRESSED, &bmbtn_ok);
            GUI_Exec();
            ActivDisplay = DISPLAY_MESSAGE;
        }
        else if(au_cnt == 5)
        {
            GUI_SelectLayer(0);
            WM_DeleteWindow(hBUTTON_Ok);
            GUI_SetBkColor(GUI_BLACK);
			GUI_Clear();
            DISPLAY_Init();
            au_cnt = 0;
        }
	}
	
	if(IsDISPLAY_SetpointUpdated())			// setpoint temperature changed
	{
		DISPLAY_SetpointUpdateReset();
		GUI_MULTIBUF_BeginEx(1);
        DISPLAY_TemperatureSetPoint();
		GUI_MULTIBUF_EndEx(1);
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
                BUTTON_DndActivSet();
				if(IsBUTTON_CallMaidActiv())  BUTTON_SetNewState(hBUTTON_Maid, RELEASED);
                BUTTON_SetBitmap(hBUTTON_Dnd, BUTTON_BI_PRESSED, &bmbtn_dnd_0);
                BUTTON_SetBitmap(hBUTTON_Dnd, BUTTON_BI_UNPRESSED, &bmbtn_dnd_1);
				GUI_MULTIBUF_EndEx(1);
				GUI_SelectLayer(0);
			}
			else if(btn_dnd_state == 1) 
			{
				btn_dnd_state = 0;
				GUI_SelectLayer(1);
				GUI_MULTIBUF_BeginEx(1);
				BUTTON_DndActivReset();
                BUTTON_SetBitmap(hBUTTON_Dnd, BUTTON_BI_PRESSED, &bmbtn_dnd_1);
                BUTTON_SetBitmap(hBUTTON_Dnd, BUTTON_BI_UNPRESSED, &bmbtn_dnd_0);
				GUI_MULTIBUF_EndEx(1);
				GUI_SelectLayer(0);
			}	
		}
		else if(!BUTTON_IsPressed(hBUTTON_Dnd) && btn_dnd_old_state)  btn_dnd_old_state = 0;
        
		if(BUTTON_IsPressed(hBUTTON_SosReset) && !btn_sos_old_state && IsBUTTON_SosResetActiv())
		{
			btn_sos_old_state = 1;	
			
			if(btn_sos_state == 1) 
			{
				btn_sos_state = 0;
				GUI_SelectLayer(1);
				GUI_MULTIBUF_BeginEx(1);
                BUTTON_SetBitmap(hBUTTON_SosReset, BUTTON_BI_PRESSED, &bmbtn_rst_sos_0);
                BUTTON_SetBitmap(hBUTTON_SosReset, BUTTON_BI_UNPRESSED, &bmbtn_rst_sos_0);
				GUI_MULTIBUF_EndEx(1);
				GUI_SelectLayer(0);
				BUTTON_SosActivReset();
			}	
		}
		else if(!BUTTON_IsPressed(hBUTTON_SosReset) && btn_sos_old_state) btn_sos_old_state = 0;
		
		if(BUTTON_IsPressed(hBUTTON_Maid) && !btn_maid_old_state)
		{
			btn_maid_old_state = 1;	
			
			if(btn_maid_state == 0) 
			{
				btn_maid_state = 1;
				GUI_SelectLayer(1);
				GUI_MULTIBUF_BeginEx(1);
				BUTTON_CallMaidActivSet();
				if(IsBUTTON_DndActiv()) BUTTON_SetNewState(hBUTTON_Dnd, RELEASED);
                BUTTON_SetBitmap(hBUTTON_Maid, BUTTON_BI_PRESSED, &bmbtn_maid_0);
                BUTTON_SetBitmap(hBUTTON_Maid, BUTTON_BI_UNPRESSED, &bmbtn_maid_1);
				GUI_MULTIBUF_EndEx(1);
				GUI_SelectLayer(0);
                
			}
			else if(btn_maid_state == 1) 
			{
				btn_maid_state = 0;
				GUI_SelectLayer(1);
				GUI_MULTIBUF_BeginEx(1);
				BUTTON_CallMaidActivReset();
                BUTTON_SetBitmap(hBUTTON_Maid, BUTTON_BI_PRESSED, &bmbtn_maid_1);
                BUTTON_SetBitmap(hBUTTON_Maid, BUTTON_BI_UNPRESSED, &bmbtn_maid_0);
				GUI_MULTIBUF_EndEx(1);
				GUI_SelectLayer(0);
               
			}
		}
		else if(!BUTTON_IsPressed(hBUTTON_Maid) && btn_maid_old_state) btn_maid_old_state = 0;
        
	
        if(BUTTON_IsPressed(hBUTTON_Increase) && !btn_increase_old_state)
		{
			btn_increase_old_state = 1;
			
            if(Thermostat_1.set_temperature < THERMOSTAT_MAX_TEMPERATURE) 
            {
                Thermostat_1.set_temperature += 10;
                GUI_MULTIBUF_BeginEx(1);
                DISPLAY_TemperatureSetPoint();
                GUI_MULTIBUF_EndEx(1);
            }
		}
		else if(!BUTTON_IsPressed(hBUTTON_Increase) && btn_increase_old_state) btn_increase_old_state = 0;
        
        if(BUTTON_IsPressed(hBUTTON_Decrease) && !btn_decrease_old_state)
		{
			btn_decrease_old_state = 1;
			
            if(Thermostat_1.set_temperature > THERMOSTAT_MIN_TEMPERATURE) 
            {
                Thermostat_1.set_temperature -= 10;
                GUI_MULTIBUF_BeginEx(1);
                DISPLAY_TemperatureSetPoint();
                GUI_MULTIBUF_EndEx(1);
            }
		}
		else if(!BUTTON_IsPressed(hBUTTON_Decrease) && btn_decrease_old_state) btn_decrease_old_state = 0;
    }
}


static void PID_Hook(GUI_PID_STATE * pState) 
{

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
		GUI_ClearRect(240, 230, 480, 270);
        
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
        display_buffer[buff_bcnt++] = '.';
        display_buffer[buff_bcnt++] = ' ';
        display_buffer[buff_bcnt++] = ' ';
        display_buffer[buff_bcnt++] =  (time.Hours >> 4) + 48;
		display_buffer[buff_bcnt++] =  (time.Hours & 0x0f) + 48;
		display_buffer[buff_bcnt++] = ':';
		display_buffer[buff_bcnt++] =  (time.Minutes >> 4) + 48;
		display_buffer[buff_bcnt++] =  (time.Minutes & 0x0f) + 48;	
		GUI_SetFont(GUI_FONT_24_1);
		GUI_SetColor(GUI_WHITE);
		GUI_SetTextMode(GUI_TM_TRANS);
		GUI_SetTextAlign(GUI_TA_RIGHT|GUI_TA_VCENTER);
		GUI_GotoXY(470, 255);
		GUI_DispString((const char *)display_buffer);
	}

	GUI_SelectLayer(0);
}


static void DISPLAY_TemperatureSetPoint(void)
{
#define DEC_POS     125
#define UNIT_POS    165 
#define V_POS       145  
    
    uint8_t dec, unit;
    
    GUI_SelectLayer(1);
    dec = (Thermostat_1.set_temperature / 100);
    unit = ((Thermostat_1.set_temperature - (dec * 100)) / 10);
    GUI_ClearRect(120, 140, 250, 220);
    
    if(dec == 1) GUI_DrawBitmap(&bmnumber_1, DEC_POS, V_POS);
    else if(dec == 2) GUI_DrawBitmap(&bmnumber_2, DEC_POS, V_POS);
    else if(dec == 3) GUI_DrawBitmap(&bmnumber_3, DEC_POS, V_POS);
    
    if(unit == 0) GUI_DrawBitmap(&bmnumber_0, UNIT_POS, V_POS);
    else if(unit == 1) GUI_DrawBitmap(&bmnumber_1, UNIT_POS, V_POS);
    else if(unit == 2) GUI_DrawBitmap(&bmnumber_2, UNIT_POS, V_POS);
    else if(unit == 3) GUI_DrawBitmap(&bmnumber_3, UNIT_POS, V_POS);
    else if(unit == 4) GUI_DrawBitmap(&bmnumber_4, UNIT_POS, V_POS);
    else if(unit == 5) GUI_DrawBitmap(&bmnumber_5, UNIT_POS, V_POS);
    else if(unit == 6) GUI_DrawBitmap(&bmnumber_6, UNIT_POS, V_POS);
    else if(unit == 7) GUI_DrawBitmap(&bmnumber_7, UNIT_POS, V_POS);
    else if(unit == 8) GUI_DrawBitmap(&bmnumber_8, UNIT_POS, V_POS);
    else if(unit == 9) GUI_DrawBitmap(&bmnumber_9, UNIT_POS, V_POS);
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
				BUTTON_SetBitmap(hBUTTON_Dnd, BUTTON_BI_PRESSED, &bmbtn_dnd_1);
                BUTTON_SetBitmap(hBUTTON_Dnd, BUTTON_BI_UNPRESSED, &bmbtn_dnd_0);
				GUI_MULTIBUF_EndEx(1);
				GUI_SelectLayer(0);
				BUTTON_DndActivReset();
			}
			else if(new_state == PRESSED)
			{
				btn_dnd_state = 1;
				GUI_SelectLayer(1);
				GUI_MULTIBUF_BeginEx(1);
				BUTTON_SetBitmap(hBUTTON_Dnd, BUTTON_BI_PRESSED, &bmbtn_dnd_0);
                BUTTON_SetBitmap(hBUTTON_Dnd, BUTTON_BI_UNPRESSED, &bmbtn_dnd_1);
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
				BUTTON_SetBitmap(hBUTTON_SosReset, BUTTON_BI_PRESSED, &bmbtn_rst_sos_1);
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
				BUTTON_SetBitmap(hBUTTON_Maid, BUTTON_BI_PRESSED, &bmbtn_maid_1);
                BUTTON_SetBitmap(hBUTTON_Maid, BUTTON_BI_UNPRESSED, &bmbtn_maid_0);
				GUI_MULTIBUF_EndEx(1);
				GUI_SelectLayer(0);
				BUTTON_CallMaidActivReset();
			}
			else if(new_state == PRESSED)
			{
				btn_maid_state = 1;
				GUI_SelectLayer(1);
				GUI_MULTIBUF_BeginEx(1);
				BUTTON_SetBitmap(hBUTTON_Maid, BUTTON_BI_PRESSED, &bmbtn_maid_0);
                BUTTON_SetBitmap(hBUTTON_Maid, BUTTON_BI_UNPRESSED, &bmbtn_maid_1);
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
