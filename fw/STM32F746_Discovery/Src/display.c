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
BUTTON_Handle hBUTTON_AlarmClock;
BUTTON_Handle hBUTTON_AlarmSetTime;
BUTTON_Handle hBUTTON_AlarmOnOff;
BUTTON_Handle hBUTTON_Home;
BUTTON_Handle hBUTTON_Dnd;
BUTTON_Handle hBUTTON_Sos;
BUTTON_Handle hBUTTON_Maid;
BUTTON_Handle hBUTTON_Weather;
BUTTON_Handle hBUTTON_CtrlMode;
BUTTON_Handle hBUTTON_FanMode;
WM_HWIN hLISTWHEEL_Window;
LISTWHEEL_Handle hLISTWHEEL_TimeMinute;
LISTWHEEL_Handle hLISTWHEEL_TimeHour;
KNOB_Handle hKNOB_Temperature;
GUI_HSPRITE SPRITE_DoorBell;

eActivDisplayTypeDef ActivDisplay;
FORECAST_DayTypeDef FORECAST_Current;
FORECAST_DayTypeDef FORECAST_Monday;
FORECAST_DayTypeDef FORECAST_Tuesday;
FORECAST_DayTypeDef FORECAST_Wednesday;
FORECAST_DayTypeDef FORECAST_Thurstday;
FORECAST_DayTypeDef FORECAST_Freeday;
FORECAST_DayTypeDef FORECAST_Saturday;
FORECAST_DayTypeDef FORECAST_Sunday;


/* Private Define ------------------------------------------------------------*/
#ifndef PI
#define PI							3.14159265358979f
#endif
#define TIME_WAIT          			3000 
#define FACTOR_MIN   				100
#define FACTOR_MAX 					20000


/* Private Variable ----------------------------------------------------------*/
__IO uint32_t display_timer;
__IO uint32_t display_knob_timer;
__IO uint32_t display_date_time_timer;
__IO uint32_t display_doorbell_animation_timer;
uint32_t display_flags;

uint8_t current_outdoor_temperature;
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
GUI_RECT Rect4 = {255, 230, 335, 265};
GUI_RECT Rect5 = {336, 230, 416, 265};
GUI_RECT Rect6 = {270, 135, 420, 190};
GUI_RECT Rect7 = {270, 190, 420, 245};


GUI_RECT ForecastFrame[8] = {
	{ 70,  28, 455,  58},
	{  5,  70,  65, 265},
	{ 70,  70, 130, 265},
	{135,  70, 195, 265},
	{200,  70, 260, 265},
	{265,  70, 325, 265},
	{330,  70, 390, 265},
	{395,  70, 455, 265}
};

const double Rad2Deg = 180.0 / (double)PI;
const double Deg2Rad = (double)PI / 180.0;
static GUI_CONST_STORAGE GUI_FONT * pFont23pBold = &GUI_Font23S_AA4;
static GUI_CONST_STORAGE GUI_FONT * pFont32pBold = &GUI_Font32S_AA4;
static GUI_CONST_STORAGE GUI_FONT * pFont23p     = &GUI_Font23SL_AA4;
static GUI_CONST_STORAGE GUI_FONT * pFont32p     = &GUI_Font32SL_AA4;

