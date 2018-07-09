# 1 "../Drivers/BSP/Components/ft5336/ft5336.c"
# 1 "<built-in>" 1
# 1 "<built-in>" 3
# 370 "<built-in>" 3
# 1 "<command line>" 1
# 1 "<built-in>" 2
# 1 "../Drivers/BSP/Components/ft5336/ft5336.c" 2
# 38 "../Drivers/BSP/Components/ft5336/ft5336.c"
# 1 "../Drivers/BSP/Components/ft5336/ft5336.h" 1
# 51 "../Drivers/BSP/Components/ft5336/ft5336.h"
# 1 "../Drivers/BSP/Components/ft5336/../Common/ts.h" 1
# 47 "../Drivers/BSP/Components/ft5336/../Common/ts.h"
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
# 48 "../Drivers/BSP/Components/ft5336/../Common/ts.h" 2
# 68 "../Drivers/BSP/Components/ft5336/../Common/ts.h"
typedef struct
{
  void (*Init)(uint16_t);
  uint16_t (*ReadID)(uint16_t);
  void (*Reset)(uint16_t);
  void (*Start)(uint16_t);
  uint8_t (*DetectTouch)(uint16_t);
  void (*GetXY)(uint16_t, uint16_t*, uint16_t*);
  void (*EnableIT)(uint16_t);
  void (*ClearIT)(uint16_t);
  uint8_t (*GetITStatus)(uint16_t);
  void (*DisableIT)(uint16_t);
}TS_DrvTypeDef;
# 52 "../Drivers/BSP/Components/ft5336/ft5336.h" 2
# 74 "../Drivers/BSP/Components/ft5336/ft5336.h"
typedef struct
{
  uint8_t i2cInitialized;


  uint8_t currActiveTouchNb;


  uint8_t currActiveTouchIdx;

} ft5336_handle_TypeDef;
# 376 "../Drivers/BSP/Components/ft5336/ft5336.h"
void ft5336_Init(uint16_t DeviceAddr);






void ft5336_Reset(uint16_t DeviceAddr);







uint16_t ft5336_ReadID(uint16_t DeviceAddr);






void ft5336_TS_Start(uint16_t DeviceAddr);
# 407 "../Drivers/BSP/Components/ft5336/ft5336.h"
uint8_t ft5336_TS_DetectTouch(uint16_t DeviceAddr);
# 418 "../Drivers/BSP/Components/ft5336/ft5336.h"
void ft5336_TS_GetXY(uint16_t DeviceAddr, uint16_t *X, uint16_t *Y);







void ft5336_TS_EnableIT(uint16_t DeviceAddr);







void ft5336_TS_DisableIT(uint16_t DeviceAddr);
# 443 "../Drivers/BSP/Components/ft5336/ft5336.h"
uint8_t ft5336_TS_ITStatus (uint16_t DeviceAddr);







void ft5336_TS_ClearIT (uint16_t DeviceAddr);
# 463 "../Drivers/BSP/Components/ft5336/ft5336.h"
void ft5336_TS_GetGestureID(uint16_t DeviceAddr, uint8_t * pGestureId);
# 480 "../Drivers/BSP/Components/ft5336/ft5336.h"
void ft5336_TS_GetTouchInfo(uint16_t DeviceAddr,
                            uint32_t touchIdx,
                            uint32_t * pWeight,
                            uint32_t * pArea,
                            uint32_t * pEvent);
# 495 "../Drivers/BSP/Components/ft5336/ft5336.h"
extern void TS_IO_Init(void);
extern void TS_IO_Write(uint8_t Addr, uint8_t Reg, uint8_t Value);
extern uint8_t TS_IO_Read(uint8_t Addr, uint8_t Reg);
extern void TS_IO_Delay(uint32_t Delay);
# 512 "../Drivers/BSP/Components/ft5336/ft5336.h"
extern TS_DrvTypeDef ft5336_ts_drv;
# 39 "../Drivers/BSP/Components/ft5336/ft5336.c" 2
# 77 "../Drivers/BSP/Components/ft5336/ft5336.c"
TS_DrvTypeDef ft5336_ts_drv =
{
  ft5336_Init,
  ft5336_ReadID,
  ft5336_Reset,

  ft5336_TS_Start,
  ft5336_TS_DetectTouch,
  ft5336_TS_GetXY,

  ft5336_TS_EnableIT,
  ft5336_TS_ClearIT,
  ft5336_TS_ITStatus,
  ft5336_TS_DisableIT

};


