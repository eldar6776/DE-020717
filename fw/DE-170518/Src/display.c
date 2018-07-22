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
#include "stm32746g.h"



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

#define BTN_INC_X0                  220
#define BTN_INC_Y0                  90
#define BTN_INC_X1                  334
#define BTN_INC_Y1                  246

#define BTN_DEC_X0                  3
#define BTN_DEC_Y0                  87
#define BTN_DEC_X1                  106
#define BTN_DEC_Y1                  247

#define BTN_DND_X0                  355
#define BTN_DND_Y0                  5
#define BTN_DND_X1                  475
#define BTN_DND_Y1                  55

#define BTN_CMD_X0                  355
#define BTN_CMD_Y0                  75
#define BTN_CMD_X1                  475    
#define BTN_CMD_Y1                  125

#define BTN_SOS_X0                  355
#define BTN_SOS_Y0                  145
#define BTN_SOS_X1                  475
#define BTN_SOS_Y1                  195

#define BTN_DOR_X0                  25
#define BTN_DOR_Y0                  215
#define BTN_DOR_X1                  180
#define BTN_DOR_Y1                  265

#define BTN_OK_X0                   340
#define BTN_OK_Y0                   215
#define BTN_OK_X1                   473
#define BTN_OK_Y1                   270

#define SP_TEMP_DEC_POS             125
#define SP_TEMP_UNIT_POS            165 
#define SP_TEMP_V_POS               145 


/* Private Variable ----------------------------------------------------------*/
__IO uint32_t display_timer;
__IO uint32_t display_date_time_timer;
__IO uint32_t display_message_timer;
__IO uint32_t display_screensaver_timer;

uint32_t display_flags;

uint8_t display_buffer[DISPLAY_BUFFER_SIZE];
uint8_t display_message_id, display_message_time;
uint8_t btn_dnd_state, btn_dnd_old_state;
uint8_t btn_sos_state, btn_sos_old_state;
uint8_t btn_maid_state, btn_maid_old_state;
uint8_t btn_ok_state, btn_ok_old_state;
uint8_t btn_opendoor_state, btn_opendoor_old_state;
uint8_t btn_increase_state, btn_increase_old_state;
uint8_t btn_decrease_state, btn_decrease_old_state;
uint8_t btn_last_state;

/* Private Macro -------------------------------------------------------------*/
/* Private Function Prototype ------------------------------------------------*/
static void PID_Hook(GUI_PID_STATE * pState);
static void DISPLAY_DateTime(void);
static void DISPLAY_TemperatureSetPoint(void);


/* Program Code  -------------------------------------------------------------*/
void DISPLAY_Init(void)
{
	GUI_Init();
	GUI_PID_SetHook(PID_Hook);
	WM_MULTIBUF_Enable(1);
	LCD_SetVisEx(0, 1);
	LCD_SetVisEx(1, 1);
	GUI_SelectLayer(0);
	GUI_Clear();
	GUI_DrawBitmap(&bm_display_0, 0, 0);
    GUI_SelectLayer(1);
	GUI_SetBkColor(GUI_TRANSPARENT); 
	GUI_Clear();
    BUTTON_SetNewState(GUI_ID_BUTTON_Dnd, RELEASED);
    BUTTON_SetNewState(GUI_ID_BUTTON_Maid, RELEASED);
    BUTTON_SetNewState(GUI_ID_BUTTON_Sos, RELEASED);
	GUI_Exec();
	ActivDisplay = DISPLAY_THERMOSTAT;
    DISPLAY_SetpointUpdateSet();
	DISPLAY_DateTime();
    DISPLAY_StartScreenSaverTimer(DISPLAY_SCREENSAVER_TIME);
}