static const GUI_COLOR _aGradient[] = {
  0x00BC944C, 0x00BC944C, 0x00BB944C, 0x00BA944C, 0x00BA944C, 0x00B9944C, 0x00B9944C, 0x00B8944C, 0x00B7944C, 0x00B7944C, 0x00B6944C, 0x00B5944C, 0x00B5944C, 0x00B4944C, 0x00B3944C, 0x00B3944C, 0x00B2944C, 0x00B1944C, 0x00B0944C, 0x00AF944C, 0x00AE944C, 
  0x00AE944C, 0x00AD944C, 0x00AC944C, 0x00AB944C, 0x00AA944C, 0x00A9944C, 0x00A8944C, 0x00A7944C, 0x00A6944C, 0x00A5944C, 0x00A4944C, 0x00A3944C, 0x00A2944C, 0x00A1944C, 0x00A0944C, 0x009F944C, 0x009E944C, 0x009D944C, 0x009C944C, 0x009B944C, 
  0x009A944C, 0x0099944C, 0x0098944C, 0x0097944C, 0x0096944C, 0x0094944C, 0x0093944C, 0x0092944C, 0x0091944C, 0x0090944C, 0x008F944C, 0x008E944C, 0x008C944C, 0x008B944C, 0x008A944C, 0x0089944C, 0x0088944C, 0x0087944C, 0x0085944C, 0x0084944C, 
  0x0083944C, 0x0082944C, 0x0081944C, 0x007F944C, 0x007E944C, 0x007D944C, 0x007C944C, 0x007B944C, 0x0079944C, 0x0078944C, 0x0077944C, 0x0076944C, 0x0075944C, 0x0074944C, 0x0072944C, 0x0071944C, 0x0070944C, 0x006F944C, 0x006E944C, 0x006D944C, 
  0x006B944C, 0x006A944C, 0x0069944C, 0x0068944C, 0x0067944C, 0x0066944C, 0x0065944C, 0x0063944C, 0x0062944C, 0x0061944C, 0x0060944C, 0x005F944C, 0x005E944C, 0x005D944C, 0x005C944C, 0x005B944C, 0x005A944C, 0x0059944C, 0x0058944C, 0x0057944C, 
  0x0056944C, 0x0055944C, 0x0054944C, 0x0053944C, 0x0052944C, 0x0051944C, 0x0050944C, 0x004F944C, 0x004E944C, 0x004D944C, 0x004C944C, 0x004C944C, 0x004B944C, 0x004A944C, 0x0049944C, 0x0048944C, 0x0047944C, 0x0047944C, 0x0046944C, 0x0045944C, 
  0x0044944C, 0x0044944C, 0x0043944C, 0x0042944C, 0x0042944C, 0x0041944C, 0x0041944C, 0x0040944C, 0x003F944D, 0x003F944D, 0x003E944E, 0x003E944F, 0x003D934F, 0x003D9350, 0x003C9351, 0x003C9352, 0x003B9352, 0x003B9353, 0x003A9354, 0x003A9355, 
  0x00399256, 0x00399256, 0x00399257, 0x00389258, 0x00389259, 0x0037925A, 0x0037915B, 0x0037915C, 0x0036915D, 0x0036915E, 0x0035915F, 0x00359160, 0x00359061, 0x00349062, 0x00349063, 0x00349064, 0x00339066, 0x00338F67, 0x00338F68, 0x00338F69, 
  0x00328F6A, 0x00328F6B, 0x00328E6D, 0x00328E6E, 0x00318E6F, 0x00318E70, 0x00318D71, 0x00318D73, 0x00308D74, 0x00308D75, 0x00308D77, 0x00308C78, 0x00308C79, 0x002F8C7A, 0x002F8C7C, 0x002F8B7D, 0x002F8B7E, 0x002F8B80, 0x002E8B81, 0x002E8A82, 
  0x002E8A84, 0x002E8A85, 0x002E8A86, 0x002E8988, 0x002E8989, 0x002D898A, 0x002D898C, 0x002D888D, 0x002D888F, 0x002D8890, 0x002D8891, 0x002D8893, 0x002D8794, 0x002D8795, 0x002C8797, 0x002C8798, 0x002C869A, 0x002C869B, 0x002C869C, 0x002C869E, 
  0x002C859F, 0x002C85A0, 0x002C85A2, 0x002C85A3, 0x002C84A4, 0x002C84A6, 0x002C84A7, 0x002C84A8, 0x002B83AA, 0x002B83AB, 0x002B83AC, 0x002B83AD, 0x002B82AF, 0x002B82B0, 0x002B82B1, 0x002B82B3, 0x002B82B4, 0x002B81B5, 0x002B81B6, 0x002B81B7, 
  0x002B81B9, 0x002B80BA, 0x002B80BB, 0x002B80BC, 0x002B80BD, 0x002B80BE, 0x002B7FC0, 0x002B7FC1, 0x002B7FC2, 0x002B7FC3, 0x002A7FC4, 0x002A7EC5, 0x002A7EC6, 0x002A7EC7, 0x002A7EC8, 0x002A7EC9, 0x002A7ECA, 0x002A7DCB, 0x002A7DCC, 0x002A7DCD, 
  0x002A7DCE, 0x002A7DCE, 0x002A7DCF, 0x002A7CD0, 0x002A7CD1, 0x002A7CD2, 0x002A7CD2, 0x002A7CD3, 0x002A7CD4, 0x00297CD5, 0x00297CD5, 0x00297BD6, 0x00297BD7, 0x00297BD7, 0x00297BD8

};


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
static void DISPLAY_Forecast(void);
static void DISPLAY_AlarmClock(void);
static void DISPLAY_Knob(void);
static void BUTTON_FanModePressed(void);
static void BUTTON_CtrlModePressed(void);
static void BUTTON_FanModeReleased(void);
static void BUTTON_CtrlModeReleased(void);
static int _OwnerDraw(const WIDGET_ITEM_DRAW_INFO * pDrawItemInfo);
static void DISPLAY_InitForecastFrame(FORECAST_DayTypeDef* fday);
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
	GUI_DrawBitmap(&bmbckgnd_thermostat, 0, 0);
	hBUTTON_AlarmClock =BUTTON_Create(	5,   5,  55,  55, GUI_ID_BUTTON_AlarmClock,	WM_CF_SHOW);
	hBUTTON_Dnd = 		BUTTON_Create(	5,  65, 210,  45, GUI_ID_BUTTON_Dnd,		WM_CF_SHOW);
	hBUTTON_Sos = 		BUTTON_Create(	5, 110, 210,  45, GUI_ID_BUTTON_Sos,		WM_CF_SHOW);
	hBUTTON_Maid = 		BUTTON_Create(	5, 155, 210,  45, GUI_ID_BUTTON_Maid, 		WM_CF_SHOW);
	hBUTTON_Weather = 	BUTTON_Create(	5, 210,  55,  55, GUI_ID_BUTTON_Weather,	WM_CF_SHOW);
	hBUTTON_FanMode = 	BUTTON_Create(255, 230,  80,  35, GUI_ID_BUTTON_FanSpeed,	WM_CF_SHOW);
	hBUTTON_CtrlMode = 	BUTTON_Create(336, 230,  80,  35, GUI_ID_BUTTON_CtrlMode,	WM_CF_SHOW);
	BUTTON_SetBitmap(hBUTTON_AlarmClock, 		BUTTON_BI_PRESSED, 		&bmalarm_clock_icon);
	BUTTON_SetBitmap(hBUTTON_AlarmClock, 		BUTTON_BI_UNPRESSED, 	&bmalarm_clock_icon);
	BUTTON_SetBitmap(hBUTTON_Weather, 	BUTTON_BI_PRESSED, 		&bmweather_icon);
	BUTTON_SetBitmap(hBUTTON_Weather, 	BUTTON_BI_UNPRESSED, 	&bmweather_icon);
	
	GUI_Exec();
	GUI_SelectLayer(1);
	GUI_SetBkColor(GUI_TRANSPARENT); 
	GUI_Clear();
	
	GUI_DrawBitmap(&bmknob, 249, 52);
	
	GUI_SetColor(GUI_WHITE);
	GUI_FillRectEx(&Rect1);
	GUI_SetColor(LIGHT_BLUE);
	GUI_AA_FillRoundedRect(Rect1.x0 + 1, Rect1.y0 + 1, Rect1.x1 - 1, Rect1.y1 - 1, 8);
	Rect1.x0 += 5;
	GUI_SetFont(pFont23pBold);
	GUI_SetTextMode(GUI_TM_TRANS);
	GUI_SetColor(LEMON);
	GUI_DispStringInRect("Do Not Disturb", &Rect1, GUI_TA_VCENTER | GUI_TA_HCENTER);
	Rect1.x0 -= 5;
	
	GUI_SetColor(GUI_WHITE);
	GUI_FillRectEx(&Rect2);
	GUI_SetColor(LIGHT_BLUE);
	GUI_AA_FillRoundedRect(Rect2.x0 + 1, Rect2.y0 + 1, Rect2.x1 - 1, Rect2.y1 - 1, 8);
	Rect2.x0 += 5;
	GUI_SetFont(pFont23pBold);
	GUI_SetTextMode(GUI_TM_TRANS);
	GUI_SetColor(LEMON);
	GUI_DispStringInRect("SOS Reset", &Rect2, GUI_TA_VCENTER | GUI_TA_HCENTER);
	Rect2.x0 -= 5;

	GUI_SetColor(GUI_WHITE);
	GUI_FillRectEx(&Rect3);
	GUI_SetColor(LIGHT_BLUE);
	GUI_AA_FillRoundedRect(Rect3.x0 + 1, Rect3.y0 + 1, Rect3.x1 - 1, Rect3.y1 - 1, 8);
	Rect3.x0 += 5;
	GUI_SetFont(pFont23pBold);
	GUI_SetTextMode(GUI_TM_TRANS);
	GUI_SetColor(LEMON);
	GUI_DispStringInRect("Call Maid", &Rect3, GUI_TA_VCENTER | GUI_TA_HCENTER);
	Rect3.x0 -= 5;
	
	ActivDisplay = DISPLAY_THERMOSTAT;
	BUTTON_FanModeReleased();
	BUTTON_CtrlModeReleased();
	DISPLAY_DateTime();
	DISPLAY_Forecast();
	DISPLAY_Knob();
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
		GUI_MULTIBUF_BeginEx(1);
		DISPLAY_Knob();
		GUI_MULTIBUF_EndEx(1);
	}
	
	if(IsDOORBELL_Activ() && (!IsDISPLAY_DoorBellAnimationActiv()) && (!IsBUTTON_DndActiv()))
	{
		DISPLAY_DoorBellAnimationSet();
		GUI_SelectLayer(1);
		GUI_MULTIBUF_BeginEx(1);
		GUI_SetColor(GUI_BLUE);
		GUI_FillCircle(336, 139, 56);
		SPRITE_DoorBell = GUI_SPRITE_CreateAnim(&apbmdoor_bell_anim[1], 275, 85, 100,0, 9);
		DISPLAY_StartDoorBellTimer(DISPLAY_DOORBELL_TIME);
		GUI_MULTIBUF_EndEx(1);
		GUI_SelectLayer(0);
		if(audio_cnt == 0) AUDIO_PLAYER_Play(alarm_clock_clasic);
		else if(audio_cnt == 1) AUDIO_PLAYER_Play(alarm_clock_cosmic);
		else if(audio_cnt == 2) AUDIO_PLAYER_Play(alarm_clock_iphon);
		else if(audio_cnt == 3) AUDIO_PLAYER_Play(alarm_clock_melodic);
		else if(audio_cnt == 4) AUDIO_PLAYER_Play(alarm_clock_samsung);
		else if(audio_cnt == 5) AUDIO_PLAYER_Play(doorbell_dingdong);
		else if(audio_cnt == 6) AUDIO_PLAYER_Play(fire_alarm_hard);
		else if(audio_cnt == 7) AUDIO_PLAYER_Play(fire_alarm_soft);
		else if(audio_cnt == 8) AUDIO_PLAYER_Play(sos_alarm_entry);
		if(++audio_cnt >= 9) audio_cnt = 0;
	}
	else if(!IsDOORBELL_Activ() && (IsDISPLAY_DoorBellAnimationActiv()) && (IsDISPLAY_DoorBellTimerExpired()))
	{
		GUI_MULTIBUF_BeginEx(1);
		DISPLAY_DoorBellAnimationReset();
		GUI_SPRITE_StopAnim(SPRITE_DoorBell);
		GUI_SPRITE_Delete(SPRITE_DoorBell);
		DISPLAY_Knob();
		GUI_MULTIBUF_EndEx(1);
	}
	/** ==========================================================================*/
	/**		C H E C K   S O F T W A R E   B U T T O N   T O U C H   E V E N T	  */
	/** ==========================================================================*/
	if(ActivDisplay == DISPLAY_THERMOSTAT)
	{
		if(BUTTON_IsPressed(hBUTTON_AlarmClock) && (!btn_alarm_clock_old_state))
		{
			btn_alarm_clock_old_state = 1;
			
			if(btn_alarm_clock_state == 0) btn_alarm_clock_state = 1;
			else if(btn_alarm_clock_state == 1) btn_alarm_clock_state = 0;
			
			ActivDisplay = DISPLAY_ALARM_CLOCK;
			GUI_SelectLayer(1);
			GUI_SetBkColor(GUI_TRANSPARENT); 
			GUI_Clear();
			GUI_SelectLayer(0);
			WM_DeleteWindow(hBUTTON_AlarmClock);
			WM_DeleteWindow(hBUTTON_Dnd);
			WM_DeleteWindow(hBUTTON_Sos);
			WM_DeleteWindow(hBUTTON_Maid);
			WM_DeleteWindow(hBUTTON_CtrlMode);
			WM_DeleteWindow(hBUTTON_FanMode);
			WM_DeleteWindow(hBUTTON_Weather);
			GUI_SetBkColor(GUI_BLACK);
			GUI_Clear();
			GUI_MULTIBUF_BeginEx(0);
			GUI_DrawBitmap(&bmbckgnd_forecast, 0, 0);
			WINDOW_SetDefaultBkColor(DARK_BLUE);
			hLISTWHEEL_Window = WINDOW_CreateUser(65, 130, 170, 120, 0, WM_CF_SHOW, 0, GUI_ID_LISTWHEEL_Window,0, 0);
			hBUTTON_Home = 			BUTTON_Create(	5,   5,  55,   55, GUI_ID_BUTTON_Home, 			WM_CF_SHOW);
			hBUTTON_AlarmOnOff 	= 	BUTTON_Create(270, 135,  150,  55, GUI_ID_BUTTON_AlarmOnOff,	WM_CF_SHOW);
			hBUTTON_AlarmSetTime = 	BUTTON_Create(270, 190,  150,  55, GUI_ID_BUTTON_AlarmSetTime,	WM_CF_SHOW);
			
			hLISTWHEEL_TimeHour = LISTWHEEL_CreateUser(65, 130, 80, 120, 0, WM_CF_SHOW | WM_CF_HASTRANS, 0, GUI_ID_LISTWHEEL_TimeHour, 0, sizeof(_apHour));
			LISTWHEEL_SetFont(hLISTWHEEL_TimeHour, GUI_FONT_32_1);
			LISTWHEEL_SetTextAlign(hLISTWHEEL_TimeHour, TEXT_CF_HCENTER|TEXT_CF_VCENTER);
			LISTWHEEL_SetTextColor(hLISTWHEEL_TimeHour, LISTWHEEL_CI_SEL, LEMON);
			LISTWHEEL_SetTextColor(hLISTWHEEL_TimeHour, LISTWHEEL_CI_UNSEL, LEMON);
			LISTWHEEL_SetSnapPosition(hLISTWHEEL_TimeHour, 45);
			LISTWHEEL_SetOwnerDraw(hLISTWHEEL_TimeHour, _OwnerDraw);
			LISTWHEEL_SetUserData(hLISTWHEEL_TimeHour, &_apHour, sizeof(_apHour));
			LISTWHEEL_SetLineHeight(hLISTWHEEL_TimeHour, 30);
			
			for (i = 0; i < GUI_COUNTOF(_apHour); i++) 
			{
				LISTWHEEL_AddString(hLISTWHEEL_TimeHour, *(_apHour + i));
			}
			
			hLISTWHEEL_TimeMinute = LISTWHEEL_CreateUser(155, 130, 80, 120, 0, WM_CF_SHOW | WM_CF_HASTRANS, 0, GUI_ID_LISTWHEEL_TimeMinute, 0, sizeof(_apMinute));
			LISTWHEEL_SetFont(hLISTWHEEL_TimeMinute, GUI_FONT_32_1);
			LISTWHEEL_SetTextAlign(hLISTWHEEL_TimeMinute, TEXT_CF_HCENTER|TEXT_CF_VCENTER);
			LISTWHEEL_SetTextColor(hLISTWHEEL_TimeMinute, LISTWHEEL_CI_SEL, LEMON);
			LISTWHEEL_SetTextColor(hLISTWHEEL_TimeMinute, LISTWHEEL_CI_UNSEL, LEMON);
			LISTWHEEL_SetSnapPosition(hLISTWHEEL_TimeMinute, 45);
			LISTWHEEL_SetOwnerDraw(hLISTWHEEL_TimeMinute, _OwnerDraw);
			LISTWHEEL_SetUserData(hLISTWHEEL_TimeMinute, &_apMinute, sizeof(_apMinute));
			LISTWHEEL_SetLineHeight(hLISTWHEEL_TimeMinute, 30);
			
			for (i = 0; i < GUI_COUNTOF(_apMinute); i++) 
			{
				LISTWHEEL_AddString(hLISTWHEEL_TimeMinute, *(_apMinute + i));
			}
			
			
			GUI_SelectLayer(1);
			GUI_MULTIBUF_BeginEx(1);
			GUI_SetBkColor(GUI_TRANSPARENT); 
			GUI_Clear();
			GUI_DrawBitmap(&bmhome_icon, 5, 5);

			if(IsBUTTON_AlarmClockActiv())
			{
				btn_alarm_on_off_state = 1;
				GUI_SetColor(GUI_TRANSPARENT);
				GUI_FillRectEx(&Rect6);
				GUI_SetColor(GUI_GREEN);
				GUI_AA_FillRoundedRect(Rect6.x0 + 1, Rect6.y0 + 1, Rect6.x1 - 1, Rect6.y1 - 1, 8);
				Rect6.x0 += 5;
				GUI_SetFont(pFont32pBold);
				GUI_SetTextMode(GUI_TM_TRANS);
				GUI_SetColor(GUI_WHITE);
				GUI_DispStringInRect("Stop Alarm", &Rect6, GUI_TA_VCENTER | GUI_TA_HCENTER);
				Rect6.x0 -= 5;				
			}
			else
			{
				btn_alarm_on_off_state = 0;
				GUI_SetColor(GUI_TRANSPARENT);
				GUI_FillRectEx(&Rect6);
				GUI_SetColor(LIGHT_BLUE);
				GUI_AA_FillRoundedRect(Rect6.x0 + 1, Rect6.y0 + 1, Rect6.x1 - 1, Rect6.y1 - 1, 8);
				Rect6.x0 += 5;
				GUI_SetFont(pFont23pBold);
				GUI_SetTextMode(GUI_TM_TRANS);
				GUI_SetColor(LEMON);
				GUI_DispStringInRect("Start Alarm", &Rect6, GUI_TA_VCENTER | GUI_TA_HCENTER);
				Rect6.x0 -= 5;
			}
			
			GUI_SetColor(GUI_TRANSPARENT);
			GUI_FillRectEx(&Rect7);
			GUI_SetColor(LIGHT_BLUE);
			GUI_AA_FillRoundedRect(Rect7.x0 + 1, Rect7.y0 + 1, Rect7.x1 - 1, Rect7.y1 - 1, 8);
			Rect7.x0 += 5;
			GUI_SetFont(pFont23pBold);
			GUI_SetTextMode(GUI_TM_TRANS);
			GUI_SetColor(LEMON);
			GUI_DispStringInRect("Set Alarm", &Rect7, GUI_TA_VCENTER | GUI_TA_HCENTER);
			Rect7.x0 -= 5;
			DISPLAY_AlarmClock();
			DISPLAY_DateTime();
			GUI_MULTIBUF_EndEx(0);
			GUI_MULTIBUF_EndEx(1);
		}
		else if(!BUTTON_IsPressed(hBUTTON_AlarmClock) && (btn_alarm_clock_old_state)) btn_alarm_clock_old_state = 0;		
		
		if(BUTTON_IsPressed(hBUTTON_Dnd) && !btn_dnd_old_state)
		{
			btn_dnd_old_state = 1;
			
			if(btn_dnd_state == 0) 
			{
				btn_dnd_state = 1;
				GUI_SelectLayer(1);
				GUI_MULTIBUF_BeginEx(1);
				GUI_SetColor(GUI_WHITE);
				GUI_FillRectEx(&Rect1);
				GUI_SetColor(GUI_RED);
				GUI_AA_FillRoundedRect(Rect1.x0 + 1, Rect1.y0 + 1, Rect1.x1 - 1, Rect1.y1 - 1, 8);
				Rect1.x0 += 5;
				GUI_SetFont(pFont32pBold);
				GUI_SetTextMode(GUI_TM_TRANS);
				GUI_SetColor(GUI_WHITE);
				GUI_DispStringInRect("Do Not Disturb", &Rect1, GUI_TA_VCENTER | GUI_TA_HCENTER);
				Rect1.x0 -= 5;
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
				GUI_SetColor(GUI_WHITE);
				GUI_FillRectEx(&Rect1);
				GUI_SetColor(LIGHT_BLUE);
				GUI_AA_FillRoundedRect(Rect1.x0 + 1, Rect1.y0 + 1, Rect1.x1 - 1, Rect1.y1 - 1, 8);
				Rect1.x0 += 5;
				GUI_SetFont(pFont23pBold);
				GUI_SetTextMode(GUI_TM_TRANS);
				GUI_SetColor(LEMON);
				GUI_DispStringInRect("Do Not Disturb", &Rect1, GUI_TA_VCENTER | GUI_TA_HCENTER);
				Rect1.x0 -= 5;
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
				GUI_SetColor(GUI_WHITE);
				GUI_FillRectEx(&Rect2);
				GUI_SetColor(LIGHT_BLUE);
				GUI_AA_FillRoundedRect(Rect2.x0 + 1, Rect2.y0 + 1, Rect2.x1 - 1, Rect2.y1 - 1, 8);
				Rect2.x0 += 5;
				GUI_SetFont(pFont23pBold);
				GUI_SetTextMode(GUI_TM_TRANS);
				GUI_SetColor(LEMON);
				GUI_DispStringInRect("SOS Reset", &Rect2, GUI_TA_VCENTER | GUI_TA_HCENTER);
				Rect2.x0 -= 5;
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
				GUI_SetColor(GUI_WHITE);
				GUI_FillRectEx(&Rect3);
				GUI_SetColor(GUI_GREEN);
				GUI_AA_FillRoundedRect(Rect3.x0 + 1, Rect3.y0 + 1, Rect3.x1 - 1, Rect3.y1 - 1, 8);
				Rect3.x0 += 5;
				GUI_SetFont(pFont32pBold);
				GUI_SetTextMode(GUI_TM_TRANS);
				GUI_SetColor(GUI_WHITE);
				GUI_DispStringInRect("Call Maid", &Rect3, GUI_TA_VCENTER | GUI_TA_HCENTER);
				Rect3.x0 -= 5;
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
				GUI_SetColor(GUI_WHITE);
				GUI_FillRectEx(&Rect3);
				GUI_SetColor(LIGHT_BLUE);
				GUI_AA_FillRoundedRect(Rect3.x0 + 1, Rect3.y0 + 1, Rect3.x1 - 1, Rect3.y1 - 1, 8);
				Rect3.x0 += 5;
				GUI_SetFont(pFont23pBold);
				GUI_SetTextMode(GUI_TM_TRANS);
				GUI_SetColor(LEMON);
				GUI_DispStringInRect("Call Maid", &Rect3, GUI_TA_VCENTER | GUI_TA_HCENTER);
				Rect3.x0 -= 5;
				GUI_MULTIBUF_EndEx(1);
				GUI_SelectLayer(0);
				BUTTON_CallMaidActivReset();
			}
		
		}
		else if(!BUTTON_IsPressed(hBUTTON_Maid) && btn_maid_old_state) btn_maid_old_state = 0;

		if(BUTTON_IsPressed(hBUTTON_FanMode) && !btn_fan_mode_old_state)
		{
			btn_fan_mode_old_state = 1;
			
			if(btn_fan_mode_state == 0)
			{
				btn_fan_mode_state = 1;
				BUTTON_FanModePressed();
			}
			else if(btn_fan_mode_state == 1)
			{
				btn_fan_mode_state = 2;			
				BUTTON_FanModePressed();
			}
			else if(btn_fan_mode_state == 2)
			{
				btn_fan_mode_state = 3;			
				BUTTON_FanModePressed();
			}
			else if(btn_fan_mode_state == 3)
			{
				btn_fan_mode_state = 0;			
				BUTTON_FanModePressed();
			}
		}
		else if(!BUTTON_IsPressed(hBUTTON_FanMode) && btn_fan_mode_old_state)
		{
			btn_fan_mode_old_state = 0;		
			if(btn_ctrl_mode_state == 0) BUTTON_FanModeReleased();
			else BUTTON_FanModePressed();
		}
		
		
		if(BUTTON_IsPressed(hBUTTON_CtrlMode) && !btn_ctrl_mode_old_state)
		{
			btn_ctrl_mode_old_state = 1;
			
			if(ActivDisplay == DISPLAY_THERMOSTAT)
			{
				if(btn_ctrl_mode_state == 0)
				{
					btn_ctrl_mode_state = 1;
					BUTTON_CtrlModePressed();
					btn_fan_mode_state = 0;
					BUTTON_FanModePressed();
				}
				else if(btn_ctrl_mode_state == 1)
				{
					btn_ctrl_mode_state = 2;
					BUTTON_CtrlModePressed();
					btn_fan_mode_state = 0;
					BUTTON_FanModePressed();
				}
				else if(btn_ctrl_mode_state ==2)
				{
					btn_ctrl_mode_state = 0;
					BUTTON_CtrlModeReleased();
					BUTTON_FanModeReleased();
				}
			}
		}
		else if(!BUTTON_IsPressed(hBUTTON_CtrlMode) && btn_ctrl_mode_old_state) 
		{
			if(ActivDisplay == DISPLAY_THERMOSTAT)
			{
				btn_ctrl_mode_old_state = 0;
				if(btn_ctrl_mode_state != 0) BUTTON_CtrlModePressed();
				else BUTTON_CtrlModeReleased();	
			}		
		}
		
	
		if((BUTTON_IsPressed(hBUTTON_Weather)) && !btn_weather_old_state)
		{
			btn_weather_old_state = 1;
			
			if(btn_weather_state == 0) btn_weather_state = 1;
			else if(btn_weather_state == 1) btn_weather_state = 0;
			
			ActivDisplay = DISPLAY_FORECAST;
			GUI_SelectLayer(1);
			GUI_SetBkColor(GUI_TRANSPARENT); 
			GUI_Clear();
			GUI_SelectLayer(0);
			WM_DeleteWindow(hBUTTON_AlarmClock);
			WM_DeleteWindow(hBUTTON_Dnd);
			WM_DeleteWindow(hBUTTON_Sos);
			WM_DeleteWindow(hBUTTON_Maid);
			WM_DeleteWindow(hBUTTON_CtrlMode);
			WM_DeleteWindow(hBUTTON_FanMode);
			WM_DeleteWindow(hBUTTON_Weather);
			GUI_SetBkColor(GUI_BLACK);
			GUI_Clear();
			GUI_MULTIBUF_BeginEx(0);
			GUI_DrawBitmap(&bmbckgnd_forecast, 0, 0);
			hBUTTON_Home = BUTTON_Create( 5, 5, 55, 55, GUI_ID_BUTTON_Home, WM_CF_SHOW);			
			GUI_SelectLayer(1);
			GUI_MULTIBUF_BeginEx(1);
			GUI_SetBkColor(GUI_TRANSPARENT); 
			GUI_Clear(); 
			GUI_DrawBitmap(&bmhome_icon, 5, 5);
			DISPLAY_Forecast();
			GUI_MULTIBUF_EndEx(0);
			GUI_MULTIBUF_EndEx(1);
		}
		else if((!BUTTON_IsPressed(hBUTTON_Weather)) && btn_weather_old_state) btn_weather_old_state = 0;
	}
	else if(ActivDisplay == DISPLAY_ALARM_CLOCK)
	{
		if(BUTTON_IsPressed(hBUTTON_AlarmOnOff) && !btn_alarm_on_off_old_state)
		{
			btn_alarm_on_off_old_state = 1;
			
			if((btn_alarm_on_off_state == 0) && (btn_alarm_set_time_state))
			{
				btn_alarm_on_off_state = 1;
				GUI_SelectLayer(1);
				GUI_MULTIBUF_BeginEx(1);
				GUI_SetColor(GUI_TRANSPARENT);
				GUI_FillRectEx(&Rect6);
				GUI_SetColor(GUI_GREEN);
				GUI_AA_FillRoundedRect(Rect6.x0 + 1, Rect6.y0 + 1, Rect6.x1 - 1, Rect6.y1 - 1, 8);
				Rect6.x0 += 5;
				GUI_SetFont(pFont32pBold);
				GUI_SetTextMode(GUI_TM_TRANS);
				GUI_SetColor(GUI_WHITE);
				GUI_DispStringInRect("Stop Alarm", &Rect6, GUI_TA_VCENTER | GUI_TA_HCENTER);
				Rect6.x0 -= 5;
				GUI_MULTIBUF_EndEx(1);
				GUI_SelectLayer(0);	
				BUTTON_AlarmClockActivSet();
				ALARM_CLOCK_ActivSet();				
			}
			else if(btn_alarm_on_off_state == 1) 
			{
				btn_alarm_on_off_state = 0;
				
				GUI_SelectLayer(1);
				GUI_MULTIBUF_BeginEx(1);
				GUI_SetColor(GUI_TRANSPARENT);
				GUI_FillRectEx(&Rect6);
				GUI_SetColor(LIGHT_BLUE);
				GUI_AA_FillRoundedRect(Rect6.x0 + 1, Rect6.y0 + 1, Rect6.x1 - 1, Rect6.y1 - 1, 8);
				Rect6.x0 += 5;
				GUI_SetFont(pFont23pBold);
				GUI_SetTextMode(GUI_TM_TRANS);
				GUI_SetColor(LEMON);
				GUI_DispStringInRect("Start Alarm", &Rect6, GUI_TA_VCENTER | GUI_TA_HCENTER);
				Rect6.x0 -= 5;
				GUI_MULTIBUF_EndEx(1);
				GUI_SelectLayer(0);		
				BUTTON_AlarmClockActivReset();
				ALARM_CLOCK_ActivReset();
			}
		}
		else if(!BUTTON_IsPressed(hBUTTON_AlarmOnOff) && btn_alarm_on_off_old_state) btn_alarm_on_off_old_state = 0;
			
		if(BUTTON_IsPressed(hBUTTON_AlarmSetTime) && !btn_alarm_set_time_old_state && !btn_alarm_on_off_state)
		{
			btn_alarm_set_time_old_state = 1;
			btn_alarm_set_time_state = 1;
			GUI_SelectLayer(1);
			GUI_MULTIBUF_BeginEx(1);
			GUI_SetColor(GUI_TRANSPARENT);
			GUI_FillRectEx(&Rect7);
			GUI_SetColor(GUI_GREEN);
			GUI_AA_FillRoundedRect(Rect7.x0 + 1, Rect7.y0 + 1, Rect7.x1 - 1, Rect7.y1 - 1, 8);
			Rect7.x0 += 5;
			GUI_SetFont(pFont32pBold);
			GUI_SetTextMode(GUI_TM_TRANS);
			GUI_SetColor(GUI_WHITE);
			GUI_DispStringInRect("Set Alarm", &Rect7, GUI_TA_VCENTER | GUI_TA_HCENTER);
			Rect7.x0 -= 5;
			GUI_MULTIBUF_EndEx(1);
			GUI_SelectLayer(0);
			DISPLAY_AlarmClock();
			DISPLAY_DateTime();
		}
		else if(!BUTTON_IsPressed(hBUTTON_AlarmSetTime) && btn_alarm_set_time_old_state && !btn_alarm_on_off_state)
		{
			btn_alarm_set_time_old_state = 0;
			GUI_SelectLayer(1);
			GUI_MULTIBUF_BeginEx(1);
			GUI_SetColor(GUI_TRANSPARENT);
			GUI_FillRectEx(&Rect7);
			GUI_SetColor(LIGHT_BLUE);
			GUI_AA_FillRoundedRect(Rect7.x0 + 1, Rect7.y0 + 1, Rect7.x1 - 1, Rect7.y1 - 1, 8);
			Rect7.x0 += 5;
			GUI_SetFont(pFont23pBold);
			GUI_SetTextMode(GUI_TM_TRANS);
			GUI_SetColor(LEMON);
			GUI_DispStringInRect("Set Alarm", &Rect7, GUI_TA_VCENTER | GUI_TA_HCENTER);
			Rect7.x0 -= 5;
			GUI_MULTIBUF_EndEx(1);
			GUI_SelectLayer(0);
		}		
	}
	
	if((ActivDisplay == DISPLAY_ALARM_CLOCK) || (ActivDisplay == DISPLAY_FORECAST))
	{
		if(BUTTON_IsPressed(hBUTTON_Home) && (!btn_home_old_state))
		{
			btn_home_old_state = 1;
			
			if(btn_home_state == 0) btn_home_state = 1;
			else if(btn_home_state == 1) btn_home_state = 0;
			
			GUI_SelectLayer(1);
			GUI_SetBkColor(GUI_TRANSPARENT); 
			GUI_Clear();
			GUI_SelectLayer(0);
			WM_DeleteWindow(hBUTTON_Home);
			
			if(ActivDisplay == DISPLAY_ALARM_CLOCK)
			{
				WM_DeleteWindow(hBUTTON_AlarmOnOff);
				WM_DeleteWindow(hBUTTON_AlarmSetTime);
				WM_DeleteWindow(hLISTWHEEL_TimeHour);
				WM_DeleteWindow(hLISTWHEEL_TimeMinute);
				WM_DeleteWindow(hLISTWHEEL_Window);
			}
			
			GUI_SetBkColor(GUI_BLACK);
			GUI_Clear();
			GUI_MULTIBUF_BeginEx(0);
			ActivDisplay = DISPLAY_THERMOSTAT;
			GUI_DrawBitmap(&bmbckgnd_thermostat, 0, 0);
			hBUTTON_AlarmClock =BUTTON_Create(	5,   5,  55,  55, GUI_ID_BUTTON_AlarmClock,	WM_CF_SHOW);
			hBUTTON_Dnd = 		BUTTON_Create(	5,  65, 210,  45, GUI_ID_BUTTON_Dnd,		WM_CF_SHOW);
			hBUTTON_Sos = 		BUTTON_Create(	5, 110, 210,  45, GUI_ID_BUTTON_Sos,		WM_CF_SHOW);
			hBUTTON_Maid = 		BUTTON_Create(	5, 155, 210,  45, GUI_ID_BUTTON_Maid, 		WM_CF_SHOW);
			hBUTTON_Weather = 	BUTTON_Create(	5, 210,  55,  55, GUI_ID_BUTTON_Weather,	WM_CF_SHOW);
			hBUTTON_FanMode = 	BUTTON_Create(255, 230,  80,  35, GUI_ID_BUTTON_FanSpeed,	WM_CF_SHOW);
			hBUTTON_CtrlMode = 	BUTTON_Create(336, 230,  80,  35, GUI_ID_BUTTON_CtrlMode,	WM_CF_SHOW);
			BUTTON_SetBitmap(hBUTTON_AlarmClock, 		BUTTON_BI_PRESSED, 		&bmalarm_clock_icon);
			BUTTON_SetBitmap(hBUTTON_AlarmClock, 		BUTTON_BI_UNPRESSED, 	&bmalarm_clock_icon);
			BUTTON_SetBitmap(hBUTTON_Weather, 	BUTTON_BI_PRESSED, 		&bmweather_icon);
			BUTTON_SetBitmap(hBUTTON_Weather, 	BUTTON_BI_UNPRESSED, 	&bmweather_icon);
			GUI_SelectLayer(1);
			GUI_MULTIBUF_BeginEx(1);
			GUI_SetBkColor(GUI_TRANSPARENT); 
			GUI_Clear();
			GUI_DrawBitmap(&bmknob, 249, 52);
			
			if(IsBUTTON_DndActiv())
			{
				btn_dnd_state = 1;;
				GUI_SetColor(GUI_WHITE);
				GUI_FillRectEx(&Rect1);
				GUI_SetColor(GUI_RED);
				GUI_AA_FillRoundedRect(Rect1.x0 + 1, Rect1.y0 + 1, Rect1.x1 - 1, Rect1.y1 - 1, 8);
				Rect1.x0 += 5;
				GUI_SetFont(pFont32pBold);
				GUI_SetTextMode(GUI_TM_TRANS);
				GUI_SetColor(GUI_WHITE);
				GUI_DispStringInRect("Do Not Disturb", &Rect1, GUI_TA_VCENTER | GUI_TA_HCENTER);
				Rect1.x0 -= 5;
			}
			else
			{
				btn_dnd_state = 0;
				GUI_SetColor(GUI_WHITE);
				GUI_FillRectEx(&Rect1);
				GUI_SetColor(LIGHT_BLUE);
				GUI_AA_FillRoundedRect(Rect1.x0 + 1, Rect1.y0 + 1, Rect1.x1 - 1, Rect1.y1 - 1, 8);
				Rect1.x0 += 5;
				GUI_SetFont(pFont23pBold);
				GUI_SetTextMode(GUI_TM_TRANS);
				GUI_SetColor(LEMON);
				GUI_DispStringInRect("Do Not Disturb", &Rect1, GUI_TA_VCENTER | GUI_TA_HCENTER);
				Rect1.x0 -= 5;
			}
			
			if(IsBUTTON_SosActiv())
			{
				btn_sos_state = 1;
				GUI_SetColor(GUI_WHITE);
				GUI_FillRectEx(&Rect2);
				GUI_SetColor(GUI_RED);
				GUI_AA_FillRoundedRect(Rect2.x0 + 1, Rect2.y0 + 1, Rect2.x1 - 1, Rect2.y1 - 1, 8);
				Rect2.x0 += 5;
				GUI_SetFont(pFont32pBold);
				GUI_SetTextMode(GUI_TM_TRANS);
				GUI_SetColor(GUI_WHITE);
				GUI_DispStringInRect("SOS Reset", &Rect2, GUI_TA_VCENTER | GUI_TA_HCENTER);
				Rect2.x0 -= 5;
			}
			else
			{
				btn_sos_state = 0;
				GUI_SetColor(GUI_WHITE);
				GUI_FillRectEx(&Rect2);
				GUI_SetColor(LIGHT_BLUE);
				GUI_AA_FillRoundedRect(Rect2.x0 + 1, Rect2.y0 + 1, Rect2.x1 - 1, Rect2.y1 - 1, 8);
				Rect2.x0 += 5;
				GUI_SetFont(pFont23pBold);
				GUI_SetTextMode(GUI_TM_TRANS);
				GUI_SetColor(LEMON);
				GUI_DispStringInRect("SOS Reset", &Rect2, GUI_TA_VCENTER | GUI_TA_HCENTER);
				Rect2.x0 -= 5;
			}	
			
			if(IsBUTTON_CallMaidActiv())
			{
				btn_maid_state = 1;
				GUI_SetColor(GUI_WHITE);
				GUI_FillRectEx(&Rect3);
				GUI_SetColor(GUI_GREEN);
				GUI_AA_FillRoundedRect(Rect3.x0 + 1, Rect3.y0 + 1, Rect3.x1 - 1, Rect3.y1 - 1, 8);
				Rect3.x0 += 5;
				GUI_SetFont(pFont32pBold);
				GUI_SetTextMode(GUI_TM_TRANS);
				GUI_SetColor(GUI_WHITE);
				GUI_DispStringInRect("Call Maid", &Rect3, GUI_TA_VCENTER | GUI_TA_HCENTER);
				Rect3.x0 -= 5;
			}
			else
			{
				btn_maid_state = 0;
				GUI_SetColor(GUI_WHITE);
				GUI_FillRectEx(&Rect3);
				GUI_SetColor(LIGHT_BLUE);
				GUI_AA_FillRoundedRect(Rect3.x0 + 1, Rect3.y0 + 1, Rect3.x1 - 1, Rect3.y1 - 1, 8);
				Rect3.x0 += 5;
				GUI_SetFont(pFont23pBold);
				GUI_SetTextMode(GUI_TM_TRANS);
				GUI_SetColor(LEMON);
				GUI_DispStringInRect("Call Maid", &Rect3, GUI_TA_VCENTER | GUI_TA_HCENTER);
				Rect3.x0 -= 5;
			}	
			
			if(btn_fan_mode_state > 0) BUTTON_FanModePressed();
			else BUTTON_FanModeReleased();
			if(btn_ctrl_mode_state > 0) BUTTON_CtrlModePressed();
			else BUTTON_CtrlModeReleased();
			DISPLAY_RoomTemperature();
			DISPLAY_DateTime();
			DISPLAY_Forecast();
			DISPLAY_Knob();
			GUI_MULTIBUF_EndEx(0);
			GUI_MULTIBUF_EndEx(1);
		}
		else if(!BUTTON_IsPressed(hBUTTON_Home) && (btn_home_old_state)) btn_home_old_state = 0;		
	}
}