static ft5336_handle_TypeDef ft5336_handle = { ((uint8_t)0x00), 0, 0};
# 112 "../Drivers/BSP/Components/ft5336/ft5336.c"
static uint8_t ft5336_Get_I2C_InitializedStatus(void);






static void ft5336_I2C_InitializeIfRequired(void);






static uint32_t ft5336_TS_Configure(uint16_t DeviceAddr);
# 145 "../Drivers/BSP/Components/ft5336/ft5336.c"
void ft5336_Init(uint16_t DeviceAddr)
{


  TS_IO_Delay(200);


  ft5336_I2C_InitializeIfRequired();
}







void ft5336_Reset(uint16_t DeviceAddr)
{


}







uint16_t ft5336_ReadID(uint16_t DeviceAddr)
{
  volatile uint8_t ucReadId = 0;
  uint8_t nbReadAttempts = 0;
  uint8_t bFoundDevice = 0;


  ft5336_I2C_InitializeIfRequired();


  for(nbReadAttempts = 0; ((nbReadAttempts < 3) && !(bFoundDevice)); nbReadAttempts++)
  {

    ucReadId = TS_IO_Read(DeviceAddr, ((uint8_t)0xA8));


    if(ucReadId == ((uint8_t)0x79))
    {

      bFoundDevice = 1;
    }
  }


  return (ucReadId);
}