void DISPLAY_Service(void)
{
	//static uint16_t actual_temp;
	/** ==========================================================================*/
	/**    D R A W     D I S P L A Y	G U I	O N	   U P D A T E    E V E N T   */
	/** ==========================================================================*/
	if(IsDISPLAY_TimerExpired())			        // display gui update
	{
		DISPLAY_StartTimer(GUI_REFRESH_TIME);
		GUI_Exec();
	}
	else return;									        // wait for gui refresh timer

    if(IsDISPLAY_ScreenSaverTimerExpirerd() && !IsDISPLAY_BrightnessSet())   
    {
        DISPLAY_BrightnessSet();
        __HAL_TIM_SET_COMPARE(&htim9, TIM_CHANNEL_1, DISPLAY_BRIGHTNESS_LOW); 
    }
    
    if(IsDISPLAY_UpdateActiv())                     // display message request
    {
        DISPLAY_UpdateReset();
        __HAL_TIM_SET_COMPARE(&htim9, TIM_CHANNEL_1, DISPLAY_BRIGHTNESS_HIGH);
        DISPLAY_StartScreenSaverTimer(DISPLAY_SCREENSAVER_TIME);
        DISPLAY_BrightnessReset();
        
        if(display_message_time > 0) 
        {
            DISPLAY_MessageStartTimer(display_message_time * 30000);
            DISPLAY_MessageTimerSet();
        }
        else DISPLAY_MessageTimerReset();
        
        if(display_message_id == 0)
        {
            GUI_SelectLayer(0);
            GUI_Clear();
            GUI_MULTIBUF_BeginEx(0);
            GUI_DrawBitmap(&bm_display_0, 0, 0);
            GUI_MULTIBUF_EndEx(0);
            GUI_SelectLayer(1);
            GUI_SetBkColor(GUI_TRANSPARENT); 
            GUI_Clear();
            GUI_MULTIBUF_BeginEx(1);
            BUTTON_SetNewState(GUI_ID_BUTTON_Dnd, BUTTON_GetState(GUI_ID_BUTTON_Dnd));
            BUTTON_SetNewState(GUI_ID_BUTTON_Maid, BUTTON_GetState(GUI_ID_BUTTON_Maid));
            BUTTON_SetNewState(GUI_ID_BUTTON_Sos, BUTTON_GetState(GUI_ID_BUTTON_Sos));
            GUI_MULTIBUF_EndEx(1);
            ActivDisplay = DISPLAY_THERMOSTAT;
            DISPLAY_SetpointUpdateSet();
            DISPLAY_DateTime();
            BUZZER_SignalOff();
        }
        else if(display_message_id == 1)
        {
            GUI_SelectLayer(0);
            GUI_Clear();
            GUI_MULTIBUF_BeginEx(0);
            GUI_DrawBitmap(&bm_display_1, 0, 0);
            GUI_MULTIBUF_EndEx(0);
            GUI_SelectLayer(1);
            GUI_SetBkColor(GUI_TRANSPARENT); 
            GUI_Clear();
            GUI_MULTIBUF_BeginEx(1);
            GUI_DrawBitmap(&bm_btn_open_door, BTN_DOR_X0, BTN_DOR_Y0); 
            GUI_DrawBitmap(&bm_btn_ok, BTN_OK_X0, BTN_OK_Y0);
            GUI_MULTIBUF_EndEx(1);
            ActivDisplay = DISPLAY_MESSAGE;
            BUZZER_SignalOn();
        }
        else if(display_message_id == 2)
        {
            GUI_SelectLayer(0);
            GUI_Clear();
            GUI_MULTIBUF_BeginEx(0);
            GUI_DrawBitmap(&bm_display_2, 0, 0);
            GUI_MULTIBUF_EndEx(0);
            GUI_SelectLayer(1);
            GUI_SetBkColor(GUI_TRANSPARENT); 
            GUI_Clear();
            GUI_MULTIBUF_BeginEx(1);
            GUI_DrawBitmap(&bm_btn_ok, BTN_OK_X0, BTN_OK_Y0);
            GUI_MULTIBUF_EndEx(1);
            ActivDisplay = DISPLAY_MESSAGE;
            BUZZER_SignalOn();
        }
    }
    else if(IsDISPLAY_DateTimeTimerExpired())	    // date & time info update 
	{
		DISPLAY_DateTimeStartTimer(DATE_TIME_REFRESH_TIME);
		DISPLAY_DateTime();
	}
	else if(IsDISPLAY_SetpointUpdated())			// setpoint temperature changed
	{
		DISPLAY_SetpointUpdateReset();
        DISPLAY_TemperatureSetPoint();
	}
	else if(ActivDisplay == DISPLAY_THERMOSTAT)     // check thermostat display button states
	{
		if(btn_dnd_state && !btn_dnd_old_state)
		{
			btn_dnd_old_state = 1;
            
            if(!IsBUTTON_DndActiv())
            {
                BUTTON_SetNewState(GUI_ID_BUTTON_Dnd, PRESSED);
                BUTTON_SetNewState(GUI_ID_BUTTON_Maid, RELEASED);
            }
            else
            {
                BUTTON_SetNewState(GUI_ID_BUTTON_Dnd, RELEASED);
            }
		}
		else if(!btn_dnd_state && btn_dnd_old_state)  btn_dnd_old_state = 0;
        		
		if(btn_maid_state && !btn_maid_old_state)
		{
			btn_maid_old_state = 1;
            
			if(!IsBUTTON_CallMaidActiv())
            {
                BUTTON_SetNewState(GUI_ID_BUTTON_Maid, PRESSED);
                BUTTON_SetNewState(GUI_ID_BUTTON_Dnd, RELEASED);
            }
            else
            {
                BUTTON_SetNewState(GUI_ID_BUTTON_Maid, RELEASED);
            }
		}
		else if(!btn_maid_state && btn_maid_old_state) btn_maid_old_state = 0;
              
        if(IsBUTTON_SosResetActiv() && btn_sos_state && !btn_sos_old_state)
		{
			btn_sos_old_state = 1;
			BUTTON_SetNewState(GUI_ID_BUTTON_Sos, RELEASED);
		}
		else if(!btn_sos_state && btn_sos_old_state) btn_sos_old_state = 0;
        
        if(btn_increase_state && !btn_increase_old_state)
		{
			btn_increase_old_state = 1;
            
            if(Thermostat_1.set_temperature <= (THERMOSTAT_MAX_TEMPERATURE - 10)) 
            {
                Thermostat_1.set_temperature += 10;
                DISPLAY_TemperatureSetPoint();
            }
            else Thermostat_1.set_temperature = THERMOSTAT_MAX_TEMPERATURE;
            
            ONEWIRE_UpdateThermostatParameterSet();
            buzzer_mode = BUZZER_BUTTON_PRESSED;
            BUZZER_SignalOn();
		}
		else if(!btn_increase_state && btn_increase_old_state) btn_increase_old_state = 0;
        
        if(btn_decrease_state && !btn_decrease_old_state)
		{
			btn_decrease_old_state = 1;
            
            if(Thermostat_1.set_temperature >= (THERMOSTAT_MIN_TEMPERATURE + 10)) 
            {
                Thermostat_1.set_temperature -= 10;
                DISPLAY_TemperatureSetPoint();
            }
            else Thermostat_1.set_temperature = THERMOSTAT_MIN_TEMPERATURE;
            
            ONEWIRE_UpdateThermostatParameterSet();
            buzzer_mode = BUZZER_BUTTON_PRESSED;
            BUZZER_SignalOn();
		}
		else if(!btn_decrease_state && btn_decrease_old_state) btn_decrease_old_state = 0;
    }
    else if(ActivDisplay == DISPLAY_MESSAGE)        // check message display button states
	{
        if(IsDISPLAY_MessageTimerActiv() && IsDISPLAY_MessageTimerExpired())
        {
            display_message_time = 0;
            display_message_id = 0;
            ONEWIRE_UpdateDisplayImageSet();
            DISPLAY_UpdateSet();
        }
        else if(btn_ok_state)
		{
            btn_ok_state = 0; 
            display_message_id = 0;
            ONEWIRE_UpdateDisplayImageSet();
            DISPLAY_UpdateSet();
		}
        else if(btn_opendoor_state)
		{
            if(display_message_id == 1) BUTTON_OpenDoorSet();
            btn_opendoor_state = 0;
            display_message_id = 0;
            ONEWIRE_UpdateDisplayImageSet();
            DISPLAY_UpdateSet();
		}
    }
}


