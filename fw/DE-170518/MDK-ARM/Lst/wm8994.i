# 1 "../Drivers/BSP/Components/wm8994/wm8994.c"
# 1 "<built-in>" 1
# 1 "<built-in>" 3
# 370 "<built-in>" 3
# 1 "<command line>" 1
# 1 "<built-in>" 2
# 1 "../Drivers/BSP/Components/wm8994/wm8994.c" 2
# 37 "../Drivers/BSP/Components/wm8994/wm8994.c"
# 1 "../Drivers/BSP/Components/wm8994/wm8994.h" 1
# 42 "../Drivers/BSP/Components/wm8994/wm8994.h"
# 1 "../Drivers/BSP/Components/wm8994/../Common/audio.h" 1
# 48 "../Drivers/BSP/Components/wm8994/../Common/audio.h"
# 1 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\stdint.h" 1 3
# 56 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\stdint.h" 3
typedef signed char int8_t;
typedef signed short int int16_t;
typedef signed int int32_t;
typedef signed long long int int64_t;


typedef unsigned char uint8_t;
typedef unsigned short int uint16_t;
typedef unsigned int uint32_t;
typedef unsigned long long int uint64_t;





typedef signed char int_least8_t;
typedef signed short int int_least16_t;
typedef signed int int_least32_t;
typedef signed long long int int_least64_t;


typedef unsigned char uint_least8_t;
typedef unsigned short int uint_least16_t;
typedef unsigned int uint_least32_t;
typedef unsigned long long int uint_least64_t;




typedef signed int int_fast8_t;
typedef signed int int_fast16_t;
typedef signed int int_fast32_t;
typedef signed long long int int_fast64_t;


typedef unsigned int uint_fast8_t;
typedef unsigned int uint_fast16_t;
typedef unsigned int uint_fast32_t;
typedef unsigned long long int uint_fast64_t;






typedef signed int intptr_t;
typedef unsigned int uintptr_t;



typedef signed long long intmax_t;
typedef unsigned long long uintmax_t;
# 49 "../Drivers/BSP/Components/wm8994/../Common/audio.h" 2
# 81 "../Drivers/BSP/Components/wm8994/../Common/audio.h"
typedef struct
{
  uint32_t (*Init)(uint16_t, uint16_t, uint8_t, uint32_t);
  void (*DeInit)(void);
  uint32_t (*ReadID)(uint16_t);
  uint32_t (*Play)(uint16_t, uint16_t*, uint16_t);
  uint32_t (*Pause)(uint16_t);
  uint32_t (*Resume)(uint16_t);
  uint32_t (*Stop)(uint16_t, uint32_t);
  uint32_t (*SetFrequency)(uint16_t, uint32_t);
  uint32_t (*SetVolume)(uint16_t, uint8_t);
  uint32_t (*SetMute)(uint16_t, uint32_t);
  uint32_t (*SetOutputMode)(uint16_t, uint8_t);
  uint32_t (*Reset)(uint16_t);
}AUDIO_DrvTypeDef;
# 43 "../Drivers/BSP/Components/wm8994/wm8994.h" 2
# 145 "../Drivers/BSP/Components/wm8994/wm8994.h"
uint32_t wm8994_Init(uint16_t DeviceAddr, uint16_t OutputInputDevice, uint8_t Volume, uint32_t AudioFreq);
void wm8994_DeInit(void);
uint32_t wm8994_ReadID(uint16_t DeviceAddr);
uint32_t wm8994_Play(uint16_t DeviceAddr, uint16_t* pBuffer, uint16_t Size);
uint32_t wm8994_Pause(uint16_t DeviceAddr);
uint32_t wm8994_Resume(uint16_t DeviceAddr);
uint32_t wm8994_Stop(uint16_t DeviceAddr, uint32_t Cmd);
uint32_t wm8994_SetVolume(uint16_t DeviceAddr, uint8_t Volume);
uint32_t wm8994_SetMute(uint16_t DeviceAddr, uint32_t Cmd);
uint32_t wm8994_SetOutputMode(uint16_t DeviceAddr, uint8_t Output);
uint32_t wm8994_SetFrequency(uint16_t DeviceAddr, uint32_t AudioFreq);
uint32_t wm8994_Reset(uint16_t DeviceAddr);