static void PID_Hook(GUI_PID_STATE * pState) 
{
	double x0,x1;
	double y0,y1;
	double angle;
	
	if(ActivDisplay == DISPLAY_THERMOSTAT)
	{
		if ((pState->x >= KNOB_X0) && 
			(pState->y >= KNOB_Y0) && 
			(pState->x < (KNOB_X0 + 200)) && 
			(pState->y < (KNOB_Y0 + 160))) 
		{
			pState->Layer = 1;			
			x0 = 336;
			y0 = 139;
			x1 = pState->x;
			y1 = pState->y;			
			angle = atan2(y0 -y1, x0 - x1) * Rad2Deg;
			
			if(angle < 0)
			{
				if(x1 > x0) angle = 180;
				else angle = 0;
			}
			
			Thermostat_1.set_temperature = THERMOSTAT_MIN_TEMPERATURE + (uint16_t) angle;			
			if(Thermostat_1.set_temperature <  THERMOSTAT_MIN_TEMPERATURE) Thermostat_1.set_temperature =  THERMOSTAT_MIN_TEMPERATURE;
			else if(Thermostat_1.set_temperature >  THERMOSTAT_MAX_TEMPERATURE) Thermostat_1.set_temperature =  THERMOSTAT_MAX_TEMPERATURE;
			DISPLAY_SetpointUpdateSet();
		}	
	}
}