static void PID_Hook(GUI_PID_STATE * pState) 
{
    if(pState->Pressed  == 1) 
    {
        __HAL_TIM_SET_COMPARE(&htim9, TIM_CHANNEL_1, DISPLAY_BRIGHTNESS_HIGH);
        DISPLAY_StartScreenSaverTimer(DISPLAY_SCREENSAVER_TIME);
        DISPLAY_BrightnessReset();
    }
      
    if(ActivDisplay == DISPLAY_THERMOSTAT)
	{
        if(pState->Pressed  == 1)
        {
            pState->Layer = 1;
            
            if ((pState->x >= BTN_INC_X0) && 
                (pState->y >= BTN_INC_Y0) && 
                (pState->x < BTN_INC_X1) && 
                (pState->y < BTN_INC_Y1)) 
            {	
                btn_increase_state = 1;   
            }
            
            if ((pState->x >= BTN_DEC_X0) && 
                (pState->y >= BTN_DEC_Y0) && 
                (pState->x < BTN_DEC_X1) && 
                (pState->y < BTN_DEC_Y1)) 
            {	
                btn_decrease_state = 1;
            }  

            if ((pState->x >= BTN_DND_X0) && 
                (pState->y >= BTN_DND_Y0) && 
                (pState->x < BTN_DND_X1) && 
                (pState->y < BTN_DND_Y1)) 
            {
                btn_dnd_state = 1;
            }
               
            if ((pState->x >= BTN_CMD_X0) && 
                (pState->y >= BTN_CMD_Y0) && 
                (pState->x < BTN_CMD_X1) && 
                (pState->y < BTN_CMD_Y1)) 
            {
                btn_maid_state = 1;
            } 
            
            if ((pState->x >= BTN_SOS_X0) && 
                (pState->y >= BTN_SOS_Y0) && 
                (pState->x < BTN_SOS_X1) && 
                (pState->y < BTN_SOS_Y1)) 
            {
                btn_sos_state = 1;
            } 
        }
        else
        {
            btn_decrease_state = 0;   
            btn_increase_state = 0;
            btn_dnd_state = 0;
            btn_maid_state = 0;
            btn_sos_state = 0;           
        }
	}
    else if(ActivDisplay == DISPLAY_MESSAGE)
	{
        if(pState->Pressed  == 1)
        {
            pState->Layer = 1;
            
           if ((pState->x >= BTN_DOR_X0) && 
                (pState->y >= BTN_DOR_Y0) && 
                (pState->x < BTN_DOR_X1) && 
                (pState->y < BTN_DOR_Y1)) 
            {
                btn_opendoor_state = 1;
            }
               
            if ((pState->x >= BTN_OK_X0) && 
                (pState->y >= BTN_OK_Y0) && 
                (pState->x < BTN_OK_X1) && 
                (pState->y < BTN_OK_Y1)) 
            {
                btn_ok_state = 1;
            } 
        }
        else
        {
            btn_opendoor_state = 0;   
            btn_ok_state = 0;          
        }
	}
}