void AUDIO_IO_Init(void);
void AUDIO_IO_DeInit(void);
void AUDIO_IO_Write(uint8_t Addr, uint16_t Reg, uint16_t Value);
uint8_t AUDIO_IO_Read(uint8_t Addr, uint16_t Reg);
void AUDIO_IO_Delay(uint32_t Delay);


extern AUDIO_DrvTypeDef wm8994_drv;
# 38 "../Drivers/BSP/Components/wm8994/wm8994.c" 2
# 86 "../Drivers/BSP/Components/wm8994/wm8994.c"
AUDIO_DrvTypeDef wm8994_drv =
{
  wm8994_Init,
  wm8994_DeInit,
  wm8994_ReadID,

  wm8994_Play,
  wm8994_Pause,
  wm8994_Resume,
  wm8994_Stop,

  wm8994_SetFrequency,
  wm8994_SetVolume,
  wm8994_SetMute,
  wm8994_SetOutputMode,

  wm8994_Reset
};

static uint32_t outputEnabled = 0;
static uint32_t inputEnabled = 0;
static uint8_t ColdStartup = 1;
# 116 "../Drivers/BSP/Components/wm8994/wm8994.c"
static uint8_t CODEC_IO_Write(uint8_t Addr, uint16_t Reg, uint16_t Value);
# 137 "../Drivers/BSP/Components/wm8994/wm8994.c"
uint32_t wm8994_Init(uint16_t DeviceAddr, uint16_t OutputInputDevice, uint8_t Volume, uint32_t AudioFreq)
{
 uint32_t counter = 0;
 uint16_t output_device = OutputInputDevice & 0xFF;
 uint16_t input_device = OutputInputDevice & 0xFF00;
 uint16_t power_mgnt_reg_1 = 0;


 AUDIO_IO_Init();

 counter += CODEC_IO_Write(DeviceAddr, 0x102, 0x0003);
 counter += CODEC_IO_Write(DeviceAddr, 0x817, 0x0000);
 counter += CODEC_IO_Write(DeviceAddr, 0x102, 0x0000);


 counter += CODEC_IO_Write(DeviceAddr, 0x39, 0x006C);


 if (input_device > 0)
 {
  counter += CODEC_IO_Write(DeviceAddr, 0x01, 0x0013);
 }
 else
 {
  counter += CODEC_IO_Write(DeviceAddr, 0x01, 0x0003);
 }


  AUDIO_IO_Delay(50);


  if (output_device > 0)
  {
    outputEnabled = 1;

    switch (output_device)
    {
  case ((uint16_t)0x0001):


    counter += CODEC_IO_Write(DeviceAddr, 0x05, 0x0C0C);


    counter += CODEC_IO_Write(DeviceAddr, 0x601, 0x0000);


    counter += CODEC_IO_Write(DeviceAddr, 0x602, 0x0000);


    counter += CODEC_IO_Write(DeviceAddr, 0x604, 0x0002);


    counter += CODEC_IO_Write(DeviceAddr, 0x605, 0x0002);
    break;

  case ((uint16_t)0x0002):


    counter += CODEC_IO_Write(DeviceAddr, 0x05, 0x0303);


    counter += CODEC_IO_Write(DeviceAddr, 0x601, 0x0001);


    counter += CODEC_IO_Write(DeviceAddr, 0x602, 0x0001);


    counter += CODEC_IO_Write(DeviceAddr, 0x604, 0x0000);


    counter += CODEC_IO_Write(DeviceAddr, 0x605, 0x0000);
    break;

  case ((uint16_t)0x0003):
    if (input_device == ((uint16_t)0x0800))
    {


   counter += CODEC_IO_Write(DeviceAddr, 0x05, 0x0303 | 0x0C0C);



   counter += CODEC_IO_Write(DeviceAddr, 0x601, 0x0003);



   counter += CODEC_IO_Write(DeviceAddr, 0x602, 0x0003);



   counter += CODEC_IO_Write(DeviceAddr, 0x604, 0x0003);



   counter += CODEC_IO_Write(DeviceAddr, 0x605, 0x0003);
    }
    else
    {


   counter += CODEC_IO_Write(DeviceAddr, 0x05, 0x0303 | 0x0C0C);


   counter += CODEC_IO_Write(DeviceAddr, 0x601, 0x0001);


   counter += CODEC_IO_Write(DeviceAddr, 0x602, 0x0001);


   counter += CODEC_IO_Write(DeviceAddr, 0x604, 0x0002);


   counter += CODEC_IO_Write(DeviceAddr, 0x605, 0x0002);
    }
    break;

  case ((uint16_t)0x0004) :
  default:


    counter += CODEC_IO_Write(DeviceAddr, 0x05, 0x0303);


    counter += CODEC_IO_Write(DeviceAddr, 0x601, 0x0001);


    counter += CODEC_IO_Write(DeviceAddr, 0x602, 0x0001);


    counter += CODEC_IO_Write(DeviceAddr, 0x604, 0x0000);


    counter += CODEC_IO_Write(DeviceAddr, 0x605, 0x0000);
    break;
    }
  }
  else
  {
    outputEnabled = 0;
  }


  if (input_device > 0)
  {
    inputEnabled = 1;
    switch (input_device)
    {
    case ((uint16_t)0x0200) :



      counter += CODEC_IO_Write(DeviceAddr, 0x04, 0x0C30);


      counter += CODEC_IO_Write(DeviceAddr, 0x450, 0x00DB);


      counter += CODEC_IO_Write(DeviceAddr, 0x02, 0x6000);


      counter += CODEC_IO_Write(DeviceAddr, 0x608, 0x0002);


      counter += CODEC_IO_Write(DeviceAddr, 0x609, 0x0002);


      counter += CODEC_IO_Write(DeviceAddr, 0x700, 0x000E);
      break;

    case ((uint16_t)0x0300) :

      counter += CODEC_IO_Write(DeviceAddr, 0x28, 0x0011);


      counter += CODEC_IO_Write(DeviceAddr, 0x29, 0x0035);


      counter += CODEC_IO_Write(DeviceAddr, 0x2A, 0x0035);



      counter += CODEC_IO_Write(DeviceAddr, 0x04, 0x0303);


      counter += CODEC_IO_Write(DeviceAddr, 0x440, 0x00DB);


      counter += CODEC_IO_Write(DeviceAddr, 0x02, 0x6350);


      counter += CODEC_IO_Write(DeviceAddr, 0x606, 0x0002);


      counter += CODEC_IO_Write(DeviceAddr, 0x607, 0x0002);


      counter += CODEC_IO_Write(DeviceAddr, 0x700, 0x000D);
      break;

    case ((uint16_t)0x0100) :



      counter += CODEC_IO_Write(DeviceAddr, 0x04, 0x030C);


      counter += CODEC_IO_Write(DeviceAddr, 0x440, 0x00DB);


      counter += CODEC_IO_Write(DeviceAddr, 0x02, 0x6350);


      counter += CODEC_IO_Write(DeviceAddr, 0x606, 0x0002);


      counter += CODEC_IO_Write(DeviceAddr, 0x607, 0x0002);


      counter += CODEC_IO_Write(DeviceAddr, 0x700, 0x000D);
      break;
    case ((uint16_t)0x0800) :



      counter += CODEC_IO_Write(DeviceAddr, 0x04, 0x0F3C);


      counter += CODEC_IO_Write(DeviceAddr, 0x450, 0x00DB);


      counter += CODEC_IO_Write(DeviceAddr, 0x440, 0x00DB);


      counter += CODEC_IO_Write(DeviceAddr, 0x02, 0x63A0);


      counter += CODEC_IO_Write(DeviceAddr, 0x606, 0x0002);


      counter += CODEC_IO_Write(DeviceAddr, 0x607, 0x0002);


      counter += CODEC_IO_Write(DeviceAddr, 0x608, 0x0002);


      counter += CODEC_IO_Write(DeviceAddr, 0x609, 0x0002);


      counter += CODEC_IO_Write(DeviceAddr, 0x700, 0x000D);
      break;
    case ((uint16_t)0x0400) :
    default:

      counter++;
      break;
    }
  }
  else
  {
    inputEnabled = 0;
  }


  switch (AudioFreq)
  {
  case ((uint32_t)8000):

    counter += CODEC_IO_Write(DeviceAddr, 0x210, 0x0003);
    break;

  case ((uint32_t)16000):

    counter += CODEC_IO_Write(DeviceAddr, 0x210, 0x0033);
    break;

  case ((uint32_t)32000):

    counter += CODEC_IO_Write(DeviceAddr, 0x210, 0x0063);
    break;

  case ((uint32_t)48000):

    counter += CODEC_IO_Write(DeviceAddr, 0x210, 0x0083);
    break;

  case ((uint32_t)96000):

    counter += CODEC_IO_Write(DeviceAddr, 0x210, 0x00A3);
    break;

  case ((uint32_t)11025):

    counter += CODEC_IO_Write(DeviceAddr, 0x210, 0x0013);
    break;

  case ((uint32_t)22050):

    counter += CODEC_IO_Write(DeviceAddr, 0x210, 0x0043);
    break;

  case ((uint32_t)44100):

    counter += CODEC_IO_Write(DeviceAddr, 0x210, 0x0073);
    break;

  default:

    counter += CODEC_IO_Write(DeviceAddr, 0x210, 0x0083);
    break;
  }

  if(input_device == ((uint16_t)0x0800))
  {

  counter += CODEC_IO_Write(DeviceAddr, 0x300, 0x4018);
  }
  else
  {

  counter += CODEC_IO_Write(DeviceAddr, 0x300, 0x4010);
  }


  counter += CODEC_IO_Write(DeviceAddr, 0x302, 0x0000);


  counter += CODEC_IO_Write(DeviceAddr, 0x208, 0x000A);


  counter += CODEC_IO_Write(DeviceAddr, 0x200, 0x0001);

  if (output_device > 0)
  {
    if (output_device == ((uint16_t)0x0002))
    {

      counter += CODEC_IO_Write(DeviceAddr, 0x2D, 0x0100);


      counter += CODEC_IO_Write(DeviceAddr, 0x2E, 0x0100);


      if(ColdStartup)
      {
        counter += CODEC_IO_Write(DeviceAddr,0x110,0x8100);

        ColdStartup=0;

        AUDIO_IO_Delay(300);
      }
      else
      {
        counter += CODEC_IO_Write(DeviceAddr,0x110,0x8108);

        AUDIO_IO_Delay(50);
      }


      counter += CODEC_IO_Write(DeviceAddr, 0x420, 0x0000);
    }
    else
    {



      counter += CODEC_IO_Write(DeviceAddr, 0x03, 0x0300);


      counter += CODEC_IO_Write(DeviceAddr, 0x22, 0x0000);


      counter += CODEC_IO_Write(DeviceAddr, 0x23, 0x0000);



      counter += CODEC_IO_Write(DeviceAddr, 0x36, 0x0300);


      counter += CODEC_IO_Write(DeviceAddr, 0x01, 0x3003);



      if (input_device == ((uint16_t)0x0800))
      {

      counter += CODEC_IO_Write(DeviceAddr, 0x51, 0x0205);
      }
      else
      {

      counter += CODEC_IO_Write(DeviceAddr, 0x51, 0x0005);
      }



      power_mgnt_reg_1 |= 0x0303 | 0x3003;
      counter += CODEC_IO_Write(DeviceAddr, 0x01, power_mgnt_reg_1);


      counter += CODEC_IO_Write(DeviceAddr, 0x60, 0x0022);


      counter += CODEC_IO_Write(DeviceAddr, 0x4C, 0x9F25);


      AUDIO_IO_Delay(15);


      counter += CODEC_IO_Write(DeviceAddr, 0x2D, 0x0001);


      counter += CODEC_IO_Write(DeviceAddr, 0x2E, 0x0001);



      counter += CODEC_IO_Write(DeviceAddr, 0x03, 0x0030 | 0x0300);


      counter += CODEC_IO_Write(DeviceAddr, 0x54, 0x0033);


      AUDIO_IO_Delay(257);


      counter += CODEC_IO_Write(DeviceAddr, 0x60, 0x00EE);

    }



    counter += CODEC_IO_Write(DeviceAddr, 0x610, 0x00C0);


    counter += CODEC_IO_Write(DeviceAddr, 0x611, 0x00C0);


    counter += CODEC_IO_Write(DeviceAddr, 0x420, 0x0010);


    counter += CODEC_IO_Write(DeviceAddr, 0x612, 0x00C0);


    counter += CODEC_IO_Write(DeviceAddr, 0x613, 0x00C0);


    counter += CODEC_IO_Write(DeviceAddr, 0x422, 0x0010);


    wm8994_SetVolume(DeviceAddr, Volume);
  }

  if (input_device > 0)
  {
    if ((input_device == ((uint16_t)0x0100)) || (input_device == ((uint16_t)0x0200)))
    {

      power_mgnt_reg_1 |= 0x0013;
      counter += CODEC_IO_Write(DeviceAddr, 0x01, power_mgnt_reg_1);


      counter += CODEC_IO_Write(DeviceAddr, 0x620, 0x0002);


      counter += CODEC_IO_Write(DeviceAddr, 0x411, 0x3800);
    }
    else if(input_device == ((uint16_t)0x0800))
    {

      power_mgnt_reg_1 |= 0x0013;
      counter += CODEC_IO_Write(DeviceAddr, 0x01, power_mgnt_reg_1);


      counter += CODEC_IO_Write(DeviceAddr, 0x620, 0x0002);


      counter += CODEC_IO_Write(DeviceAddr, 0x410, 0x1800);


      counter += CODEC_IO_Write(DeviceAddr, 0x411, 0x1800);
    }
    else if ((input_device == ((uint16_t)0x0300)) || (input_device == ((uint16_t)0x0400)))
    {


      counter += CODEC_IO_Write(DeviceAddr, 0x18, 0x000B);


      counter += CODEC_IO_Write(DeviceAddr, 0x1A, 0x000B);


      counter += CODEC_IO_Write(DeviceAddr, 0x410, 0x1800);
    }

    wm8994_SetVolume(DeviceAddr, Volume);
  }

  return counter;
}