void ft5336_TS_Start(uint16_t DeviceAddr)
{

  do { if(ft5336_TS_Configure(DeviceAddr)) { ; } }while(0);



  ft5336_TS_EnableIT(DeviceAddr);
}
# 222 "../Drivers/BSP/Components/ft5336/ft5336.c"
uint8_t ft5336_TS_DetectTouch(uint16_t DeviceAddr)
{
  volatile uint8_t nbTouch = 0;


  nbTouch = TS_IO_Read(DeviceAddr, ((uint8_t)0x02));
  nbTouch &= ((uint8_t)0x0F);

  if(nbTouch > ((uint8_t)0x05))
  {

    nbTouch = 0;
  }


  ft5336_handle.currActiveTouchNb = nbTouch;


  ft5336_handle.currActiveTouchIdx = 0;

  return(nbTouch);
}
# 254 "../Drivers/BSP/Components/ft5336/ft5336.c"
void ft5336_TS_GetXY(uint16_t DeviceAddr, uint16_t *X, uint16_t *Y)
{
  volatile uint8_t ucReadData = 0;
  static uint16_t coord;
  uint8_t regAddressXLow = 0;
  uint8_t regAddressXHigh = 0;
  uint8_t regAddressYLow = 0;
  uint8_t regAddressYHigh = 0;

  if(ft5336_handle.currActiveTouchIdx < ft5336_handle.currActiveTouchNb)
  {
    switch(ft5336_handle.currActiveTouchIdx)
    {
    case 0 :
      regAddressXLow = ((uint8_t)0x04);
      regAddressXHigh = ((uint8_t)0x03);
      regAddressYLow = ((uint8_t)0x06);
      regAddressYHigh = ((uint8_t)0x05);
      break;

    case 1 :
      regAddressXLow = ((uint8_t)0x0A);
      regAddressXHigh = ((uint8_t)0x09);
      regAddressYLow = ((uint8_t)0x0C);
      regAddressYHigh = ((uint8_t)0x0B);
      break;

    case 2 :
      regAddressXLow = ((uint8_t)0x10);
      regAddressXHigh = ((uint8_t)0x0F);
      regAddressYLow = ((uint8_t)0x12);
      regAddressYHigh = ((uint8_t)0x11);
      break;

    case 3 :
      regAddressXLow = ((uint8_t)0x16);
      regAddressXHigh = ((uint8_t)0x15);
      regAddressYLow = ((uint8_t)0x18);
      regAddressYHigh = ((uint8_t)0x17);
      break;

    case 4 :
      regAddressXLow = ((uint8_t)0x1C);
      regAddressXHigh = ((uint8_t)0x1B);
      regAddressYLow = ((uint8_t)0x1E);
      regAddressYHigh = ((uint8_t)0x1D);
      break;

    case 5 :
      regAddressXLow = ((uint8_t)0x22);
      regAddressXHigh = ((uint8_t)0x21);
      regAddressYLow = ((uint8_t)0x24);
      regAddressYHigh = ((uint8_t)0x23);
      break;

    case 6 :
      regAddressXLow = ((uint8_t)0x28);
      regAddressXHigh = ((uint8_t)0x27);
      regAddressYLow = ((uint8_t)0x2A);
      regAddressYHigh = ((uint8_t)0x29);
      break;

    case 7 :
      regAddressXLow = ((uint8_t)0x2E);
      regAddressXHigh = ((uint8_t)0x2D);
      regAddressYLow = ((uint8_t)0x30);
      regAddressYHigh = ((uint8_t)0x2F);
      break;

    case 8 :
      regAddressXLow = ((uint8_t)0x34);
      regAddressXHigh = ((uint8_t)0x33);
      regAddressYLow = ((uint8_t)0x36);
      regAddressYHigh = ((uint8_t)0x35);
      break;

    case 9 :
      regAddressXLow = ((uint8_t)0x3A);
      regAddressXHigh = ((uint8_t)0x39);
      regAddressYLow = ((uint8_t)0x3C);
      regAddressYHigh = ((uint8_t)0x3B);
      break;

    default :
      break;

    }


    ucReadData = TS_IO_Read(DeviceAddr, regAddressXLow);
    coord = (ucReadData & ((uint8_t)0xFF)) >> ((uint8_t)0x00);


    ucReadData = TS_IO_Read(DeviceAddr, regAddressXHigh);
    coord |= ((ucReadData & ((uint8_t)0x0F)) >> ((uint8_t)0x00)) << 8;


    *X = coord;


    ucReadData = TS_IO_Read(DeviceAddr, regAddressYLow);
    coord = (ucReadData & ((uint8_t)0xFF)) >> ((uint8_t)0x00);


    ucReadData = TS_IO_Read(DeviceAddr, regAddressYHigh);
    coord |= ((ucReadData & ((uint8_t)0x0F)) >> ((uint8_t)0x00)) << 8;


    *Y = coord;

    ft5336_handle.currActiveTouchIdx++;

  }
}







void ft5336_TS_EnableIT(uint16_t DeviceAddr)
{
   uint8_t regValue = 0;
   regValue = (((uint8_t)0x01) & (((uint8_t)0x03) >> ((uint8_t)0x00))) << ((uint8_t)0x00);


   TS_IO_Write(DeviceAddr, ((uint8_t)0xA4), regValue);
}