static void DISPLAY_DateTime(void)
{
	uint8_t	buff_bcnt;
	
	if(ActivDisplay == DISPLAY_THERMOSTAT)
	{
        HAL_RTC_GetTime(&hrtc, &time, RTC_FORMAT_BCD);
        HAL_RTC_GetDate(&hrtc, &date, RTC_FORMAT_BCD);
        ClearBuffer(display_buffer,  sizeof(display_buffer));
        GUI_MULTIBUF_BeginEx(1);
		GUI_ClearRect(240, 250, 480, 270);   
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
        GUI_MULTIBUF_EndEx(1);
	}
}


static void DISPLAY_TemperatureSetPoint(void)
{
    uint8_t dec, unit;
    
    if(ActivDisplay == DISPLAY_THERMOSTAT)
	{
        dec = (Thermostat_1.set_temperature / 100);
        unit = ((Thermostat_1.set_temperature - (dec * 100)) / 10);
        
        GUI_MULTIBUF_BeginEx(1);
        GUI_ClearRect(120, 140, 250, 220);
        
        if(dec == 1) GUI_DrawBitmap(&bm_number_1, SP_TEMP_DEC_POS, SP_TEMP_V_POS);
        else if(dec == 2) GUI_DrawBitmap(&bm_number_2, SP_TEMP_DEC_POS, SP_TEMP_V_POS);
        else if(dec == 3) GUI_DrawBitmap(&bm_number_3, SP_TEMP_DEC_POS, SP_TEMP_V_POS);
        
        if(unit == 0) GUI_DrawBitmap(&bm_number_0, SP_TEMP_UNIT_POS, SP_TEMP_V_POS);
        else if(unit == 1) GUI_DrawBitmap(&bm_number_1, SP_TEMP_UNIT_POS, SP_TEMP_V_POS);
        else if(unit == 2) GUI_DrawBitmap(&bm_number_2, SP_TEMP_UNIT_POS, SP_TEMP_V_POS);
        else if(unit == 3) GUI_DrawBitmap(&bm_number_3, SP_TEMP_UNIT_POS, SP_TEMP_V_POS);
        else if(unit == 4) GUI_DrawBitmap(&bm_number_4, SP_TEMP_UNIT_POS, SP_TEMP_V_POS);
        else if(unit == 5) GUI_DrawBitmap(&bm_number_5, SP_TEMP_UNIT_POS, SP_TEMP_V_POS);
        else if(unit == 6) GUI_DrawBitmap(&bm_number_6, SP_TEMP_UNIT_POS, SP_TEMP_V_POS);
        else if(unit == 7) GUI_DrawBitmap(&bm_number_7, SP_TEMP_UNIT_POS, SP_TEMP_V_POS);
        else if(unit == 8) GUI_DrawBitmap(&bm_number_8, SP_TEMP_UNIT_POS, SP_TEMP_V_POS);
        else if(unit == 9) GUI_DrawBitmap(&bm_number_9, SP_TEMP_UNIT_POS, SP_TEMP_V_POS);
        GUI_MULTIBUF_EndEx(1);
    }
}