void wm8994_DeInit(void)
{

  AUDIO_IO_DeInit();
}






uint32_t wm8994_ReadID(uint16_t DeviceAddr)
{

  AUDIO_IO_Init();

  return ((uint32_t)AUDIO_IO_Read(DeviceAddr, 0x00));
}







uint32_t wm8994_Play(uint16_t DeviceAddr, uint16_t* pBuffer, uint16_t Size)
{
  uint32_t counter = 0;



  counter += wm8994_SetMute(DeviceAddr, 0);

  return counter;
}






uint32_t wm8994_Pause(uint16_t DeviceAddr)
{
  uint32_t counter = 0;



  counter += wm8994_SetMute(DeviceAddr, 1);


  counter += CODEC_IO_Write(DeviceAddr, 0x02, 0x01);

  return counter;
}






uint32_t wm8994_Resume(uint16_t DeviceAddr)
{
  uint32_t counter = 0;



  counter += wm8994_SetMute(DeviceAddr, 0);

  return counter;
}
# 725 "../Drivers/BSP/Components/wm8994/wm8994.c"
uint32_t wm8994_Stop(uint16_t DeviceAddr, uint32_t CodecPdwnMode)
{
  uint32_t counter = 0;

  if (outputEnabled != 0)
  {

    counter += wm8994_SetMute(DeviceAddr, 1);

    if (CodecPdwnMode == 2)
    {

    }
    else
    {

      counter += CODEC_IO_Write(DeviceAddr, 0x420, 0x0200);


      counter += CODEC_IO_Write(DeviceAddr, 0x422, 0x0200);


      counter += CODEC_IO_Write(DeviceAddr, 0x2D, 0x0000);


      counter += CODEC_IO_Write(DeviceAddr, 0x2E, 0x0000);


      counter += CODEC_IO_Write(DeviceAddr, 0x05, 0x0000);


      counter += CODEC_IO_Write(DeviceAddr, 0x0000, 0x0000);

      outputEnabled = 0;
    }
  }
  return counter;
}
# 771 "../Drivers/BSP/Components/wm8994/wm8994.c"
uint32_t wm8994_SetVolume(uint16_t DeviceAddr, uint8_t Volume)
{
  uint32_t counter = 0;
  uint8_t convertedvol = (((Volume) > 100)? 100:((uint8_t)(((Volume) * 63) / 100)));


  if (outputEnabled != 0)
  {
    if(convertedvol > 0x3E)
    {

      counter += wm8994_SetMute(DeviceAddr, 0);


      counter += CODEC_IO_Write(DeviceAddr, 0x1C, 0x3F | 0x140);


      counter += CODEC_IO_Write(DeviceAddr, 0x1D, 0x3F | 0x140);


      counter += CODEC_IO_Write(DeviceAddr, 0x26, 0x3F | 0x140);


      counter += CODEC_IO_Write(DeviceAddr, 0x27, 0x3F | 0x140);
    }
    else if (Volume == 0)
    {

      counter += wm8994_SetMute(DeviceAddr, 1);
    }
    else
    {

      counter += wm8994_SetMute(DeviceAddr, 0);


      counter += CODEC_IO_Write(DeviceAddr, 0x1C, convertedvol | 0x140);


      counter += CODEC_IO_Write(DeviceAddr, 0x1D, convertedvol | 0x140);


      counter += CODEC_IO_Write(DeviceAddr, 0x26, convertedvol | 0x140);


      counter += CODEC_IO_Write(DeviceAddr, 0x27, convertedvol | 0x140);
    }
  }


  if (inputEnabled != 0)
  {
    convertedvol = (((Volume) >= 100)? 239:((uint8_t)(((Volume) * 240) / 100)));


    counter += CODEC_IO_Write(DeviceAddr, 0x400, convertedvol | 0x100);


    counter += CODEC_IO_Write(DeviceAddr, 0x401, convertedvol | 0x100);


    counter += CODEC_IO_Write(DeviceAddr, 0x404, convertedvol | 0x100);


    counter += CODEC_IO_Write(DeviceAddr, 0x405, convertedvol | 0x100);
  }
  return counter;
}
# 847 "../Drivers/BSP/Components/wm8994/wm8994.c"
uint32_t wm8994_SetMute(uint16_t DeviceAddr, uint32_t Cmd)
{
  uint32_t counter = 0;

  if (outputEnabled != 0)
  {

    if(Cmd == 1)
    {

      counter += CODEC_IO_Write(DeviceAddr, 0x420, 0x0200);


      counter += CODEC_IO_Write(DeviceAddr, 0x422, 0x0200);
    }
    else
    {

      counter += CODEC_IO_Write(DeviceAddr, 0x420, 0x0010);


      counter += CODEC_IO_Write(DeviceAddr, 0x422, 0x0010);
    }
  }
  return counter;
}
# 882 "../Drivers/BSP/Components/wm8994/wm8994.c"
uint32_t wm8994_SetOutputMode(uint16_t DeviceAddr, uint8_t Output)
{
  uint32_t counter = 0;

  switch (Output)
  {
  case ((uint16_t)0x0001):


    counter += CODEC_IO_Write(DeviceAddr, 0x05, 0x0C0C);


    counter += CODEC_IO_Write(DeviceAddr, 0x601, 0x0000);


    counter += CODEC_IO_Write(DeviceAddr, 0x602, 0x0000);


    counter += CODEC_IO_Write(DeviceAddr, 0x604, 0x0002);


    counter += CODEC_IO_Write(DeviceAddr, 0x605, 0x0002);
    break;

  case ((uint16_t)0x0002):


    counter += CODEC_IO_Write(DeviceAddr, 0x05, 0x0303);


    counter += CODEC_IO_Write(DeviceAddr, 0x601, 0x0001);


    counter += CODEC_IO_Write(DeviceAddr, 0x602, 0x0001);


    counter += CODEC_IO_Write(DeviceAddr, 0x604, 0x0000);


    counter += CODEC_IO_Write(DeviceAddr, 0x605, 0x0000);
    break;

  case ((uint16_t)0x0003):


    counter += CODEC_IO_Write(DeviceAddr, 0x05, 0x0303 | 0x0C0C);


    counter += CODEC_IO_Write(DeviceAddr, 0x601, 0x0001);


    counter += CODEC_IO_Write(DeviceAddr, 0x602, 0x0001);


    counter += CODEC_IO_Write(DeviceAddr, 0x604, 0x0002);


    counter += CODEC_IO_Write(DeviceAddr, 0x605, 0x0002);
    break;

  default:


    counter += CODEC_IO_Write(DeviceAddr, 0x05, 0x0303);


    counter += CODEC_IO_Write(DeviceAddr, 0x601, 0x0001);


    counter += CODEC_IO_Write(DeviceAddr, 0x602, 0x0001);


    counter += CODEC_IO_Write(DeviceAddr, 0x604, 0x0000);


    counter += CODEC_IO_Write(DeviceAddr, 0x605, 0x0000);
    break;
  }
  return counter;
}