static void DISPLAY_Knob(void)
{
	int index;
	GUI_COLOR color;
	
	if(ActivDisplay == DISPLAY_THERMOSTAT)
	{	
		GUI_SelectLayer(1);
		index = (((Thermostat_1.set_temperature / 10)- (THERMOSTAT_MIN_TEMPERATURE / 10)) * (GUI_COUNTOF(_aGradient) - 1)) 
				/ ((THERMOSTAT_MAX_TEMPERATURE / 10) - (THERMOSTAT_MIN_TEMPERATURE / 10));
		color = _aGradient[index];
		GUI_SetColor(color);
		GUI_FillCircle(336, 139, 56);
		GUI_SetColor(GUI_WHITE);
		GUI_SetTextAlign(GUI_TA_RIGHT | GUI_TA_VCENTER);
		GUI_SetTextMode(GUI_TM_TRANS);
		GUI_GotoXY(335, 150);
		GUI_SetFont(pFont32pBold);
		GUI_DispDecSpace((Thermostat_1.set_temperature / 10), 2);
		GUI_DispString("°C");
		GUI_GotoXY(300, 115);
		GUI_SetFont(pFont32p);
		GUI_DispString("Setup");	
		GUI_GotoXY(370, 20);
		GUI_SelectLayer(0);
	}
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

static void BUTTON_FanModePressed(void)
{
	if(ActivDisplay == DISPLAY_THERMOSTAT)
	{
		GUI_SelectLayer(1);
		GUI_MULTIBUF_BeginEx(1);
		GUI_DrawBitmap(&bmButtonRoundPressed_80x35, 255, 230);
		if(btn_ctrl_mode_state == 0)  GUI_SetColor(GUI_DARKGRAY);
		else if(btn_ctrl_mode_state == 1) GUI_SetColor(GUI_BLUE);
		else if(btn_ctrl_mode_state == 2) GUI_SetColor(GUI_RED);
		GUI_SetFont(pFont23pBold);
		GUI_SetTextMode(GUI_TM_TRANS);	
		if(btn_fan_mode_state == 0) 
		{
			GUI_DispStringInRect("Auto", &Rect4, GUI_TA_VCENTER|GUI_TA_HCENTER);
			Thermostat_1.fan_mode = THERMOSTAT_FAN_MODE_AUTO;
		}
		else if(btn_fan_mode_state == 1) 
		{
			GUI_DispStringInRect("Low", &Rect4, GUI_TA_VCENTER|GUI_TA_HCENTER);
			Thermostat_1.fan_mode = THERMOSTAT_FAN_MODE_LOW;
		}
		else if(btn_fan_mode_state == 2)
		{
			GUI_DispStringInRect("Midle", &Rect4, GUI_TA_VCENTER|GUI_TA_HCENTER);
			Thermostat_1.fan_mode = THERMOSTAT_FAN_MODE_MIDDLE;
		}
		else if(btn_fan_mode_state == 3)
		{
			GUI_DispStringInRect("High", &Rect4, GUI_TA_VCENTER|GUI_TA_HCENTER);
			Thermostat_1.fan_mode = THERMOSTAT_FAN_MODE_HIGH;
		}
		GUI_MULTIBUF_EndEx(1);
		GUI_SelectLayer(0);
	}
}


static void BUTTON_FanModeReleased(void)
{
	if(ActivDisplay == DISPLAY_THERMOSTAT)
	{
		GUI_SelectLayer(1);
		GUI_MULTIBUF_BeginEx(1);
		GUI_DrawBitmap(&bmButtonRound_80x35, 255, 230);
		GUI_SetFont(pFont23pBold);
		GUI_SetTextMode(GUI_TM_TRANS);
		GUI_SetColor(GUI_DARKGRAY);	
		GUI_DispStringInRect("Off", &Rect4, GUI_TA_VCENTER|GUI_TA_HCENTER);
		GUI_MULTIBUF_EndEx(1);
		GUI_SelectLayer(0);
	}
}


static void BUTTON_CtrlModePressed(void)
{
	if(ActivDisplay == DISPLAY_THERMOSTAT)
	{
		GUI_SelectLayer(1);
		GUI_MULTIBUF_BeginEx(1);
		GUI_DrawBitmap(&bmButtonRoundPressed_80x35, 336, 230);
		GUI_SetFont(pFont23pBold);
		GUI_SetTextMode(GUI_TM_TRANS);	
		if(btn_ctrl_mode_state == 0) 
		{
			GUI_SetColor(GUI_DARKGRAY);
			GUI_DispStringInRect("Off", &Rect5, GUI_TA_VCENTER|GUI_TA_HCENTER);
			Thermostat_1.ctrl_mode = THERMOSTAT_CONTROL_MODE_OFF;
		}
		else if(btn_ctrl_mode_state == 1) 
		{
			GUI_SetColor(GUI_BLUE);
			GUI_DispStringInRect("Cool", &Rect5, GUI_TA_VCENTER|GUI_TA_HCENTER);
			Thermostat_1.ctrl_mode = THERMOSTAT_CONTROL_MODE_COOLING;
		}
		else if(btn_ctrl_mode_state == 2)
		{
			GUI_SetColor(GUI_RED);
			GUI_DispStringInRect("Heat", &Rect5, GUI_TA_VCENTER|GUI_TA_HCENTER);
			Thermostat_1.ctrl_mode = THERMOSTAT_CONTROL_MODE_HEATING;
		}
		GUI_MULTIBUF_EndEx(1);
		GUI_SelectLayer(0);	
		BUTTON_FanModePressed();
	}
}


static void BUTTON_CtrlModeReleased(void)
{
	if(ActivDisplay == DISPLAY_THERMOSTAT)
	{
		GUI_SelectLayer(1);
		GUI_MULTIBUF_BeginEx(1);
		GUI_DrawBitmap(&bmButtonRound_80x35, 336, 230);
		GUI_SetFont(pFont23pBold);
		GUI_SetTextMode(GUI_TM_TRANS);
		GUI_SetColor(GUI_DARKGRAY);	
		GUI_DispStringInRect("Off", &Rect5, GUI_TA_VCENTER|GUI_TA_HCENTER);
		Thermostat_1.ctrl_mode = THERMOSTAT_CONTROL_MODE_OFF;
		GUI_MULTIBUF_EndEx(1);
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
		GUI_SetFont(GUI_FONT_32_1);
		GUI_SetColor(GUI_YELLOW);
		GUI_SetTextMode(GUI_TM_TRANS);
		GUI_SetTextAlign(GUI_TA_LEFT);
		
		switch (date.WeekDay)
		{
			case 1:
				//memcpy(display_buffer, "ponedjeljak", 11);
				GUI_DispStringAt("MON", 65, 30);
				break;					
			case 2:
				//memcpy(display_buffer, "utorak", 6);
				GUI_DispStringAt("TUE", 65, 30);
				break;					
			case 3:
				//memcpy(display_buffer, "srijeda", 7);
				GUI_DispStringAt("WED", 65, 30);
				break;					
			case 4:
				//memcpy(display_buffer, "cetvrtak", 8);
				GUI_DispStringAt("THU", 65, 30);
				break;					
			case 5:
				//memcpy(display_buffer, "petak", 5);
				GUI_DispStringAt("FRI", 65, 30);
				break;					
			case 6:
				//memcpy(display_buffer, "subota", 6);
				GUI_DispStringAt("SAT", 65, 30);
				break;					
			case 7:
				//memcpy(display_buffer, "nedjelja", 8);
				GUI_DispStringAt("SUN", 65, 30);
				break;					
			default:
				date.WeekDay = 7;
				//memcpy(display_buffer, "nedjelja", 8);
				GUI_DispStringAt("SUN", 65, 30);
				break;				
		}

		//buff_bcnt = strlen((const char *)display_buffer);
		//display_buffer[buff_bcnt++] = ' ';
		//display_buffer[buff_bcnt++] = ' ';
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
		GUI_SetFont(GUI_FONT_24_1);
		GUI_SetColor(GUI_YELLOW);
		GUI_SetTextMode(GUI_TM_TRANS);
		GUI_SetTextAlign(GUI_TA_RIGHT|GUI_TA_VCENTER);
		GUI_GotoXY(220, 20);
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
		GUI_GotoXY(220, 30);
		GUI_DispString((const char *)display_buffer);
	}
	else if(ActivDisplay == DISPLAY_ALARM_CLOCK)
	{
		GUI_ClearRect(65, 5, 480, 65);
			
		ClearBuffer(display_buffer,  sizeof(display_buffer));
		
		switch (date.WeekDay)
		{
			case 1:
				memcpy(display_buffer, "MONDAY   ", 9);
				break;					
			case 2:
				memcpy(display_buffer, "TUESDAY  ", 9);
				break;					
			case 3:
				memcpy(display_buffer, "WEDNESDAY", 9);
				break;					
			case 4:
				memcpy(display_buffer, "THURSDAY ", 9);
				break;					
			case 5:
				memcpy(display_buffer, "FRIDAY   ", 9);
				break;					
			case 6:
				memcpy(display_buffer, "SATURDAY ", 9);
				break;					
			case 7:
				memcpy(display_buffer, "SUNDAY   ", 9);
				break;					
			default:
				date.WeekDay = 7;
				memcpy(display_buffer, "SUNDAY   ", 9);
				break;				
		}

		display_buffer[9] =	 ' ';
		display_buffer[10] = ' ';
		display_buffer[11] = ' ';
		display_buffer[12] = ' ';
		display_buffer[13] = (date.Date >> 4) + 48;
		display_buffer[14] = (date.Date & 0x0f) + 48;
		display_buffer[15] = ' ';
		
		switch (date.Month)
		{
			case 1:
				memcpy(&display_buffer[16], "  JANUARY", 9);
				break;					
			case 2:
				memcpy(&display_buffer[16], " FEBRUARY", 9);
				break;					
			case 3:
				memcpy(&display_buffer[16], "    MARCH", 9);
				break;					
			case 4:
				memcpy(&display_buffer[16], "    APRIL", 9);
				break;					
			case 5:
				memcpy(&display_buffer[16], "      MAY", 9);
				break;					
			case 6:
				memcpy(&display_buffer[16], "     JUNE", 9);
				break;					
			case 7:
				memcpy(&display_buffer[16], "     JULY", 9);
				break;	
			case 8:
				memcpy(&display_buffer[16], "   AUGUST", 9);
				break;					
			case 9:
				memcpy(&display_buffer[16], "SEPTEMBER", 9);
				break;					
			case 10:
				memcpy(&display_buffer[16], "  OCTOBER", 9);
				break;					
			case 11:
				memcpy(&display_buffer[16], " NOVEMBER", 9);
				break;
			case 12:
				memcpy(&display_buffer[16], " DECEMBER", 9);
				break;				
			default:
				date.Month = 1;
				memcpy(&display_buffer[16], "  JANUARY", 9);
				break;				
		}
		
		GUI_GotoXY(340, 20);
		GUI_SetFont(GUI_FONT_24_1);
		GUI_SetColor(GUI_YELLOW);
		GUI_SetTextMode(GUI_TM_TRANS);
		GUI_SetTextAlign(GUI_TA_RIGHT|GUI_TA_VCENTER);
		GUI_DispString((const char*)display_buffer);
		ClearBuffer(display_buffer,  sizeof(display_buffer));		
		display_buffer[0] = ((time.Hours >> 4) + 0x30);
		display_buffer[1] = ((time.Hours & 0x0f) + 0x30);
		display_buffer[2] = ':';
		display_buffer[3] = ((time.Minutes >> 4) + 0x30);
		display_buffer[4] = ((time.Minutes & 0x0f) + 0x30);
		GUI_GotoXY(340, 50);
		GUI_SetFont(GUI_FONT_32_1);
		GUI_SetColor(GUI_YELLOW);
		GUI_SetTextMode(GUI_TM_TRANS);			
		GUI_SetTextAlign(GUI_TA_RIGHT|GUI_TA_VCENTER);
		GUI_DispString((const char*)display_buffer);
		GUI_SetFont(GUI_FONT_24_1);		
		GUI_SetColor(GUI_YELLOW);
		GUI_SetTextMode(GUI_TM_TRANS);
		GUI_SetTextAlign(GUI_TA_LEFT|GUI_TA_VCENTER);
		GUI_DispStringAt("Current time:", 80, 50);	
	}
	
	GUI_SelectLayer(0);
}


static void DISPLAY_Forecast(void)
{
	uint8_t thi, tlo, tcl;
	
	GUI_SelectLayer(1);
	if(ActivDisplay == DISPLAY_THERMOSTAT)
	{
		GUI_DrawBitmap(&bmson_with_cloud, 185, 210);
		
		switch (date.WeekDay)
		{
			case 1:
				thi = FORECAST_Monday.para.high_temp;
				tlo = FORECAST_Monday.para.low_temp;
				tcl = FORECAST_Monday.para.cloudness;
				break;					
			case 2:
				thi = FORECAST_Tuesday.para.high_temp;
				tlo = FORECAST_Tuesday.para.low_temp;
				tcl = FORECAST_Tuesday.para.cloudness;
				break;					
			case 3:
				thi = FORECAST_Wednesday.para.high_temp;
				tlo = FORECAST_Wednesday.para.low_temp;
				tcl = FORECAST_Wednesday.para.cloudness;
				break;					
			case 4:
				thi = FORECAST_Thurstday.para.high_temp;
				tlo = FORECAST_Thurstday.para.low_temp;
				tcl = FORECAST_Thurstday.para.cloudness;
				break;					
			case 5:
				thi = FORECAST_Freeday.para.high_temp;
				tlo = FORECAST_Freeday.para.low_temp;
				tcl = FORECAST_Freeday.para.cloudness;
				break;					
			case 6:
				thi = FORECAST_Saturday.para.high_temp;
				tlo = FORECAST_Saturday.para.low_temp;
				tcl = FORECAST_Saturday.para.cloudness;
				break;					
			case 7:
				thi = FORECAST_Sunday.para.high_temp;
				tlo = FORECAST_Sunday.para.low_temp;
				tcl = FORECAST_Sunday.para.cloudness;
				break;					
			default:
				thi = FORECAST_Monday.para.high_temp;
				tlo = FORECAST_Monday.para.low_temp;
				tcl = FORECAST_Monday.para.cloudness;
				break;				
		}
		//(0=CLEAR;1=MIST;2=PARTLY CLOUDY;3=CLOUDY;4=PARTLY RAIN;5=RAIN;6=HEAVY RAIN...20=HEAVY SNOW)
		
		GUI_SetFont(GUI_FONT_20_1);
		GUI_UC_SetEncodeUTF8();
		GUI_SetColor(GUI_RED);
		GUI_SetTextMode(GUI_TM_TRANS);
		GUI_SetTextAlign(GUI_TA_LEFT);
		GUI_GotoXY(145, 220);
		GUI_DispDecSpace(thi, 2);
		GUI_DispString("°C");
		GUI_SetColor(GUI_BLUE);
		GUI_SetTextMode(GUI_TM_TRANS);
		GUI_SetTextAlign(GUI_TA_LEFT);
		GUI_GotoXY(145, 240);
		GUI_DispDecSpace(tlo, 2);
		GUI_DispString("°C");	
		GUI_SetColor(GUI_WHITE);
		GUI_SetTextMode(GUI_TM_TRANS);
		GUI_SetTextAlign(GUI_TA_LEFT);
		GUI_GotoXY(65, 220);
		GUI_DispString("Sarajevo");
		GUI_GotoXY(65, 240);
		if(tcl == 0) GUI_DispString(	 "vedro	 ");
		else if(tcl == 1) GUI_DispString("mj.obla");
		else if(tcl == 2) GUI_DispString("oblacno");
		else if(tcl == 3) GUI_DispString("mj.kisa");
		else if(tcl == 4) GUI_DispString("kisno  ");
		else if(tcl == 5) GUI_DispString("prolom ");
		else if(tcl == 6) GUI_DispString("grmljav");
		else if(tcl == 7) GUI_DispString("snijeg ");		
		
	}
	else if(ActivDisplay == DISPLAY_FORECAST)
	{
		current_outdoor_temperature = (Thermostat_1.actual_temperature & 0x0fff) / 10;
		if(Thermostat_1.actual_temperature & 0x8000) current_outdoor_temperature |= 0x80;
		FORECAST_Monday.para.week_day = 1;
		FORECAST_Monday.para.low_temp = 12;
		FORECAST_Monday.para.high_temp = 15;
		FORECAST_Monday.para.humidity = 30;
		FORECAST_Monday.para.cloudness = 1;
		DISPLAY_InitForecastFrame(&FORECAST_Monday);
		
		FORECAST_Tuesday.para.week_day = 2;
		FORECAST_Tuesday.para.low_temp = 14;
		FORECAST_Tuesday.para.high_temp = 17;
		FORECAST_Tuesday.para.humidity = 32;
		FORECAST_Tuesday.para.cloudness = 2;
		DISPLAY_InitForecastFrame(&FORECAST_Tuesday);
		
		FORECAST_Wednesday.para.week_day = 3;
		FORECAST_Wednesday.para.low_temp = 16;
		FORECAST_Wednesday.para.high_temp = 19;
		FORECAST_Wednesday.para.humidity = 34;
		FORECAST_Wednesday.para.cloudness = 3;
		DISPLAY_InitForecastFrame(&FORECAST_Wednesday);
		
		FORECAST_Thurstday.para.week_day = 4;
		FORECAST_Thurstday.para.low_temp = 21;
		FORECAST_Thurstday.para.high_temp = 25;
		FORECAST_Thurstday.para.humidity = 45;
		FORECAST_Thurstday.para.cloudness = 4;
		DISPLAY_InitForecastFrame(&FORECAST_Thurstday);
		
		FORECAST_Freeday.para.week_day = 5;
		FORECAST_Freeday.para.low_temp = 24;
		FORECAST_Freeday.para.high_temp = 26;
		FORECAST_Freeday.para.humidity = 47;
		FORECAST_Freeday.para.cloudness = 5;
		DISPLAY_InitForecastFrame(&FORECAST_Freeday);
		
		FORECAST_Saturday.para.week_day = 6;
		FORECAST_Saturday.para.low_temp = 27;
		FORECAST_Saturday.para.high_temp = 34;
		FORECAST_Saturday.para.humidity = 56;
		FORECAST_Saturday.para.cloudness = 6;
		DISPLAY_InitForecastFrame(&FORECAST_Saturday);
		
		FORECAST_Sunday.para.week_day = 7;
		FORECAST_Sunday.para.low_temp = 31;
		FORECAST_Sunday.para.high_temp = 36;
		FORECAST_Sunday.para.humidity = 59;
		FORECAST_Sunday.para.cloudness = 7;
		DISPLAY_InitForecastFrame(&FORECAST_Sunday);
		
		GUI_SetColor(GUI_BLUE);
		GUI_FillRectEx(&ForecastFrame[0]);
		GUI_SetColor((0x22ul << 24) | LIGHT_BLUE);
		GUI_AA_FillRoundedRect(ForecastFrame[0].x0 + 1, ForecastFrame[0].y0 + 1,
								ForecastFrame[0].x1 - 1, ForecastFrame[0].y1 - 1, 8);
		GUI_SetColor(GUI_WHITE);
		GUI_SetTextMode(GUI_TM_TRANS);
		GUI_SetTextAlign(GUI_TA_LEFT|GUI_TA_VCENTER);
		GUI_SetFont(GUI_FONT_32_1);
		GUI_GotoXY(80, 44);
		if(current_outdoor_temperature & 0x80) GUI_DispString("-");
		GUI_DispDecSpace((current_outdoor_temperature & 0x7f), 2);
		GUI_DispString("°C");
		GUI_SetFont(GUI_FONT_24_1);
		GUI_GotoXY(80, 15);
		GUI_DispString("SARAJEVO");		
				
		ClearBuffer(display_buffer,  sizeof(display_buffer));
		
		switch (date.WeekDay)
		{
			case 1:
				memcpy(display_buffer, "MONDAY   ", 9);
				break;					
			case 2:
				memcpy(display_buffer, "TUESDAY  ", 9);
				break;					
			case 3:
				memcpy(display_buffer, "WEDNESDAY", 9);
				break;					
			case 4:
				memcpy(display_buffer, "THURSDAY ", 9);
				break;					
			case 5:
				memcpy(display_buffer, "FRIDAY   ", 9);
				break;					
			case 6:
				memcpy(display_buffer, "SATURDAY ", 9);
				break;					
			case 7:
				memcpy(display_buffer, "SUNDAY   ", 9);
				break;					
			default:
				date.WeekDay = 7;
				memcpy(display_buffer, "SUNDAY   ", 9);
				break;				
		}

		display_buffer[9] = ' ';
		display_buffer[10] = ' ';
		display_buffer[11] = (date.Date >> 4) + 48;
		display_buffer[12] = (date.Date & 0x0f) + 48;
		display_buffer[13] = ' ';
		
		switch (date.Month)
		{
			case 1:
				memcpy(&display_buffer[14], "  JANUARY", 9);
				break;					
			case 2:
				memcpy(&display_buffer[14], " FEBRUARY", 9);
				break;					
			case 3:
				memcpy(&display_buffer[14], "    MARCH", 9);
				break;					
			case 4:
				memcpy(&display_buffer[14], "    APRIL", 9);
				break;					
			case 5:
				memcpy(&display_buffer[14], "      MAY", 9);
				break;					
			case 6:
				memcpy(&display_buffer[14], "     JUNE", 9);
				break;					
			case 7:
				memcpy(&display_buffer[14], "     JULY", 9);
				break;	
			case 8:
				memcpy(&display_buffer[14], "   AUGUST", 9);
				break;					
			case 9:
				memcpy(&display_buffer[14], "SEPTEMBER", 9);
				break;					
			case 10:
				memcpy(&display_buffer[14], "  OCTOBER", 9);
				break;					
			case 11:
				memcpy(&display_buffer[14], " NOVEMBER", 9);
				break;
			case 12:
				memcpy(&display_buffer[14], " DECEMBER", 9);
				break;				
			default:
				date.Month = 1;
				memcpy(&display_buffer[14], "  JANUARY", 9);
				break;				
		}
		
		GUI_GotoXY(450, 15);
		GUI_SetFont(GUI_FONT_24_1);
		GUI_SetColor(GUI_WHITE);
		GUI_SetTextMode(GUI_TM_TRANS);
		GUI_SetTextAlign(GUI_TA_RIGHT|GUI_TA_VCENTER);
		GUI_DispString((const char*)display_buffer);
		ClearBuffer(display_buffer,  sizeof(display_buffer));		
		display_buffer[0] = ((time.Hours >> 4) + 0x30);
		display_buffer[1] = ((time.Hours & 0x0f) + 0x30);
		display_buffer[2] = ':';
		display_buffer[3] = ((time.Minutes >> 4) + 0x30);
		display_buffer[4] = ((time.Minutes & 0x0f) + 0x30);
		GUI_GotoXY(450, 44);
		GUI_SetFont(GUI_FONT_32_1);
		GUI_SetColor(GUI_WHITE);
		GUI_SetTextMode(GUI_TM_TRANS);			
		GUI_SetTextAlign(GUI_TA_RIGHT|GUI_TA_VCENTER);
		GUI_DispString((const char*)display_buffer);
	}
	GUI_SelectLayer(0);
}

static void DISPLAY_InitForecastFrame(FORECAST_DayTypeDef* fday)
{
		GUI_SetColor(GUI_BLUE);
		GUI_FillRectEx(&ForecastFrame[fday->para.week_day]);
		GUI_SetColor((0x62ul << 24) | LIGHT_BLUE);
		GUI_AA_FillRoundedRect(ForecastFrame[fday->para.week_day].x0 + 1, 
								ForecastFrame[fday->para.week_day].y0 + 1,
								ForecastFrame[fday->para.week_day].x1 - 1, 
								ForecastFrame[fday->para.week_day].y1 - 1, 8);
		GUI_SetColor((0x22ul << 24) | GUI_BLUE);
		GUI_FillRect(ForecastFrame[fday->para.week_day].x0 + 1, 
					ForecastFrame[fday->para.week_day].y0 + 1, 
					ForecastFrame[fday->para.week_day].x1 - 1, 
					ForecastFrame[fday->para.week_day].y1 - 165);
		GUI_FillRect(ForecastFrame[fday->para.week_day].x0 + 1, 
					ForecastFrame[fday->para.week_day].y0 + 165, 
					ForecastFrame[fday->para.week_day].x1 - 1, 
					ForecastFrame[fday->para.week_day].y1 - 1);
		GUI_SetColor((0x22ul << 24) | GUI_RED);
		GUI_FillRect(ForecastFrame[fday->para.week_day].x0 + 1, 
					ForecastFrame[fday->para.week_day].y0 + 130, 
					ForecastFrame[fday->para.week_day].x1 - 1, 
					ForecastFrame[fday->para.week_day].y1 -35);
		GUI_SetFont(pFont23pBold);
		GUI_SetTextMode(GUI_TM_TRANS);
		GUI_SetColor(GUI_WHITE);
		ForecastFrame[fday->para.week_day].y0 +=5;
		GUI_DispStringInRect(_apDays[fday->para.week_day], &ForecastFrame[fday->para.week_day], GUI_TA_TOP|GUI_TA_HCENTER);
		ForecastFrame[fday->para.week_day].y0 -=5;
		GUI_DrawBitmap(&bmson_with_cloud, 
					(ForecastFrame[fday->para.week_day].x0 + 2), 
					(ForecastFrame[fday->para.week_day].y0 + 30));
		GUI_SetFont(pFont23pBold);
		GUI_SetColor(LEMON);
		GUI_SetTextMode(GUI_TM_TRANS);
		GUI_SetTextAlign(GUI_TA_RIGHT|GUI_TA_VCENTER);
		GUI_GotoXY((ForecastFrame[fday->para.week_day].x0 + 
					((ForecastFrame[fday->para.week_day].x1 -
					ForecastFrame[fday->para.week_day].x0) / 2)),
					(ForecastFrame[fday->para.week_day].y0 + 115));
		GUI_DispDecSpace((fday->para.humidity), 2);
		GUI_SetTextAlign(GUI_TA_LEFT|GUI_TA_VCENTER);
		GUI_DispString("%");
		GUI_SetColor(GUI_WHITE);
		GUI_SetTextMode(GUI_TM_TRANS);
		GUI_SetTextAlign(GUI_TA_RIGHT|GUI_TA_VCENTER);
		GUI_GotoXY((ForecastFrame[fday->para.week_day].x0 + 
					((ForecastFrame[fday->para.week_day].x1 - 
					ForecastFrame[fday->para.week_day].x0) / 2)), 
					(ForecastFrame[fday->para.week_day].y0 + 145));
		GUI_DispDecSpace((fday->para.high_temp), 2);
		GUI_SetTextAlign(GUI_TA_LEFT|GUI_TA_VCENTER);
		GUI_DispString("°C");
		GUI_SetTextAlign(GUI_TA_RIGHT|GUI_TA_VCENTER);
		GUI_GotoXY((ForecastFrame[fday->para.week_day].x0 + 
					((ForecastFrame[fday->para.week_day].x1 - 
					ForecastFrame[fday->para.week_day].x0) / 2)), 
					(ForecastFrame[fday->para.week_day].y0 + 180));
		GUI_DispDecSpace((fday->para.low_temp), 2);
		GUI_SetTextAlign(GUI_TA_LEFT|GUI_TA_VCENTER);
		GUI_DispString("°C");
}


static void DISPLAY_AlarmClock(void)
{	
	int	selected_index;
	
	if(ActivDisplay == DISPLAY_ALARM_CLOCK)
	{
		GUI_SelectLayer(1);
		GUI_SetColor((0x72ul << 24) | DARK_BLUE);
		GUI_FillRect(65, 65, 420, 100);
		GUI_SetFont(pFont32p);		
		GUI_SetColor(GUI_WHITE);
		GUI_SetTextMode(GUI_TM_TRANS);
		GUI_DispStringAt("Alarm time:", 80, 80);
		GUI_SetFont(GUI_FONT_16B_1);
		GUI_SetTextMode(GUI_TM_TRANS);
		GUI_DispStringAt("HOURS     /     MINUTE", 80, 115);
		
		if(btn_alarm_set_time_state == 1)
		{
			ClearBuffer(display_buffer, DISPLAY_BUFFER_SIZE);
			selected_index = LISTWHEEL_GetPos(hLISTWHEEL_TimeHour);
			alarm_hour = Dec2Bcd(selected_index);
			memcpy(display_buffer, _apHour[selected_index], 2);
			display_buffer[2] = ':';
			selected_index = LISTWHEEL_GetPos(hLISTWHEEL_TimeMinute);
			alarm_minute = Dec2Bcd(selected_index);
			memcpy(&display_buffer[3], _apMinute[selected_index], 2);
			GUI_GotoXY(270, 80);
			GUI_SetFont(pFont32pBold);
			GUI_SetColor(GUI_WHITE);
			GUI_SetTextMode(GUI_TM_TRANS);			
			GUI_SetTextAlign(GUI_TA_LEFT | GUI_TA_VCENTER);
			GUI_DispString((const char*)display_buffer);
		}
		
		GUI_SelectLayer(0);
	}	
}



static int _OwnerDraw(const WIDGET_ITEM_DRAW_INFO * pDrawItemInfo) 
{
	int		selected_index;
	
	switch (pDrawItemInfo->Cmd) 
	{
		case WIDGET_ITEM_GET_XSIZE:
			return LISTWHEEL_OwnerDraw(pDrawItemInfo);
		
		case WIDGET_ITEM_GET_YSIZE:
			return LISTWHEEL_OwnerDraw(pDrawItemInfo);
		
		case WIDGET_ITEM_DRAW:
			return LISTWHEEL_OwnerDraw(pDrawItemInfo);
		
		case WIDGET_DRAW_BACKGROUND:
			break;
		
		case WIDGET_DRAW_OVERLAY:
		{
			GUI_SetColor(GUI_RED);
			selected_index = LISTWHEEL_GetPos(hLISTWHEEL_TimeHour);
			LISTWHEEL_SetSel(hLISTWHEEL_TimeHour, selected_index);
			selected_index = LISTWHEEL_GetPos(hLISTWHEEL_TimeMinute);
			LISTWHEEL_SetSel(hLISTWHEEL_TimeMinute, selected_index);
			GUI_DrawHLine(45, 0, 270);
			GUI_DrawHLine(74, 0, 270);
			GUI_DrawHLine(45, 280, 380);
			GUI_DrawHLine(74, 280, 380);
			return LISTWHEEL_OwnerDraw(pDrawItemInfo);
			break;
		}
		
		default:
			return LISTWHEEL_OwnerDraw(pDrawItemInfo);
	}
	
	return 0;
}

void BUTTON_SetNewState(uint16_t button_id, BUTTON_StateTypeDef new_state)
{
	switch(button_id)
	{
		case GUI_ID_BUTTON_Home:
		{
			break;
		}
		case  GUI_ID_BUTTON_Dnd:
		{
			if(new_state == RELEASED)
			{
				btn_dnd_state = 0;
				GUI_SelectLayer(1);
				GUI_MULTIBUF_BeginEx(1);
				GUI_SetColor(GUI_WHITE);
				GUI_FillRectEx(&Rect1);
				GUI_SetColor(LIGHT_BLUE);
				GUI_AA_FillRoundedRect(Rect1.x0 + 1, Rect1.y0 + 1, Rect1.x1 - 1, Rect1.y1 - 1, 8);
				Rect1.x0 += 5;
				GUI_SetFont(pFont23pBold);
				GUI_SetTextMode(GUI_TM_TRANS);
				GUI_SetColor(LEMON);
				GUI_DispStringInRect("Do Not Disturb", &Rect1, GUI_TA_VCENTER | GUI_TA_HCENTER);
				Rect1.x0 -= 5;
				GUI_MULTIBUF_EndEx(1);
				GUI_SelectLayer(0);
				BUTTON_DndActivReset();
			}
			else if(new_state == PRESSED)
			{
				btn_dnd_state = 1;
				GUI_SelectLayer(1);
				GUI_MULTIBUF_BeginEx(1);
				GUI_SetColor(GUI_WHITE);
				GUI_FillRectEx(&Rect1);
				GUI_SetColor(GUI_RED);
				GUI_AA_FillRoundedRect(Rect1.x0 + 1, Rect1.y0 + 1, Rect1.x1 - 1, Rect1.y1 - 1, 8);
				Rect1.x0 += 5;
				GUI_SetFont(pFont32pBold);
				GUI_SetTextMode(GUI_TM_TRANS);
				GUI_SetColor(GUI_WHITE);
				GUI_DispStringInRect("Do Not Disturb", &Rect1, GUI_TA_VCENTER | GUI_TA_HCENTER);
				Rect1.x0 -= 5;
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
				GUI_SetColor(GUI_WHITE);
				GUI_FillRectEx(&Rect2);
				GUI_SetColor(LIGHT_BLUE);
				GUI_AA_FillRoundedRect(Rect2.x0 + 1, Rect2.y0 + 1, Rect2.x1 - 1, Rect2.y1 - 1, 8);
				Rect2.x0 += 5;
				GUI_SetFont(pFont23pBold);
				GUI_SetTextMode(GUI_TM_TRANS);
				GUI_SetColor(LEMON);
				GUI_DispStringInRect("SOS Reset", &Rect2, GUI_TA_VCENTER | GUI_TA_HCENTER);
				Rect2.x0 -= 5;
				GUI_MULTIBUF_EndEx(1);
				GUI_SelectLayer(0);
				BUTTON_SosActivReset();
			}
			else if(new_state == PRESSED)
			{
				btn_sos_state = 1;
				GUI_SelectLayer(1);
				GUI_MULTIBUF_BeginEx(1);
				GUI_SetColor(GUI_WHITE);
				GUI_FillRectEx(&Rect2);
				GUI_SetColor(GUI_RED);
				GUI_AA_FillRoundedRect(Rect2.x0 + 1, Rect2.y0 + 1, Rect2.x1 - 1, Rect2.y1 - 1, 8);
				Rect2.x0 += 5;
				GUI_SetFont(pFont32pBold);
				GUI_SetTextMode(GUI_TM_TRANS);
				GUI_SetColor(GUI_WHITE);
				GUI_DispStringInRect("SOS Reset", &Rect2, GUI_TA_VCENTER | GUI_TA_HCENTER);
				Rect2.x0 -= 5;
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
				GUI_SetColor(GUI_WHITE);
				GUI_FillRectEx(&Rect3);
				GUI_SetColor(LIGHT_BLUE);
				GUI_AA_FillRoundedRect(Rect3.x0 + 1, Rect3.y0 + 1, Rect3.x1 - 1, Rect3.y1 - 1, 8);
				Rect3.x0 += 5;
				GUI_SetFont(pFont23pBold);
				GUI_SetTextMode(GUI_TM_TRANS);
				GUI_SetColor(LEMON);
				GUI_DispStringInRect("Call Maid", &Rect3, GUI_TA_VCENTER | GUI_TA_HCENTER);
				Rect3.x0 -= 5;
				GUI_MULTIBUF_EndEx(1);
				GUI_SelectLayer(0);
				BUTTON_CallMaidActivReset();
			}
			else if(new_state == PRESSED)
			{
				btn_maid_state = 1;
				GUI_SelectLayer(1);
				GUI_MULTIBUF_BeginEx(1);
				GUI_SetColor(GUI_WHITE);
				GUI_FillRectEx(&Rect3);
				GUI_SetColor(GUI_GREEN);
				GUI_AA_FillRoundedRect(Rect3.x0 + 1, Rect3.y0 + 1, Rect3.x1 - 1, Rect3.y1 - 1, 8);
				Rect3.x0 += 5;
				GUI_SetFont(pFont32pBold);
				GUI_SetTextMode(GUI_TM_TRANS);
				GUI_SetColor(GUI_WHITE);
				GUI_DispStringInRect("Call Maid", &Rect3, GUI_TA_VCENTER | GUI_TA_HCENTER);
				Rect3.x0 -= 5;
				GUI_MULTIBUF_EndEx(1);
				GUI_SelectLayer(0);
				BUTTON_CallMaidActivSet();
			}
			break;
		}
		
		
		case  GUI_ID_BUTTON_Weather:
		{
			break;
		}	
		case  GUI_ID_BUTTON_CtrlMode:
		{
			break;
		}
		case  GUI_ID_BUTTON_FanSpeed:
		{
			break;
		}
	}
}


BUTTON_StateTypeDef BUTTON_GetState(uint16_t button_id)
{
	switch(button_id)
	{
		case GUI_ID_BUTTON_Home:
			return (btn_home_state);
		
		case  GUI_ID_BUTTON_Dnd:
			return (btn_dnd_state);
		
		case  GUI_ID_BUTTON_Sos:
			return (btn_sos_state);
		
		case  GUI_ID_BUTTON_Maid:
			return (btn_maid_state);
		
		case  GUI_ID_BUTTON_Weather:
			return (btn_weather_state);
		
		case  GUI_ID_BUTTON_CtrlMode:
			return (btn_ctrl_mode_state);
		
		case  GUI_ID_BUTTON_FanSpeed:
			return (btn_fan_mode_state);
	}
	return(2);
}


/*************************** End of file ****************************/
