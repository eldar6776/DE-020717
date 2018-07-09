/*********************************************************************
*                SEGGER Microcontroller GmbH & Co. KG                *
*        Solutions for real time microcontroller applications        *
**********************************************************************
*                                                                    *
*        (c) 1996 - 2017  SEGGER Microcontroller GmbH & Co. KG       *
*                                                                    *
*        Internet: www.segger.com    Support:  support@segger.com    *
*                                                                    *
**********************************************************************

** emWin V5.42 - Graphical user interface for embedded applications **
emWin is protected by international copyright laws.   Knowledge of the
source code may not be used to write a similar product.  This file may
only  be used  in accordance  with  a license  and should  not be  re-
distributed in any way. We appreciate your understanding and fairness.
----------------------------------------------------------------------
File        : Resource.h
Content     : Main resource header file of weather forecast demo
---------------------------END-OF-HEADER------------------------------
*/

#ifndef RESOURCE_H
#define RESOURCE_H

#include "GUI.h"
//
//	Sound
//
//extern const unsigned char alarm_clock_clasic[];
//extern const unsigned char alarm_clock_cosmic[];
//extern const unsigned char alarm_clock_iphon[];
//extern const unsigned char alarm_clock_melodic[];
//extern const unsigned char alarm_clock_samsung[];
//extern const unsigned char doorbell_dingdong[];
//extern const unsigned char fire_alarm_hard[];
//extern const unsigned char fire_alarm_soft[];
//extern const unsigned char sos_alarm_entry[];
//
// 	Font
//
extern GUI_CONST_STORAGE GUI_FONT GUI_Font23S_AA4;
extern GUI_CONST_STORAGE GUI_FONT GUI_Font23SL_AA4;
extern GUI_CONST_STORAGE GUI_FONT GUI_Font32S_AA4;
extern GUI_CONST_STORAGE GUI_FONT GUI_Font32SL_AA4;
//
// 	Image
//
extern GUI_CONST_STORAGE GUI_BITMAP bmmaid_call_assert;
extern GUI_CONST_STORAGE GUI_BITMAP bmdo_not_disturb_assert;
extern GUI_CONST_STORAGE GUI_BITMAP bmreset_sos_assert;
extern GUI_CONST_STORAGE GUI_BITMAP bmbckgnd_thermostat;
//extern GUI_CONST_STORAGE GUI_BITMAP bmbckgnd_forecast;
//extern GUI_CONST_STORAGE GUI_BITMAP bmtopbar;
extern GUI_CONST_STORAGE GUI_BITMAP bmknob;
//extern GUI_CONST_STORAGE GUI_BITMAP bmButtonRound_80x35;
//extern GUI_CONST_STORAGE GUI_BITMAP bmButtonRoundPressed_80x35;
//extern GUI_CONST_STORAGE GUI_BITMAP bmKNOB_175x175;
//extern GUI_CONST_STORAGE GUI_BITMAP bmalarm_clock_icon;
//extern GUI_CONST_STORAGE GUI_BITMAP bmhome_icon;
//extern GUI_CONST_STORAGE GUI_BITMAP bmweather_icon;
//extern GUI_CONST_STORAGE GUI_BITMAP bmson_with_cloud;
extern GUI_CONST_STORAGE GUI_BITMAP bmnumber_0;
extern GUI_CONST_STORAGE GUI_BITMAP bmnumber_1;
extern GUI_CONST_STORAGE GUI_BITMAP bmnumber_2;
extern GUI_CONST_STORAGE GUI_BITMAP bmnumber_3;
extern GUI_CONST_STORAGE GUI_BITMAP bmnumber_4;
extern GUI_CONST_STORAGE GUI_BITMAP bmnumber_5;
extern GUI_CONST_STORAGE GUI_BITMAP bmnumber_6;
extern GUI_CONST_STORAGE GUI_BITMAP bmnumber_7;
extern GUI_CONST_STORAGE GUI_BITMAP bmnumber_8;
extern GUI_CONST_STORAGE GUI_BITMAP bmnumber_9;
//
//	Animation
//
extern const GUI_BITMAP * apbmdoor_bell_anim[10];
extern const unsigned     aDelaydoor_bell_anim[10];
#endif // RESOURCE_H

/*************************** End of file ****************************/