uint32_t wm8994_SetFrequency(uint16_t DeviceAddr, uint32_t AudioFreq)
{
  uint32_t counter = 0;


  switch (AudioFreq)
  {
  case ((uint32_t)8000):

    counter += CODEC_IO_Write(DeviceAddr, 0x210, 0x0003);
    break;

  case ((uint32_t)16000):

    counter += CODEC_IO_Write(DeviceAddr, 0x210, 0x0033);
    break;

  case ((uint32_t)32000):

    counter += CODEC_IO_Write(DeviceAddr, 0x210, 0x0063);
    break;

  case ((uint32_t)48000):

    counter += CODEC_IO_Write(DeviceAddr, 0x210, 0x0083);
    break;

  case ((uint32_t)96000):

    counter += CODEC_IO_Write(DeviceAddr, 0x210, 0x00A3);
    break;

  case ((uint32_t)11025):

    counter += CODEC_IO_Write(DeviceAddr, 0x210, 0x0013);
    break;

  case ((uint32_t)22050):

    counter += CODEC_IO_Write(DeviceAddr, 0x210, 0x0043);
    break;

  case ((uint32_t)44100):

    counter += CODEC_IO_Write(DeviceAddr, 0x210, 0x0073);
    break;

  default:

    counter += CODEC_IO_Write(DeviceAddr, 0x210, 0x0083);
    break;
  }
  return counter;
}






uint32_t wm8994_Reset(uint16_t DeviceAddr)
{
  uint32_t counter = 0;


  counter = CODEC_IO_Write(DeviceAddr, 0x0000, 0x0000);
  outputEnabled = 0;
  inputEnabled=0;

  return counter;
}
# 1048 "../Drivers/BSP/Components/wm8994/wm8994.c"
static uint8_t CODEC_IO_Write(uint8_t Addr, uint16_t Reg, uint16_t Value)
{
  uint32_t result = 0;

 AUDIO_IO_Write(Addr, Reg, Value);






  return result;
}