void ft5336_TS_DisableIT(uint16_t DeviceAddr)
{
  uint8_t regValue = 0;
  regValue = (((uint8_t)0x00) & (((uint8_t)0x03) >> ((uint8_t)0x00))) << ((uint8_t)0x00);


  TS_IO_Write(DeviceAddr, ((uint8_t)0xA4), regValue);
}
# 407 "../Drivers/BSP/Components/ft5336/ft5336.c"
uint8_t ft5336_TS_ITStatus(uint16_t DeviceAddr)
{

  return 0;
}
# 420 "../Drivers/BSP/Components/ft5336/ft5336.c"
void ft5336_TS_ClearIT(uint16_t DeviceAddr)
{

}
# 435 "../Drivers/BSP/Components/ft5336/ft5336.c"
void ft5336_TS_GetGestureID(uint16_t DeviceAddr, uint8_t * pGestureId)
{
  volatile uint8_t ucReadData = 0;

  ucReadData = TS_IO_Read(DeviceAddr, ((uint8_t)0x01));

  * pGestureId = ucReadData;
}
# 459 "../Drivers/BSP/Components/ft5336/ft5336.c"
void ft5336_TS_GetTouchInfo(uint16_t DeviceAddr,
                            uint32_t touchIdx,
                            uint32_t * pWeight,
                            uint32_t * pArea,
                            uint32_t * pEvent)
{
  volatile uint8_t ucReadData = 0;
  uint8_t regAddressXHigh = 0;
  uint8_t regAddressPWeight = 0;
  uint8_t regAddressPMisc = 0;

  if(touchIdx < ft5336_handle.currActiveTouchNb)
  {
    switch(touchIdx)
    {
    case 0 :
      regAddressXHigh = ((uint8_t)0x03);
      regAddressPWeight = ((uint8_t)0x07);
      regAddressPMisc = ((uint8_t)0x08);
      break;

    case 1 :
      regAddressXHigh = ((uint8_t)0x09);
      regAddressPWeight = ((uint8_t)0x0D);
      regAddressPMisc = ((uint8_t)0x0E);
      break;

    case 2 :
      regAddressXHigh = ((uint8_t)0x0F);
      regAddressPWeight = ((uint8_t)0x13);
      regAddressPMisc = ((uint8_t)0x14);
      break;

    case 3 :
      regAddressXHigh = ((uint8_t)0x15);
      regAddressPWeight = ((uint8_t)0x19);
      regAddressPMisc = ((uint8_t)0x1A);
      break;

    case 4 :
      regAddressXHigh = ((uint8_t)0x1B);
      regAddressPWeight = ((uint8_t)0x1F);
      regAddressPMisc = ((uint8_t)0x20);
      break;

    case 5 :
      regAddressXHigh = ((uint8_t)0x21);
      regAddressPWeight = ((uint8_t)0x25);
      regAddressPMisc = ((uint8_t)0x26);
      break;

    case 6 :
      regAddressXHigh = ((uint8_t)0x27);
      regAddressPWeight = ((uint8_t)0x2B);
      regAddressPMisc = ((uint8_t)0x2C);
      break;

    case 7 :
      regAddressXHigh = ((uint8_t)0x2D);
      regAddressPWeight = ((uint8_t)0x31);
      regAddressPMisc = ((uint8_t)0x32);
      break;

    case 8 :
      regAddressXHigh = ((uint8_t)0x33);
      regAddressPWeight = ((uint8_t)0x37);
      regAddressPMisc = ((uint8_t)0x38);
      break;

    case 9 :
      regAddressXHigh = ((uint8_t)0x39);
      regAddressPWeight = ((uint8_t)0x3D);
      regAddressPMisc = ((uint8_t)0x3E);
      break;

    default :
      break;

    }


    ucReadData = TS_IO_Read(DeviceAddr, regAddressXHigh);
    * pEvent = (ucReadData & ((uint8_t)(3 << ((uint8_t)0x06)))) >> ((uint8_t)0x06);


    ucReadData = TS_IO_Read(DeviceAddr, regAddressPWeight);
    * pWeight = (ucReadData & ((uint8_t)0xFF)) >> ((uint8_t)0x00);


    ucReadData = TS_IO_Read(DeviceAddr, regAddressPMisc);
    * pArea = (ucReadData & ((uint8_t)(0x04 << 4))) >> ((uint8_t)0x04);

  }
}
# 568 "../Drivers/BSP/Components/ft5336/ft5336.c"
static uint8_t ft5336_Get_I2C_InitializedStatus(void)
{
  return(ft5336_handle.i2cInitialized);
}






static void ft5336_I2C_InitializeIfRequired(void)
{
  if(ft5336_Get_I2C_InitializedStatus() == ((uint8_t)0x00))
  {

    TS_IO_Init();


    ft5336_handle.i2cInitialized = ((uint8_t)0x01);
  }
}






static uint32_t ft5336_TS_Configure(uint16_t DeviceAddr)
{
  uint32_t status = ((uint8_t)0x00);



  return(status);
}