void BUTTON_SetNewState(uint16_t button_id, BUTTON_StateTypeDef new_state)
{
    BUTTON_StateChangedSet();
    GUI_MULTIBUF_BeginEx(1);
    
	switch(button_id)
	{
		case  GUI_ID_BUTTON_Dnd:
		{
			if(new_state == RELEASED)
			{
				BUTTON_DndActivReset();
                GUI_DrawBitmap(&bm_btn_dnd_0, BTN_DND_X0, BTN_DND_Y0);
			}
			else if(new_state == PRESSED)
			{
				BUTTON_DndActivSet();
                GUI_DrawBitmap(&bm_btn_dnd_1, BTN_DND_X0, BTN_DND_Y0);
			}
            break;
		}
		
		
		case  GUI_ID_BUTTON_Sos:
		{
			if(new_state == RELEASED)
			{
				BUTTON_SosActivReset();
                GUI_DrawBitmap(&bm_btn_rst_sos_0, BTN_SOS_X0, BTN_SOS_Y0);
			}
			else if(new_state == PRESSED)
			{
                BUTTON_SosActivSet();
				GUI_DrawBitmap(&bm_btn_rst_sos_1, BTN_SOS_X0, BTN_SOS_Y0);
			}
			break;
		}
		
		
		case  GUI_ID_BUTTON_Maid:
		{
			if(new_state == RELEASED)
			{
                BUTTON_CallMaidActivReset();
				GUI_DrawBitmap(&bm_btn_maid_0, BTN_CMD_X0, BTN_CMD_Y0);
			}
			else if(new_state == PRESSED)
			{
                BUTTON_CallMaidActivSet();
				GUI_DrawBitmap(&bm_btn_maid_1, BTN_CMD_X0, BTN_CMD_Y0);
			}
			break;
		}
	}
    
    GUI_MULTIBUF_EndEx(1);
    buzzer_mode = BUZZER_BUTTON_PRESSED;
    BUZZER_SignalOn();
}


BUTTON_StateTypeDef BUTTON_GetState(uint16_t button_id)
{
	switch(button_id)
	{
		case  GUI_ID_BUTTON_Dnd:
            if(IsBUTTON_DndActiv()) return (PRESSED);
			else return (RELEASED);
		
		case  GUI_ID_BUTTON_Sos:
			if(IsBUTTON_SosResetActiv()) return (PRESSED);
			else return (RELEASED);
		
		case  GUI_ID_BUTTON_Maid:
			if(IsBUTTON_CallMaidActiv()) return (PRESSED);
			else return (RELEASED);
	}
    
	return(BUTTON_SHIT);
}


/*************************** End of file ****************************/
