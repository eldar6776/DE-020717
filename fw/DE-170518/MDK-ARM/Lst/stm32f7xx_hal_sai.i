# 1 "../Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_sai.c"
# 1 "<built-in>" 1
# 1 "<built-in>" 3
# 370 "<built-in>" 3
# 1 "<command line>" 1
# 1 "<built-in>" 2
# 1 "../Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_sai.c" 2
# 165 "../Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_sai.c"
# 1 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal.h" 1
# 46 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal.h"
# 1 "../Inc\\stm32f7xx_hal_conf.h" 1
# 238 "../Inc\\stm32f7xx_hal_conf.h"
# 1 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_rcc.h" 1
# 45 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_rcc.h"
# 1 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_def.h" 1
# 46 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_def.h"
# 1 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include\\stm32f7xx.h" 1
# 140 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include\\stm32f7xx.h"
# 1 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f746xx.h" 1
# 65 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f746xx.h"
typedef enum
{

  NonMaskableInt_IRQn = -14,
  MemoryManagement_IRQn = -12,
  BusFault_IRQn = -11,
  UsageFault_IRQn = -10,
  SVCall_IRQn = -5,
  DebugMonitor_IRQn = -4,
  PendSV_IRQn = -2,
  SysTick_IRQn = -1,

  WWDG_IRQn = 0,
  PVD_IRQn = 1,
  TAMP_STAMP_IRQn = 2,
  RTC_WKUP_IRQn = 3,
  FLASH_IRQn = 4,
  RCC_IRQn = 5,
  EXTI0_IRQn = 6,
  EXTI1_IRQn = 7,
  EXTI2_IRQn = 8,
  EXTI3_IRQn = 9,
  EXTI4_IRQn = 10,
  DMA1_Stream0_IRQn = 11,
  DMA1_Stream1_IRQn = 12,
  DMA1_Stream2_IRQn = 13,
  DMA1_Stream3_IRQn = 14,
  DMA1_Stream4_IRQn = 15,
  DMA1_Stream5_IRQn = 16,
  DMA1_Stream6_IRQn = 17,
  ADC_IRQn = 18,
  CAN1_TX_IRQn = 19,
  CAN1_RX0_IRQn = 20,
  CAN1_RX1_IRQn = 21,
  CAN1_SCE_IRQn = 22,
  EXTI9_5_IRQn = 23,
  TIM1_BRK_TIM9_IRQn = 24,
  TIM1_UP_TIM10_IRQn = 25,
  TIM1_TRG_COM_TIM11_IRQn = 26,
  TIM1_CC_IRQn = 27,
  TIM2_IRQn = 28,
  TIM3_IRQn = 29,
  TIM4_IRQn = 30,
  I2C1_EV_IRQn = 31,
  I2C1_ER_IRQn = 32,
  I2C2_EV_IRQn = 33,
  I2C2_ER_IRQn = 34,
  SPI1_IRQn = 35,
  SPI2_IRQn = 36,
  USART1_IRQn = 37,
  USART2_IRQn = 38,
  USART3_IRQn = 39,
  EXTI15_10_IRQn = 40,
  RTC_Alarm_IRQn = 41,
  OTG_FS_WKUP_IRQn = 42,
  TIM8_BRK_TIM12_IRQn = 43,
  TIM8_UP_TIM13_IRQn = 44,
  TIM8_TRG_COM_TIM14_IRQn = 45,
  TIM8_CC_IRQn = 46,
  DMA1_Stream7_IRQn = 47,
  FMC_IRQn = 48,
  SDMMC1_IRQn = 49,
  TIM5_IRQn = 50,
  SPI3_IRQn = 51,
  UART4_IRQn = 52,
  UART5_IRQn = 53,
  TIM6_DAC_IRQn = 54,
  TIM7_IRQn = 55,
  DMA2_Stream0_IRQn = 56,
  DMA2_Stream1_IRQn = 57,
  DMA2_Stream2_IRQn = 58,
  DMA2_Stream3_IRQn = 59,
  DMA2_Stream4_IRQn = 60,
  ETH_IRQn = 61,
  ETH_WKUP_IRQn = 62,
  CAN2_TX_IRQn = 63,
  CAN2_RX0_IRQn = 64,
  CAN2_RX1_IRQn = 65,
  CAN2_SCE_IRQn = 66,
  OTG_FS_IRQn = 67,
  DMA2_Stream5_IRQn = 68,
  DMA2_Stream6_IRQn = 69,
  DMA2_Stream7_IRQn = 70,
  USART6_IRQn = 71,
  I2C3_EV_IRQn = 72,
  I2C3_ER_IRQn = 73,
  OTG_HS_EP1_OUT_IRQn = 74,
  OTG_HS_EP1_IN_IRQn = 75,
  OTG_HS_WKUP_IRQn = 76,
  OTG_HS_IRQn = 77,
  DCMI_IRQn = 78,
  RNG_IRQn = 80,
  FPU_IRQn = 81,
  UART7_IRQn = 82,
  UART8_IRQn = 83,
  SPI4_IRQn = 84,
  SPI5_IRQn = 85,
  SPI6_IRQn = 86,
  SAI1_IRQn = 87,
  LTDC_IRQn = 88,
  LTDC_ER_IRQn = 89,
  DMA2D_IRQn = 90,
  SAI2_IRQn = 91,
  QUADSPI_IRQn = 92,
  LPTIM1_IRQn = 93,
  CEC_IRQn = 94,
  I2C4_EV_IRQn = 95,
  I2C4_ER_IRQn = 96,
  SPDIF_RX_IRQn = 97,
} IRQn_Type;
# 190 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f746xx.h"
# 1 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include\\core_cm7.h" 1
# 29 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include\\core_cm7.h" 3





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
# 35 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include\\core_cm7.h" 2 3
# 63 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include\\core_cm7.h" 3
# 1 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include/cmsis_version.h" 1 3
# 29 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include/cmsis_version.h" 3
# 64 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include\\core_cm7.h" 2 3
# 162 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include\\core_cm7.h" 3
# 1 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include/cmsis_compiler.h" 1 3
# 41 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include/cmsis_compiler.h" 3
# 1 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include/cmsis_armclang.h" 1 3
# 31 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include/cmsis_armclang.h" 3


# 1 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\arm_compat.h" 1 3






# 1 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\arm_acle.h" 1 3
# 48 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\arm_acle.h" 3
static __inline__ void __attribute__((__always_inline__, __nodebug__)) __wfi(void) {
  __builtin_arm_wfi();
}

static __inline__ void __attribute__((__always_inline__, __nodebug__)) __wfe(void) {
  __builtin_arm_wfe();
}

static __inline__ void __attribute__((__always_inline__, __nodebug__)) __sev(void) {
  __builtin_arm_sev();
}

static __inline__ void __attribute__((__always_inline__, __nodebug__)) __sevl(void) {
  __builtin_arm_sevl();
}

static __inline__ void __attribute__((__always_inline__, __nodebug__)) __yield(void) {
  __builtin_arm_yield();
}







static __inline__ uint32_t __attribute__((__always_inline__, __nodebug__))
__swp(uint32_t __x, volatile uint32_t *__p) {
  uint32_t v;
  do
    v = __builtin_arm_ldrex(__p);
  while (__builtin_arm_strex(__x, __p));
  return v;
}
# 107 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\arm_acle.h" 3
static __inline__ void __attribute__((__always_inline__, __nodebug__)) __nop(void) {
  __builtin_arm_nop();
}




static __inline__ uint32_t __attribute__((__always_inline__, __nodebug__))
__ror(uint32_t __x, uint32_t __y) {
  __y %= 32;
  if (__y == 0)
    return __x;
  return (__x >> __y) | (__x << (32 - __y));
}

static __inline__ uint64_t __attribute__((__always_inline__, __nodebug__))
__rorll(uint64_t __x, uint32_t __y) {
  __y %= 64;
  if (__y == 0)
    return __x;
  return (__x >> __y) | (__x << (64 - __y));
}

static __inline__ unsigned long __attribute__((__always_inline__, __nodebug__))
__rorl(unsigned long __x, uint32_t __y) {

  return __ror(__x, __y);



}



static __inline__ uint32_t __attribute__((__always_inline__, __nodebug__))
__clz(uint32_t __t) {
  return __builtin_clz(__t);
}

static __inline__ unsigned long __attribute__((__always_inline__, __nodebug__))
__clzl(unsigned long __t) {
  return __builtin_clzl(__t);
}

static __inline__ uint64_t __attribute__((__always_inline__, __nodebug__))
__clzll(uint64_t __t) {
  return __builtin_clzll(__t);
}


static __inline__ uint32_t __attribute__((__always_inline__, __nodebug__))
__rev(uint32_t __t) {
  return __builtin_bswap32(__t);
}

static __inline__ unsigned long __attribute__((__always_inline__, __nodebug__))
__revl(unsigned long __t) {

  return __builtin_bswap32(__t);



}

static __inline__ uint64_t __attribute__((__always_inline__, __nodebug__))
__revll(uint64_t __t) {
  return __builtin_bswap64(__t);
}


static __inline__ uint32_t __attribute__((__always_inline__, __nodebug__))
__rev16(uint32_t __t) {
  return __ror(__rev(__t), 16);
}

static __inline__ uint64_t __attribute__((__always_inline__, __nodebug__))
__rev16ll(uint64_t __t) {
  return (((uint64_t)__rev16(__t >> 32)) << 32) | __rev16(__t);
}

static __inline__ unsigned long __attribute__((__always_inline__, __nodebug__))
__rev16l(unsigned long __t) {

    return __rev16(__t);



}


static __inline__ int16_t __attribute__((__always_inline__, __nodebug__))
__revsh(int16_t __t) {
  return __builtin_bswap16(__t);
}


static __inline__ uint32_t __attribute__((__always_inline__, __nodebug__))
__rbit(uint32_t __t) {
  return __builtin_arm_rbit(__t);
}

static __inline__ uint64_t __attribute__((__always_inline__, __nodebug__))
__rbitll(uint64_t __t) {

  return (((uint64_t)__builtin_arm_rbit(__t)) << 32) |
         __builtin_arm_rbit(__t >> 32);



}

static __inline__ unsigned long __attribute__((__always_inline__, __nodebug__))
__rbitl(unsigned long __t) {

  return __rbit(__t);



}





static __inline__ int32_t __attribute__((__always_inline__,__nodebug__))
__smulbb(int32_t __a, int32_t __b) {
  return __builtin_arm_smulbb(__a, __b);
}
static __inline__ int32_t __attribute__((__always_inline__,__nodebug__))
__smulbt(int32_t __a, int32_t __b) {
  return __builtin_arm_smulbt(__a, __b);
}
static __inline__ int32_t __attribute__((__always_inline__,__nodebug__))
__smultb(int32_t __a, int32_t __b) {
  return __builtin_arm_smultb(__a, __b);
}
static __inline__ int32_t __attribute__((__always_inline__,__nodebug__))
__smultt(int32_t __a, int32_t __b) {
  return __builtin_arm_smultt(__a, __b);
}
static __inline__ int32_t __attribute__((__always_inline__,__nodebug__))
__smulwb(int32_t __a, int32_t __b) {
  return __builtin_arm_smulwb(__a, __b);
}
static __inline__ int32_t __attribute__((__always_inline__,__nodebug__))
__smulwt(int32_t __a, int32_t __b) {
  return __builtin_arm_smulwt(__a, __b);
}
# 271 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\arm_acle.h" 3
static __inline__ int32_t __attribute__((__always_inline__, __nodebug__))
__qadd(int32_t __t, int32_t __v) {
  return __builtin_arm_qadd(__t, __v);
}

static __inline__ int32_t __attribute__((__always_inline__, __nodebug__))
__qsub(int32_t __t, int32_t __v) {
  return __builtin_arm_qsub(__t, __v);
}

static __inline__ int32_t __attribute__((__always_inline__, __nodebug__))
__qdbl(int32_t __t) {
  return __builtin_arm_qadd(__t, __t);
}




static __inline__ int32_t __attribute__((__always_inline__, __nodebug__))
__smlabb(int32_t __a, int32_t __b, int32_t __c) {
  return __builtin_arm_smlabb(__a, __b, __c);
}
static __inline__ int32_t __attribute__((__always_inline__, __nodebug__))
__smlabt(int32_t __a, int32_t __b, int32_t __c) {
  return __builtin_arm_smlabt(__a, __b, __c);
}
static __inline__ int32_t __attribute__((__always_inline__, __nodebug__))
__smlatb(int32_t __a, int32_t __b, int32_t __c) {
  return __builtin_arm_smlatb(__a, __b, __c);
}
static __inline__ int32_t __attribute__((__always_inline__, __nodebug__))
__smlatt(int32_t __a, int32_t __b, int32_t __c) {
  return __builtin_arm_smlatt(__a, __b, __c);
}
static __inline__ int32_t __attribute__((__always_inline__, __nodebug__))
__smlawb(int32_t __a, int32_t __b, int32_t __c) {
  return __builtin_arm_smlawb(__a, __b, __c);
}
static __inline__ int32_t __attribute__((__always_inline__, __nodebug__))
__smlawt(int32_t __a, int32_t __b, int32_t __c) {
  return __builtin_arm_smlawt(__a, __b, __c);
}
# 324 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\arm_acle.h" 3
typedef int32_t int8x4_t;
typedef int32_t int16x2_t;
typedef uint32_t uint8x4_t;
typedef uint32_t uint16x2_t;

static __inline__ int16x2_t __attribute__((__always_inline__, __nodebug__))
__sxtab16(int16x2_t __a, int8x4_t __b) {
  return __builtin_arm_sxtab16(__a, __b);
}
static __inline__ int16x2_t __attribute__((__always_inline__, __nodebug__))
__sxtb16(int8x4_t __a) {
  return __builtin_arm_sxtb16(__a);
}
static __inline__ int16x2_t __attribute__((__always_inline__, __nodebug__))
__uxtab16(int16x2_t __a, int8x4_t __b) {
  return __builtin_arm_uxtab16(__a, __b);
}
static __inline__ int16x2_t __attribute__((__always_inline__, __nodebug__))
__uxtb16(int8x4_t __a) {
  return __builtin_arm_uxtb16(__a);
}




static __inline__ uint8x4_t __attribute__((__always_inline__, __nodebug__))
__sel(uint8x4_t __a, uint8x4_t __b) {
  return __builtin_arm_sel(__a, __b);
}




static __inline__ int8x4_t __attribute__((__always_inline__, __nodebug__))
__qadd8(int8x4_t __a, int8x4_t __b) {
  return __builtin_arm_qadd8(__a, __b);
}
static __inline__ int8x4_t __attribute__((__always_inline__, __nodebug__))
__qsub8(int8x4_t __a, int8x4_t __b) {
  return __builtin_arm_qsub8(__a, __b);
}
static __inline__ int8x4_t __attribute__((__always_inline__, __nodebug__))
__sadd8(int8x4_t __a, int8x4_t __b) {
  return __builtin_arm_sadd8(__a, __b);
}
static __inline__ int8x4_t __attribute__((__always_inline__, __nodebug__))
__shadd8(int8x4_t __a, int8x4_t __b) {
  return __builtin_arm_shadd8(__a, __b);
}
static __inline__ int8x4_t __attribute__((__always_inline__, __nodebug__))
__shsub8(int8x4_t __a, int8x4_t __b) {
  return __builtin_arm_shsub8(__a, __b);
}
static __inline__ int8x4_t __attribute__((__always_inline__, __nodebug__))
__ssub8(int8x4_t __a, int8x4_t __b) {
  return __builtin_arm_ssub8(__a, __b);
}
static __inline__ uint8x4_t __attribute__((__always_inline__, __nodebug__))
__uadd8(uint8x4_t __a, uint8x4_t __b) {
  return __builtin_arm_uadd8(__a, __b);
}
static __inline__ uint8x4_t __attribute__((__always_inline__, __nodebug__))
__uhadd8(uint8x4_t __a, uint8x4_t __b) {
  return __builtin_arm_uhadd8(__a, __b);
}
static __inline__ uint8x4_t __attribute__((__always_inline__, __nodebug__))
__uhsub8(uint8x4_t __a, uint8x4_t __b) {
  return __builtin_arm_uhsub8(__a, __b);
}
static __inline__ uint8x4_t __attribute__((__always_inline__, __nodebug__))
__uqadd8(uint8x4_t __a, uint8x4_t __b) {
  return __builtin_arm_uqadd8(__a, __b);
}
static __inline__ uint8x4_t __attribute__((__always_inline__, __nodebug__))
__uqsub8(uint8x4_t __a, uint8x4_t __b) {
  return __builtin_arm_uqsub8(__a, __b);
}
static __inline__ uint8x4_t __attribute__((__always_inline__, __nodebug__))
__usub8(uint8x4_t __a, uint8x4_t __b) {
  return __builtin_arm_usub8(__a, __b);
}




static __inline__ uint32_t __attribute__((__always_inline__, __nodebug__))
__usad8(uint8x4_t __a, uint8x4_t __b) {
  return __builtin_arm_usad8(__a, __b);
}
static __inline__ uint32_t __attribute__((__always_inline__, __nodebug__))
__usada8(uint8x4_t __a, uint8x4_t __b, uint32_t __c) {
  return __builtin_arm_usada8(__a, __b, __c);
}




static __inline__ int16x2_t __attribute__((__always_inline__, __nodebug__))
__qadd16(int16x2_t __a, int16x2_t __b) {
  return __builtin_arm_qadd16(__a, __b);
}
static __inline__ int16x2_t __attribute__((__always_inline__, __nodebug__))
__qasx(int16x2_t __a, int16x2_t __b) {
  return __builtin_arm_qasx(__a, __b);
}
static __inline__ int16x2_t __attribute__((__always_inline__, __nodebug__))
__qsax(int16x2_t __a, int16x2_t __b) {
  return __builtin_arm_qsax(__a, __b);
}
static __inline__ int16x2_t __attribute__((__always_inline__, __nodebug__))
__qsub16(int16x2_t __a, int16x2_t __b) {
  return __builtin_arm_qsub16(__a, __b);
}
static __inline__ int16x2_t __attribute__((__always_inline__, __nodebug__))
__sadd16(int16x2_t __a, int16x2_t __b) {
  return __builtin_arm_sadd16(__a, __b);
}
static __inline__ int16x2_t __attribute__((__always_inline__, __nodebug__))
__sasx(int16x2_t __a, int16x2_t __b) {
  return __builtin_arm_sasx(__a, __b);
}
static __inline__ int16x2_t __attribute__((__always_inline__, __nodebug__))
__shadd16(int16x2_t __a, int16x2_t __b) {
  return __builtin_arm_shadd16(__a, __b);
}
static __inline__ int16x2_t __attribute__((__always_inline__, __nodebug__))
__shasx(int16x2_t __a, int16x2_t __b) {
  return __builtin_arm_shasx(__a, __b);
}
static __inline__ int16x2_t __attribute__((__always_inline__, __nodebug__))
__shsax(int16x2_t __a, int16x2_t __b) {
  return __builtin_arm_shsax(__a, __b);
}
static __inline__ int16x2_t __attribute__((__always_inline__, __nodebug__))
__shsub16(int16x2_t __a, int16x2_t __b) {
  return __builtin_arm_shsub16(__a, __b);
}
static __inline__ int16x2_t __attribute__((__always_inline__, __nodebug__))
__ssax(int16x2_t __a, int16x2_t __b) {
  return __builtin_arm_ssax(__a, __b);
}
static __inline__ int16x2_t __attribute__((__always_inline__, __nodebug__))
__ssub16(int16x2_t __a, int16x2_t __b) {
  return __builtin_arm_ssub16(__a, __b);
}
static __inline__ uint16x2_t __attribute__((__always_inline__, __nodebug__))
__uadd16(uint16x2_t __a, uint16x2_t __b) {
  return __builtin_arm_uadd16(__a, __b);
}
static __inline__ uint16x2_t __attribute__((__always_inline__, __nodebug__))
__uasx(uint16x2_t __a, uint16x2_t __b) {
  return __builtin_arm_uasx(__a, __b);
}
static __inline__ uint16x2_t __attribute__((__always_inline__, __nodebug__))
__uhadd16(uint16x2_t __a, uint16x2_t __b) {
  return __builtin_arm_uhadd16(__a, __b);
}
static __inline__ uint16x2_t __attribute__((__always_inline__, __nodebug__))
__uhasx(uint16x2_t __a, uint16x2_t __b) {
  return __builtin_arm_uhasx(__a, __b);
}
static __inline__ uint16x2_t __attribute__((__always_inline__, __nodebug__))
__uhsax(uint16x2_t __a, uint16x2_t __b) {
  return __builtin_arm_uhsax(__a, __b);
}
static __inline__ uint16x2_t __attribute__((__always_inline__, __nodebug__))
__uhsub16(uint16x2_t __a, uint16x2_t __b) {
  return __builtin_arm_uhsub16(__a, __b);
}
static __inline__ uint16x2_t __attribute__((__always_inline__, __nodebug__))
__uqadd16(uint16x2_t __a, uint16x2_t __b) {
  return __builtin_arm_uqadd16(__a, __b);
}
static __inline__ uint16x2_t __attribute__((__always_inline__, __nodebug__))
__uqasx(uint16x2_t __a, uint16x2_t __b) {
  return __builtin_arm_uqasx(__a, __b);
}
static __inline__ uint16x2_t __attribute__((__always_inline__, __nodebug__))
__uqsax(uint16x2_t __a, uint16x2_t __b) {
  return __builtin_arm_uqsax(__a, __b);
}
static __inline__ uint16x2_t __attribute__((__always_inline__, __nodebug__))
__uqsub16(uint16x2_t __a, uint16x2_t __b) {
  return __builtin_arm_uqsub16(__a, __b);
}
static __inline__ uint16x2_t __attribute__((__always_inline__, __nodebug__))
__usax(uint16x2_t __a, uint16x2_t __b) {
  return __builtin_arm_usax(__a, __b);
}
static __inline__ uint16x2_t __attribute__((__always_inline__, __nodebug__))
__usub16(uint16x2_t __a, uint16x2_t __b) {
  return __builtin_arm_usub16(__a, __b);
}




static __inline__ int32_t __attribute__((__always_inline__, __nodebug__))
__smlad(int16x2_t __a, int16x2_t __b, int32_t __c) {
  return __builtin_arm_smlad(__a, __b, __c);
}
static __inline__ int32_t __attribute__((__always_inline__, __nodebug__))
__smladx(int16x2_t __a, int16x2_t __b, int32_t __c) {
  return __builtin_arm_smladx(__a, __b, __c);
}
static __inline__ int64_t __attribute__((__always_inline__, __nodebug__))
__smlald(int16x2_t __a, int16x2_t __b, int64_t __c) {
  return __builtin_arm_smlald(__a, __b, __c);
}
static __inline__ int64_t __attribute__((__always_inline__, __nodebug__))
__smlaldx(int16x2_t __a, int16x2_t __b, int64_t __c) {
  return __builtin_arm_smlaldx(__a, __b, __c);
}
static __inline__ int32_t __attribute__((__always_inline__, __nodebug__))
__smlsd(int16x2_t __a, int16x2_t __b, int32_t __c) {
  return __builtin_arm_smlsd(__a, __b, __c);
}
static __inline__ int32_t __attribute__((__always_inline__, __nodebug__))
__smlsdx(int16x2_t __a, int16x2_t __b, int32_t __c) {
  return __builtin_arm_smlsdx(__a, __b, __c);
}
static __inline__ int64_t __attribute__((__always_inline__, __nodebug__))
__smlsld(int16x2_t __a, int16x2_t __b, int64_t __c) {
  return __builtin_arm_smlsld(__a, __b, __c);
}
static __inline__ int64_t __attribute__((__always_inline__, __nodebug__))
__smlsldx(int16x2_t __a, int16x2_t __b, int64_t __c) {
  return __builtin_arm_smlsldx(__a, __b, __c);
}
static __inline__ int32_t __attribute__((__always_inline__, __nodebug__))
__smuad(int16x2_t __a, int16x2_t __b) {
  return __builtin_arm_smuad(__a, __b);
}
static __inline__ int32_t __attribute__((__always_inline__, __nodebug__))
__smuadx(int16x2_t __a, int16x2_t __b) {
  return __builtin_arm_smuadx(__a, __b);
}
static __inline__ int32_t __attribute__((__always_inline__, __nodebug__))
__smusd(int16x2_t __a, int16x2_t __b) {
  return __builtin_arm_smusd(__a, __b);
}
static __inline__ int32_t __attribute__((__always_inline__, __nodebug__))
__smusdx(int16x2_t __a, int16x2_t __b) {
  return __builtin_arm_smusdx(__a, __b);
}
# 8 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\arm_compat.h" 2 3
# 40 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\arm_compat.h" 3
static __inline__ unsigned int __attribute__((__always_inline__, __nodebug__))
__disable_fiq(void) {
  unsigned int cpsr;

  __asm__ __volatile__("mrs %[cpsr], faultmask\n"
                       "cpsid f\n"
                       : [cpsr] "=r"(cpsr));
  return cpsr & 0x1;
# 62 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\arm_compat.h" 3
}


static __inline__ unsigned int __attribute__((__always_inline__, __nodebug__))
__disable_irq(void) {
  unsigned int cpsr;


  __asm__ __volatile__("mrs %[cpsr], primask\n"
                       "cpsid i\n"
                       : [cpsr] "=r"(cpsr));
  return cpsr & 0x1;
# 89 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\arm_compat.h" 3
}







static __inline__ void __attribute__((__always_inline__, __nodebug__))
__enable_fiq(void) {

  __asm__ __volatile__("cpsie f");
# 109 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\arm_compat.h" 3
}


static __inline__ void __attribute__((__always_inline__, __nodebug__))
__enable_irq(void) {

  __asm__ __volatile__("cpsie i");
# 124 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\arm_compat.h" 3
}

static __inline__ void __attribute__((__always_inline__, __nodebug__)) __force_stores(void) {
    __asm__ __volatile__ ("" : : : "memory", "cc");
}

static void __attribute__((__always_inline__, __nodebug__)) __memory_changed(void) {
    __asm__ __volatile__ ("" : : : "memory", "cc");
}

static void __attribute__((__always_inline__, __nodebug__)) __schedule_barrier(void) {
    __asm__ __volatile__ ("" : : : "memory", "cc");
}

static __inline__ int __attribute__((__always_inline__, __nodebug__))
__semihost(int val, const void *ptr) {
  register int v __asm__("r0") = val;
  register const void *p __asm__("r1") = ptr;
  __asm__ __volatile__(


      "bkpt 0xab"
# 160 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\arm_compat.h" 3
      : "+r"(v), "+r"(p)
      :
      : "memory", "cc");
  return v;
}


static __inline__ unsigned int __attribute__((__always_inline__, __nodebug__))
__vfp_status(unsigned int mask, unsigned int flags) {
  unsigned int fpscr;
  __asm__ __volatile__("vmrs %[fpscr], fpscr" : [fpscr] "=r"(fpscr));
  unsigned int set = mask & flags;
  unsigned int clear = mask & ~flags;
  unsigned int toggle = ~mask & flags;
  fpscr |= set;
  fpscr &= ~clear;
  fpscr ^= toggle;
  __asm__ __volatile__("vmsr fpscr, %[fpscr]" : : [fpscr] "r"(fpscr));
  return fpscr;
}
# 34 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include/cmsis_armclang.h" 2 3
# 68 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include/cmsis_armclang.h" 3
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wpacked"

 struct __attribute__((packed)) T_UINT32 { uint32_t v; };
#pragma clang diagnostic pop



#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wpacked"

 struct __attribute__((packed, aligned(1))) T_UINT16_WRITE { uint16_t v; };
#pragma clang diagnostic pop



#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wpacked"

 struct __attribute__((packed, aligned(1))) T_UINT16_READ { uint16_t v; };
#pragma clang diagnostic pop



#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wpacked"

 struct __attribute__((packed, aligned(1))) T_UINT32_WRITE { uint32_t v; };
#pragma clang diagnostic pop



#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wpacked"

 struct __attribute__((packed, aligned(1))) T_UINT32_READ { uint32_t v; };
#pragma clang diagnostic pop
# 142 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline uint32_t __get_CONTROL(void)
{
  uint32_t result;

  __asm volatile ("MRS %0, control" : "=r" (result) );
  return(result);
}
# 172 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline void __set_CONTROL(uint32_t control)
{
  __asm volatile ("MSR control, %0" : : "r" (control) : "memory");
}
# 196 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline uint32_t __get_IPSR(void)
{
  uint32_t result;

  __asm volatile ("MRS %0, ipsr" : "=r" (result) );
  return(result);
}







__attribute__((always_inline)) static __inline uint32_t __get_APSR(void)
{
  uint32_t result;

  __asm volatile ("MRS %0, apsr" : "=r" (result) );
  return(result);
}







__attribute__((always_inline)) static __inline uint32_t __get_xPSR(void)
{
  uint32_t result;

  __asm volatile ("MRS %0, xpsr" : "=r" (result) );
  return(result);
}







__attribute__((always_inline)) static __inline uint32_t __get_PSP(void)
{
  register uint32_t result;

  __asm volatile ("MRS %0, psp" : "=r" (result) );
  return(result);
}
# 268 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline void __set_PSP(uint32_t topOfProcStack)
{
  __asm volatile ("MSR psp, %0" : : "r" (topOfProcStack) : );
}
# 292 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline uint32_t __get_MSP(void)
{
  register uint32_t result;

  __asm volatile ("MRS %0, msp" : "=r" (result) );
  return(result);
}
# 322 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline void __set_MSP(uint32_t topOfMainStack)
{
  __asm volatile ("MSR msp, %0" : : "r" (topOfMainStack) : );
}
# 373 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline uint32_t __get_PRIMASK(void)
{
  uint32_t result;

  __asm volatile ("MRS %0, primask" : "=r" (result) );
  return(result);
}
# 403 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline void __set_PRIMASK(uint32_t priMask)
{
  __asm volatile ("MSR primask, %0" : : "r" (priMask) : "memory");
}
# 446 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline uint32_t __get_BASEPRI(void)
{
  uint32_t result;

  __asm volatile ("MRS %0, basepri" : "=r" (result) );
  return(result);
}
# 476 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline void __set_BASEPRI(uint32_t basePri)
{
  __asm volatile ("MSR basepri, %0" : : "r" (basePri) : "memory");
}
# 501 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline void __set_BASEPRI_MAX(uint32_t basePri)
{
  __asm volatile ("MSR basepri_max, %0" : : "r" (basePri) : "memory");
}







__attribute__((always_inline)) static __inline uint32_t __get_FAULTMASK(void)
{
  uint32_t result;

  __asm volatile ("MRS %0, faultmask" : "=r" (result) );
  return(result);
}
# 542 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline void __set_FAULTMASK(uint32_t faultMask)
{
  __asm volatile ("MSR faultmask, %0" : : "r" (faultMask) : "memory");
}
# 884 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline uint32_t __ROR(uint32_t op1, uint32_t op2)
{
  op2 %= 32U;
  if (op2 == 0U)
  {
    return op1;
  }
  return (op1 >> op2) | (op1 << (32U - op2));
}
# 1029 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline uint32_t __RRX(uint32_t value)
{
  uint32_t result;

  __asm volatile ("rrx %0, %1" : "=r" (result) : "r" (value) );
  return(result);
}
# 1044 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline uint8_t __LDRBT(volatile uint8_t *ptr)
{
  uint32_t result;

  __asm volatile ("ldrbt %0, %1" : "=r" (result) : "Q" (*ptr) );
  return ((uint8_t) result);
}
# 1059 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline uint16_t __LDRHT(volatile uint16_t *ptr)
{
  uint32_t result;

  __asm volatile ("ldrht %0, %1" : "=r" (result) : "Q" (*ptr) );
  return ((uint16_t) result);
}
# 1074 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline uint32_t __LDRT(volatile uint32_t *ptr)
{
  uint32_t result;

  __asm volatile ("ldrt %0, %1" : "=r" (result) : "Q" (*ptr) );
  return(result);
}
# 1089 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline void __STRBT(uint8_t value, volatile uint8_t *ptr)
{
  __asm volatile ("strbt %1, %0" : "=Q" (*ptr) : "r" ((uint32_t)value) );
}
# 1101 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline void __STRHT(uint16_t value, volatile uint16_t *ptr)
{
  __asm volatile ("strht %1, %0" : "=Q" (*ptr) : "r" ((uint32_t)value) );
}
# 1113 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline void __STRT(uint32_t value, volatile uint32_t *ptr)
{
  __asm volatile ("strt %1, %0" : "=Q" (*ptr) : "r" (value) );
}
# 1332 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline uint32_t __SADD8(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm volatile ("sadd8 %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static __inline uint32_t __QADD8(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm volatile ("qadd8 %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static __inline uint32_t __SHADD8(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm volatile ("shadd8 %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static __inline uint32_t __UADD8(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm volatile ("uadd8 %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static __inline uint32_t __UQADD8(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm volatile ("uqadd8 %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static __inline uint32_t __UHADD8(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm volatile ("uhadd8 %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}


__attribute__((always_inline)) static __inline uint32_t __SSUB8(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm volatile ("ssub8 %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static __inline uint32_t __QSUB8(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm volatile ("qsub8 %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static __inline uint32_t __SHSUB8(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm volatile ("shsub8 %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static __inline uint32_t __USUB8(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm volatile ("usub8 %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static __inline uint32_t __UQSUB8(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm volatile ("uqsub8 %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static __inline uint32_t __UHSUB8(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm volatile ("uhsub8 %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}


__attribute__((always_inline)) static __inline uint32_t __SADD16(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm volatile ("sadd16 %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static __inline uint32_t __QADD16(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm volatile ("qadd16 %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static __inline uint32_t __SHADD16(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm volatile ("shadd16 %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static __inline uint32_t __UADD16(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm volatile ("uadd16 %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static __inline uint32_t __UQADD16(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm volatile ("uqadd16 %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static __inline uint32_t __UHADD16(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm volatile ("uhadd16 %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static __inline uint32_t __SSUB16(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm volatile ("ssub16 %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static __inline uint32_t __QSUB16(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm volatile ("qsub16 %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static __inline uint32_t __SHSUB16(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm volatile ("shsub16 %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static __inline uint32_t __USUB16(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm volatile ("usub16 %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static __inline uint32_t __UQSUB16(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm volatile ("uqsub16 %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static __inline uint32_t __UHSUB16(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm volatile ("uhsub16 %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static __inline uint32_t __SASX(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm volatile ("sasx %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static __inline uint32_t __QASX(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm volatile ("qasx %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static __inline uint32_t __SHASX(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm volatile ("shasx %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static __inline uint32_t __UASX(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm volatile ("uasx %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static __inline uint32_t __UQASX(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm volatile ("uqasx %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static __inline uint32_t __UHASX(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm volatile ("uhasx %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static __inline uint32_t __SSAX(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm volatile ("ssax %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static __inline uint32_t __QSAX(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm volatile ("qsax %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static __inline uint32_t __SHSAX(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm volatile ("shsax %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static __inline uint32_t __USAX(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm volatile ("usax %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static __inline uint32_t __UQSAX(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm volatile ("uqsax %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static __inline uint32_t __UHSAX(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm volatile ("uhsax %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static __inline uint32_t __USAD8(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm volatile ("usad8 %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static __inline uint32_t __USADA8(uint32_t op1, uint32_t op2, uint32_t op3)
{
  uint32_t result;

  __asm volatile ("usada8 %0, %1, %2, %3" : "=r" (result) : "r" (op1), "r" (op2), "r" (op3) );
  return(result);
}
# 1652 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline uint32_t __UXTB16(uint32_t op1)
{
  uint32_t result;

  __asm volatile ("uxtb16 %0, %1" : "=r" (result) : "r" (op1));
  return(result);
}

__attribute__((always_inline)) static __inline uint32_t __UXTAB16(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm volatile ("uxtab16 %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static __inline uint32_t __SXTB16(uint32_t op1)
{
  uint32_t result;

  __asm volatile ("sxtb16 %0, %1" : "=r" (result) : "r" (op1));
  return(result);
}

__attribute__((always_inline)) static __inline uint32_t __SXTAB16(uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm volatile ("sxtab16 %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static __inline uint32_t __SMUAD (uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm volatile ("smuad %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static __inline uint32_t __SMUADX (uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm volatile ("smuadx %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static __inline uint32_t __SMLAD (uint32_t op1, uint32_t op2, uint32_t op3)
{
  uint32_t result;

  __asm volatile ("smlad %0, %1, %2, %3" : "=r" (result) : "r" (op1), "r" (op2), "r" (op3) );
  return(result);
}

__attribute__((always_inline)) static __inline uint32_t __SMLADX (uint32_t op1, uint32_t op2, uint32_t op3)
{
  uint32_t result;

  __asm volatile ("smladx %0, %1, %2, %3" : "=r" (result) : "r" (op1), "r" (op2), "r" (op3) );
  return(result);
}

__attribute__((always_inline)) static __inline uint64_t __SMLALD (uint32_t op1, uint32_t op2, uint64_t acc)
{
  union llreg_u{
    uint32_t w32[2];
    uint64_t w64;
  } llr;
  llr.w64 = acc;


  __asm volatile ("smlald %0, %1, %2, %3" : "=r" (llr.w32[0]), "=r" (llr.w32[1]): "r" (op1), "r" (op2) , "0" (llr.w32[0]), "1" (llr.w32[1]) );




  return(llr.w64);
}

__attribute__((always_inline)) static __inline uint64_t __SMLALDX (uint32_t op1, uint32_t op2, uint64_t acc)
{
  union llreg_u{
    uint32_t w32[2];
    uint64_t w64;
  } llr;
  llr.w64 = acc;


  __asm volatile ("smlaldx %0, %1, %2, %3" : "=r" (llr.w32[0]), "=r" (llr.w32[1]): "r" (op1), "r" (op2) , "0" (llr.w32[0]), "1" (llr.w32[1]) );




  return(llr.w64);
}

__attribute__((always_inline)) static __inline uint32_t __SMUSD (uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm volatile ("smusd %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static __inline uint32_t __SMUSDX (uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm volatile ("smusdx %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static __inline uint32_t __SMLSD (uint32_t op1, uint32_t op2, uint32_t op3)
{
  uint32_t result;

  __asm volatile ("smlsd %0, %1, %2, %3" : "=r" (result) : "r" (op1), "r" (op2), "r" (op3) );
  return(result);
}

__attribute__((always_inline)) static __inline uint32_t __SMLSDX (uint32_t op1, uint32_t op2, uint32_t op3)
{
  uint32_t result;

  __asm volatile ("smlsdx %0, %1, %2, %3" : "=r" (result) : "r" (op1), "r" (op2), "r" (op3) );
  return(result);
}

__attribute__((always_inline)) static __inline uint64_t __SMLSLD (uint32_t op1, uint32_t op2, uint64_t acc)
{
  union llreg_u{
    uint32_t w32[2];
    uint64_t w64;
  } llr;
  llr.w64 = acc;


  __asm volatile ("smlsld %0, %1, %2, %3" : "=r" (llr.w32[0]), "=r" (llr.w32[1]): "r" (op1), "r" (op2) , "0" (llr.w32[0]), "1" (llr.w32[1]) );




  return(llr.w64);
}

__attribute__((always_inline)) static __inline uint64_t __SMLSLDX (uint32_t op1, uint32_t op2, uint64_t acc)
{
  union llreg_u{
    uint32_t w32[2];
    uint64_t w64;
  } llr;
  llr.w64 = acc;


  __asm volatile ("smlsldx %0, %1, %2, %3" : "=r" (llr.w32[0]), "=r" (llr.w32[1]): "r" (op1), "r" (op2) , "0" (llr.w32[0]), "1" (llr.w32[1]) );




  return(llr.w64);
}

__attribute__((always_inline)) static __inline uint32_t __SEL (uint32_t op1, uint32_t op2)
{
  uint32_t result;

  __asm volatile ("sel %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static __inline int32_t __QADD( int32_t op1, int32_t op2)
{
  int32_t result;

  __asm volatile ("qadd %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}

__attribute__((always_inline)) static __inline int32_t __QSUB( int32_t op1, int32_t op2)
{
  int32_t result;

  __asm volatile ("qsub %0, %1, %2" : "=r" (result) : "r" (op1), "r" (op2) );
  return(result);
}
# 1865 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline int32_t __SMMLA (int32_t op1, int32_t op2, int32_t op3)
{
  int32_t result;

  __asm volatile ("smmla %0, %1, %2, %3" : "=r" (result): "r" (op1), "r" (op2), "r" (op3) );
  return(result);
}
# 42 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include/cmsis_compiler.h" 2 3
# 163 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include\\core_cm7.h" 2 3
# 274 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include\\core_cm7.h" 3
typedef union
{
  struct
  {
    uint32_t _reserved0:16;
    uint32_t GE:4;
    uint32_t _reserved1:7;
    uint32_t Q:1;
    uint32_t V:1;
    uint32_t C:1;
    uint32_t Z:1;
    uint32_t N:1;
  } b;
  uint32_t w;
} APSR_Type;
# 313 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include\\core_cm7.h" 3
typedef union
{
  struct
  {
    uint32_t ISR:9;
    uint32_t _reserved0:23;
  } b;
  uint32_t w;
} IPSR_Type;
# 331 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include\\core_cm7.h" 3
typedef union
{
  struct
  {
    uint32_t ISR:9;
    uint32_t _reserved0:1;
    uint32_t ICI_IT_1:6;
    uint32_t GE:4;
    uint32_t _reserved1:4;
    uint32_t T:1;
    uint32_t ICI_IT_2:2;
    uint32_t Q:1;
    uint32_t V:1;
    uint32_t C:1;
    uint32_t Z:1;
    uint32_t N:1;
  } b;
  uint32_t w;
} xPSR_Type;
# 386 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include\\core_cm7.h" 3
typedef union
{
  struct
  {
    uint32_t nPRIV:1;
    uint32_t SPSEL:1;
    uint32_t FPCA:1;
    uint32_t _reserved0:29;
  } b;
  uint32_t w;
} CONTROL_Type;
# 421 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include\\core_cm7.h" 3
typedef struct
{
  volatile uint32_t ISER[8U];
        uint32_t RESERVED0[24U];
  volatile uint32_t ICER[8U];
        uint32_t RSERVED1[24U];
  volatile uint32_t ISPR[8U];
        uint32_t RESERVED2[24U];
  volatile uint32_t ICPR[8U];
        uint32_t RESERVED3[24U];
  volatile uint32_t IABR[8U];
        uint32_t RESERVED4[56U];
  volatile uint8_t IP[240U];
        uint32_t RESERVED5[644U];
  volatile uint32_t STIR;
} NVIC_Type;
# 455 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include\\core_cm7.h" 3
typedef struct
{
  volatile const uint32_t CPUID;
  volatile uint32_t ICSR;
  volatile uint32_t VTOR;
  volatile uint32_t AIRCR;
  volatile uint32_t SCR;
  volatile uint32_t CCR;
  volatile uint8_t SHPR[12U];
  volatile uint32_t SHCSR;
  volatile uint32_t CFSR;
  volatile uint32_t HFSR;
  volatile uint32_t DFSR;
  volatile uint32_t MMFAR;
  volatile uint32_t BFAR;
  volatile uint32_t AFSR;
  volatile const uint32_t ID_PFR[2U];
  volatile const uint32_t ID_DFR;
  volatile const uint32_t ID_AFR;
  volatile const uint32_t ID_MFR[4U];
  volatile const uint32_t ID_ISAR[5U];
        uint32_t RESERVED0[1U];
  volatile const uint32_t CLIDR;
  volatile const uint32_t CTR;
  volatile const uint32_t CCSIDR;
  volatile uint32_t CSSELR;
  volatile uint32_t CPACR;
        uint32_t RESERVED3[93U];
  volatile uint32_t STIR;
        uint32_t RESERVED4[15U];
  volatile const uint32_t MVFR0;
  volatile const uint32_t MVFR1;
  volatile const uint32_t MVFR2;
        uint32_t RESERVED5[1U];
  volatile uint32_t ICIALLU;
        uint32_t RESERVED6[1U];
  volatile uint32_t ICIMVAU;
  volatile uint32_t DCIMVAC;
  volatile uint32_t DCISW;
  volatile uint32_t DCCMVAU;
  volatile uint32_t DCCMVAC;
  volatile uint32_t DCCSW;
  volatile uint32_t DCCIMVAC;
  volatile uint32_t DCCISW;
        uint32_t RESERVED7[6U];
  volatile uint32_t ITCMCR;
  volatile uint32_t DTCMCR;
  volatile uint32_t AHBPCR;
  volatile uint32_t CACR;
  volatile uint32_t AHBSCR;
        uint32_t RESERVED8[1U];
  volatile uint32_t ABFSR;
} SCB_Type;
# 921 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include\\core_cm7.h" 3
typedef struct
{
        uint32_t RESERVED0[1U];
  volatile const uint32_t ICTR;
  volatile uint32_t ACTLR;
} SCnSCB_Type;
# 961 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include\\core_cm7.h" 3
typedef struct
{
  volatile uint32_t CTRL;
  volatile uint32_t LOAD;
  volatile uint32_t VAL;
  volatile const uint32_t CALIB;
} SysTick_Type;
# 1013 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include\\core_cm7.h" 3
typedef struct
{
  volatile union
  {
    volatile uint8_t u8;
    volatile uint16_t u16;
    volatile uint32_t u32;
  } PORT [32U];
        uint32_t RESERVED0[864U];
  volatile uint32_t TER;
        uint32_t RESERVED1[15U];
  volatile uint32_t TPR;
        uint32_t RESERVED2[15U];
  volatile uint32_t TCR;
        uint32_t RESERVED3[29U];
  volatile uint32_t IWR;
  volatile const uint32_t IRR;
  volatile uint32_t IMCR;
        uint32_t RESERVED4[43U];
  volatile uint32_t LAR;
  volatile const uint32_t LSR;
        uint32_t RESERVED5[6U];
  volatile const uint32_t PID4;
  volatile const uint32_t PID5;
  volatile const uint32_t PID6;
  volatile const uint32_t PID7;
  volatile const uint32_t PID0;
  volatile const uint32_t PID1;
  volatile const uint32_t PID2;
  volatile const uint32_t PID3;
  volatile const uint32_t CID0;
  volatile const uint32_t CID1;
  volatile const uint32_t CID2;
  volatile const uint32_t CID3;
} ITM_Type;
# 1116 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include\\core_cm7.h" 3
typedef struct
{
  volatile uint32_t CTRL;
  volatile uint32_t CYCCNT;
  volatile uint32_t CPICNT;
  volatile uint32_t EXCCNT;
  volatile uint32_t SLEEPCNT;
  volatile uint32_t LSUCNT;
  volatile uint32_t FOLDCNT;
  volatile const uint32_t PCSR;
  volatile uint32_t COMP0;
  volatile uint32_t MASK0;
  volatile uint32_t FUNCTION0;
        uint32_t RESERVED0[1U];
  volatile uint32_t COMP1;
  volatile uint32_t MASK1;
  volatile uint32_t FUNCTION1;
        uint32_t RESERVED1[1U];
  volatile uint32_t COMP2;
  volatile uint32_t MASK2;
  volatile uint32_t FUNCTION2;
        uint32_t RESERVED2[1U];
  volatile uint32_t COMP3;
  volatile uint32_t MASK3;
  volatile uint32_t FUNCTION3;
        uint32_t RESERVED3[981U];
  volatile uint32_t LAR;
  volatile const uint32_t LSR;
} DWT_Type;
# 1266 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include\\core_cm7.h" 3
typedef struct
{
  volatile uint32_t SSPSR;
  volatile uint32_t CSPSR;
        uint32_t RESERVED0[2U];
  volatile uint32_t ACPR;
        uint32_t RESERVED1[55U];
  volatile uint32_t SPPR;
        uint32_t RESERVED2[131U];
  volatile const uint32_t FFSR;
  volatile uint32_t FFCR;
  volatile const uint32_t FSCR;
        uint32_t RESERVED3[759U];
  volatile const uint32_t TRIGGER;
  volatile const uint32_t FIFO0;
  volatile const uint32_t ITATBCTR2;
        uint32_t RESERVED4[1U];
  volatile const uint32_t ITATBCTR0;
  volatile const uint32_t FIFO1;
  volatile uint32_t ITCTRL;
        uint32_t RESERVED5[39U];
  volatile uint32_t CLAIMSET;
  volatile uint32_t CLAIMCLR;
        uint32_t RESERVED7[8U];
  volatile const uint32_t DEVID;
  volatile const uint32_t DEVTYPE;
} TPI_Type;
# 1425 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include\\core_cm7.h" 3
typedef struct
{
  volatile const uint32_t TYPE;
  volatile uint32_t CTRL;
  volatile uint32_t RNR;
  volatile uint32_t RBAR;
  volatile uint32_t RASR;
  volatile uint32_t RBAR_A1;
  volatile uint32_t RASR_A1;
  volatile uint32_t RBAR_A2;
  volatile uint32_t RASR_A2;
  volatile uint32_t RBAR_A3;
  volatile uint32_t RASR_A3;
} MPU_Type;
# 1521 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include\\core_cm7.h" 3
typedef struct
{
        uint32_t RESERVED0[1U];
  volatile uint32_t FPCCR;
  volatile uint32_t FPCAR;
  volatile uint32_t FPDSCR;
  volatile const uint32_t MVFR0;
  volatile const uint32_t MVFR1;
  volatile const uint32_t MVFR2;
} FPU_Type;
# 1630 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include\\core_cm7.h" 3
typedef struct
{
  volatile uint32_t DHCSR;
  volatile uint32_t DCRSR;
  volatile uint32_t DCRDR;
  volatile uint32_t DEMCR;
} CoreDebug_Type;
# 1854 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include\\core_cm7.h" 3
static __inline void __NVIC_SetPriorityGrouping(uint32_t PriorityGroup)
{
  uint32_t reg_value;
  uint32_t PriorityGroupTmp = (PriorityGroup & (uint32_t)0x07UL);

  reg_value = ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->AIRCR;
  reg_value &= ~((uint32_t)((0xFFFFUL << 16U) | (7UL << 8U)));
  reg_value = (reg_value |
                ((uint32_t)0x5FAUL << 16U) |
                (PriorityGroupTmp << 8U) );
  ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->AIRCR = reg_value;
}







static __inline uint32_t __NVIC_GetPriorityGrouping(void)
{
  return ((uint32_t)((((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->AIRCR & (7UL << 8U)) >> 8U));
}
# 1885 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include\\core_cm7.h" 3
static __inline void __NVIC_EnableIRQ(IRQn_Type IRQn)
{
  if ((int32_t)(IRQn) >= 0)
  {
    ((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->ISER[(((uint32_t)IRQn) >> 5UL)] = (uint32_t)(1UL << (((uint32_t)IRQn) & 0x1FUL));
  }
}
# 1902 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include\\core_cm7.h" 3
static __inline uint32_t __NVIC_GetEnableIRQ(IRQn_Type IRQn)
{
  if ((int32_t)(IRQn) >= 0)
  {
    return((uint32_t)(((((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->ISER[(((uint32_t)IRQn) >> 5UL)] & (1UL << (((uint32_t)IRQn) & 0x1FUL))) != 0UL) ? 1UL : 0UL));
  }
  else
  {
    return(0U);
  }
}
# 1921 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include\\core_cm7.h" 3
static __inline void __NVIC_DisableIRQ(IRQn_Type IRQn)
{
  if ((int32_t)(IRQn) >= 0)
  {
    ((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->ICER[(((uint32_t)IRQn) >> 5UL)] = (uint32_t)(1UL << (((uint32_t)IRQn) & 0x1FUL));
    __builtin_arm_dsb(0xF);;
    __builtin_arm_isb(0xF);;
  }
}
# 1940 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include\\core_cm7.h" 3
static __inline uint32_t __NVIC_GetPendingIRQ(IRQn_Type IRQn)
{
  if ((int32_t)(IRQn) >= 0)
  {
    return((uint32_t)(((((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->ISPR[(((uint32_t)IRQn) >> 5UL)] & (1UL << (((uint32_t)IRQn) & 0x1FUL))) != 0UL) ? 1UL : 0UL));
  }
  else
  {
    return(0U);
  }
}
# 1959 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include\\core_cm7.h" 3
static __inline void __NVIC_SetPendingIRQ(IRQn_Type IRQn)
{
  if ((int32_t)(IRQn) >= 0)
  {
    ((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->ISPR[(((uint32_t)IRQn) >> 5UL)] = (uint32_t)(1UL << (((uint32_t)IRQn) & 0x1FUL));
  }
}
# 1974 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include\\core_cm7.h" 3
static __inline void __NVIC_ClearPendingIRQ(IRQn_Type IRQn)
{
  if ((int32_t)(IRQn) >= 0)
  {
    ((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->ICPR[(((uint32_t)IRQn) >> 5UL)] = (uint32_t)(1UL << (((uint32_t)IRQn) & 0x1FUL));
  }
}
# 1991 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include\\core_cm7.h" 3
static __inline uint32_t __NVIC_GetActive(IRQn_Type IRQn)
{
  if ((int32_t)(IRQn) >= 0)
  {
    return((uint32_t)(((((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->IABR[(((uint32_t)IRQn) >> 5UL)] & (1UL << (((uint32_t)IRQn) & 0x1FUL))) != 0UL) ? 1UL : 0UL));
  }
  else
  {
    return(0U);
  }
}
# 2013 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include\\core_cm7.h" 3
static __inline void __NVIC_SetPriority(IRQn_Type IRQn, uint32_t priority)
{
  if ((int32_t)(IRQn) >= 0)
  {
    ((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->IP[((uint32_t)IRQn)] = (uint8_t)((priority << (8U - 4)) & (uint32_t)0xFFUL);
  }
  else
  {
    ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->SHPR[(((uint32_t)IRQn) & 0xFUL)-4UL] = (uint8_t)((priority << (8U - 4)) & (uint32_t)0xFFUL);
  }
}
# 2035 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include\\core_cm7.h" 3
static __inline uint32_t __NVIC_GetPriority(IRQn_Type IRQn)
{

  if ((int32_t)(IRQn) >= 0)
  {
    return(((uint32_t)((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->IP[((uint32_t)IRQn)] >> (8U - 4)));
  }
  else
  {
    return(((uint32_t)((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->SHPR[(((uint32_t)IRQn) & 0xFUL)-4UL] >> (8U - 4)));
  }
}
# 2060 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include\\core_cm7.h" 3
static __inline uint32_t NVIC_EncodePriority (uint32_t PriorityGroup, uint32_t PreemptPriority, uint32_t SubPriority)
{
  uint32_t PriorityGroupTmp = (PriorityGroup & (uint32_t)0x07UL);
  uint32_t PreemptPriorityBits;
  uint32_t SubPriorityBits;

  PreemptPriorityBits = ((7UL - PriorityGroupTmp) > (uint32_t)(4)) ? (uint32_t)(4) : (uint32_t)(7UL - PriorityGroupTmp);
  SubPriorityBits = ((PriorityGroupTmp + (uint32_t)(4)) < (uint32_t)7UL) ? (uint32_t)0UL : (uint32_t)((PriorityGroupTmp - 7UL) + (uint32_t)(4));

  return (
           ((PreemptPriority & (uint32_t)((1UL << (PreemptPriorityBits)) - 1UL)) << SubPriorityBits) |
           ((SubPriority & (uint32_t)((1UL << (SubPriorityBits )) - 1UL)))
         );
}
# 2087 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include\\core_cm7.h" 3
static __inline void NVIC_DecodePriority (uint32_t Priority, uint32_t PriorityGroup, uint32_t* const pPreemptPriority, uint32_t* const pSubPriority)
{
  uint32_t PriorityGroupTmp = (PriorityGroup & (uint32_t)0x07UL);
  uint32_t PreemptPriorityBits;
  uint32_t SubPriorityBits;

  PreemptPriorityBits = ((7UL - PriorityGroupTmp) > (uint32_t)(4)) ? (uint32_t)(4) : (uint32_t)(7UL - PriorityGroupTmp);
  SubPriorityBits = ((PriorityGroupTmp + (uint32_t)(4)) < (uint32_t)7UL) ? (uint32_t)0UL : (uint32_t)((PriorityGroupTmp - 7UL) + (uint32_t)(4));

  *pPreemptPriority = (Priority >> SubPriorityBits) & (uint32_t)((1UL << (PreemptPriorityBits)) - 1UL);
  *pSubPriority = (Priority ) & (uint32_t)((1UL << (SubPriorityBits )) - 1UL);
}
# 2110 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include\\core_cm7.h" 3
static __inline void __NVIC_SetVector(IRQn_Type IRQn, uint32_t vector)
{
  uint32_t *vectors = (uint32_t *)((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->VTOR;
  vectors[(int32_t)IRQn + 16] = vector;
}
# 2125 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include\\core_cm7.h" 3
static __inline uint32_t __NVIC_GetVector(IRQn_Type IRQn)
{
  uint32_t *vectors = (uint32_t *)((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->VTOR;
  return vectors[(int32_t)IRQn + 16];
}






static __inline void __NVIC_SystemReset(void)
{
  __builtin_arm_dsb(0xF);;

  ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->AIRCR = (uint32_t)((0x5FAUL << 16U) |
                           (((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->AIRCR & (7UL << 8U)) |
                            (1UL << 2U) );
  __builtin_arm_dsb(0xF);;

  for(;;)
  {
    __builtin_arm_nop();
  }
}








# 1 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include/mpu_armv7.h" 1 3
# 29 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include/mpu_armv7.h" 3
# 107 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include/mpu_armv7.h" 3
typedef struct {
  uint32_t RBAR;
  uint32_t RASR;
} ARM_MPU_Region_t;




static __inline void ARM_MPU_Enable(uint32_t MPU_Control)
{
  __builtin_arm_dsb(0xF);;
  __builtin_arm_isb(0xF);;
  ((MPU_Type *) ((0xE000E000UL) + 0x0D90UL) )->CTRL = MPU_Control | (1UL );

  ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->SHCSR |= (1UL << 16U);

}



static __inline void ARM_MPU_Disable(void)
{
  __builtin_arm_dsb(0xF);;
  __builtin_arm_isb(0xF);;

  ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->SHCSR &= ~(1UL << 16U);

  ((MPU_Type *) ((0xE000E000UL) + 0x0D90UL) )->CTRL &= ~(1UL );
}




static __inline void ARM_MPU_ClrRegion(uint32_t rnr)
{
  ((MPU_Type *) ((0xE000E000UL) + 0x0D90UL) )->RNR = rnr;
  ((MPU_Type *) ((0xE000E000UL) + 0x0D90UL) )->RASR = 0U;
}





static __inline void ARM_MPU_SetRegion(uint32_t rbar, uint32_t rasr)
{
  ((MPU_Type *) ((0xE000E000UL) + 0x0D90UL) )->RBAR = rbar;
  ((MPU_Type *) ((0xE000E000UL) + 0x0D90UL) )->RASR = rasr;
}






static __inline void ARM_MPU_SetRegionEx(uint32_t rnr, uint32_t rbar, uint32_t rasr)
{
  ((MPU_Type *) ((0xE000E000UL) + 0x0D90UL) )->RNR = rnr;
  ((MPU_Type *) ((0xE000E000UL) + 0x0D90UL) )->RBAR = rbar;
  ((MPU_Type *) ((0xE000E000UL) + 0x0D90UL) )->RASR = rasr;
}






static __inline void orderedCpy(volatile uint32_t* dst, const uint32_t* __restrict src, uint32_t len)
{
  uint32_t i;
  for (i = 0U; i < len; ++i)
  {
    dst[i] = src[i];
  }
}





static __inline void ARM_MPU_Load(ARM_MPU_Region_t const* table, uint32_t cnt)
{
  const uint32_t rowWordSize = sizeof(ARM_MPU_Region_t)/4U;
  while (cnt > 4U) {
    orderedCpy(&(((MPU_Type *) ((0xE000E000UL) + 0x0D90UL) )->RBAR), &(table->RBAR), 4U*rowWordSize);
    table += 4U;
    cnt -= 4U;
  }
  orderedCpy(&(((MPU_Type *) ((0xE000E000UL) + 0x0D90UL) )->RBAR), &(table->RBAR), cnt*rowWordSize);
}
# 2158 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include\\core_cm7.h" 2 3
# 2177 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include\\core_cm7.h" 3
static __inline uint32_t SCB_GetFPUType(void)
{
  uint32_t mvfr0;

  mvfr0 = ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->MVFR0;
  if ((mvfr0 & ((0xFUL << 4U) | (0xFUL << 8U))) == 0x220U)
  {
    return 2U;
  }
  else if ((mvfr0 & ((0xFUL << 4U) | (0xFUL << 8U))) == 0x020U)
  {
    return 1U;
  }
  else
  {
    return 0U;
  }
}
# 2218 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include\\core_cm7.h" 3
static __inline void SCB_EnableICache (void)
{

    __builtin_arm_dsb(0xF);;
    __builtin_arm_isb(0xF);;
    ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->ICIALLU = 0UL;
    __builtin_arm_dsb(0xF);;
    __builtin_arm_isb(0xF);;
    ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->CCR |= (uint32_t)(1UL << 17U);
    __builtin_arm_dsb(0xF);;
    __builtin_arm_isb(0xF);;

}






static __inline void SCB_DisableICache (void)
{

    __builtin_arm_dsb(0xF);;
    __builtin_arm_isb(0xF);;
    ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->CCR &= ~(uint32_t)(1UL << 17U);
    ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->ICIALLU = 0UL;
    __builtin_arm_dsb(0xF);;
    __builtin_arm_isb(0xF);;

}






static __inline void SCB_InvalidateICache (void)
{

    __builtin_arm_dsb(0xF);;
    __builtin_arm_isb(0xF);;
    ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->ICIALLU = 0UL;
    __builtin_arm_dsb(0xF);;
    __builtin_arm_isb(0xF);;

}






static __inline void SCB_EnableDCache (void)
{

    uint32_t ccsidr;
    uint32_t sets;
    uint32_t ways;

    ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->CSSELR = 0U;
    __builtin_arm_dsb(0xF);;

    ccsidr = ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->CCSIDR;


    sets = (uint32_t)((((ccsidr) & (0x7FFFUL << 13U) ) >> 13U ));
    do {
      ways = (uint32_t)((((ccsidr) & (0x3FFUL << 3U)) >> 3U));
      do {
        ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->DCISW = (((sets << 5U) & (0x1FFUL << 5U)) |
                      ((ways << 30U) & (3UL << 30U)) );



      } while (ways-- != 0U);
    } while(sets-- != 0U);
    __builtin_arm_dsb(0xF);;

    ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->CCR |= (uint32_t)(1UL << 16U);

    __builtin_arm_dsb(0xF);;
    __builtin_arm_isb(0xF);;

}






static __inline void SCB_DisableDCache (void)
{

    register uint32_t ccsidr;
    register uint32_t sets;
    register uint32_t ways;

    ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->CSSELR = 0U;
    __builtin_arm_dsb(0xF);;

    ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->CCR &= ~(uint32_t)(1UL << 16U);
    __builtin_arm_dsb(0xF);;

    ccsidr = ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->CCSIDR;


    sets = (uint32_t)((((ccsidr) & (0x7FFFUL << 13U) ) >> 13U ));
    do {
      ways = (uint32_t)((((ccsidr) & (0x3FFUL << 3U)) >> 3U));
      do {
        ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->DCCISW = (((sets << 5U) & (0x1FFUL << 5U)) |
                       ((ways << 30U) & (3UL << 30U)) );



      } while (ways-- != 0U);
    } while(sets-- != 0U);

    __builtin_arm_dsb(0xF);;
    __builtin_arm_isb(0xF);;

}






static __inline void SCB_InvalidateDCache (void)
{

    uint32_t ccsidr;
    uint32_t sets;
    uint32_t ways;

    ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->CSSELR = 0U;
    __builtin_arm_dsb(0xF);;

    ccsidr = ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->CCSIDR;


    sets = (uint32_t)((((ccsidr) & (0x7FFFUL << 13U) ) >> 13U ));
    do {
      ways = (uint32_t)((((ccsidr) & (0x3FFUL << 3U)) >> 3U));
      do {
        ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->DCISW = (((sets << 5U) & (0x1FFUL << 5U)) |
                      ((ways << 30U) & (3UL << 30U)) );



      } while (ways-- != 0U);
    } while(sets-- != 0U);

    __builtin_arm_dsb(0xF);;
    __builtin_arm_isb(0xF);;

}






static __inline void SCB_CleanDCache (void)
{

    uint32_t ccsidr;
    uint32_t sets;
    uint32_t ways;

     ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->CSSELR = 0U;
   __builtin_arm_dsb(0xF);;

    ccsidr = ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->CCSIDR;


    sets = (uint32_t)((((ccsidr) & (0x7FFFUL << 13U) ) >> 13U ));
    do {
      ways = (uint32_t)((((ccsidr) & (0x3FFUL << 3U)) >> 3U));
      do {
        ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->DCCSW = (((sets << 5U) & (0x1FFUL << 5U)) |
                      ((ways << 30U) & (3UL << 30U)) );



      } while (ways-- != 0U);
    } while(sets-- != 0U);

    __builtin_arm_dsb(0xF);;
    __builtin_arm_isb(0xF);;

}






static __inline void SCB_CleanInvalidateDCache (void)
{

    uint32_t ccsidr;
    uint32_t sets;
    uint32_t ways;

    ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->CSSELR = 0U;
    __builtin_arm_dsb(0xF);;

    ccsidr = ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->CCSIDR;


    sets = (uint32_t)((((ccsidr) & (0x7FFFUL << 13U) ) >> 13U ));
    do {
      ways = (uint32_t)((((ccsidr) & (0x3FFUL << 3U)) >> 3U));
      do {
        ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->DCCISW = (((sets << 5U) & (0x1FFUL << 5U)) |
                       ((ways << 30U) & (3UL << 30U)) );



      } while (ways-- != 0U);
    } while(sets-- != 0U);

    __builtin_arm_dsb(0xF);;
    __builtin_arm_isb(0xF);;

}
# 2453 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include\\core_cm7.h" 3
static __inline void SCB_InvalidateDCache_by_Addr (uint32_t *addr, int32_t dsize)
{

     int32_t op_size = dsize;
    uint32_t op_addr = (uint32_t)addr;
     int32_t linesize = 32;

    __builtin_arm_dsb(0xF);;

    while (op_size > 0) {
      ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->DCIMVAC = op_addr;
      op_addr += (uint32_t)linesize;
      op_size -= linesize;
    }

    __builtin_arm_dsb(0xF);;
    __builtin_arm_isb(0xF);;

}
# 2480 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include\\core_cm7.h" 3
static __inline void SCB_CleanDCache_by_Addr (uint32_t *addr, int32_t dsize)
{

     int32_t op_size = dsize;
    uint32_t op_addr = (uint32_t) addr;
     int32_t linesize = 32;

    __builtin_arm_dsb(0xF);;

    while (op_size > 0) {
      ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->DCCMVAC = op_addr;
      op_addr += (uint32_t)linesize;
      op_size -= linesize;
    }

    __builtin_arm_dsb(0xF);;
    __builtin_arm_isb(0xF);;

}
# 2507 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include\\core_cm7.h" 3
static __inline void SCB_CleanInvalidateDCache_by_Addr (uint32_t *addr, int32_t dsize)
{

     int32_t op_size = dsize;
    uint32_t op_addr = (uint32_t) addr;
     int32_t linesize = 32;

    __builtin_arm_dsb(0xF);;

    while (op_size > 0) {
      ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->DCCIMVAC = op_addr;
      op_addr += (uint32_t)linesize;
      op_size -= linesize;
    }

    __builtin_arm_dsb(0xF);;
    __builtin_arm_isb(0xF);;

}
# 2553 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include\\core_cm7.h" 3
static __inline uint32_t SysTick_Config(uint32_t ticks)
{
  if ((ticks - 1UL) > (0xFFFFFFUL ))
  {
    return (1UL);
  }

  ((SysTick_Type *) ((0xE000E000UL) + 0x0010UL) )->LOAD = (uint32_t)(ticks - 1UL);
  __NVIC_SetPriority (SysTick_IRQn, (1UL << 4) - 1UL);
  ((SysTick_Type *) ((0xE000E000UL) + 0x0010UL) )->VAL = 0UL;
  ((SysTick_Type *) ((0xE000E000UL) + 0x0010UL) )->CTRL = (1UL << 2U) |
                   (1UL << 1U) |
                   (1UL );
  return (0UL);
}
# 2583 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include\\core_cm7.h" 3
extern volatile int32_t ITM_RxBuffer;
# 2595 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include\\core_cm7.h" 3
static __inline uint32_t ITM_SendChar (uint32_t ch)
{
  if (((((ITM_Type *) (0xE0000000UL) )->TCR & (1UL )) != 0UL) &&
      ((((ITM_Type *) (0xE0000000UL) )->TER & 1UL ) != 0UL) )
  {
    while (((ITM_Type *) (0xE0000000UL) )->PORT[0U].u32 == 0UL)
    {
      __builtin_arm_nop();
    }
    ((ITM_Type *) (0xE0000000UL) )->PORT[0U].u8 = (uint8_t)ch;
  }
  return (ch);
}
# 2616 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include\\core_cm7.h" 3
static __inline int32_t ITM_ReceiveChar (void)
{
  int32_t ch = -1;

  if (ITM_RxBuffer != ((int32_t)0x5AA55AA5U))
  {
    ch = ITM_RxBuffer;
    ITM_RxBuffer = ((int32_t)0x5AA55AA5U);
  }

  return (ch);
}
# 2636 "C:/Keil/ARM/PACK/ARM/CMSIS/5.3.0/CMSIS/Include\\core_cm7.h" 3
static __inline int32_t ITM_CheckChar (void)
{

  if (ITM_RxBuffer == ((int32_t)0x5AA55AA5U))
  {
    return (0);
  }
  else
  {
    return (1);
  }
}
# 191 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f746xx.h" 2


# 1 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/system_stm32f7xx.h" 1
# 74 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/system_stm32f7xx.h"
extern uint32_t SystemCoreClock;

extern const uint8_t AHBPrescTable[16];
extern const uint8_t APBPrescTable[8];
# 104 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/system_stm32f7xx.h"
extern void SystemInit(void);
extern void SystemCoreClockUpdate(void);
# 194 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f746xx.h" 2
# 204 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f746xx.h"
typedef struct
{
  volatile uint32_t SR;
  volatile uint32_t CR1;
  volatile uint32_t CR2;
  volatile uint32_t SMPR1;
  volatile uint32_t SMPR2;
  volatile uint32_t JOFR1;
  volatile uint32_t JOFR2;
  volatile uint32_t JOFR3;
  volatile uint32_t JOFR4;
  volatile uint32_t HTR;
  volatile uint32_t LTR;
  volatile uint32_t SQR1;
  volatile uint32_t SQR2;
  volatile uint32_t SQR3;
  volatile uint32_t JSQR;
  volatile uint32_t JDR1;
  volatile uint32_t JDR2;
  volatile uint32_t JDR3;
  volatile uint32_t JDR4;
  volatile uint32_t DR;
} ADC_TypeDef;

typedef struct
{
  volatile uint32_t CSR;
  volatile uint32_t CCR;
  volatile uint32_t CDR;

} ADC_Common_TypeDef;






typedef struct
{
  volatile uint32_t TIR;
  volatile uint32_t TDTR;
  volatile uint32_t TDLR;
  volatile uint32_t TDHR;
} CAN_TxMailBox_TypeDef;





typedef struct
{
  volatile uint32_t RIR;
  volatile uint32_t RDTR;
  volatile uint32_t RDLR;
  volatile uint32_t RDHR;
} CAN_FIFOMailBox_TypeDef;





typedef struct
{
  volatile uint32_t FR1;
  volatile uint32_t FR2;
} CAN_FilterRegister_TypeDef;





typedef struct
{
  volatile uint32_t MCR;
  volatile uint32_t MSR;
  volatile uint32_t TSR;
  volatile uint32_t RF0R;
  volatile uint32_t RF1R;
  volatile uint32_t IER;
  volatile uint32_t ESR;
  volatile uint32_t BTR;
  uint32_t RESERVED0[88];
  CAN_TxMailBox_TypeDef sTxMailBox[3];
  CAN_FIFOMailBox_TypeDef sFIFOMailBox[2];
  uint32_t RESERVED1[12];
  volatile uint32_t FMR;
  volatile uint32_t FM1R;
  uint32_t RESERVED2;
  volatile uint32_t FS1R;
  uint32_t RESERVED3;
  volatile uint32_t FFA1R;
  uint32_t RESERVED4;
  volatile uint32_t FA1R;
  uint32_t RESERVED5[8];
  CAN_FilterRegister_TypeDef sFilterRegister[28];
} CAN_TypeDef;





typedef struct
{
  volatile uint32_t CR;
  volatile uint32_t CFGR;
  volatile uint32_t TXDR;
  volatile uint32_t RXDR;
  volatile uint32_t ISR;
  volatile uint32_t IER;
}CEC_TypeDef;





typedef struct
{
  volatile uint32_t DR;
  volatile uint8_t IDR;
  uint8_t RESERVED0;
  uint16_t RESERVED1;
  volatile uint32_t CR;
  uint32_t RESERVED2;
  volatile uint32_t INIT;
  volatile uint32_t POL;
} CRC_TypeDef;





typedef struct
{
  volatile uint32_t CR;
  volatile uint32_t SWTRIGR;
  volatile uint32_t DHR12R1;
  volatile uint32_t DHR12L1;
  volatile uint32_t DHR8R1;
  volatile uint32_t DHR12R2;
  volatile uint32_t DHR12L2;
  volatile uint32_t DHR8R2;
  volatile uint32_t DHR12RD;
  volatile uint32_t DHR12LD;
  volatile uint32_t DHR8RD;
  volatile uint32_t DOR1;
  volatile uint32_t DOR2;
  volatile uint32_t SR;
} DAC_TypeDef;






typedef struct
{
  volatile uint32_t IDCODE;
  volatile uint32_t CR;
  volatile uint32_t APB1FZ;
  volatile uint32_t APB2FZ;
}DBGMCU_TypeDef;





typedef struct
{
  volatile uint32_t CR;
  volatile uint32_t SR;
  volatile uint32_t RISR;
  volatile uint32_t IER;
  volatile uint32_t MISR;
  volatile uint32_t ICR;
  volatile uint32_t ESCR;
  volatile uint32_t ESUR;
  volatile uint32_t CWSTRTR;
  volatile uint32_t CWSIZER;
  volatile uint32_t DR;
} DCMI_TypeDef;





typedef struct
{
  volatile uint32_t CR;
  volatile uint32_t NDTR;
  volatile uint32_t PAR;
  volatile uint32_t M0AR;
  volatile uint32_t M1AR;
  volatile uint32_t FCR;
} DMA_Stream_TypeDef;

typedef struct
{
  volatile uint32_t LISR;
  volatile uint32_t HISR;
  volatile uint32_t LIFCR;
  volatile uint32_t HIFCR;
} DMA_TypeDef;





typedef struct
{
  volatile uint32_t CR;
  volatile uint32_t ISR;
  volatile uint32_t IFCR;
  volatile uint32_t FGMAR;
  volatile uint32_t FGOR;
  volatile uint32_t BGMAR;
  volatile uint32_t BGOR;
  volatile uint32_t FGPFCCR;
  volatile uint32_t FGCOLR;
  volatile uint32_t BGPFCCR;
  volatile uint32_t BGCOLR;
  volatile uint32_t FGCMAR;
  volatile uint32_t BGCMAR;
  volatile uint32_t OPFCCR;
  volatile uint32_t OCOLR;
  volatile uint32_t OMAR;
  volatile uint32_t OOR;
  volatile uint32_t NLR;
  volatile uint32_t LWR;
  volatile uint32_t AMTCR;
  uint32_t RESERVED[236];
  volatile uint32_t FGCLUT[256];
  volatile uint32_t BGCLUT[256];
} DMA2D_TypeDef;






typedef struct
{
  volatile uint32_t MACCR;
  volatile uint32_t MACFFR;
  volatile uint32_t MACHTHR;
  volatile uint32_t MACHTLR;
  volatile uint32_t MACMIIAR;
  volatile uint32_t MACMIIDR;
  volatile uint32_t MACFCR;
  volatile uint32_t MACVLANTR;
  uint32_t RESERVED0[2];
  volatile uint32_t MACRWUFFR;
  volatile uint32_t MACPMTCSR;
  uint32_t RESERVED1;
  volatile uint32_t MACDBGR;
  volatile uint32_t MACSR;
  volatile uint32_t MACIMR;
  volatile uint32_t MACA0HR;
  volatile uint32_t MACA0LR;
  volatile uint32_t MACA1HR;
  volatile uint32_t MACA1LR;
  volatile uint32_t MACA2HR;
  volatile uint32_t MACA2LR;
  volatile uint32_t MACA3HR;
  volatile uint32_t MACA3LR;
  uint32_t RESERVED2[40];
  volatile uint32_t MMCCR;
  volatile uint32_t MMCRIR;
  volatile uint32_t MMCTIR;
  volatile uint32_t MMCRIMR;
  volatile uint32_t MMCTIMR;
  uint32_t RESERVED3[14];
  volatile uint32_t MMCTGFSCCR;
  volatile uint32_t MMCTGFMSCCR;
  uint32_t RESERVED4[5];
  volatile uint32_t MMCTGFCR;
  uint32_t RESERVED5[10];
  volatile uint32_t MMCRFCECR;
  volatile uint32_t MMCRFAECR;
  uint32_t RESERVED6[10];
  volatile uint32_t MMCRGUFCR;
  uint32_t RESERVED7[334];
  volatile uint32_t PTPTSCR;
  volatile uint32_t PTPSSIR;
  volatile uint32_t PTPTSHR;
  volatile uint32_t PTPTSLR;
  volatile uint32_t PTPTSHUR;
  volatile uint32_t PTPTSLUR;
  volatile uint32_t PTPTSAR;
  volatile uint32_t PTPTTHR;
  volatile uint32_t PTPTTLR;
  volatile uint32_t RESERVED8;
  volatile uint32_t PTPTSSR;
  uint32_t RESERVED9[565];
  volatile uint32_t DMABMR;
  volatile uint32_t DMATPDR;
  volatile uint32_t DMARPDR;
  volatile uint32_t DMARDLAR;
  volatile uint32_t DMATDLAR;
  volatile uint32_t DMASR;
  volatile uint32_t DMAOMR;
  volatile uint32_t DMAIER;
  volatile uint32_t DMAMFBOCR;
  volatile uint32_t DMARSWTR;
  uint32_t RESERVED10[8];
  volatile uint32_t DMACHTDR;
  volatile uint32_t DMACHRDR;
  volatile uint32_t DMACHTBAR;
  volatile uint32_t DMACHRBAR;
} ETH_TypeDef;





typedef struct
{
  volatile uint32_t IMR;
  volatile uint32_t EMR;
  volatile uint32_t RTSR;
  volatile uint32_t FTSR;
  volatile uint32_t SWIER;
  volatile uint32_t PR;
} EXTI_TypeDef;





typedef struct
{
  volatile uint32_t ACR;
  volatile uint32_t KEYR;
  volatile uint32_t OPTKEYR;
  volatile uint32_t SR;
  volatile uint32_t CR;
  volatile uint32_t OPTCR;
  volatile uint32_t OPTCR1;
} FLASH_TypeDef;







typedef struct
{
  volatile uint32_t BTCR[8];
} FMC_Bank1_TypeDef;





typedef struct
{
  volatile uint32_t BWTR[7];
} FMC_Bank1E_TypeDef;





typedef struct
{
  volatile uint32_t PCR;
  volatile uint32_t SR;
  volatile uint32_t PMEM;
  volatile uint32_t PATT;
  uint32_t RESERVED0;
  volatile uint32_t ECCR;
} FMC_Bank3_TypeDef;





typedef struct
{
  volatile uint32_t SDCR[2];
  volatile uint32_t SDTR[2];
  volatile uint32_t SDCMR;
  volatile uint32_t SDRTR;
  volatile uint32_t SDSR;
} FMC_Bank5_6_TypeDef;






typedef struct
{
  volatile uint32_t MODER;
  volatile uint32_t OTYPER;
  volatile uint32_t OSPEEDR;
  volatile uint32_t PUPDR;
  volatile uint32_t IDR;
  volatile uint32_t ODR;
  volatile uint32_t BSRR;
  volatile uint32_t LCKR;
  volatile uint32_t AFR[2];
} GPIO_TypeDef;





typedef struct
{
  volatile uint32_t MEMRMP;
  volatile uint32_t PMC;
  volatile uint32_t EXTICR[4];
  uint32_t RESERVED[2];
  volatile uint32_t CMPCR;
} SYSCFG_TypeDef;





typedef struct
{
  volatile uint32_t CR1;
  volatile uint32_t CR2;
  volatile uint32_t OAR1;
  volatile uint32_t OAR2;
  volatile uint32_t TIMINGR;
  volatile uint32_t TIMEOUTR;
  volatile uint32_t ISR;
  volatile uint32_t ICR;
  volatile uint32_t PECR;
  volatile uint32_t RXDR;
  volatile uint32_t TXDR;
} I2C_TypeDef;





typedef struct
{
  volatile uint32_t KR;
  volatile uint32_t PR;
  volatile uint32_t RLR;
  volatile uint32_t SR;
  volatile uint32_t WINR;
} IWDG_TypeDef;






typedef struct
{
  uint32_t RESERVED0[2];
  volatile uint32_t SSCR;
  volatile uint32_t BPCR;
  volatile uint32_t AWCR;
  volatile uint32_t TWCR;
  volatile uint32_t GCR;
  uint32_t RESERVED1[2];
  volatile uint32_t SRCR;
  uint32_t RESERVED2[1];
  volatile uint32_t BCCR;
  uint32_t RESERVED3[1];
  volatile uint32_t IER;
  volatile uint32_t ISR;
  volatile uint32_t ICR;
  volatile uint32_t LIPCR;
  volatile uint32_t CPSR;
  volatile uint32_t CDSR;
} LTDC_TypeDef;





typedef struct
{
  volatile uint32_t CR;
  volatile uint32_t WHPCR;
  volatile uint32_t WVPCR;
  volatile uint32_t CKCR;
  volatile uint32_t PFCR;
  volatile uint32_t CACR;
  volatile uint32_t DCCR;
  volatile uint32_t BFCR;
  uint32_t RESERVED0[2];
  volatile uint32_t CFBAR;
  volatile uint32_t CFBLR;
  volatile uint32_t CFBLNR;
  uint32_t RESERVED1[3];
  volatile uint32_t CLUTWR;

} LTDC_Layer_TypeDef;





typedef struct
{
  volatile uint32_t CR1;
  volatile uint32_t CSR1;
  volatile uint32_t CR2;
  volatile uint32_t CSR2;
} PWR_TypeDef;






typedef struct
{
  volatile uint32_t CR;
  volatile uint32_t PLLCFGR;
  volatile uint32_t CFGR;
  volatile uint32_t CIR;
  volatile uint32_t AHB1RSTR;
  volatile uint32_t AHB2RSTR;
  volatile uint32_t AHB3RSTR;
  uint32_t RESERVED0;
  volatile uint32_t APB1RSTR;
  volatile uint32_t APB2RSTR;
  uint32_t RESERVED1[2];
  volatile uint32_t AHB1ENR;
  volatile uint32_t AHB2ENR;
  volatile uint32_t AHB3ENR;
  uint32_t RESERVED2;
  volatile uint32_t APB1ENR;
  volatile uint32_t APB2ENR;
  uint32_t RESERVED3[2];
  volatile uint32_t AHB1LPENR;
  volatile uint32_t AHB2LPENR;
  volatile uint32_t AHB3LPENR;
  uint32_t RESERVED4;
  volatile uint32_t APB1LPENR;
  volatile uint32_t APB2LPENR;
  uint32_t RESERVED5[2];
  volatile uint32_t BDCR;
  volatile uint32_t CSR;
  uint32_t RESERVED6[2];
  volatile uint32_t SSCGR;
  volatile uint32_t PLLI2SCFGR;
  volatile uint32_t PLLSAICFGR;
  volatile uint32_t DCKCFGR1;
  volatile uint32_t DCKCFGR2;

} RCC_TypeDef;





typedef struct
{
  volatile uint32_t TR;
  volatile uint32_t DR;
  volatile uint32_t CR;
  volatile uint32_t ISR;
  volatile uint32_t PRER;
  volatile uint32_t WUTR;
       uint32_t reserved;
  volatile uint32_t ALRMAR;
  volatile uint32_t ALRMBR;
  volatile uint32_t WPR;
  volatile uint32_t SSR;
  volatile uint32_t SHIFTR;
  volatile uint32_t TSTR;
  volatile uint32_t TSDR;
  volatile uint32_t TSSSR;
  volatile uint32_t CALR;
  volatile uint32_t TAMPCR;
  volatile uint32_t ALRMASSR;
  volatile uint32_t ALRMBSSR;
  volatile uint32_t OR;
  volatile uint32_t BKP0R;
  volatile uint32_t BKP1R;
  volatile uint32_t BKP2R;
  volatile uint32_t BKP3R;
  volatile uint32_t BKP4R;
  volatile uint32_t BKP5R;
  volatile uint32_t BKP6R;
  volatile uint32_t BKP7R;
  volatile uint32_t BKP8R;
  volatile uint32_t BKP9R;
  volatile uint32_t BKP10R;
  volatile uint32_t BKP11R;
  volatile uint32_t BKP12R;
  volatile uint32_t BKP13R;
  volatile uint32_t BKP14R;
  volatile uint32_t BKP15R;
  volatile uint32_t BKP16R;
  volatile uint32_t BKP17R;
  volatile uint32_t BKP18R;
  volatile uint32_t BKP19R;
  volatile uint32_t BKP20R;
  volatile uint32_t BKP21R;
  volatile uint32_t BKP22R;
  volatile uint32_t BKP23R;
  volatile uint32_t BKP24R;
  volatile uint32_t BKP25R;
  volatile uint32_t BKP26R;
  volatile uint32_t BKP27R;
  volatile uint32_t BKP28R;
  volatile uint32_t BKP29R;
  volatile uint32_t BKP30R;
  volatile uint32_t BKP31R;
} RTC_TypeDef;






typedef struct
{
  volatile uint32_t GCR;
} SAI_TypeDef;

typedef struct
{
  volatile uint32_t CR1;
  volatile uint32_t CR2;
  volatile uint32_t FRCR;
  volatile uint32_t SLOTR;
  volatile uint32_t IMR;
  volatile uint32_t SR;
  volatile uint32_t CLRFR;
  volatile uint32_t DR;
} SAI_Block_TypeDef;





typedef struct
{
  volatile uint32_t CR;
  volatile uint32_t IMR;
  volatile uint32_t SR;
  volatile uint32_t IFCR;
  volatile uint32_t DR;
  volatile uint32_t CSR;
  volatile uint32_t DIR;
} SPDIFRX_TypeDef;





typedef struct
{
  volatile uint32_t POWER;
  volatile uint32_t CLKCR;
  volatile uint32_t ARG;
  volatile uint32_t CMD;
  volatile const uint32_t RESPCMD;
  volatile const uint32_t RESP1;
  volatile const uint32_t RESP2;
  volatile const uint32_t RESP3;
  volatile const uint32_t RESP4;
  volatile uint32_t DTIMER;
  volatile uint32_t DLEN;
  volatile uint32_t DCTRL;
  volatile const uint32_t DCOUNT;
  volatile const uint32_t STA;
  volatile uint32_t ICR;
  volatile uint32_t MASK;
  uint32_t RESERVED0[2];
  volatile const uint32_t FIFOCNT;
  uint32_t RESERVED1[13];
  volatile uint32_t FIFO;
} SDMMC_TypeDef;





typedef struct
{
  volatile uint32_t CR1;
  volatile uint32_t CR2;
  volatile uint32_t SR;
  volatile uint32_t DR;
  volatile uint32_t CRCPR;
  volatile uint32_t RXCRCR;
  volatile uint32_t TXCRCR;
  volatile uint32_t I2SCFGR;
  volatile uint32_t I2SPR;
} SPI_TypeDef;





typedef struct
{
  volatile uint32_t CR;
  volatile uint32_t DCR;
  volatile uint32_t SR;
  volatile uint32_t FCR;
  volatile uint32_t DLR;
  volatile uint32_t CCR;
  volatile uint32_t AR;
  volatile uint32_t ABR;
  volatile uint32_t DR;
  volatile uint32_t PSMKR;
  volatile uint32_t PSMAR;
  volatile uint32_t PIR;
  volatile uint32_t LPTR;
} QUADSPI_TypeDef;





typedef struct
{
  volatile uint32_t CR1;
  volatile uint32_t CR2;
  volatile uint32_t SMCR;
  volatile uint32_t DIER;
  volatile uint32_t SR;
  volatile uint32_t EGR;
  volatile uint32_t CCMR1;
  volatile uint32_t CCMR2;
  volatile uint32_t CCER;
  volatile uint32_t CNT;
  volatile uint32_t PSC;
  volatile uint32_t ARR;
  volatile uint32_t RCR;
  volatile uint32_t CCR1;
  volatile uint32_t CCR2;
  volatile uint32_t CCR3;
  volatile uint32_t CCR4;
  volatile uint32_t BDTR;
  volatile uint32_t DCR;
  volatile uint32_t DMAR;
  volatile uint32_t OR;
  volatile uint32_t CCMR3;
  volatile uint32_t CCR5;
  volatile uint32_t CCR6;

} TIM_TypeDef;




typedef struct
{
  volatile uint32_t ISR;
  volatile uint32_t ICR;
  volatile uint32_t IER;
  volatile uint32_t CFGR;
  volatile uint32_t CR;
  volatile uint32_t CMP;
  volatile uint32_t ARR;
  volatile uint32_t CNT;
} LPTIM_TypeDef;






typedef struct
{
  volatile uint32_t CR1;
  volatile uint32_t CR2;
  volatile uint32_t CR3;
  volatile uint32_t BRR;
  volatile uint32_t GTPR;
  volatile uint32_t RTOR;
  volatile uint32_t RQR;
  volatile uint32_t ISR;
  volatile uint32_t ICR;
  volatile uint32_t RDR;
  volatile uint32_t TDR;
} USART_TypeDef;






typedef struct
{
  volatile uint32_t CR;
  volatile uint32_t CFR;
  volatile uint32_t SR;
} WWDG_TypeDef;






typedef struct
{
  volatile uint32_t CR;
  volatile uint32_t SR;
  volatile uint32_t DR;
} RNG_TypeDef;
# 1019 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f746xx.h"
typedef struct
{
 volatile uint32_t GOTGCTL;
  volatile uint32_t GOTGINT;
  volatile uint32_t GAHBCFG;
  volatile uint32_t GUSBCFG;
  volatile uint32_t GRSTCTL;
  volatile uint32_t GINTSTS;
  volatile uint32_t GINTMSK;
  volatile uint32_t GRXSTSR;
  volatile uint32_t GRXSTSP;
  volatile uint32_t GRXFSIZ;
  volatile uint32_t DIEPTXF0_HNPTXFSIZ;
  volatile uint32_t HNPTXSTS;
  uint32_t Reserved30[2];
  volatile uint32_t GCCFG;
  volatile uint32_t CID;
  uint32_t Reserved5[3];
  volatile uint32_t GHWCFG3;
  uint32_t Reserved6;
  volatile uint32_t GLPMCFG;
  volatile uint32_t GPWRDN;
  volatile uint32_t GDFIFOCFG;
   volatile uint32_t GADPCTL;
    uint32_t Reserved43[39];
  volatile uint32_t HPTXFSIZ;
  volatile uint32_t DIEPTXF[0x0F];
} USB_OTG_GlobalTypeDef;





typedef struct
{
  volatile uint32_t DCFG;
  volatile uint32_t DCTL;
  volatile uint32_t DSTS;
  uint32_t Reserved0C;
  volatile uint32_t DIEPMSK;
  volatile uint32_t DOEPMSK;
  volatile uint32_t DAINT;
  volatile uint32_t DAINTMSK;
  uint32_t Reserved20;
  uint32_t Reserved9;
  volatile uint32_t DVBUSDIS;
  volatile uint32_t DVBUSPULSE;
  volatile uint32_t DTHRCTL;
  volatile uint32_t DIEPEMPMSK;
  volatile uint32_t DEACHINT;
  volatile uint32_t DEACHMSK;
  uint32_t Reserved40;
  volatile uint32_t DINEP1MSK;
  uint32_t Reserved44[15];
  volatile uint32_t DOUTEP1MSK;
} USB_OTG_DeviceTypeDef;





typedef struct
{
  volatile uint32_t DIEPCTL;
  uint32_t Reserved04;
  volatile uint32_t DIEPINT;
  uint32_t Reserved0C;
  volatile uint32_t DIEPTSIZ;
  volatile uint32_t DIEPDMA;
  volatile uint32_t DTXFSTS;
  uint32_t Reserved18;
} USB_OTG_INEndpointTypeDef;





typedef struct
{
  volatile uint32_t DOEPCTL;
  uint32_t Reserved04;
  volatile uint32_t DOEPINT;
  uint32_t Reserved0C;
  volatile uint32_t DOEPTSIZ;
  volatile uint32_t DOEPDMA;
  uint32_t Reserved18[2];
} USB_OTG_OUTEndpointTypeDef;





typedef struct
{
  volatile uint32_t HCFG;
  volatile uint32_t HFIR;
  volatile uint32_t HFNUM;
  uint32_t Reserved40C;
  volatile uint32_t HPTXSTS;
  volatile uint32_t HAINT;
  volatile uint32_t HAINTMSK;
} USB_OTG_HostTypeDef;




typedef struct
{
  volatile uint32_t HCCHAR;
  volatile uint32_t HCSPLT;
  volatile uint32_t HCINT;
  volatile uint32_t HCINTMSK;
  volatile uint32_t HCTSIZ;
  volatile uint32_t HCDMA;
  uint32_t Reserved[2];
} USB_OTG_HostChannelTypeDef;
# 141 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include\\stm32f7xx.h" 2
# 164 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include\\stm32f7xx.h"
typedef enum
{
  RESET = 0U,
  SET = !RESET
} FlagStatus, ITStatus;

typedef enum
{
  DISABLE = 0U,
  ENABLE = !DISABLE
} FunctionalState;


typedef enum
{
  ERROR = 0U,
  SUCCESS = !ERROR
} ErrorStatus;
# 211 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include\\stm32f7xx.h"
# 1 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal.h" 1
# 212 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include\\stm32f7xx.h" 2
# 47 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_def.h" 2
# 1 "../Drivers/STM32F7xx_HAL_Driver/Inc/Legacy/stm32_hal_legacy.h" 1
# 48 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_def.h" 2
# 1 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 1 3
# 53 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
    typedef unsigned int size_t;
# 68 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
    typedef __builtin_va_list __va_list;
# 87 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
typedef struct __fpos_t_struct {
    unsigned long long int __pos;





    struct {
        unsigned int __state1, __state2;
    } __mbstate;
} fpos_t;
# 108 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
typedef struct __FILE FILE;
# 119 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
struct __FILE {
    union {
        long __FILE_alignment;



        char __FILE_size[84];

    } __FILE_opaque;
};
# 138 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
extern FILE __stdin, __stdout, __stderr;
extern FILE *__aeabi_stdin, *__aeabi_stdout, *__aeabi_stderr;
# 224 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
extern __attribute__((nothrow)) int remove(const char * ) __attribute__((__nonnull__(1)));







extern __attribute__((nothrow)) int rename(const char * , const char * ) __attribute__((__nonnull__(1,2)));
# 243 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
extern __attribute__((nothrow)) FILE *tmpfile(void);






extern __attribute__((nothrow)) char *tmpnam(char * );
# 265 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
extern __attribute__((nothrow)) int fclose(FILE * ) __attribute__((__nonnull__(1)));
# 275 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
extern __attribute__((nothrow)) int fflush(FILE * );
# 285 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
extern __attribute__((nothrow)) FILE *fopen(const char * __restrict ,
                           const char * __restrict ) __attribute__((__nonnull__(1,2)));
# 329 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
extern __attribute__((nothrow)) FILE *freopen(const char * __restrict ,
                    const char * __restrict ,
                    FILE * __restrict ) __attribute__((__nonnull__(2,3)));
# 342 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
extern __attribute__((nothrow)) void setbuf(FILE * __restrict ,
                    char * __restrict ) __attribute__((__nonnull__(1)));






extern __attribute__((nothrow)) int setvbuf(FILE * __restrict ,
                   char * __restrict ,
                   int , size_t ) __attribute__((__nonnull__(1)));
# 370 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
#pragma __printf_args
extern __attribute__((nothrow)) int fprintf(FILE * __restrict ,
                    const char * __restrict , ...) __attribute__((__nonnull__(1,2)));
# 393 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
#pragma __printf_args
extern __attribute__((nothrow)) int _fprintf(FILE * __restrict ,
                     const char * __restrict , ...) __attribute__((__nonnull__(1,2)));





#pragma __printf_args
extern __attribute__((nothrow)) int printf(const char * __restrict , ...) __attribute__((__nonnull__(1)));






#pragma __printf_args
extern __attribute__((nothrow)) int _printf(const char * __restrict , ...) __attribute__((__nonnull__(1)));





#pragma __printf_args
extern __attribute__((nothrow)) int sprintf(char * __restrict , const char * __restrict , ...) __attribute__((__nonnull__(1,2)));








#pragma __printf_args
extern __attribute__((nothrow)) int _sprintf(char * __restrict , const char * __restrict , ...) __attribute__((__nonnull__(1,2)));






#pragma __printf_args
extern __attribute__((nothrow)) int __ARM_snprintf(char * __restrict , size_t ,
                     const char * __restrict , ...) __attribute__((__nonnull__(3)));


#pragma __printf_args
extern __attribute__((nothrow)) int snprintf(char * __restrict , size_t ,
                     const char * __restrict , ...) __attribute__((__nonnull__(3)));
# 460 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
#pragma __printf_args
extern __attribute__((nothrow)) int _snprintf(char * __restrict , size_t ,
                      const char * __restrict , ...) __attribute__((__nonnull__(3)));





#pragma __scanf_args
extern __attribute__((nothrow)) int fscanf(FILE * __restrict ,
                    const char * __restrict , ...) __attribute__((__nonnull__(1,2)));
# 503 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
#pragma __scanf_args
extern __attribute__((nothrow)) int _fscanf(FILE * __restrict ,
                     const char * __restrict , ...) __attribute__((__nonnull__(1,2)));





#pragma __scanf_args
extern __attribute__((nothrow)) int scanf(const char * __restrict , ...) __attribute__((__nonnull__(1)));








#pragma __scanf_args
extern __attribute__((nothrow)) int _scanf(const char * __restrict , ...) __attribute__((__nonnull__(1)));





#pragma __scanf_args
extern __attribute__((nothrow)) int sscanf(const char * __restrict ,
                    const char * __restrict , ...) __attribute__((__nonnull__(1,2)));
# 541 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
#pragma __scanf_args
extern __attribute__((nothrow)) int _sscanf(const char * __restrict ,
                     const char * __restrict , ...) __attribute__((__nonnull__(1,2)));







extern __attribute__((nothrow)) int vfscanf(FILE * __restrict , const char * __restrict , __va_list) __attribute__((__nonnull__(1,2)));
extern __attribute__((nothrow)) int vscanf(const char * __restrict , __va_list) __attribute__((__nonnull__(1)));
extern __attribute__((nothrow)) int vsscanf(const char * __restrict , const char * __restrict , __va_list) __attribute__((__nonnull__(1,2)));

extern __attribute__((nothrow)) int _vfscanf(FILE * __restrict , const char * __restrict , __va_list) __attribute__((__nonnull__(1,2)));
extern __attribute__((nothrow)) int _vscanf(const char * __restrict , __va_list) __attribute__((__nonnull__(1)));
extern __attribute__((nothrow)) int _vsscanf(const char * __restrict , const char * __restrict , __va_list) __attribute__((__nonnull__(1,2)));
extern __attribute__((nothrow)) int __ARM_vsscanf(const char * __restrict , const char * __restrict , __va_list) __attribute__((__nonnull__(1,2)));

extern __attribute__((nothrow)) int vprintf(const char * __restrict , __va_list ) __attribute__((__nonnull__(1)));







extern __attribute__((nothrow)) int _vprintf(const char * __restrict , __va_list ) __attribute__((__nonnull__(1)));





extern __attribute__((nothrow)) int vfprintf(FILE * __restrict ,
                    const char * __restrict , __va_list ) __attribute__((__nonnull__(1,2)));
# 584 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
extern __attribute__((nothrow)) int vsprintf(char * __restrict ,
                     const char * __restrict , __va_list ) __attribute__((__nonnull__(1,2)));
# 594 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
extern __attribute__((nothrow)) int __ARM_vsnprintf(char * __restrict , size_t ,
                     const char * __restrict , __va_list ) __attribute__((__nonnull__(3)));

extern __attribute__((nothrow)) int vsnprintf(char * __restrict , size_t ,
                     const char * __restrict , __va_list ) __attribute__((__nonnull__(3)));
# 609 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
extern __attribute__((nothrow)) int _vsprintf(char * __restrict ,
                      const char * __restrict , __va_list ) __attribute__((__nonnull__(1,2)));





extern __attribute__((nothrow)) int _vfprintf(FILE * __restrict ,
                     const char * __restrict , __va_list ) __attribute__((__nonnull__(1,2)));





extern __attribute__((nothrow)) int _vsnprintf(char * __restrict , size_t ,
                      const char * __restrict , __va_list ) __attribute__((__nonnull__(3)));
# 635 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
#pragma __printf_args
extern __attribute__((nothrow)) int __ARM_asprintf(char ** , const char * __restrict , ...) __attribute__((__nonnull__(2)));
extern __attribute__((nothrow)) int __ARM_vasprintf(char ** , const char * __restrict , __va_list ) __attribute__((__nonnull__(2)));
# 649 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
extern __attribute__((nothrow)) int fgetc(FILE * ) __attribute__((__nonnull__(1)));
# 659 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
extern __attribute__((nothrow)) char *fgets(char * __restrict , int ,
                    FILE * __restrict ) __attribute__((__nonnull__(1,3)));
# 673 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
extern __attribute__((nothrow)) int fputc(int , FILE * ) __attribute__((__nonnull__(2)));
# 683 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
extern __attribute__((nothrow)) int fputs(const char * __restrict , FILE * __restrict ) __attribute__((__nonnull__(1,2)));






extern __attribute__((nothrow)) int getc(FILE * ) __attribute__((__nonnull__(1)));
# 704 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
    extern __attribute__((nothrow)) int (getchar)(void);
# 713 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
extern __attribute__((nothrow)) char *gets(char * ) __attribute__((__nonnull__(1)));
# 725 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
extern __attribute__((nothrow)) int putc(int , FILE * ) __attribute__((__nonnull__(2)));
# 737 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
    extern __attribute__((nothrow)) int (putchar)(int );






extern __attribute__((nothrow)) int puts(const char * ) __attribute__((__nonnull__(1)));







extern __attribute__((nothrow)) int ungetc(int , FILE * ) __attribute__((__nonnull__(2)));
# 778 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
extern __attribute__((nothrow)) size_t fread(void * __restrict ,
                    size_t , size_t , FILE * __restrict ) __attribute__((__nonnull__(1,4)));
# 794 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
extern __attribute__((nothrow)) size_t __fread_bytes_avail(void * __restrict ,
                    size_t , FILE * __restrict ) __attribute__((__nonnull__(1,3)));
# 810 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
extern __attribute__((nothrow)) size_t fwrite(const void * __restrict ,
                    size_t , size_t , FILE * __restrict ) __attribute__((__nonnull__(1,4)));
# 822 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
extern __attribute__((nothrow)) int fgetpos(FILE * __restrict , fpos_t * __restrict ) __attribute__((__nonnull__(1,2)));
# 833 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
extern __attribute__((nothrow)) int fseek(FILE * , long int , int ) __attribute__((__nonnull__(1)));
# 850 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
extern __attribute__((nothrow)) int fsetpos(FILE * __restrict , const fpos_t * __restrict ) __attribute__((__nonnull__(1,2)));
# 863 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
extern __attribute__((nothrow)) long int ftell(FILE * ) __attribute__((__nonnull__(1)));
# 877 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
extern __attribute__((nothrow)) void rewind(FILE * ) __attribute__((__nonnull__(1)));
# 886 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
extern __attribute__((nothrow)) void clearerr(FILE * ) __attribute__((__nonnull__(1)));







extern __attribute__((nothrow)) int feof(FILE * ) __attribute__((__nonnull__(1)));




extern __attribute__((nothrow)) int ferror(FILE * ) __attribute__((__nonnull__(1)));




extern __attribute__((nothrow)) void perror(const char * );
# 917 "C:\\Keil\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
extern __attribute__((nothrow)) int _fisatty(FILE * ) __attribute__((__nonnull__(1)));



extern __attribute__((nothrow)) void __use_no_semihosting_swi(void);
extern __attribute__((nothrow)) void __use_no_semihosting(void);
# 49 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_def.h" 2





typedef enum
{
  HAL_OK = 0x00U,
  HAL_ERROR = 0x01U,
  HAL_BUSY = 0x02U,
  HAL_TIMEOUT = 0x03U
} HAL_StatusTypeDef;




typedef enum
{
  HAL_UNLOCKED = 0x00,
  HAL_LOCKED = 0x01
} HAL_LockTypeDef;
# 46 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_rcc.h" 2



# 1 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc_ex.h" 1
# 63 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc_ex.h"
typedef struct
{
  uint32_t PLLState;


  uint32_t PLLSource;


  uint32_t PLLM;


  uint32_t PLLN;


  uint32_t PLLP;


  uint32_t PLLQ;






}RCC_PLLInitTypeDef;




typedef struct
{
  uint32_t PLLI2SN;



  uint32_t PLLI2SR;



  uint32_t PLLI2SQ;





  uint32_t PLLI2SP;



}RCC_PLLI2SInitTypeDef;




typedef struct
{
  uint32_t PLLSAIN;



  uint32_t PLLSAIQ;





  uint32_t PLLSAIR;




  uint32_t PLLSAIP;


}RCC_PLLSAIInitTypeDef;




typedef struct
{
  uint32_t PeriphClockSelection;


  RCC_PLLI2SInitTypeDef PLLI2S;


  RCC_PLLSAIInitTypeDef PLLSAI;


  uint32_t PLLI2SDivQ;



  uint32_t PLLSAIDivQ;



  uint32_t PLLSAIDivR;


  uint32_t RTCClockSelection;


  uint32_t I2sClockSelection;


  uint32_t TIMPresSelection;


  uint32_t Sai1ClockSelection;


  uint32_t Sai2ClockSelection;


  uint32_t Usart1ClockSelection;


  uint32_t Usart2ClockSelection;


  uint32_t Usart3ClockSelection;


  uint32_t Uart4ClockSelection;


  uint32_t Uart5ClockSelection;


  uint32_t Usart6ClockSelection;


  uint32_t Uart7ClockSelection;


  uint32_t Uart8ClockSelection;


  uint32_t I2c1ClockSelection;


  uint32_t I2c2ClockSelection;


  uint32_t I2c3ClockSelection;


  uint32_t I2c4ClockSelection;


  uint32_t Lptim1ClockSelection;


  uint32_t CecClockSelection;


  uint32_t Clk48ClockSelection;


  uint32_t Sdmmc1ClockSelection;
# 240 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc_ex.h"
}RCC_PeriphCLKInitTypeDef;
# 3204 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc_ex.h"
HAL_StatusTypeDef HAL_RCCEx_PeriphCLKConfig(RCC_PeriphCLKInitTypeDef *PeriphClkInit);
void HAL_RCCEx_GetPeriphCLKConfig(RCC_PeriphCLKInitTypeDef *PeriphClkInit);
uint32_t HAL_RCCEx_GetPeriphCLKFreq(uint32_t PeriphClk);
# 50 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_rcc.h" 2
# 68 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_rcc.h"
typedef struct
{
  uint32_t OscillatorType;


  uint32_t HSEState;


  uint32_t LSEState;


  uint32_t HSIState;


  uint32_t HSICalibrationValue;


  uint32_t LSIState;


  RCC_PLLInitTypeDef PLL;

}RCC_OscInitTypeDef;




typedef struct
{
  uint32_t ClockType;


  uint32_t SYSCLKSource;


  uint32_t AHBCLKDivider;


  uint32_t APB1CLKDivider;


  uint32_t APB2CLKDivider;


}RCC_ClkInitTypeDef;
# 1133 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_rcc.h"
void HAL_RCC_DeInit(void);
HAL_StatusTypeDef HAL_RCC_OscConfig(RCC_OscInitTypeDef *RCC_OscInitStruct);
HAL_StatusTypeDef HAL_RCC_ClockConfig(RCC_ClkInitTypeDef *RCC_ClkInitStruct, uint32_t FLatency);
# 1144 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_rcc.h"
void HAL_RCC_MCOConfig(uint32_t RCC_MCOx, uint32_t RCC_MCOSource, uint32_t RCC_MCODiv);
void HAL_RCC_EnableCSS(void);
void HAL_RCC_DisableCSS(void);
uint32_t HAL_RCC_GetSysClockFreq(void);
uint32_t HAL_RCC_GetHCLKFreq(void);
uint32_t HAL_RCC_GetPCLK1Freq(void);
uint32_t HAL_RCC_GetPCLK2Freq(void);
void HAL_RCC_GetOscConfig(RCC_OscInitTypeDef *RCC_OscInitStruct);
void HAL_RCC_GetClockConfig(RCC_ClkInitTypeDef *RCC_ClkInitStruct, uint32_t *pFLatency);


void HAL_RCC_NMI_IRQHandler(void);


void HAL_RCC_CSSCallback(void);
# 239 "../Inc\\stm32f7xx_hal_conf.h" 2



# 1 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_gpio.h" 1
# 63 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_gpio.h"
typedef struct
{
  uint32_t Pin;


  uint32_t Mode;


  uint32_t Pull;


  uint32_t Speed;


  uint32_t Alternate;

}GPIO_InitTypeDef;




typedef enum
{
  GPIO_PIN_RESET = 0,
  GPIO_PIN_SET
}GPIO_PinState;
# 230 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_gpio.h"
# 1 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_gpio_ex.h" 1
# 231 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_gpio.h" 2
# 241 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_gpio.h"
void HAL_GPIO_Init(GPIO_TypeDef *GPIOx, GPIO_InitTypeDef *GPIO_Init);
void HAL_GPIO_DeInit(GPIO_TypeDef *GPIOx, uint32_t GPIO_Pin);
# 251 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_gpio.h"
GPIO_PinState HAL_GPIO_ReadPin(GPIO_TypeDef* GPIOx, uint16_t GPIO_Pin);
void HAL_GPIO_WritePin(GPIO_TypeDef* GPIOx, uint16_t GPIO_Pin, GPIO_PinState PinState);
void HAL_GPIO_TogglePin(GPIO_TypeDef* GPIOx, uint16_t GPIO_Pin);
HAL_StatusTypeDef HAL_GPIO_LockPin(GPIO_TypeDef* GPIOx, uint16_t GPIO_Pin);
void HAL_GPIO_EXTI_IRQHandler(uint16_t GPIO_Pin);
void HAL_GPIO_EXTI_Callback(uint16_t GPIO_Pin);
# 243 "../Inc\\stm32f7xx_hal_conf.h" 2



# 1 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_dma.h" 1
# 65 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_dma.h"
typedef struct
{
  uint32_t Channel;


  uint32_t Direction;



  uint32_t PeriphInc;


  uint32_t MemInc;


  uint32_t PeriphDataAlignment;


  uint32_t MemDataAlignment;


  uint32_t Mode;




  uint32_t Priority;


  uint32_t FIFOMode;




  uint32_t FIFOThreshold;


  uint32_t MemBurst;





  uint32_t PeriphBurst;




}DMA_InitTypeDef;




typedef enum
{
  HAL_DMA_STATE_RESET = 0x00U,
  HAL_DMA_STATE_READY = 0x01U,
  HAL_DMA_STATE_BUSY = 0x02U,
  HAL_DMA_STATE_TIMEOUT = 0x03U,
  HAL_DMA_STATE_ERROR = 0x04U,
  HAL_DMA_STATE_ABORT = 0x05U,
}HAL_DMA_StateTypeDef;




typedef enum
{
  HAL_DMA_FULL_TRANSFER = 0x00U,
  HAL_DMA_HALF_TRANSFER = 0x01U,
}HAL_DMA_LevelCompleteTypeDef;




typedef enum
{
  HAL_DMA_XFER_CPLT_CB_ID = 0x00U,
  HAL_DMA_XFER_HALFCPLT_CB_ID = 0x01U,
  HAL_DMA_XFER_M1CPLT_CB_ID = 0x02U,
  HAL_DMA_XFER_M1HALFCPLT_CB_ID = 0x03U,
  HAL_DMA_XFER_ERROR_CB_ID = 0x04U,
  HAL_DMA_XFER_ABORT_CB_ID = 0x05U,
  HAL_DMA_XFER_ALL_CB_ID = 0x06U
}HAL_DMA_CallbackIDTypeDef;




typedef struct __DMA_HandleTypeDef
{
  DMA_Stream_TypeDef *Instance;

  DMA_InitTypeDef Init;

  HAL_LockTypeDef Lock;

  volatile HAL_DMA_StateTypeDef State;

  void *Parent;

  void (* XferCpltCallback)( struct __DMA_HandleTypeDef * hdma);

  void (* XferHalfCpltCallback)( struct __DMA_HandleTypeDef * hdma);

  void (* XferM1CpltCallback)( struct __DMA_HandleTypeDef * hdma);

  void (* XferM1HalfCpltCallback)( struct __DMA_HandleTypeDef * hdma);

  void (* XferErrorCallback)( struct __DMA_HandleTypeDef * hdma);

  void (* XferAbortCallback)( struct __DMA_HandleTypeDef * hdma);

 volatile uint32_t ErrorCode;

 uint32_t StreamBaseAddress;

 uint32_t StreamIndex;

}DMA_HandleTypeDef;
# 630 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_dma.h"
# 1 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_dma_ex.h" 1
# 64 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_dma_ex.h"
typedef enum
{
  MEMORY0 = 0x00U,
  MEMORY1 = 0x01U,

}HAL_DMA_MemoryTypeDef;
# 128 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_dma_ex.h"
HAL_StatusTypeDef HAL_DMAEx_MultiBufferStart(DMA_HandleTypeDef *hdma, uint32_t SrcAddress, uint32_t DstAddress, uint32_t SecondMemAddress, uint32_t DataLength);
HAL_StatusTypeDef HAL_DMAEx_MultiBufferStart_IT(DMA_HandleTypeDef *hdma, uint32_t SrcAddress, uint32_t DstAddress, uint32_t SecondMemAddress, uint32_t DataLength);
HAL_StatusTypeDef HAL_DMAEx_ChangeMemory(DMA_HandleTypeDef *hdma, uint32_t Address, HAL_DMA_MemoryTypeDef memory);
# 631 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_dma.h" 2
# 643 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_dma.h"
HAL_StatusTypeDef HAL_DMA_Init(DMA_HandleTypeDef *hdma);
HAL_StatusTypeDef HAL_DMA_DeInit(DMA_HandleTypeDef *hdma);
# 653 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_dma.h"
HAL_StatusTypeDef HAL_DMA_Start (DMA_HandleTypeDef *hdma, uint32_t SrcAddress, uint32_t DstAddress, uint32_t DataLength);
HAL_StatusTypeDef HAL_DMA_Start_IT(DMA_HandleTypeDef *hdma, uint32_t SrcAddress, uint32_t DstAddress, uint32_t DataLength);
HAL_StatusTypeDef HAL_DMA_Abort(DMA_HandleTypeDef *hdma);
HAL_StatusTypeDef HAL_DMA_Abort_IT(DMA_HandleTypeDef *hdma);
HAL_StatusTypeDef HAL_DMA_PollForTransfer(DMA_HandleTypeDef *hdma, HAL_DMA_LevelCompleteTypeDef CompleteLevel, uint32_t Timeout);
void HAL_DMA_IRQHandler(DMA_HandleTypeDef *hdma);
HAL_StatusTypeDef HAL_DMA_RegisterCallback(DMA_HandleTypeDef *hdma, HAL_DMA_CallbackIDTypeDef CallbackID, void (* pCallback)(DMA_HandleTypeDef *_hdma));
HAL_StatusTypeDef HAL_DMA_UnRegisterCallback(DMA_HandleTypeDef *hdma, HAL_DMA_CallbackIDTypeDef CallbackID);
# 670 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_dma.h"
HAL_DMA_StateTypeDef HAL_DMA_GetState(DMA_HandleTypeDef *hdma);
uint32_t HAL_DMA_GetError(DMA_HandleTypeDef *hdma);
# 247 "../Inc\\stm32f7xx_hal_conf.h" 2



# 1 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_cortex.h" 1
# 64 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_cortex.h"
typedef struct
{
  uint8_t Enable;

  uint8_t Number;

  uint32_t BaseAddress;
  uint8_t Size;

  uint8_t SubRegionDisable;

  uint8_t TypeExtField;

  uint8_t AccessPermission;

  uint8_t DisableExec;

  uint8_t IsShareable;

  uint8_t IsCacheable;

  uint8_t IsBufferable;

}MPU_Region_InitTypeDef;
# 277 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_cortex.h"
void HAL_NVIC_SetPriorityGrouping(uint32_t PriorityGroup);
void HAL_NVIC_SetPriority(IRQn_Type IRQn, uint32_t PreemptPriority, uint32_t SubPriority);
void HAL_NVIC_EnableIRQ(IRQn_Type IRQn);
void HAL_NVIC_DisableIRQ(IRQn_Type IRQn);
void HAL_NVIC_SystemReset(void);
uint32_t HAL_SYSTICK_Config(uint32_t TicksNumb);
# 292 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_cortex.h"
void HAL_MPU_Enable(uint32_t MPU_Control);
void HAL_MPU_Disable(void);
void HAL_MPU_ConfigRegion(MPU_Region_InitTypeDef *MPU_Init);

uint32_t HAL_NVIC_GetPriorityGrouping(void);
void HAL_NVIC_GetPriority(IRQn_Type IRQn, uint32_t PriorityGroup, uint32_t* pPreemptPriority, uint32_t* pSubPriority);
uint32_t HAL_NVIC_GetPendingIRQ(IRQn_Type IRQn);
void HAL_NVIC_SetPendingIRQ(IRQn_Type IRQn);
void HAL_NVIC_ClearPendingIRQ(IRQn_Type IRQn);
uint32_t HAL_NVIC_GetActive(IRQn_Type IRQn);
void HAL_SYSTICK_CLKSourceConfig(uint32_t CLKSource);
void HAL_SYSTICK_IRQHandler(void);
void HAL_SYSTICK_Callback(void);
# 251 "../Inc\\stm32f7xx_hal_conf.h" 2



# 1 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_adc.h" 1
# 73 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_adc.h"
typedef struct
{
  uint32_t ClockPrescaler;


  uint32_t Resolution;

  uint32_t DataAlign;


  uint32_t ScanConvMode;







  uint32_t EOCSelection;






  uint32_t ContinuousConvMode;


  uint32_t NbrOfConversion;


  uint32_t DiscontinuousConvMode;



  uint32_t NbrOfDiscConversion;


  uint32_t ExternalTrigConv;



  uint32_t ExternalTrigConvEdge;


  uint32_t DMAContinuousRequests;




}ADC_InitTypeDef;
# 132 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_adc.h"
typedef struct
{
  uint32_t Channel;

  uint32_t Rank;


  uint32_t SamplingTime;
# 148 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_adc.h"
  uint32_t Offset;
}ADC_ChannelConfTypeDef;




typedef struct
{
  uint32_t WatchdogMode;

  uint32_t HighThreshold;

  uint32_t LowThreshold;

  uint32_t Channel;


  uint32_t ITMode;


  uint32_t WatchdogNumber;
}ADC_AnalogWDGConfTypeDef;
# 208 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_adc.h"
typedef struct
{
  ADC_TypeDef *Instance;

  ADC_InitTypeDef Init;

  volatile uint32_t NbrOfCurrentConversionRank;

  DMA_HandleTypeDef *DMA_Handle;

  HAL_LockTypeDef Lock;

  volatile uint32_t State;

  volatile uint32_t ErrorCode;
}ADC_HandleTypeDef;
# 556 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_adc.h"
# 1 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_adc_ex.h" 1
# 72 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_adc_ex.h"
typedef struct
{
  uint32_t InjectedChannel;


  uint32_t InjectedRank;


  uint32_t InjectedSamplingTime;
# 89 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_adc_ex.h"
  uint32_t InjectedOffset;



  uint32_t InjectedNbrOfConversion;




  uint32_t InjectedDiscontinuousConvMode;






  uint32_t AutoInjectedConv;







  uint32_t ExternalTrigInjecConv;







  uint32_t ExternalTrigInjecConvEdge;




}ADC_InjectionConfTypeDef;




typedef struct
{
  uint32_t Mode;

  uint32_t DMAAccessMode;

  uint32_t TwoSamplingDelay;

}ADC_MultiModeTypeDef;
# 256 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_adc_ex.h"
HAL_StatusTypeDef HAL_ADCEx_InjectedStart(ADC_HandleTypeDef* hadc);
HAL_StatusTypeDef HAL_ADCEx_InjectedStop(ADC_HandleTypeDef* hadc);
HAL_StatusTypeDef HAL_ADCEx_InjectedPollForConversion(ADC_HandleTypeDef* hadc, uint32_t Timeout);
HAL_StatusTypeDef HAL_ADCEx_InjectedStart_IT(ADC_HandleTypeDef* hadc);
HAL_StatusTypeDef HAL_ADCEx_InjectedStop_IT(ADC_HandleTypeDef* hadc);
uint32_t HAL_ADCEx_InjectedGetValue(ADC_HandleTypeDef* hadc, uint32_t InjectedRank);
HAL_StatusTypeDef HAL_ADCEx_MultiModeStart_DMA(ADC_HandleTypeDef* hadc, uint32_t* pData, uint32_t Length);
HAL_StatusTypeDef HAL_ADCEx_MultiModeStop_DMA(ADC_HandleTypeDef* hadc);
uint32_t HAL_ADCEx_MultiModeGetValue(ADC_HandleTypeDef* hadc);
void HAL_ADCEx_InjectedConvCpltCallback(ADC_HandleTypeDef* hadc);


HAL_StatusTypeDef HAL_ADCEx_InjectedConfigChannel(ADC_HandleTypeDef* hadc,ADC_InjectionConfTypeDef* sConfigInjected);
HAL_StatusTypeDef HAL_ADCEx_MultiModeConfigChannel(ADC_HandleTypeDef* hadc, ADC_MultiModeTypeDef* multimode);
# 557 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_adc.h" 2
# 567 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_adc.h"
HAL_StatusTypeDef HAL_ADC_Init(ADC_HandleTypeDef* hadc);
HAL_StatusTypeDef HAL_ADC_DeInit(ADC_HandleTypeDef *hadc);
void HAL_ADC_MspInit(ADC_HandleTypeDef* hadc);
void HAL_ADC_MspDeInit(ADC_HandleTypeDef* hadc);
# 579 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_adc.h"
HAL_StatusTypeDef HAL_ADC_Start(ADC_HandleTypeDef* hadc);
HAL_StatusTypeDef HAL_ADC_Stop(ADC_HandleTypeDef* hadc);
HAL_StatusTypeDef HAL_ADC_PollForConversion(ADC_HandleTypeDef* hadc, uint32_t Timeout);

HAL_StatusTypeDef HAL_ADC_PollForEvent(ADC_HandleTypeDef* hadc, uint32_t EventType, uint32_t Timeout);

HAL_StatusTypeDef HAL_ADC_Start_IT(ADC_HandleTypeDef* hadc);
HAL_StatusTypeDef HAL_ADC_Stop_IT(ADC_HandleTypeDef* hadc);

void HAL_ADC_IRQHandler(ADC_HandleTypeDef* hadc);

HAL_StatusTypeDef HAL_ADC_Start_DMA(ADC_HandleTypeDef* hadc, uint32_t* pData, uint32_t Length);
HAL_StatusTypeDef HAL_ADC_Stop_DMA(ADC_HandleTypeDef* hadc);

uint32_t HAL_ADC_GetValue(ADC_HandleTypeDef* hadc);

void HAL_ADC_ConvCpltCallback(ADC_HandleTypeDef* hadc);
void HAL_ADC_ConvHalfCpltCallback(ADC_HandleTypeDef* hadc);
void HAL_ADC_LevelOutOfWindowCallback(ADC_HandleTypeDef* hadc);
void HAL_ADC_ErrorCallback(ADC_HandleTypeDef *hadc);
# 607 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_adc.h"
HAL_StatusTypeDef HAL_ADC_ConfigChannel(ADC_HandleTypeDef* hadc, ADC_ChannelConfTypeDef* sConfig);
HAL_StatusTypeDef HAL_ADC_AnalogWDGConfig(ADC_HandleTypeDef* hadc, ADC_AnalogWDGConfTypeDef* AnalogWDGConfig);
# 617 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_adc.h"
uint32_t HAL_ADC_GetState(ADC_HandleTypeDef* hadc);
uint32_t HAL_ADC_GetError(ADC_HandleTypeDef *hadc);
# 255 "../Inc\\stm32f7xx_hal_conf.h" 2
# 266 "../Inc\\stm32f7xx_hal_conf.h"
# 1 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_crc.h" 1
# 64 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_crc.h"
typedef enum
{
  HAL_CRC_STATE_RESET = 0x00U,
  HAL_CRC_STATE_READY = 0x01U,
  HAL_CRC_STATE_BUSY = 0x02U,
  HAL_CRC_STATE_TIMEOUT = 0x03U,
  HAL_CRC_STATE_ERROR = 0x04U
}HAL_CRC_StateTypeDef;







typedef struct
{
  uint8_t DefaultPolynomialUse;





  uint8_t DefaultInitValueUse;




  uint32_t GeneratingPolynomial;




  uint32_t CRCLength;






  uint32_t InitValue;


  uint32_t InputDataInversionMode;






  uint32_t OutputDataInversionMode;



}CRC_InitTypeDef;







typedef struct
{
  CRC_TypeDef *Instance;

  CRC_InitTypeDef Init;

  HAL_LockTypeDef Lock;

  volatile HAL_CRC_StateTypeDef State;

  uint32_t InputDataFormat;






}CRC_HandleTypeDef;
# 283 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_crc.h"
# 1 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_crc_ex.h" 1
# 136 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_crc_ex.h"
HAL_StatusTypeDef HAL_CRCEx_Polynomial_Set(CRC_HandleTypeDef *hcrc, uint32_t Pol, uint32_t PolyLength);
HAL_StatusTypeDef HAL_CRCEx_Input_Data_Reverse(CRC_HandleTypeDef *hcrc, uint32_t InputReverseMode);
HAL_StatusTypeDef HAL_CRCEx_Output_Data_Reverse(CRC_HandleTypeDef *hcrc, uint32_t OutputReverseMode);
# 284 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_crc.h" 2
# 294 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_crc.h"
HAL_StatusTypeDef HAL_CRC_Init(CRC_HandleTypeDef *hcrc);
HAL_StatusTypeDef HAL_CRC_DeInit (CRC_HandleTypeDef *hcrc);
void HAL_CRC_MspInit(CRC_HandleTypeDef *hcrc);
void HAL_CRC_MspDeInit(CRC_HandleTypeDef *hcrc);
# 310 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_crc.h"
uint32_t HAL_CRC_Accumulate(CRC_HandleTypeDef *hcrc, uint32_t pBuffer[], uint32_t BufferLength);
uint32_t HAL_CRC_Calculate(CRC_HandleTypeDef *hcrc, uint32_t pBuffer[], uint32_t BufferLength);
# 320 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_crc.h"
HAL_CRC_StateTypeDef HAL_CRC_GetState(CRC_HandleTypeDef *hcrc);
# 267 "../Inc\\stm32f7xx_hal_conf.h" 2







# 1 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_dma2d.h" 1
# 67 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_dma2d.h"
typedef struct
{
  uint32_t Blue;


  uint32_t Green;


  uint32_t Red;

} DMA2D_ColorTypeDef;




typedef struct
{
  uint32_t *pCLUT;

  uint32_t CLUTColorMode;


  uint32_t Size;

} DMA2D_CLUTCfgTypeDef;




typedef struct
{
  uint32_t Mode;


  uint32_t ColorMode;


  uint32_t OutputOffset;
# 117 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_dma2d.h"
} DMA2D_InitTypeDef;





typedef struct
{
  uint32_t InputOffset;


  uint32_t InputColorMode;


  uint32_t AlphaMode;


  uint32_t InputAlpha;
# 159 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_dma2d.h"
} DMA2D_LayerCfgTypeDef;




typedef enum
{
  HAL_DMA2D_STATE_RESET = 0x00U,
  HAL_DMA2D_STATE_READY = 0x01U,
  HAL_DMA2D_STATE_BUSY = 0x02U,
  HAL_DMA2D_STATE_TIMEOUT = 0x03U,
  HAL_DMA2D_STATE_ERROR = 0x04U,
  HAL_DMA2D_STATE_SUSPEND = 0x05U
}HAL_DMA2D_StateTypeDef;




typedef struct __DMA2D_HandleTypeDef
{
  DMA2D_TypeDef *Instance;

  DMA2D_InitTypeDef Init;

  void (* XferCpltCallback)(struct __DMA2D_HandleTypeDef * hdma2d);

  void (* XferErrorCallback)(struct __DMA2D_HandleTypeDef * hdma2d);

  DMA2D_LayerCfgTypeDef LayerCfg[2];

  HAL_LockTypeDef Lock;

  volatile HAL_DMA2D_StateTypeDef State;

  volatile uint32_t ErrorCode;
} DMA2D_HandleTypeDef;
# 447 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_dma2d.h"
HAL_StatusTypeDef HAL_DMA2D_Init(DMA2D_HandleTypeDef *hdma2d);
HAL_StatusTypeDef HAL_DMA2D_DeInit (DMA2D_HandleTypeDef *hdma2d);
void HAL_DMA2D_MspInit(DMA2D_HandleTypeDef* hdma2d);
void HAL_DMA2D_MspDeInit(DMA2D_HandleTypeDef* hdma2d);
# 462 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_dma2d.h"
HAL_StatusTypeDef HAL_DMA2D_Start(DMA2D_HandleTypeDef *hdma2d, uint32_t pdata, uint32_t DstAddress, uint32_t Width, uint32_t Height);
HAL_StatusTypeDef HAL_DMA2D_BlendingStart(DMA2D_HandleTypeDef *hdma2d, uint32_t SrcAddress1, uint32_t SrcAddress2, uint32_t DstAddress, uint32_t Width, uint32_t Height);
HAL_StatusTypeDef HAL_DMA2D_Start_IT(DMA2D_HandleTypeDef *hdma2d, uint32_t pdata, uint32_t DstAddress, uint32_t Width, uint32_t Height);
HAL_StatusTypeDef HAL_DMA2D_BlendingStart_IT(DMA2D_HandleTypeDef *hdma2d, uint32_t SrcAddress1, uint32_t SrcAddress2, uint32_t DstAddress, uint32_t Width, uint32_t Height);
HAL_StatusTypeDef HAL_DMA2D_Suspend(DMA2D_HandleTypeDef *hdma2d);
HAL_StatusTypeDef HAL_DMA2D_Resume(DMA2D_HandleTypeDef *hdma2d);
HAL_StatusTypeDef HAL_DMA2D_Abort(DMA2D_HandleTypeDef *hdma2d);
HAL_StatusTypeDef HAL_DMA2D_EnableCLUT(DMA2D_HandleTypeDef *hdma2d, uint32_t LayerIdx);
HAL_StatusTypeDef HAL_DMA2D_CLUTLoad(DMA2D_HandleTypeDef *hdma2d, DMA2D_CLUTCfgTypeDef CLUTCfg, uint32_t LayerIdx);
HAL_StatusTypeDef HAL_DMA2D_CLUTLoad_IT(DMA2D_HandleTypeDef *hdma2d, DMA2D_CLUTCfgTypeDef CLUTCfg, uint32_t LayerIdx);
HAL_StatusTypeDef HAL_DMA2D_CLUTLoading_Abort(DMA2D_HandleTypeDef *hdma2d, uint32_t LayerIdx);
HAL_StatusTypeDef HAL_DMA2D_CLUTLoading_Suspend(DMA2D_HandleTypeDef *hdma2d, uint32_t LayerIdx);
HAL_StatusTypeDef HAL_DMA2D_CLUTLoading_Resume(DMA2D_HandleTypeDef *hdma2d, uint32_t LayerIdx);
HAL_StatusTypeDef HAL_DMA2D_PollForTransfer(DMA2D_HandleTypeDef *hdma2d, uint32_t Timeout);
void HAL_DMA2D_IRQHandler(DMA2D_HandleTypeDef *hdma2d);
void HAL_DMA2D_LineEventCallback(DMA2D_HandleTypeDef *hdma2d);
void HAL_DMA2D_CLUTLoadingCpltCallback(DMA2D_HandleTypeDef *hdma2d);
# 489 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_dma2d.h"
HAL_StatusTypeDef HAL_DMA2D_ConfigLayer(DMA2D_HandleTypeDef *hdma2d, uint32_t LayerIdx);
HAL_StatusTypeDef HAL_DMA2D_ConfigCLUT(DMA2D_HandleTypeDef *hdma2d, DMA2D_CLUTCfgTypeDef CLUTCfg, uint32_t LayerIdx);
HAL_StatusTypeDef HAL_DMA2D_ProgramLineEvent(DMA2D_HandleTypeDef *hdma2d, uint32_t Line);
HAL_StatusTypeDef HAL_DMA2D_EnableDeadTime(DMA2D_HandleTypeDef *hdma2d);
HAL_StatusTypeDef HAL_DMA2D_DisableDeadTime(DMA2D_HandleTypeDef *hdma2d);
HAL_StatusTypeDef HAL_DMA2D_ConfigDeadTime(DMA2D_HandleTypeDef *hdma2d, uint8_t DeadTime);
# 505 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_dma2d.h"
HAL_DMA2D_StateTypeDef HAL_DMA2D_GetState(DMA2D_HandleTypeDef *hdma2d);
uint32_t HAL_DMA2D_GetError(DMA2D_HandleTypeDef *hdma2d);
# 275 "../Inc\\stm32f7xx_hal_conf.h" 2
# 290 "../Inc\\stm32f7xx_hal_conf.h"
# 1 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_flash.h" 1
# 63 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_flash.h"
typedef enum
{
  FLASH_PROC_NONE = 0U,
  FLASH_PROC_SECTERASE,
  FLASH_PROC_MASSERASE,
  FLASH_PROC_PROGRAM
} FLASH_ProcedureTypeDef;





typedef struct
{
  volatile FLASH_ProcedureTypeDef ProcedureOnGoing;

  volatile uint32_t NbSectorsToErase;

  volatile uint8_t VoltageForErase;

  volatile uint32_t Sector;

  volatile uint32_t Address;

  HAL_LockTypeDef Lock;

  volatile uint32_t ErrorCode;

}FLASH_ProcessTypeDef;
# 310 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_flash.h"
# 1 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_flash_ex.h" 1
# 63 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_flash_ex.h"
typedef struct
{
  uint32_t TypeErase;







  uint32_t Sector;


  uint32_t NbSectors;


  uint32_t VoltageRange;


} FLASH_EraseInitTypeDef;




typedef struct
{
  uint32_t OptionType;


  uint32_t WRPState;


  uint32_t WRPSector;


  uint32_t RDPLevel;


  uint32_t BORLevel;


  uint32_t USERConfig;



  uint32_t BootAddr0;


  uint32_t BootAddr1;
# 122 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_flash_ex.h"
} FLASH_OBProgramInitTypeDef;
# 498 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_flash_ex.h"
HAL_StatusTypeDef HAL_FLASHEx_Erase(FLASH_EraseInitTypeDef *pEraseInit, uint32_t *SectorError);
HAL_StatusTypeDef HAL_FLASHEx_Erase_IT(FLASH_EraseInitTypeDef *pEraseInit);
HAL_StatusTypeDef HAL_FLASHEx_OBProgram(FLASH_OBProgramInitTypeDef *pOBInit);
void HAL_FLASHEx_OBGetConfig(FLASH_OBProgramInitTypeDef *pOBInit);
# 642 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_flash_ex.h"
void FLASH_Erase_Sector(uint32_t Sector, uint8_t VoltageRange);
# 311 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_flash.h" 2
# 320 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_flash.h"
HAL_StatusTypeDef HAL_FLASH_Program(uint32_t TypeProgram, uint32_t Address, uint64_t Data);
HAL_StatusTypeDef HAL_FLASH_Program_IT(uint32_t TypeProgram, uint32_t Address, uint64_t Data);

void HAL_FLASH_IRQHandler(void);

void HAL_FLASH_EndOfOperationCallback(uint32_t ReturnValue);
void HAL_FLASH_OperationErrorCallback(uint32_t ReturnValue);
# 335 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_flash.h"
HAL_StatusTypeDef HAL_FLASH_Unlock(void);
HAL_StatusTypeDef HAL_FLASH_Lock(void);
HAL_StatusTypeDef HAL_FLASH_OB_Unlock(void);
HAL_StatusTypeDef HAL_FLASH_OB_Lock(void);

HAL_StatusTypeDef HAL_FLASH_OB_Launch(void);
# 349 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_flash.h"
uint32_t HAL_FLASH_GetError(void);
HAL_StatusTypeDef FLASH_WaitForLastOperation(uint32_t Timeout);
# 291 "../Inc\\stm32f7xx_hal_conf.h" 2
# 306 "../Inc\\stm32f7xx_hal_conf.h"
# 1 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_sdram.h" 1
# 45 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_sdram.h"
# 1 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_ll_fmc.h" 1
# 412 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_ll_fmc.h"
typedef struct
{
  uint32_t NSBank;


  uint32_t DataAddressMux;



  uint32_t MemoryType;



  uint32_t MemoryDataWidth;


  uint32_t BurstAccessMode;



  uint32_t WaitSignalPolarity;



  uint32_t WaitSignalActive;




  uint32_t WriteOperation;


  uint32_t WaitSignal;



  uint32_t ExtendedMode;


  uint32_t AsynchronousWait;



  uint32_t WriteBurst;


  uint32_t ContinuousClock;




  uint32_t WriteFifo;




  uint32_t PageSize;


}FMC_NORSRAM_InitTypeDef;




typedef struct
{
  uint32_t AddressSetupTime;




  uint32_t AddressHoldTime;




  uint32_t DataSetupTime;





  uint32_t BusTurnAroundDuration;




  uint32_t CLKDivision;




  uint32_t DataLatency;







  uint32_t AccessMode;

}FMC_NORSRAM_TimingTypeDef;




typedef struct
{
  uint32_t NandBank;


  uint32_t Waitfeature;


  uint32_t MemoryDataWidth;


  uint32_t EccComputation;


  uint32_t ECCPageSize;


  uint32_t TCLRSetupTime;



  uint32_t TARSetupTime;


}FMC_NAND_InitTypeDef;




typedef struct
{
  uint32_t SetupTime;





  uint32_t WaitSetupTime;





  uint32_t HoldSetupTime;






  uint32_t HiZSetupTime;




}FMC_NAND_PCC_TimingTypeDef;




typedef struct
{
  uint32_t SDBank;


  uint32_t ColumnBitsNumber;


  uint32_t RowBitsNumber;


  uint32_t MemoryDataWidth;


  uint32_t InternalBankNumber;


  uint32_t CASLatency;


  uint32_t WriteProtection;


  uint32_t SDClockPeriod;



  uint32_t ReadBurst;



  uint32_t ReadPipeDelay;

}FMC_SDRAM_InitTypeDef;




typedef struct
{
  uint32_t LoadToActiveDelay;



  uint32_t ExitSelfRefreshDelay;



  uint32_t SelfRefreshTime;



  uint32_t RowCycleDelay;




  uint32_t WriteRecoveryTime;


  uint32_t RPDelay;



  uint32_t RCDDelay;


}FMC_SDRAM_TimingTypeDef;




typedef struct
{
  uint32_t CommandMode;


  uint32_t CommandTarget;


  uint32_t AutoRefreshNumber;


  uint32_t ModeRegisterDefinition;
}FMC_SDRAM_CommandTypeDef;
# 1245 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_ll_fmc.h"
HAL_StatusTypeDef FMC_NORSRAM_Init(FMC_Bank1_TypeDef *Device, FMC_NORSRAM_InitTypeDef *Init);
HAL_StatusTypeDef FMC_NORSRAM_Timing_Init(FMC_Bank1_TypeDef *Device, FMC_NORSRAM_TimingTypeDef *Timing, uint32_t Bank);
HAL_StatusTypeDef FMC_NORSRAM_Extended_Timing_Init(FMC_Bank1E_TypeDef *Device, FMC_NORSRAM_TimingTypeDef *Timing, uint32_t Bank, uint32_t ExtendedMode);
HAL_StatusTypeDef FMC_NORSRAM_DeInit(FMC_Bank1_TypeDef *Device, FMC_Bank1E_TypeDef *ExDevice, uint32_t Bank);







HAL_StatusTypeDef FMC_NORSRAM_WriteOperation_Enable(FMC_Bank1_TypeDef *Device, uint32_t Bank);
HAL_StatusTypeDef FMC_NORSRAM_WriteOperation_Disable(FMC_Bank1_TypeDef *Device, uint32_t Bank);
# 1271 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_ll_fmc.h"
HAL_StatusTypeDef FMC_NAND_Init(FMC_Bank3_TypeDef *Device, FMC_NAND_InitTypeDef *Init);
HAL_StatusTypeDef FMC_NAND_CommonSpace_Timing_Init(FMC_Bank3_TypeDef *Device, FMC_NAND_PCC_TimingTypeDef *Timing, uint32_t Bank);
HAL_StatusTypeDef FMC_NAND_AttributeSpace_Timing_Init(FMC_Bank3_TypeDef *Device, FMC_NAND_PCC_TimingTypeDef *Timing, uint32_t Bank);
HAL_StatusTypeDef FMC_NAND_DeInit(FMC_Bank3_TypeDef *Device, uint32_t Bank);







HAL_StatusTypeDef FMC_NAND_ECC_Enable(FMC_Bank3_TypeDef *Device, uint32_t Bank);
HAL_StatusTypeDef FMC_NAND_ECC_Disable(FMC_Bank3_TypeDef *Device, uint32_t Bank);
HAL_StatusTypeDef FMC_NAND_GetECC(FMC_Bank3_TypeDef *Device, uint32_t *ECCval, uint32_t Bank, uint32_t Timeout);
# 1295 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_ll_fmc.h"
HAL_StatusTypeDef FMC_SDRAM_Init(FMC_Bank5_6_TypeDef *Device, FMC_SDRAM_InitTypeDef *Init);
HAL_StatusTypeDef FMC_SDRAM_Timing_Init(FMC_Bank5_6_TypeDef *Device, FMC_SDRAM_TimingTypeDef *Timing, uint32_t Bank);
HAL_StatusTypeDef FMC_SDRAM_DeInit(FMC_Bank5_6_TypeDef *Device, uint32_t Bank);
# 1306 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_ll_fmc.h"
HAL_StatusTypeDef FMC_SDRAM_WriteProtection_Enable(FMC_Bank5_6_TypeDef *Device, uint32_t Bank);
HAL_StatusTypeDef FMC_SDRAM_WriteProtection_Disable(FMC_Bank5_6_TypeDef *Device, uint32_t Bank);
HAL_StatusTypeDef FMC_SDRAM_SendCommand(FMC_Bank5_6_TypeDef *Device, FMC_SDRAM_CommandTypeDef *Command, uint32_t Timeout);
HAL_StatusTypeDef FMC_SDRAM_ProgramRefreshRate(FMC_Bank5_6_TypeDef *Device, uint32_t RefreshRate);
HAL_StatusTypeDef FMC_SDRAM_SetAutoRefreshNumber(FMC_Bank5_6_TypeDef *Device, uint32_t AutoRefreshNumber);
uint32_t FMC_SDRAM_GetModeStatus(FMC_Bank5_6_TypeDef *Device, uint32_t Bank);
# 46 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_sdram.h" 2
# 64 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_sdram.h"
typedef enum
{
  HAL_SDRAM_STATE_RESET = 0x00U,
  HAL_SDRAM_STATE_READY = 0x01U,
  HAL_SDRAM_STATE_BUSY = 0x02U,
  HAL_SDRAM_STATE_ERROR = 0x03U,
  HAL_SDRAM_STATE_WRITE_PROTECTED = 0x04U,
  HAL_SDRAM_STATE_PRECHARGED = 0x05U

}HAL_SDRAM_StateTypeDef;




typedef struct
{
  FMC_Bank5_6_TypeDef *Instance;

  FMC_SDRAM_InitTypeDef Init;

  volatile HAL_SDRAM_StateTypeDef State;

  HAL_LockTypeDef Lock;

  DMA_HandleTypeDef *hdma;

}SDRAM_HandleTypeDef;
# 123 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_sdram.h"
HAL_StatusTypeDef HAL_SDRAM_Init(SDRAM_HandleTypeDef *hsdram, FMC_SDRAM_TimingTypeDef *Timing);
HAL_StatusTypeDef HAL_SDRAM_DeInit(SDRAM_HandleTypeDef *hsdram);
void HAL_SDRAM_MspInit(SDRAM_HandleTypeDef *hsdram);
void HAL_SDRAM_MspDeInit(SDRAM_HandleTypeDef *hsdram);

void HAL_SDRAM_IRQHandler(SDRAM_HandleTypeDef *hsdram);
void HAL_SDRAM_RefreshErrorCallback(SDRAM_HandleTypeDef *hsdram);
void HAL_SDRAM_DMA_XferCpltCallback(DMA_HandleTypeDef *hdma);
void HAL_SDRAM_DMA_XferErrorCallback(DMA_HandleTypeDef *hdma);
# 141 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_sdram.h"
HAL_StatusTypeDef HAL_SDRAM_Read_8b(SDRAM_HandleTypeDef *hsdram, uint32_t *pAddress, uint8_t *pDstBuffer, uint32_t BufferSize);
HAL_StatusTypeDef HAL_SDRAM_Write_8b(SDRAM_HandleTypeDef *hsdram, uint32_t *pAddress, uint8_t *pSrcBuffer, uint32_t BufferSize);
HAL_StatusTypeDef HAL_SDRAM_Read_16b(SDRAM_HandleTypeDef *hsdram, uint32_t *pAddress, uint16_t *pDstBuffer, uint32_t BufferSize);
HAL_StatusTypeDef HAL_SDRAM_Write_16b(SDRAM_HandleTypeDef *hsdram, uint32_t *pAddress, uint16_t *pSrcBuffer, uint32_t BufferSize);
HAL_StatusTypeDef HAL_SDRAM_Read_32b(SDRAM_HandleTypeDef *hsdram, uint32_t *pAddress, uint32_t *pDstBuffer, uint32_t BufferSize);
HAL_StatusTypeDef HAL_SDRAM_Write_32b(SDRAM_HandleTypeDef *hsdram, uint32_t *pAddress, uint32_t *pSrcBuffer, uint32_t BufferSize);

HAL_StatusTypeDef HAL_SDRAM_Read_DMA(SDRAM_HandleTypeDef *hsdram, uint32_t * pAddress, uint32_t *pDstBuffer, uint32_t BufferSize);
HAL_StatusTypeDef HAL_SDRAM_Write_DMA(SDRAM_HandleTypeDef *hsdram, uint32_t *pAddress, uint32_t *pSrcBuffer, uint32_t BufferSize);
# 159 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_sdram.h"
HAL_StatusTypeDef HAL_SDRAM_WriteProtection_Enable(SDRAM_HandleTypeDef *hsdram);
HAL_StatusTypeDef HAL_SDRAM_WriteProtection_Disable(SDRAM_HandleTypeDef *hsdram);
HAL_StatusTypeDef HAL_SDRAM_SendCommand(SDRAM_HandleTypeDef *hsdram, FMC_SDRAM_CommandTypeDef *Command, uint32_t Timeout);
HAL_StatusTypeDef HAL_SDRAM_ProgramRefreshRate(SDRAM_HandleTypeDef *hsdram, uint32_t RefreshRate);
HAL_StatusTypeDef HAL_SDRAM_SetAutoRefreshNumber(SDRAM_HandleTypeDef *hsdram, uint32_t AutoRefreshNumber);
uint32_t HAL_SDRAM_GetModeStatus(SDRAM_HandleTypeDef *hsdram);
# 174 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_sdram.h"
HAL_SDRAM_StateTypeDef HAL_SDRAM_GetState(SDRAM_HandleTypeDef *hsdram);
# 307 "../Inc\\stm32f7xx_hal_conf.h" 2







# 1 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_i2c.h" 1
# 64 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_i2c.h"
typedef struct
{
  uint32_t Timing;



  uint32_t OwnAddress1;


  uint32_t AddressingMode;


  uint32_t DualAddressMode;


  uint32_t OwnAddress2;


  uint32_t OwnAddress2Masks;


  uint32_t GeneralCallMode;


  uint32_t NoStretchMode;


}I2C_InitTypeDef;
# 124 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_i2c.h"
typedef enum
{
  HAL_I2C_STATE_RESET = 0x00U,
  HAL_I2C_STATE_READY = 0x20U,
  HAL_I2C_STATE_BUSY = 0x24U,
  HAL_I2C_STATE_BUSY_TX = 0x21U,
  HAL_I2C_STATE_BUSY_RX = 0x22U,
  HAL_I2C_STATE_LISTEN = 0x28U,
  HAL_I2C_STATE_BUSY_TX_LISTEN = 0x29U,

  HAL_I2C_STATE_BUSY_RX_LISTEN = 0x2AU,

  HAL_I2C_STATE_ABORT = 0x60U,
  HAL_I2C_STATE_TIMEOUT = 0xA0U,
  HAL_I2C_STATE_ERROR = 0xE0U

}HAL_I2C_StateTypeDef;
# 164 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_i2c.h"
typedef enum
{
  HAL_I2C_MODE_NONE = 0x00U,
  HAL_I2C_MODE_MASTER = 0x10U,
  HAL_I2C_MODE_SLAVE = 0x20U,
  HAL_I2C_MODE_MEM = 0x40U

}HAL_I2C_ModeTypeDef;
# 197 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_i2c.h"
typedef struct __I2C_HandleTypeDef
{
  I2C_TypeDef *Instance;

  I2C_InitTypeDef Init;

  uint8_t *pBuffPtr;

  uint16_t XferSize;

  volatile uint16_t XferCount;

  volatile uint32_t XferOptions;


  volatile uint32_t PreviousState;

  HAL_StatusTypeDef (*XferISR)(struct __I2C_HandleTypeDef *hi2c, uint32_t ITFlags, uint32_t ITSources);

  DMA_HandleTypeDef *hdmatx;

  DMA_HandleTypeDef *hdmarx;

  HAL_LockTypeDef Lock;

  volatile HAL_I2C_StateTypeDef State;

  volatile HAL_I2C_ModeTypeDef Mode;

  volatile uint32_t ErrorCode;

  volatile uint32_t AddrEventCount;
}I2C_HandleTypeDef;
# 516 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_i2c.h"
# 1 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_i2c_ex.h" 1
# 130 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_i2c_ex.h"
HAL_StatusTypeDef HAL_I2CEx_ConfigAnalogFilter(I2C_HandleTypeDef *hi2c, uint32_t AnalogFilter);
HAL_StatusTypeDef HAL_I2CEx_ConfigDigitalFilter(I2C_HandleTypeDef *hi2c, uint32_t DigitalFilter);
# 517 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_i2c.h" 2
# 527 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_i2c.h"
HAL_StatusTypeDef HAL_I2C_Init(I2C_HandleTypeDef *hi2c);
HAL_StatusTypeDef HAL_I2C_DeInit (I2C_HandleTypeDef *hi2c);
void HAL_I2C_MspInit(I2C_HandleTypeDef *hi2c);
void HAL_I2C_MspDeInit(I2C_HandleTypeDef *hi2c);
# 540 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_i2c.h"
HAL_StatusTypeDef HAL_I2C_Master_Transmit(I2C_HandleTypeDef *hi2c, uint16_t DevAddress, uint8_t *pData, uint16_t Size, uint32_t Timeout);
HAL_StatusTypeDef HAL_I2C_Master_Receive(I2C_HandleTypeDef *hi2c, uint16_t DevAddress, uint8_t *pData, uint16_t Size, uint32_t Timeout);
HAL_StatusTypeDef HAL_I2C_Slave_Transmit(I2C_HandleTypeDef *hi2c, uint8_t *pData, uint16_t Size, uint32_t Timeout);
HAL_StatusTypeDef HAL_I2C_Slave_Receive(I2C_HandleTypeDef *hi2c, uint8_t *pData, uint16_t Size, uint32_t Timeout);
HAL_StatusTypeDef HAL_I2C_Mem_Write(I2C_HandleTypeDef *hi2c, uint16_t DevAddress, uint16_t MemAddress, uint16_t MemAddSize, uint8_t *pData, uint16_t Size, uint32_t Timeout);
HAL_StatusTypeDef HAL_I2C_Mem_Read(I2C_HandleTypeDef *hi2c, uint16_t DevAddress, uint16_t MemAddress, uint16_t MemAddSize, uint8_t *pData, uint16_t Size, uint32_t Timeout);
HAL_StatusTypeDef HAL_I2C_IsDeviceReady(I2C_HandleTypeDef *hi2c, uint16_t DevAddress, uint32_t Trials, uint32_t Timeout);


HAL_StatusTypeDef HAL_I2C_Master_Transmit_IT(I2C_HandleTypeDef *hi2c, uint16_t DevAddress, uint8_t *pData, uint16_t Size);
HAL_StatusTypeDef HAL_I2C_Master_Receive_IT(I2C_HandleTypeDef *hi2c, uint16_t DevAddress, uint8_t *pData, uint16_t Size);
HAL_StatusTypeDef HAL_I2C_Slave_Transmit_IT(I2C_HandleTypeDef *hi2c, uint8_t *pData, uint16_t Size);
HAL_StatusTypeDef HAL_I2C_Slave_Receive_IT(I2C_HandleTypeDef *hi2c, uint8_t *pData, uint16_t Size);
HAL_StatusTypeDef HAL_I2C_Mem_Write_IT(I2C_HandleTypeDef *hi2c, uint16_t DevAddress, uint16_t MemAddress, uint16_t MemAddSize, uint8_t *pData, uint16_t Size);
HAL_StatusTypeDef HAL_I2C_Mem_Read_IT(I2C_HandleTypeDef *hi2c, uint16_t DevAddress, uint16_t MemAddress, uint16_t MemAddSize, uint8_t *pData, uint16_t Size);

HAL_StatusTypeDef HAL_I2C_Master_Sequential_Transmit_IT(I2C_HandleTypeDef *hi2c, uint16_t DevAddress, uint8_t *pData, uint16_t Size, uint32_t XferOptions);
HAL_StatusTypeDef HAL_I2C_Master_Sequential_Receive_IT(I2C_HandleTypeDef *hi2c, uint16_t DevAddress, uint8_t *pData, uint16_t Size, uint32_t XferOptions);
HAL_StatusTypeDef HAL_I2C_Slave_Sequential_Transmit_IT(I2C_HandleTypeDef *hi2c, uint8_t *pData, uint16_t Size, uint32_t XferOptions);
HAL_StatusTypeDef HAL_I2C_Slave_Sequential_Receive_IT(I2C_HandleTypeDef *hi2c, uint8_t *pData, uint16_t Size, uint32_t XferOptions);
HAL_StatusTypeDef HAL_I2C_EnableListen_IT(I2C_HandleTypeDef *hi2c);
HAL_StatusTypeDef HAL_I2C_DisableListen_IT(I2C_HandleTypeDef *hi2c);
HAL_StatusTypeDef HAL_I2C_Master_Abort_IT(I2C_HandleTypeDef *hi2c, uint16_t DevAddress);


HAL_StatusTypeDef HAL_I2C_Master_Transmit_DMA(I2C_HandleTypeDef *hi2c, uint16_t DevAddress, uint8_t *pData, uint16_t Size);
HAL_StatusTypeDef HAL_I2C_Master_Receive_DMA(I2C_HandleTypeDef *hi2c, uint16_t DevAddress, uint8_t *pData, uint16_t Size);
HAL_StatusTypeDef HAL_I2C_Slave_Transmit_DMA(I2C_HandleTypeDef *hi2c, uint8_t *pData, uint16_t Size);
HAL_StatusTypeDef HAL_I2C_Slave_Receive_DMA(I2C_HandleTypeDef *hi2c, uint8_t *pData, uint16_t Size);
HAL_StatusTypeDef HAL_I2C_Mem_Write_DMA(I2C_HandleTypeDef *hi2c, uint16_t DevAddress, uint16_t MemAddress, uint16_t MemAddSize, uint8_t *pData, uint16_t Size);
HAL_StatusTypeDef HAL_I2C_Mem_Read_DMA(I2C_HandleTypeDef *hi2c, uint16_t DevAddress, uint16_t MemAddress, uint16_t MemAddSize, uint8_t *pData, uint16_t Size);
# 579 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_i2c.h"
void HAL_I2C_EV_IRQHandler(I2C_HandleTypeDef *hi2c);
void HAL_I2C_ER_IRQHandler(I2C_HandleTypeDef *hi2c);
void HAL_I2C_MasterTxCpltCallback(I2C_HandleTypeDef *hi2c);
void HAL_I2C_MasterRxCpltCallback(I2C_HandleTypeDef *hi2c);
void HAL_I2C_SlaveTxCpltCallback(I2C_HandleTypeDef *hi2c);
void HAL_I2C_SlaveRxCpltCallback(I2C_HandleTypeDef *hi2c);
void HAL_I2C_AddrCallback(I2C_HandleTypeDef *hi2c, uint8_t TransferDirection, uint16_t AddrMatchCode);
void HAL_I2C_ListenCpltCallback(I2C_HandleTypeDef *hi2c);
void HAL_I2C_MemTxCpltCallback(I2C_HandleTypeDef *hi2c);
void HAL_I2C_MemRxCpltCallback(I2C_HandleTypeDef *hi2c);
void HAL_I2C_ErrorCallback(I2C_HandleTypeDef *hi2c);
void HAL_I2C_AbortCpltCallback(I2C_HandleTypeDef *hi2c);
# 599 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_i2c.h"
HAL_I2C_StateTypeDef HAL_I2C_GetState(I2C_HandleTypeDef *hi2c);
HAL_I2C_ModeTypeDef HAL_I2C_GetMode(I2C_HandleTypeDef *hi2c);
uint32_t HAL_I2C_GetError(I2C_HandleTypeDef *hi2c);
# 315 "../Inc\\stm32f7xx_hal_conf.h" 2



# 1 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_i2s.h" 1
# 63 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_i2s.h"
typedef struct
{
  uint32_t Mode;


  uint32_t Standard;


  uint32_t DataFormat;


  uint32_t MCLKOutput;


  uint32_t AudioFreq;


  uint32_t CPOL;


  uint32_t ClockSource;

}I2S_InitTypeDef;




typedef enum
{
  HAL_I2S_STATE_RESET = 0x00U,
  HAL_I2S_STATE_READY = 0x01U,
  HAL_I2S_STATE_BUSY = 0x02U,
  HAL_I2S_STATE_BUSY_TX = 0x03U,
  HAL_I2S_STATE_BUSY_RX = 0x04U,
  HAL_I2S_STATE_BUSY_TX_RX = 0x05U,
  HAL_I2S_STATE_TIMEOUT = 0x06U,
  HAL_I2S_STATE_ERROR = 0x07U

}HAL_I2S_StateTypeDef;




typedef struct
{
  SPI_TypeDef *Instance;

  I2S_InitTypeDef Init;

  uint16_t *pTxBuffPtr;

  volatile uint16_t TxXferSize;

  volatile uint16_t TxXferCount;

  uint16_t *pRxBuffPtr;

  volatile uint16_t RxXferSize;

  volatile uint16_t RxXferCount;






  DMA_HandleTypeDef *hdmatx;

  DMA_HandleTypeDef *hdmarx;

  volatile HAL_LockTypeDef Lock;

  volatile HAL_I2S_StateTypeDef State;

  volatile uint32_t ErrorCode;

}I2S_HandleTypeDef;
# 365 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_i2s.h"
HAL_StatusTypeDef HAL_I2S_Init(I2S_HandleTypeDef *hi2s);
HAL_StatusTypeDef HAL_I2S_DeInit (I2S_HandleTypeDef *hi2s);
void HAL_I2S_MspInit(I2S_HandleTypeDef *hi2s);
void HAL_I2S_MspDeInit(I2S_HandleTypeDef *hi2s);
# 378 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_i2s.h"
HAL_StatusTypeDef HAL_I2S_Transmit(I2S_HandleTypeDef *hi2s, uint16_t *pData, uint16_t Size, uint32_t Timeout);
HAL_StatusTypeDef HAL_I2S_Receive(I2S_HandleTypeDef *hi2s, uint16_t *pData, uint16_t Size, uint32_t Timeout);


HAL_StatusTypeDef HAL_I2S_Transmit_IT(I2S_HandleTypeDef *hi2s, uint16_t *pData, uint16_t Size);
HAL_StatusTypeDef HAL_I2S_Receive_IT(I2S_HandleTypeDef *hi2s, uint16_t *pData, uint16_t Size);
void HAL_I2S_IRQHandler(I2S_HandleTypeDef *hi2s);


HAL_StatusTypeDef HAL_I2S_Transmit_DMA(I2S_HandleTypeDef *hi2s, uint16_t *pData, uint16_t Size);
HAL_StatusTypeDef HAL_I2S_Receive_DMA(I2S_HandleTypeDef *hi2s, uint16_t *pData, uint16_t Size);

HAL_StatusTypeDef HAL_I2S_DMAPause(I2S_HandleTypeDef *hi2s);
HAL_StatusTypeDef HAL_I2S_DMAResume(I2S_HandleTypeDef *hi2s);
HAL_StatusTypeDef HAL_I2S_DMAStop(I2S_HandleTypeDef *hi2s);


void HAL_I2S_TxHalfCpltCallback(I2S_HandleTypeDef *hi2s);
void HAL_I2S_TxCpltCallback(I2S_HandleTypeDef *hi2s);
void HAL_I2S_RxHalfCpltCallback(I2S_HandleTypeDef *hi2s);
void HAL_I2S_RxCpltCallback(I2S_HandleTypeDef *hi2s);
void HAL_I2S_ErrorCallback(I2S_HandleTypeDef *hi2s);
# 408 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_i2s.h"
HAL_I2S_StateTypeDef HAL_I2S_GetState(I2S_HandleTypeDef *hi2s);
uint32_t HAL_I2S_GetError(I2S_HandleTypeDef *hi2s);
# 319 "../Inc\\stm32f7xx_hal_conf.h" 2
# 330 "../Inc\\stm32f7xx_hal_conf.h"
# 1 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_ltdc.h" 1
# 68 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_ltdc.h"
typedef struct
{
  uint8_t Blue;


  uint8_t Green;


  uint8_t Red;


  uint8_t Reserved;
} LTDC_ColorTypeDef;




typedef struct
{
  uint32_t HSPolarity;


  uint32_t VSPolarity;


  uint32_t DEPolarity;


  uint32_t PCPolarity;


  uint32_t HorizontalSync;


  uint32_t VerticalSync;


  uint32_t AccumulatedHBP;


  uint32_t AccumulatedVBP;


  uint32_t AccumulatedActiveW;


  uint32_t AccumulatedActiveH;


  uint32_t TotalWidth;


  uint32_t TotalHeigh;


  LTDC_ColorTypeDef Backcolor;
} LTDC_InitTypeDef;




typedef struct
{
  uint32_t WindowX0;


  uint32_t WindowX1;


  uint32_t WindowY0;


  uint32_t WindowY1;


  uint32_t PixelFormat;


  uint32_t Alpha;


  uint32_t Alpha0;


  uint32_t BlendingFactor1;


  uint32_t BlendingFactor2;


  uint32_t FBStartAdress;

  uint32_t ImageWidth;


  uint32_t ImageHeight;


  LTDC_ColorTypeDef Backcolor;
} LTDC_LayerCfgTypeDef;




typedef enum
{
  HAL_LTDC_STATE_RESET = 0x00U,
  HAL_LTDC_STATE_READY = 0x01U,
  HAL_LTDC_STATE_BUSY = 0x02U,
  HAL_LTDC_STATE_TIMEOUT = 0x03U,
  HAL_LTDC_STATE_ERROR = 0x04U
}HAL_LTDC_StateTypeDef;




typedef struct
{
  LTDC_TypeDef *Instance;

  LTDC_InitTypeDef Init;

  LTDC_LayerCfgTypeDef LayerCfg[2];

  HAL_LockTypeDef Lock;

  volatile HAL_LTDC_StateTypeDef State;

  volatile uint32_t ErrorCode;

} LTDC_HandleTypeDef;
# 492 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_ltdc.h"
HAL_StatusTypeDef HAL_LTDC_Init(LTDC_HandleTypeDef *hltdc);
HAL_StatusTypeDef HAL_LTDC_DeInit(LTDC_HandleTypeDef *hltdc);
void HAL_LTDC_MspInit(LTDC_HandleTypeDef* hltdc);
void HAL_LTDC_MspDeInit(LTDC_HandleTypeDef* hltdc);
void HAL_LTDC_ErrorCallback(LTDC_HandleTypeDef *hltdc);
void HAL_LTDC_LineEventCallback(LTDC_HandleTypeDef *hltdc);
void HAL_LTDC_ReloadEventCallback(LTDC_HandleTypeDef *hltdc);
# 507 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_ltdc.h"
void HAL_LTDC_IRQHandler(LTDC_HandleTypeDef *hltdc);
# 516 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_ltdc.h"
HAL_StatusTypeDef HAL_LTDC_ConfigLayer(LTDC_HandleTypeDef *hltdc, LTDC_LayerCfgTypeDef *pLayerCfg, uint32_t LayerIdx);
HAL_StatusTypeDef HAL_LTDC_SetWindowSize(LTDC_HandleTypeDef *hltdc, uint32_t XSize, uint32_t YSize, uint32_t LayerIdx);
HAL_StatusTypeDef HAL_LTDC_SetWindowPosition(LTDC_HandleTypeDef *hltdc, uint32_t X0, uint32_t Y0, uint32_t LayerIdx);
HAL_StatusTypeDef HAL_LTDC_SetPixelFormat(LTDC_HandleTypeDef *hltdc, uint32_t Pixelformat, uint32_t LayerIdx);
HAL_StatusTypeDef HAL_LTDC_SetAlpha(LTDC_HandleTypeDef *hltdc, uint32_t Alpha, uint32_t LayerIdx);
HAL_StatusTypeDef HAL_LTDC_SetAddress(LTDC_HandleTypeDef *hltdc, uint32_t Address, uint32_t LayerIdx);
HAL_StatusTypeDef HAL_LTDC_SetPitch(LTDC_HandleTypeDef *hltdc, uint32_t LinePitchInPixels, uint32_t LayerIdx);
HAL_StatusTypeDef HAL_LTDC_ConfigColorKeying(LTDC_HandleTypeDef *hltdc, uint32_t RGBValue, uint32_t LayerIdx);
HAL_StatusTypeDef HAL_LTDC_ConfigCLUT(LTDC_HandleTypeDef *hltdc, uint32_t *pCLUT, uint32_t CLUTSize, uint32_t LayerIdx);
HAL_StatusTypeDef HAL_LTDC_EnableColorKeying(LTDC_HandleTypeDef *hltdc, uint32_t LayerIdx);
HAL_StatusTypeDef HAL_LTDC_DisableColorKeying(LTDC_HandleTypeDef *hltdc, uint32_t LayerIdx);
HAL_StatusTypeDef HAL_LTDC_EnableCLUT(LTDC_HandleTypeDef *hltdc, uint32_t LayerIdx);
HAL_StatusTypeDef HAL_LTDC_DisableCLUT(LTDC_HandleTypeDef *hltdc, uint32_t LayerIdx);
HAL_StatusTypeDef HAL_LTDC_ProgramLineEvent(LTDC_HandleTypeDef *hltdc, uint32_t Line);
HAL_StatusTypeDef HAL_LTDC_EnableDither(LTDC_HandleTypeDef *hltdc);
HAL_StatusTypeDef HAL_LTDC_DisableDither(LTDC_HandleTypeDef *hltdc);
HAL_StatusTypeDef HAL_LTDC_Reload(LTDC_HandleTypeDef *hltdc, uint32_t ReloadType);
HAL_StatusTypeDef HAL_LTDC_ConfigLayer_NoReload(LTDC_HandleTypeDef *hltdc, LTDC_LayerCfgTypeDef *pLayerCfg, uint32_t LayerIdx);
HAL_StatusTypeDef HAL_LTDC_SetWindowSize_NoReload(LTDC_HandleTypeDef *hltdc, uint32_t XSize, uint32_t YSize, uint32_t LayerIdx);
HAL_StatusTypeDef HAL_LTDC_SetWindowPosition_NoReload(LTDC_HandleTypeDef *hltdc, uint32_t X0, uint32_t Y0, uint32_t LayerIdx);
HAL_StatusTypeDef HAL_LTDC_SetPixelFormat_NoReload(LTDC_HandleTypeDef *hltdc, uint32_t Pixelformat, uint32_t LayerIdx);
HAL_StatusTypeDef HAL_LTDC_SetAlpha_NoReload(LTDC_HandleTypeDef *hltdc, uint32_t Alpha, uint32_t LayerIdx);
HAL_StatusTypeDef HAL_LTDC_SetAddress_NoReload(LTDC_HandleTypeDef *hltdc, uint32_t Address, uint32_t LayerIdx);
HAL_StatusTypeDef HAL_LTDC_SetPitch_NoReload(LTDC_HandleTypeDef *hltdc, uint32_t LinePitchInPixels, uint32_t LayerIdx);
HAL_StatusTypeDef HAL_LTDC_ConfigColorKeying_NoReload(LTDC_HandleTypeDef *hltdc, uint32_t RGBValue, uint32_t LayerIdx);
HAL_StatusTypeDef HAL_LTDC_EnableColorKeying_NoReload(LTDC_HandleTypeDef *hltdc, uint32_t LayerIdx);
HAL_StatusTypeDef HAL_LTDC_DisableColorKeying_NoReload(LTDC_HandleTypeDef *hltdc, uint32_t LayerIdx);
HAL_StatusTypeDef HAL_LTDC_EnableCLUT_NoReload(LTDC_HandleTypeDef *hltdc, uint32_t LayerIdx);
HAL_StatusTypeDef HAL_LTDC_DisableCLUT_NoReload(LTDC_HandleTypeDef *hltdc, uint32_t LayerIdx);
# 554 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_ltdc.h"
HAL_LTDC_StateTypeDef HAL_LTDC_GetState(LTDC_HandleTypeDef *hltdc);
uint32_t HAL_LTDC_GetError(LTDC_HandleTypeDef *hltdc);
# 331 "../Inc\\stm32f7xx_hal_conf.h" 2



# 1 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_pwr.h" 1
# 64 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_pwr.h"
typedef struct
{
  uint32_t PVDLevel;


  uint32_t Mode;

}PWR_PVDTypeDef;
# 302 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_pwr.h"
# 1 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_pwr_ex.h" 1
# 200 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_pwr_ex.h"
uint32_t HAL_PWREx_GetVoltageRange(void);
HAL_StatusTypeDef HAL_PWREx_ControlVoltageScaling(uint32_t VoltageScaling);

void HAL_PWREx_EnableFlashPowerDown(void);
void HAL_PWREx_DisableFlashPowerDown(void);
HAL_StatusTypeDef HAL_PWREx_EnableBkUpReg(void);
HAL_StatusTypeDef HAL_PWREx_DisableBkUpReg(void);

void HAL_PWREx_EnableMainRegulatorLowVoltage(void);
void HAL_PWREx_DisableMainRegulatorLowVoltage(void);
void HAL_PWREx_EnableLowRegulatorLowVoltage(void);
void HAL_PWREx_DisableLowRegulatorLowVoltage(void);

HAL_StatusTypeDef HAL_PWREx_EnableOverDrive(void);
HAL_StatusTypeDef HAL_PWREx_DisableOverDrive(void);
HAL_StatusTypeDef HAL_PWREx_EnterUnderDriveSTOPMode(uint32_t Regulator, uint8_t STOPEntry);
# 303 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_pwr.h" 2
# 313 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_pwr.h"
void HAL_PWR_DeInit(void);
void HAL_PWR_EnableBkUpAccess(void);
void HAL_PWR_DisableBkUpAccess(void);
# 325 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_pwr.h"
void HAL_PWR_ConfigPVD(PWR_PVDTypeDef *sConfigPVD);
void HAL_PWR_EnablePVD(void);
void HAL_PWR_DisablePVD(void);


void HAL_PWR_EnableWakeUpPin(uint32_t WakeUpPinPolarity);
void HAL_PWR_DisableWakeUpPin(uint32_t WakeUpPinx);


void HAL_PWR_EnterSTOPMode(uint32_t Regulator, uint8_t STOPEntry);
void HAL_PWR_EnterSLEEPMode(uint32_t Regulator, uint8_t SLEEPEntry);
void HAL_PWR_EnterSTANDBYMode(void);


void HAL_PWR_PVD_IRQHandler(void);
void HAL_PWR_PVDCallback(void);


void HAL_PWR_EnableSleepOnExit(void);
void HAL_PWR_DisableSleepOnExit(void);
void HAL_PWR_EnableSEVOnPend(void);
void HAL_PWR_DisableSEVOnPend(void);
# 335 "../Inc\\stm32f7xx_hal_conf.h" 2



# 1 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_qspi.h" 1
# 64 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_qspi.h"
typedef struct
{
  uint32_t ClockPrescaler;


  uint32_t FifoThreshold;


  uint32_t SampleShifting;



  uint32_t FlashSize;





  uint32_t ChipSelectHighTime;



  uint32_t ClockMode;


  uint32_t FlashID;


  uint32_t DualFlash;

}QSPI_InitTypeDef;




typedef enum
{
  HAL_QSPI_STATE_RESET = 0x00U,
  HAL_QSPI_STATE_READY = 0x01U,
  HAL_QSPI_STATE_BUSY = 0x02U,
  HAL_QSPI_STATE_BUSY_INDIRECT_TX = 0x12U,
  HAL_QSPI_STATE_BUSY_INDIRECT_RX = 0x22U,
  HAL_QSPI_STATE_BUSY_AUTO_POLLING = 0x42U,
  HAL_QSPI_STATE_BUSY_MEM_MAPPED = 0x82U,
  HAL_QSPI_STATE_ABORT = 0x08U,
  HAL_QSPI_STATE_ERROR = 0x04U
}HAL_QSPI_StateTypeDef;




typedef struct
{
  QUADSPI_TypeDef *Instance;
  QSPI_InitTypeDef Init;
  uint8_t *pTxBuffPtr;
  volatile uint32_t TxXferSize;
  volatile uint32_t TxXferCount;
  uint8_t *pRxBuffPtr;
  volatile uint32_t RxXferSize;
  volatile uint32_t RxXferCount;
  DMA_HandleTypeDef *hdma;
  volatile HAL_LockTypeDef Lock;
  volatile HAL_QSPI_StateTypeDef State;
  volatile uint32_t ErrorCode;
  uint32_t Timeout;
}QSPI_HandleTypeDef;




typedef struct
{
  uint32_t Instruction;

  uint32_t Address;

  uint32_t AlternateBytes;

  uint32_t AddressSize;

  uint32_t AlternateBytesSize;

  uint32_t DummyCycles;

  uint32_t InstructionMode;

  uint32_t AddressMode;

  uint32_t AlternateByteMode;

  uint32_t DataMode;

  uint32_t NbData;


  uint32_t DdrMode;

  uint32_t DdrHoldHalfCycle;


  uint32_t SIOOMode;

}QSPI_CommandTypeDef;




typedef struct
{
  uint32_t Match;

  uint32_t Mask;

  uint32_t Interval;

  uint32_t StatusBytesSize;

  uint32_t MatchMode;

  uint32_t AutomaticStop;

}QSPI_AutoPollingTypeDef;




typedef struct
{
  uint32_t TimeOutPeriod;

  uint32_t TimeOutActivation;

}QSPI_MemoryMappedTypeDef;
# 528 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_qspi.h"
HAL_StatusTypeDef HAL_QSPI_Init (QSPI_HandleTypeDef *hqspi);
HAL_StatusTypeDef HAL_QSPI_DeInit (QSPI_HandleTypeDef *hqspi);
void HAL_QSPI_MspInit (QSPI_HandleTypeDef *hqspi);
void HAL_QSPI_MspDeInit(QSPI_HandleTypeDef *hqspi);
# 541 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_qspi.h"
void HAL_QSPI_IRQHandler(QSPI_HandleTypeDef *hqspi);


HAL_StatusTypeDef HAL_QSPI_Command (QSPI_HandleTypeDef *hqspi, QSPI_CommandTypeDef *cmd, uint32_t Timeout);
HAL_StatusTypeDef HAL_QSPI_Transmit (QSPI_HandleTypeDef *hqspi, uint8_t *pData, uint32_t Timeout);
HAL_StatusTypeDef HAL_QSPI_Receive (QSPI_HandleTypeDef *hqspi, uint8_t *pData, uint32_t Timeout);
HAL_StatusTypeDef HAL_QSPI_Command_IT (QSPI_HandleTypeDef *hqspi, QSPI_CommandTypeDef *cmd);
HAL_StatusTypeDef HAL_QSPI_Transmit_IT (QSPI_HandleTypeDef *hqspi, uint8_t *pData);
HAL_StatusTypeDef HAL_QSPI_Receive_IT (QSPI_HandleTypeDef *hqspi, uint8_t *pData);
HAL_StatusTypeDef HAL_QSPI_Transmit_DMA (QSPI_HandleTypeDef *hqspi, uint8_t *pData);
HAL_StatusTypeDef HAL_QSPI_Receive_DMA (QSPI_HandleTypeDef *hqspi, uint8_t *pData);


HAL_StatusTypeDef HAL_QSPI_AutoPolling (QSPI_HandleTypeDef *hqspi, QSPI_CommandTypeDef *cmd, QSPI_AutoPollingTypeDef *cfg, uint32_t Timeout);
HAL_StatusTypeDef HAL_QSPI_AutoPolling_IT(QSPI_HandleTypeDef *hqspi, QSPI_CommandTypeDef *cmd, QSPI_AutoPollingTypeDef *cfg);


HAL_StatusTypeDef HAL_QSPI_MemoryMapped(QSPI_HandleTypeDef *hqspi, QSPI_CommandTypeDef *cmd, QSPI_MemoryMappedTypeDef *cfg);
# 567 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_qspi.h"
void HAL_QSPI_ErrorCallback (QSPI_HandleTypeDef *hqspi);
void HAL_QSPI_AbortCpltCallback (QSPI_HandleTypeDef *hqspi);
void HAL_QSPI_FifoThresholdCallback(QSPI_HandleTypeDef *hqspi);


void HAL_QSPI_CmdCpltCallback (QSPI_HandleTypeDef *hqspi);
void HAL_QSPI_RxCpltCallback (QSPI_HandleTypeDef *hqspi);
void HAL_QSPI_TxCpltCallback (QSPI_HandleTypeDef *hqspi);
void HAL_QSPI_RxHalfCpltCallback (QSPI_HandleTypeDef *hqspi);
void HAL_QSPI_TxHalfCpltCallback (QSPI_HandleTypeDef *hqspi);


void HAL_QSPI_StatusMatchCallback (QSPI_HandleTypeDef *hqspi);


void HAL_QSPI_TimeOutCallback (QSPI_HandleTypeDef *hqspi);
# 591 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_qspi.h"
HAL_QSPI_StateTypeDef HAL_QSPI_GetState (QSPI_HandleTypeDef *hqspi);
uint32_t HAL_QSPI_GetError (QSPI_HandleTypeDef *hqspi);
HAL_StatusTypeDef HAL_QSPI_Abort (QSPI_HandleTypeDef *hqspi);
HAL_StatusTypeDef HAL_QSPI_Abort_IT (QSPI_HandleTypeDef *hqspi);
void HAL_QSPI_SetTimeout (QSPI_HandleTypeDef *hqspi, uint32_t Timeout);
HAL_StatusTypeDef HAL_QSPI_SetFifoThreshold(QSPI_HandleTypeDef *hqspi, uint32_t Threshold);
uint32_t HAL_QSPI_GetFifoThreshold(QSPI_HandleTypeDef *hqspi);
# 339 "../Inc\\stm32f7xx_hal_conf.h" 2







# 1 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_rtc.h" 1
# 63 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_rtc.h"
typedef enum
{
  HAL_RTC_STATE_RESET = 0x00U,
  HAL_RTC_STATE_READY = 0x01U,
  HAL_RTC_STATE_BUSY = 0x02U,
  HAL_RTC_STATE_TIMEOUT = 0x03U,
  HAL_RTC_STATE_ERROR = 0x04U

}HAL_RTCStateTypeDef;




typedef struct
{
  uint32_t HourFormat;


  uint32_t AsynchPrediv;


  uint32_t SynchPrediv;


  uint32_t OutPut;


  uint32_t OutPutPolarity;


  uint32_t OutPutType;

}RTC_InitTypeDef;




typedef struct
{
  uint8_t Hours;



  uint8_t Minutes;


  uint8_t Seconds;


  uint32_t SubSeconds;



  uint32_t SecondFraction;





  uint8_t TimeFormat;


  uint32_t DayLightSaving;


  uint32_t StoreOperation;


}RTC_TimeTypeDef;




typedef struct
{
  uint8_t WeekDay;


  uint8_t Month;


  uint8_t Date;


  uint8_t Year;


}RTC_DateTypeDef;




typedef struct
{
  RTC_TimeTypeDef AlarmTime;

  uint32_t AlarmMask;


  uint32_t AlarmSubSecondMask;


  uint32_t AlarmDateWeekDaySel;


  uint8_t AlarmDateWeekDay;



  uint32_t Alarm;

}RTC_AlarmTypeDef;




typedef struct
{
  RTC_TypeDef *Instance;

  RTC_InitTypeDef Init;

  HAL_LockTypeDef Lock;

  volatile HAL_RTCStateTypeDef State;

}RTC_HandleTypeDef;
# 623 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_rtc.h"
# 1 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rtc_ex.h" 1
# 63 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rtc_ex.h"
typedef struct
{
  uint32_t Tamper;


  uint32_t Interrupt;


  uint32_t Trigger;


  uint32_t NoErase;


  uint32_t MaskFlag;


  uint32_t Filter;


  uint32_t SamplingFrequency;


  uint32_t PrechargeDuration;


  uint32_t TamperPullUp;


  uint32_t TimeStampOnTamperDetection;

}RTC_TamperTypeDef;
# 848 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rtc_ex.h"
HAL_StatusTypeDef HAL_RTCEx_SetTimeStamp(RTC_HandleTypeDef *hrtc, uint32_t TimeStampEdge, uint32_t RTC_TimeStampPin);
HAL_StatusTypeDef HAL_RTCEx_SetTimeStamp_IT(RTC_HandleTypeDef *hrtc, uint32_t TimeStampEdge, uint32_t RTC_TimeStampPin);
HAL_StatusTypeDef HAL_RTCEx_DeactivateTimeStamp(RTC_HandleTypeDef *hrtc);
HAL_StatusTypeDef HAL_RTCEx_SetInternalTimeStamp(RTC_HandleTypeDef *hrtc);
HAL_StatusTypeDef HAL_RTCEx_DeactivateInternalTimeStamp(RTC_HandleTypeDef *hrtc);
HAL_StatusTypeDef HAL_RTCEx_GetTimeStamp(RTC_HandleTypeDef *hrtc, RTC_TimeTypeDef *sTimeStamp, RTC_DateTypeDef *sTimeStampDate, uint32_t Format);

HAL_StatusTypeDef HAL_RTCEx_SetTamper(RTC_HandleTypeDef *hrtc, RTC_TamperTypeDef* sTamper);
HAL_StatusTypeDef HAL_RTCEx_SetTamper_IT(RTC_HandleTypeDef *hrtc, RTC_TamperTypeDef* sTamper);
HAL_StatusTypeDef HAL_RTCEx_DeactivateTamper(RTC_HandleTypeDef *hrtc, uint32_t Tamper);
void HAL_RTCEx_TamperTimeStampIRQHandler(RTC_HandleTypeDef *hrtc);

void HAL_RTCEx_Tamper1EventCallback(RTC_HandleTypeDef *hrtc);
void HAL_RTCEx_Tamper2EventCallback(RTC_HandleTypeDef *hrtc);
void HAL_RTCEx_Tamper3EventCallback(RTC_HandleTypeDef *hrtc);
void HAL_RTCEx_TimeStampEventCallback(RTC_HandleTypeDef *hrtc);
HAL_StatusTypeDef HAL_RTCEx_PollForTimeStampEvent(RTC_HandleTypeDef *hrtc, uint32_t Timeout);
HAL_StatusTypeDef HAL_RTCEx_PollForTamper1Event(RTC_HandleTypeDef *hrtc, uint32_t Timeout);
HAL_StatusTypeDef HAL_RTCEx_PollForTamper2Event(RTC_HandleTypeDef *hrtc, uint32_t Timeout);
HAL_StatusTypeDef HAL_RTCEx_PollForTamper3Event(RTC_HandleTypeDef *hrtc, uint32_t Timeout);
# 876 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rtc_ex.h"
HAL_StatusTypeDef HAL_RTCEx_SetWakeUpTimer(RTC_HandleTypeDef *hrtc, uint32_t WakeUpCounter, uint32_t WakeUpClock);
HAL_StatusTypeDef HAL_RTCEx_SetWakeUpTimer_IT(RTC_HandleTypeDef *hrtc, uint32_t WakeUpCounter, uint32_t WakeUpClock);
uint32_t HAL_RTCEx_DeactivateWakeUpTimer(RTC_HandleTypeDef *hrtc);
uint32_t HAL_RTCEx_GetWakeUpTimer(RTC_HandleTypeDef *hrtc);
void HAL_RTCEx_WakeUpTimerIRQHandler(RTC_HandleTypeDef *hrtc);
void HAL_RTCEx_WakeUpTimerEventCallback(RTC_HandleTypeDef *hrtc);
HAL_StatusTypeDef HAL_RTCEx_PollForWakeUpTimerEvent(RTC_HandleTypeDef *hrtc, uint32_t Timeout);
# 891 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rtc_ex.h"
void HAL_RTCEx_BKUPWrite(RTC_HandleTypeDef *hrtc, uint32_t BackupRegister, uint32_t Data);
uint32_t HAL_RTCEx_BKUPRead(RTC_HandleTypeDef *hrtc, uint32_t BackupRegister);

HAL_StatusTypeDef HAL_RTCEx_SetSmoothCalib(RTC_HandleTypeDef *hrtc, uint32_t SmoothCalibPeriod, uint32_t SmoothCalibPlusPulses, uint32_t SmouthCalibMinusPulsesValue);
HAL_StatusTypeDef HAL_RTCEx_SetSynchroShift(RTC_HandleTypeDef *hrtc, uint32_t ShiftAdd1S, uint32_t ShiftSubFS);
HAL_StatusTypeDef HAL_RTCEx_SetCalibrationOutPut(RTC_HandleTypeDef *hrtc, uint32_t CalibOutput);
HAL_StatusTypeDef HAL_RTCEx_DeactivateCalibrationOutPut(RTC_HandleTypeDef *hrtc);
HAL_StatusTypeDef HAL_RTCEx_SetRefClock(RTC_HandleTypeDef *hrtc);
HAL_StatusTypeDef HAL_RTCEx_DeactivateRefClock(RTC_HandleTypeDef *hrtc);
HAL_StatusTypeDef HAL_RTCEx_EnableBypassShadow(RTC_HandleTypeDef *hrtc);
HAL_StatusTypeDef HAL_RTCEx_DisableBypassShadow(RTC_HandleTypeDef *hrtc);
# 910 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rtc_ex.h"
void HAL_RTCEx_AlarmBEventCallback(RTC_HandleTypeDef *hrtc);
HAL_StatusTypeDef HAL_RTCEx_PollForAlarmBEvent(RTC_HandleTypeDef *hrtc, uint32_t Timeout);
# 624 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_rtc.h" 2
# 634 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_rtc.h"
HAL_StatusTypeDef HAL_RTC_Init(RTC_HandleTypeDef *hrtc);
HAL_StatusTypeDef HAL_RTC_DeInit(RTC_HandleTypeDef *hrtc);
void HAL_RTC_MspInit(RTC_HandleTypeDef *hrtc);
void HAL_RTC_MspDeInit(RTC_HandleTypeDef *hrtc);
# 646 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_rtc.h"
HAL_StatusTypeDef HAL_RTC_SetTime(RTC_HandleTypeDef *hrtc, RTC_TimeTypeDef *sTime, uint32_t Format);
HAL_StatusTypeDef HAL_RTC_GetTime(RTC_HandleTypeDef *hrtc, RTC_TimeTypeDef *sTime, uint32_t Format);
HAL_StatusTypeDef HAL_RTC_SetDate(RTC_HandleTypeDef *hrtc, RTC_DateTypeDef *sDate, uint32_t Format);
HAL_StatusTypeDef HAL_RTC_GetDate(RTC_HandleTypeDef *hrtc, RTC_DateTypeDef *sDate, uint32_t Format);
# 658 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_rtc.h"
HAL_StatusTypeDef HAL_RTC_SetAlarm(RTC_HandleTypeDef *hrtc, RTC_AlarmTypeDef *sAlarm, uint32_t Format);
HAL_StatusTypeDef HAL_RTC_SetAlarm_IT(RTC_HandleTypeDef *hrtc, RTC_AlarmTypeDef *sAlarm, uint32_t Format);
HAL_StatusTypeDef HAL_RTC_DeactivateAlarm(RTC_HandleTypeDef *hrtc, uint32_t Alarm);
HAL_StatusTypeDef HAL_RTC_GetAlarm(RTC_HandleTypeDef *hrtc, RTC_AlarmTypeDef *sAlarm, uint32_t Alarm, uint32_t Format);
void HAL_RTC_AlarmIRQHandler(RTC_HandleTypeDef *hrtc);
HAL_StatusTypeDef HAL_RTC_PollForAlarmAEvent(RTC_HandleTypeDef *hrtc, uint32_t Timeout);
void HAL_RTC_AlarmAEventCallback(RTC_HandleTypeDef *hrtc);
# 673 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_rtc.h"
HAL_StatusTypeDef HAL_RTC_WaitForSynchro(RTC_HandleTypeDef* hrtc);
# 682 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_rtc.h"
HAL_RTCStateTypeDef HAL_RTC_GetState(RTC_HandleTypeDef *hrtc);
# 790 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_rtc.h"
HAL_StatusTypeDef RTC_EnterInitMode(RTC_HandleTypeDef* hrtc);
uint8_t RTC_ByteToBcd2(uint8_t Value);
uint8_t RTC_Bcd2ToByte(uint8_t Value);
# 347 "../Inc\\stm32f7xx_hal_conf.h" 2



# 1 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_sai.h" 1
# 64 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_sai.h"
typedef enum
{
  HAL_SAI_STATE_RESET = 0x00U,
  HAL_SAI_STATE_READY = 0x01U,
  HAL_SAI_STATE_BUSY = 0x02U,
  HAL_SAI_STATE_BUSY_TX = 0x12U,
  HAL_SAI_STATE_BUSY_RX = 0x22U,
}HAL_SAI_StateTypeDef;




typedef void (*SAIcallback)(void);





typedef struct
{
  uint32_t AudioMode;


  uint32_t Synchro;


  uint32_t SynchroExt;





  uint32_t OutputDrive;




  uint32_t NoDivider;
# 110 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_sai.h"
  uint32_t FIFOThreshold;


  uint32_t AudioFrequency;


  uint32_t Mckdiv;



  uint32_t MonoStereoMode;


  uint32_t CompandingMode;


  uint32_t TriState;





  uint32_t Protocol;


  uint32_t DataSize;


  uint32_t FirstBit;


  uint32_t ClockStrobing;

}SAI_InitTypeDef;
# 152 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_sai.h"
typedef struct
{

  uint32_t FrameLength;





  uint32_t ActiveFrameLength;




  uint32_t FSDefinition;


  uint32_t FSPolarity;


  uint32_t FSOffset;


}SAI_FrameInitTypeDef;
# 184 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_sai.h"
typedef struct
{
  uint32_t FirstBitOffset;


  uint32_t SlotSize;


  uint32_t SlotNumber;


  uint32_t SlotActive;

}SAI_SlotInitTypeDef;
# 206 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_sai.h"
typedef struct __SAI_HandleTypeDef
{
  SAI_Block_TypeDef *Instance;

  SAI_InitTypeDef Init;

  SAI_FrameInitTypeDef FrameInit;

  SAI_SlotInitTypeDef SlotInit;

  uint8_t *pBuffPtr;

  uint16_t XferSize;

  uint16_t XferCount;

  DMA_HandleTypeDef *hdmatx;

  DMA_HandleTypeDef *hdmarx;

  SAIcallback mutecallback;

  void (*InterruptServiceRoutine)(struct __SAI_HandleTypeDef *hsai);

  HAL_LockTypeDef Lock;

  volatile HAL_SAI_StateTypeDef State;

  volatile uint32_t ErrorCode;
}SAI_HandleTypeDef;
# 651 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_sai.h"
HAL_StatusTypeDef HAL_SAI_InitProtocol(SAI_HandleTypeDef *hsai, uint32_t protocol, uint32_t datasize, uint32_t nbslot);
HAL_StatusTypeDef HAL_SAI_Init(SAI_HandleTypeDef *hsai);
HAL_StatusTypeDef HAL_SAI_DeInit (SAI_HandleTypeDef *hsai);
void HAL_SAI_MspInit(SAI_HandleTypeDef *hsai);
void HAL_SAI_MspDeInit(SAI_HandleTypeDef *hsai);
# 667 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_sai.h"
HAL_StatusTypeDef HAL_SAI_Transmit(SAI_HandleTypeDef *hsai, uint8_t *pData, uint16_t Size, uint32_t Timeout);
HAL_StatusTypeDef HAL_SAI_Receive(SAI_HandleTypeDef *hsai, uint8_t *pData, uint16_t Size, uint32_t Timeout);


HAL_StatusTypeDef HAL_SAI_Transmit_IT(SAI_HandleTypeDef *hsai, uint8_t *pData, uint16_t Size);
HAL_StatusTypeDef HAL_SAI_Receive_IT(SAI_HandleTypeDef *hsai, uint8_t *pData, uint16_t Size);


HAL_StatusTypeDef HAL_SAI_Transmit_DMA(SAI_HandleTypeDef *hsai, uint8_t *pData, uint16_t Size);
HAL_StatusTypeDef HAL_SAI_Receive_DMA(SAI_HandleTypeDef *hsai, uint8_t *pData, uint16_t Size);
HAL_StatusTypeDef HAL_SAI_DMAPause(SAI_HandleTypeDef *hsai);
HAL_StatusTypeDef HAL_SAI_DMAResume(SAI_HandleTypeDef *hsai);
HAL_StatusTypeDef HAL_SAI_DMAStop(SAI_HandleTypeDef *hsai);


HAL_StatusTypeDef HAL_SAI_Abort(SAI_HandleTypeDef *hsai);


HAL_StatusTypeDef HAL_SAI_EnableTxMuteMode(SAI_HandleTypeDef *hsai, uint16_t val);
HAL_StatusTypeDef HAL_SAI_DisableTxMuteMode(SAI_HandleTypeDef *hsai);
HAL_StatusTypeDef HAL_SAI_EnableRxMuteMode(SAI_HandleTypeDef *hsai, SAIcallback callback, uint16_t counter);
HAL_StatusTypeDef HAL_SAI_DisableRxMuteMode(SAI_HandleTypeDef *hsai);


void HAL_SAI_IRQHandler(SAI_HandleTypeDef *hsai);
void HAL_SAI_TxHalfCpltCallback(SAI_HandleTypeDef *hsai);
void HAL_SAI_TxCpltCallback(SAI_HandleTypeDef *hsai);
void HAL_SAI_RxHalfCpltCallback(SAI_HandleTypeDef *hsai);
void HAL_SAI_RxCpltCallback(SAI_HandleTypeDef *hsai);
void HAL_SAI_ErrorCallback(SAI_HandleTypeDef *hsai);
# 705 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_sai.h"
HAL_SAI_StateTypeDef HAL_SAI_GetState(SAI_HandleTypeDef *hsai);
uint32_t HAL_SAI_GetError(SAI_HandleTypeDef *hsai);
# 351 "../Inc\\stm32f7xx_hal_conf.h" 2
# 366 "../Inc\\stm32f7xx_hal_conf.h"
# 1 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_tim.h" 1
# 63 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_tim.h"
typedef struct
{
  uint32_t Prescaler;


  uint32_t CounterMode;


  uint32_t Period;



  uint32_t ClockDivision;


  uint32_t RepetitionCounter;
# 87 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_tim.h"
  uint32_t AutoReloadPreload;


} TIM_Base_InitTypeDef;





typedef struct
{
  uint32_t OCMode;


  uint32_t Pulse;


  uint32_t OCPolarity;


  uint32_t OCNPolarity;



  uint32_t OCFastMode;




  uint32_t OCIdleState;



  uint32_t OCNIdleState;


} TIM_OC_InitTypeDef;




typedef struct
{
  uint32_t OCMode;


  uint32_t Pulse;


  uint32_t OCPolarity;


  uint32_t OCNPolarity;



  uint32_t OCIdleState;



  uint32_t OCNIdleState;



  uint32_t ICPolarity;


  uint32_t ICSelection;


  uint32_t ICFilter;

} TIM_OnePulse_InitTypeDef;






typedef struct
{
  uint32_t ICPolarity;


  uint32_t ICSelection;


  uint32_t ICPrescaler;


  uint32_t ICFilter;

} TIM_IC_InitTypeDef;





typedef struct
{
  uint32_t EncoderMode;


  uint32_t IC1Polarity;


  uint32_t IC1Selection;


  uint32_t IC1Prescaler;


  uint32_t IC1Filter;


  uint32_t IC2Polarity;


  uint32_t IC2Selection;


  uint32_t IC2Prescaler;


  uint32_t IC2Filter;

} TIM_Encoder_InitTypeDef;




typedef struct
{
  uint32_t ClockSource;

  uint32_t ClockPolarity;

  uint32_t ClockPrescaler;

  uint32_t ClockFilter;

}TIM_ClockConfigTypeDef;




typedef struct
{
  uint32_t ClearInputState;

  uint32_t ClearInputSource;

  uint32_t ClearInputPolarity;

  uint32_t ClearInputPrescaler;

  uint32_t ClearInputFilter;

}TIM_ClearInputConfigTypeDef;




typedef struct {
  uint32_t SlaveMode;

  uint32_t InputTrigger;

  uint32_t TriggerPolarity;

  uint32_t TriggerPrescaler;

  uint32_t TriggerFilter;


}TIM_SlaveConfigTypeDef;




typedef enum
{
  HAL_TIM_STATE_RESET = 0x00U,
  HAL_TIM_STATE_READY = 0x01U,
  HAL_TIM_STATE_BUSY = 0x02U,
  HAL_TIM_STATE_TIMEOUT = 0x03U,
  HAL_TIM_STATE_ERROR = 0x04U
}HAL_TIM_StateTypeDef;




typedef enum
{
  HAL_TIM_ACTIVE_CHANNEL_1 = 0x01U,
  HAL_TIM_ACTIVE_CHANNEL_2 = 0x02U,
  HAL_TIM_ACTIVE_CHANNEL_3 = 0x04U,
  HAL_TIM_ACTIVE_CHANNEL_4 = 0x08U,
  HAL_TIM_ACTIVE_CHANNEL_CLEARED = 0x00U
}HAL_TIM_ActiveChannel;




typedef struct
{
  TIM_TypeDef *Instance;
  TIM_Base_InitTypeDef Init;
  HAL_TIM_ActiveChannel Channel;
  DMA_HandleTypeDef *hdma[7];

  HAL_LockTypeDef Lock;
  volatile HAL_TIM_StateTypeDef State;
}TIM_HandleTypeDef;
# 1075 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_tim.h"
# 1 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_tim_ex.h" 1
# 64 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_tim_ex.h"
typedef struct
{

  uint32_t IC1Polarity;


  uint32_t IC1Prescaler;


  uint32_t IC1Filter;

  uint32_t Commutation_Delay;

} TIM_HallSensor_InitTypeDef;




typedef struct {
  uint32_t MasterOutputTrigger;

  uint32_t MasterOutputTrigger2;

  uint32_t MasterSlaveMode;

}TIM_MasterConfigTypeDef;






typedef struct
{
  uint32_t OffStateRunMode;

  uint32_t OffStateIDLEMode;

  uint32_t LockLevel;

  uint32_t DeadTime;

  uint32_t BreakState;

  uint32_t BreakPolarity;

  uint32_t BreakFilter;

  uint32_t Break2State;

  uint32_t Break2Polarity;

  uint32_t Break2Filter;

  uint32_t AutomaticOutput;

} TIM_BreakDeadTimeConfigTypeDef;
# 423 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_tim_ex.h"
HAL_StatusTypeDef HAL_TIMEx_HallSensor_Init(TIM_HandleTypeDef* htim, TIM_HallSensor_InitTypeDef* sConfig);
HAL_StatusTypeDef HAL_TIMEx_HallSensor_DeInit(TIM_HandleTypeDef* htim);

void HAL_TIMEx_HallSensor_MspInit(TIM_HandleTypeDef* htim);
void HAL_TIMEx_HallSensor_MspDeInit(TIM_HandleTypeDef* htim);


HAL_StatusTypeDef HAL_TIMEx_HallSensor_Start(TIM_HandleTypeDef* htim);
HAL_StatusTypeDef HAL_TIMEx_HallSensor_Stop(TIM_HandleTypeDef* htim);

HAL_StatusTypeDef HAL_TIMEx_HallSensor_Start_IT(TIM_HandleTypeDef* htim);
HAL_StatusTypeDef HAL_TIMEx_HallSensor_Stop_IT(TIM_HandleTypeDef* htim);

HAL_StatusTypeDef HAL_TIMEx_HallSensor_Start_DMA(TIM_HandleTypeDef* htim, uint32_t *pData, uint16_t Length);
HAL_StatusTypeDef HAL_TIMEx_HallSensor_Stop_DMA(TIM_HandleTypeDef* htim);
# 447 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_tim_ex.h"
HAL_StatusTypeDef HAL_TIMEx_OCN_Start(TIM_HandleTypeDef* htim, uint32_t Channel);
HAL_StatusTypeDef HAL_TIMEx_OCN_Stop(TIM_HandleTypeDef* htim, uint32_t Channel);


HAL_StatusTypeDef HAL_TIMEx_OCN_Start_IT(TIM_HandleTypeDef* htim, uint32_t Channel);
HAL_StatusTypeDef HAL_TIMEx_OCN_Stop_IT(TIM_HandleTypeDef* htim, uint32_t Channel);


HAL_StatusTypeDef HAL_TIMEx_OCN_Start_DMA(TIM_HandleTypeDef* htim, uint32_t Channel, uint32_t *pData, uint16_t Length);
HAL_StatusTypeDef HAL_TIMEx_OCN_Stop_DMA(TIM_HandleTypeDef* htim, uint32_t Channel);
# 466 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_tim_ex.h"
HAL_StatusTypeDef HAL_TIMEx_PWMN_Start(TIM_HandleTypeDef* htim, uint32_t Channel);
HAL_StatusTypeDef HAL_TIMEx_PWMN_Stop(TIM_HandleTypeDef* htim, uint32_t Channel);


HAL_StatusTypeDef HAL_TIMEx_PWMN_Start_IT(TIM_HandleTypeDef* htim, uint32_t Channel);
HAL_StatusTypeDef HAL_TIMEx_PWMN_Stop_IT(TIM_HandleTypeDef* htim, uint32_t Channel);

HAL_StatusTypeDef HAL_TIMEx_PWMN_Start_DMA(TIM_HandleTypeDef* htim, uint32_t Channel, uint32_t *pData, uint16_t Length);
HAL_StatusTypeDef HAL_TIMEx_PWMN_Stop_DMA(TIM_HandleTypeDef* htim, uint32_t Channel);
# 484 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_tim_ex.h"
HAL_StatusTypeDef HAL_TIMEx_OnePulseN_Start(TIM_HandleTypeDef* htim, uint32_t OutputChannel);
HAL_StatusTypeDef HAL_TIMEx_OnePulseN_Stop(TIM_HandleTypeDef* htim, uint32_t OutputChannel);


HAL_StatusTypeDef HAL_TIMEx_OnePulseN_Start_IT(TIM_HandleTypeDef* htim, uint32_t OutputChannel);
HAL_StatusTypeDef HAL_TIMEx_OnePulseN_Stop_IT(TIM_HandleTypeDef* htim, uint32_t OutputChannel);
# 498 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_tim_ex.h"
HAL_StatusTypeDef HAL_TIMEx_ConfigCommutationEvent(TIM_HandleTypeDef* htim, uint32_t InputTrigger, uint32_t CommutationSource);
HAL_StatusTypeDef HAL_TIMEx_ConfigCommutationEvent_IT(TIM_HandleTypeDef* htim, uint32_t InputTrigger, uint32_t CommutationSource);
HAL_StatusTypeDef HAL_TIMEx_ConfigCommutationEvent_DMA(TIM_HandleTypeDef* htim, uint32_t InputTrigger, uint32_t CommutationSource);
HAL_StatusTypeDef HAL_TIMEx_MasterConfigSynchronization(TIM_HandleTypeDef* htim, TIM_MasterConfigTypeDef * sMasterConfig);
HAL_StatusTypeDef HAL_TIMEx_ConfigBreakDeadTime(TIM_HandleTypeDef* htim, TIM_BreakDeadTimeConfigTypeDef *sBreakDeadTimeConfig);



HAL_StatusTypeDef HAL_TIMEx_RemapConfig(TIM_HandleTypeDef* htim, uint32_t Remap);
HAL_StatusTypeDef HAL_TIMEx_GroupChannel5(TIM_HandleTypeDef *htim, uint32_t OCRef);
# 516 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_tim_ex.h"
void HAL_TIMEx_CommutationCallback(TIM_HandleTypeDef* htim);
void HAL_TIMEx_BreakCallback(TIM_HandleTypeDef* htim);
void TIMEx_DMACommutationCplt(DMA_HandleTypeDef *hdma);
# 527 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_tim_ex.h"
HAL_TIM_StateTypeDef HAL_TIMEx_HallSensor_GetState(TIM_HandleTypeDef* htim);
# 1076 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_tim.h" 2
# 1087 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_tim.h"
HAL_StatusTypeDef HAL_TIM_Base_Init(TIM_HandleTypeDef *htim);
HAL_StatusTypeDef HAL_TIM_Base_DeInit(TIM_HandleTypeDef *htim);
void HAL_TIM_Base_MspInit(TIM_HandleTypeDef *htim);
void HAL_TIM_Base_MspDeInit(TIM_HandleTypeDef *htim);

HAL_StatusTypeDef HAL_TIM_Base_Start(TIM_HandleTypeDef *htim);
HAL_StatusTypeDef HAL_TIM_Base_Stop(TIM_HandleTypeDef *htim);

HAL_StatusTypeDef HAL_TIM_Base_Start_IT(TIM_HandleTypeDef *htim);
HAL_StatusTypeDef HAL_TIM_Base_Stop_IT(TIM_HandleTypeDef *htim);

HAL_StatusTypeDef HAL_TIM_Base_Start_DMA(TIM_HandleTypeDef *htim, uint32_t *pData, uint16_t Length);
HAL_StatusTypeDef HAL_TIM_Base_Stop_DMA(TIM_HandleTypeDef *htim);
# 1108 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_tim.h"
HAL_StatusTypeDef HAL_TIM_OC_Init(TIM_HandleTypeDef *htim);
HAL_StatusTypeDef HAL_TIM_OC_DeInit(TIM_HandleTypeDef *htim);
void HAL_TIM_OC_MspInit(TIM_HandleTypeDef *htim);
void HAL_TIM_OC_MspDeInit(TIM_HandleTypeDef *htim);

HAL_StatusTypeDef HAL_TIM_OC_Start(TIM_HandleTypeDef *htim, uint32_t Channel);
HAL_StatusTypeDef HAL_TIM_OC_Stop(TIM_HandleTypeDef *htim, uint32_t Channel);

HAL_StatusTypeDef HAL_TIM_OC_Start_IT(TIM_HandleTypeDef *htim, uint32_t Channel);
HAL_StatusTypeDef HAL_TIM_OC_Stop_IT(TIM_HandleTypeDef *htim, uint32_t Channel);

HAL_StatusTypeDef HAL_TIM_OC_Start_DMA(TIM_HandleTypeDef *htim, uint32_t Channel, uint32_t *pData, uint16_t Length);
HAL_StatusTypeDef HAL_TIM_OC_Stop_DMA(TIM_HandleTypeDef *htim, uint32_t Channel);
# 1130 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_tim.h"
HAL_StatusTypeDef HAL_TIM_PWM_Init(TIM_HandleTypeDef *htim);
HAL_StatusTypeDef HAL_TIM_PWM_DeInit(TIM_HandleTypeDef *htim);
void HAL_TIM_PWM_MspInit(TIM_HandleTypeDef *htim);
void HAL_TIM_PWM_MspDeInit(TIM_HandleTypeDef *htim);

HAL_StatusTypeDef HAL_TIM_PWM_Start(TIM_HandleTypeDef *htim, uint32_t Channel);
HAL_StatusTypeDef HAL_TIM_PWM_Stop(TIM_HandleTypeDef *htim, uint32_t Channel);

HAL_StatusTypeDef HAL_TIM_PWM_Start_IT(TIM_HandleTypeDef *htim, uint32_t Channel);
HAL_StatusTypeDef HAL_TIM_PWM_Stop_IT(TIM_HandleTypeDef *htim, uint32_t Channel);

HAL_StatusTypeDef HAL_TIM_PWM_Start_DMA(TIM_HandleTypeDef *htim, uint32_t Channel, uint32_t *pData, uint16_t Length);
HAL_StatusTypeDef HAL_TIM_PWM_Stop_DMA(TIM_HandleTypeDef *htim, uint32_t Channel);
# 1152 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_tim.h"
HAL_StatusTypeDef HAL_TIM_IC_Init(TIM_HandleTypeDef *htim);
HAL_StatusTypeDef HAL_TIM_IC_DeInit(TIM_HandleTypeDef *htim);
void HAL_TIM_IC_MspInit(TIM_HandleTypeDef *htim);
void HAL_TIM_IC_MspDeInit(TIM_HandleTypeDef *htim);

HAL_StatusTypeDef HAL_TIM_IC_Start(TIM_HandleTypeDef *htim, uint32_t Channel);
HAL_StatusTypeDef HAL_TIM_IC_Stop(TIM_HandleTypeDef *htim, uint32_t Channel);

HAL_StatusTypeDef HAL_TIM_IC_Start_IT(TIM_HandleTypeDef *htim, uint32_t Channel);
HAL_StatusTypeDef HAL_TIM_IC_Stop_IT(TIM_HandleTypeDef *htim, uint32_t Channel);

HAL_StatusTypeDef HAL_TIM_IC_Start_DMA(TIM_HandleTypeDef *htim, uint32_t Channel, uint32_t *pData, uint16_t Length);
HAL_StatusTypeDef HAL_TIM_IC_Stop_DMA(TIM_HandleTypeDef *htim, uint32_t Channel);
# 1174 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_tim.h"
HAL_StatusTypeDef HAL_TIM_OnePulse_Init(TIM_HandleTypeDef *htim, uint32_t OnePulseMode);
HAL_StatusTypeDef HAL_TIM_OnePulse_DeInit(TIM_HandleTypeDef *htim);
void HAL_TIM_OnePulse_MspInit(TIM_HandleTypeDef *htim);
void HAL_TIM_OnePulse_MspDeInit(TIM_HandleTypeDef *htim);

HAL_StatusTypeDef HAL_TIM_OnePulse_Start(TIM_HandleTypeDef *htim, uint32_t OutputChannel);
HAL_StatusTypeDef HAL_TIM_OnePulse_Stop(TIM_HandleTypeDef *htim, uint32_t OutputChannel);


HAL_StatusTypeDef HAL_TIM_OnePulse_Start_IT(TIM_HandleTypeDef *htim, uint32_t OutputChannel);
HAL_StatusTypeDef HAL_TIM_OnePulse_Stop_IT(TIM_HandleTypeDef *htim, uint32_t OutputChannel);
# 1194 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_tim.h"
HAL_StatusTypeDef HAL_TIM_Encoder_Init(TIM_HandleTypeDef *htim, TIM_Encoder_InitTypeDef* sConfig);
HAL_StatusTypeDef HAL_TIM_Encoder_DeInit(TIM_HandleTypeDef *htim);
void HAL_TIM_Encoder_MspInit(TIM_HandleTypeDef *htim);
void HAL_TIM_Encoder_MspDeInit(TIM_HandleTypeDef *htim);

HAL_StatusTypeDef HAL_TIM_Encoder_Start(TIM_HandleTypeDef *htim, uint32_t Channel);
HAL_StatusTypeDef HAL_TIM_Encoder_Stop(TIM_HandleTypeDef *htim, uint32_t Channel);

HAL_StatusTypeDef HAL_TIM_Encoder_Start_IT(TIM_HandleTypeDef *htim, uint32_t Channel);
HAL_StatusTypeDef HAL_TIM_Encoder_Stop_IT(TIM_HandleTypeDef *htim, uint32_t Channel);

HAL_StatusTypeDef HAL_TIM_Encoder_Start_DMA(TIM_HandleTypeDef *htim, uint32_t Channel, uint32_t *pData1, uint32_t *pData2, uint16_t Length);
HAL_StatusTypeDef HAL_TIM_Encoder_Stop_DMA(TIM_HandleTypeDef *htim, uint32_t Channel);
# 1216 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_tim.h"
void HAL_TIM_IRQHandler(TIM_HandleTypeDef *htim);
# 1226 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_tim.h"
HAL_StatusTypeDef HAL_TIM_OC_ConfigChannel(TIM_HandleTypeDef *htim, TIM_OC_InitTypeDef* sConfig, uint32_t Channel);
HAL_StatusTypeDef HAL_TIM_PWM_ConfigChannel(TIM_HandleTypeDef *htim, TIM_OC_InitTypeDef* sConfig, uint32_t Channel);
HAL_StatusTypeDef HAL_TIM_IC_ConfigChannel(TIM_HandleTypeDef *htim, TIM_IC_InitTypeDef* sConfig, uint32_t Channel);
HAL_StatusTypeDef HAL_TIM_OnePulse_ConfigChannel(TIM_HandleTypeDef *htim, TIM_OnePulse_InitTypeDef* sConfig, uint32_t OutputChannel, uint32_t InputChannel);
HAL_StatusTypeDef HAL_TIM_ConfigOCrefClear(TIM_HandleTypeDef *htim, TIM_ClearInputConfigTypeDef * sClearInputConfig, uint32_t Channel);
HAL_StatusTypeDef HAL_TIM_ConfigClockSource(TIM_HandleTypeDef *htim, TIM_ClockConfigTypeDef * sClockSourceConfig);
HAL_StatusTypeDef HAL_TIM_ConfigTI1Input(TIM_HandleTypeDef *htim, uint32_t TI1_Selection);
HAL_StatusTypeDef HAL_TIM_SlaveConfigSynchronization(TIM_HandleTypeDef *htim, TIM_SlaveConfigTypeDef * sSlaveConfig);
HAL_StatusTypeDef HAL_TIM_SlaveConfigSynchronization_IT(TIM_HandleTypeDef *htim, TIM_SlaveConfigTypeDef * sSlaveConfig);
HAL_StatusTypeDef HAL_TIM_DMABurst_WriteStart(TIM_HandleTypeDef *htim, uint32_t BurstBaseAddress, uint32_t BurstRequestSrc, uint32_t *BurstBuffer, uint32_t BurstLength);

HAL_StatusTypeDef HAL_TIM_DMABurst_WriteStop(TIM_HandleTypeDef *htim, uint32_t BurstRequestSrc);
HAL_StatusTypeDef HAL_TIM_DMABurst_ReadStart(TIM_HandleTypeDef *htim, uint32_t BurstBaseAddress, uint32_t BurstRequestSrc, uint32_t *BurstBuffer, uint32_t BurstLength);

HAL_StatusTypeDef HAL_TIM_DMABurst_ReadStop(TIM_HandleTypeDef *htim, uint32_t BurstRequestSrc);
HAL_StatusTypeDef HAL_TIM_GenerateEvent(TIM_HandleTypeDef *htim, uint32_t EventSource);
uint32_t HAL_TIM_ReadCapturedValue(TIM_HandleTypeDef *htim, uint32_t Channel);
# 1252 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_tim.h"
void HAL_TIM_PeriodElapsedCallback(TIM_HandleTypeDef *htim);
void HAL_TIM_OC_DelayElapsedCallback(TIM_HandleTypeDef *htim);
void HAL_TIM_IC_CaptureCallback(TIM_HandleTypeDef *htim);
void HAL_TIM_PWM_PulseFinishedCallback(TIM_HandleTypeDef *htim);
void HAL_TIM_TriggerCallback(TIM_HandleTypeDef *htim);
void HAL_TIM_ErrorCallback(TIM_HandleTypeDef *htim);
# 1267 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_tim.h"
HAL_TIM_StateTypeDef HAL_TIM_Base_GetState(TIM_HandleTypeDef *htim);
HAL_TIM_StateTypeDef HAL_TIM_OC_GetState(TIM_HandleTypeDef *htim);
HAL_TIM_StateTypeDef HAL_TIM_PWM_GetState(TIM_HandleTypeDef *htim);
HAL_TIM_StateTypeDef HAL_TIM_IC_GetState(TIM_HandleTypeDef *htim);
HAL_TIM_StateTypeDef HAL_TIM_OnePulse_GetState(TIM_HandleTypeDef *htim);
HAL_TIM_StateTypeDef HAL_TIM_Encoder_GetState(TIM_HandleTypeDef *htim);
# 1531 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_tim.h"
void TIM_Base_SetConfig(TIM_TypeDef *TIMx, TIM_Base_InitTypeDef *Structure);
void TIM_TI1_SetConfig(TIM_TypeDef *TIMx, uint32_t TIM_ICPolarity, uint32_t TIM_ICSelection, uint32_t TIM_ICFilter);
void TIM_OC1_SetConfig(TIM_TypeDef *TIMx, TIM_OC_InitTypeDef *OC_Config);
void TIM_OC2_SetConfig(TIM_TypeDef *TIMx, TIM_OC_InitTypeDef *OC_Config);
void TIM_OC3_SetConfig(TIM_TypeDef *TIMx, TIM_OC_InitTypeDef *OC_Config);
void TIM_OC4_SetConfig(TIM_TypeDef *TIMx, TIM_OC_InitTypeDef *OC_Config);
void TIM_ETR_SetConfig(TIM_TypeDef* TIMx, uint32_t TIM_ExtTRGPrescaler, uint32_t TIM_ExtTRGPolarity, uint32_t ExtTRGFilter);

void TIM_DMADelayPulseCplt(DMA_HandleTypeDef *hdma);
void TIM_DMAError(DMA_HandleTypeDef *hdma);
void TIM_DMACaptureCplt(DMA_HandleTypeDef *hdma);
void TIM_CCxChannelCmd(TIM_TypeDef* TIMx, uint32_t Channel, uint32_t ChannelState);
# 367 "../Inc\\stm32f7xx_hal_conf.h" 2



# 1 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_uart.h" 1
# 63 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_uart.h"
typedef struct
{
  uint32_t BaudRate;
# 74 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_uart.h"
  uint32_t WordLength;


  uint32_t StopBits;


  uint32_t Parity;






  uint32_t Mode;


  uint32_t HwFlowCtl;



  uint32_t OverSampling;


  uint32_t OneBitSampling;


}UART_InitTypeDef;




typedef struct
{
  uint32_t AdvFeatureInit;



  uint32_t TxPinLevelInvert;


  uint32_t RxPinLevelInvert;


  uint32_t DataInvert;



  uint32_t Swap;


  uint32_t OverrunDisable;


  uint32_t DMADisableonRxError;


  uint32_t AutoBaudRateEnable;


  uint32_t AutoBaudRateMode;



  uint32_t MSBFirst;

} UART_AdvFeatureInitTypeDef;
# 182 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_uart.h"
typedef enum
{
  HAL_UART_STATE_RESET = 0x00U,

  HAL_UART_STATE_READY = 0x20U,

  HAL_UART_STATE_BUSY = 0x24U,

  HAL_UART_STATE_BUSY_TX = 0x21U,

  HAL_UART_STATE_BUSY_RX = 0x22U,

  HAL_UART_STATE_BUSY_TX_RX = 0x23U,


  HAL_UART_STATE_TIMEOUT = 0xA0U,

  HAL_UART_STATE_ERROR = 0xE0U

}HAL_UART_StateTypeDef;




typedef enum
{
  UART_CLOCKSOURCE_PCLK1 = 0x00U,
  UART_CLOCKSOURCE_PCLK2 = 0x01U,
  UART_CLOCKSOURCE_HSI = 0x02U,
  UART_CLOCKSOURCE_SYSCLK = 0x04U,
  UART_CLOCKSOURCE_LSE = 0x08U,
  UART_CLOCKSOURCE_UNDEFINED = 0x10U
}UART_ClockSourceTypeDef;




typedef struct
{
  USART_TypeDef *Instance;

  UART_InitTypeDef Init;

  UART_AdvFeatureInitTypeDef AdvancedInit;

  uint8_t *pTxBuffPtr;

  uint16_t TxXferSize;

  volatile uint16_t TxXferCount;

  uint8_t *pRxBuffPtr;

  uint16_t RxXferSize;

  volatile uint16_t RxXferCount;

  uint16_t Mask;

  DMA_HandleTypeDef *hdmatx;

  DMA_HandleTypeDef *hdmarx;

  HAL_LockTypeDef Lock;

  volatile HAL_UART_StateTypeDef gState;



  volatile HAL_UART_StateTypeDef RxState;


  volatile uint32_t ErrorCode;

}UART_HandleTypeDef;
# 1108 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_uart.h"
# 1 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_uart_ex.h" 1
# 328 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_uart_ex.h"
HAL_StatusTypeDef HAL_RS485Ex_Init(UART_HandleTypeDef *huart, uint32_t Polarity, uint32_t AssertionTime, uint32_t DeassertionTime);
# 343 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_uart_ex.h"
HAL_StatusTypeDef HAL_MultiProcessorEx_AddressLength_Set(UART_HandleTypeDef *huart, uint32_t AddressLength);
# 1109 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_uart.h" 2
# 1119 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_uart.h"
HAL_StatusTypeDef HAL_UART_Init(UART_HandleTypeDef *huart);
HAL_StatusTypeDef HAL_HalfDuplex_Init(UART_HandleTypeDef *huart);
HAL_StatusTypeDef HAL_LIN_Init(UART_HandleTypeDef *huart, uint32_t BreakDetectLength);
HAL_StatusTypeDef HAL_MultiProcessor_Init(UART_HandleTypeDef *huart, uint8_t Address, uint32_t WakeUpMethod);
HAL_StatusTypeDef HAL_RS485Ex_Init(UART_HandleTypeDef *huart, uint32_t Polarity, uint32_t AssertionTime, uint32_t DeassertionTime);
HAL_StatusTypeDef HAL_UART_DeInit (UART_HandleTypeDef *huart);
void HAL_UART_MspInit(UART_HandleTypeDef *huart);
void HAL_UART_MspDeInit(UART_HandleTypeDef *huart);
# 1137 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_uart.h"
HAL_StatusTypeDef HAL_UART_Transmit(UART_HandleTypeDef *huart, uint8_t *pData, uint16_t Size, uint32_t Timeout);
HAL_StatusTypeDef HAL_UART_Receive(UART_HandleTypeDef *huart, uint8_t *pData, uint16_t Size, uint32_t Timeout);
HAL_StatusTypeDef HAL_UART_Transmit_IT(UART_HandleTypeDef *huart, uint8_t *pData, uint16_t Size);
HAL_StatusTypeDef HAL_UART_Receive_IT(UART_HandleTypeDef *huart, uint8_t *pData, uint16_t Size);
HAL_StatusTypeDef HAL_UART_Transmit_DMA(UART_HandleTypeDef *huart, uint8_t *pData, uint16_t Size);
HAL_StatusTypeDef HAL_UART_Receive_DMA(UART_HandleTypeDef *huart, uint8_t *pData, uint16_t Size);
HAL_StatusTypeDef HAL_UART_DMAPause(UART_HandleTypeDef *huart);
HAL_StatusTypeDef HAL_UART_DMAResume(UART_HandleTypeDef *huart);
HAL_StatusTypeDef HAL_UART_DMAStop(UART_HandleTypeDef *huart);

void HAL_UART_IRQHandler(UART_HandleTypeDef *huart);
void HAL_UART_TxHalfCpltCallback(UART_HandleTypeDef *huart);
void HAL_UART_TxCpltCallback(UART_HandleTypeDef *huart);
void HAL_UART_RxHalfCpltCallback(UART_HandleTypeDef *huart);
void HAL_UART_RxCpltCallback(UART_HandleTypeDef *huart);
void HAL_UART_ErrorCallback(UART_HandleTypeDef *huart);
# 1163 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_uart.h"
HAL_StatusTypeDef HAL_LIN_SendBreak(UART_HandleTypeDef *huart);
HAL_StatusTypeDef HAL_MultiProcessorEx_AddressLength_Set(UART_HandleTypeDef *huart, uint32_t AddressLength);
HAL_StatusTypeDef HAL_MultiProcessor_EnableMuteMode(UART_HandleTypeDef *huart);
HAL_StatusTypeDef HAL_MultiProcessor_DisableMuteMode(UART_HandleTypeDef *huart);
void HAL_MultiProcessor_EnterMuteMode(UART_HandleTypeDef *huart);
HAL_StatusTypeDef HAL_HalfDuplex_EnableTransmitter(UART_HandleTypeDef *huart);
HAL_StatusTypeDef HAL_HalfDuplex_EnableReceiver(UART_HandleTypeDef *huart);
# 1180 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_uart.h"
HAL_UART_StateTypeDef HAL_UART_GetState(UART_HandleTypeDef *huart);
uint32_t HAL_UART_GetError(UART_HandleTypeDef *huart);
# 1196 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_uart.h"
HAL_StatusTypeDef UART_SetConfig(UART_HandleTypeDef *huart);
HAL_StatusTypeDef UART_CheckIdleState(UART_HandleTypeDef *huart);
HAL_StatusTypeDef UART_WaitOnFlagUntilTimeout(UART_HandleTypeDef *huart, uint32_t Flag, FlagStatus Status, uint32_t Tickstart, uint32_t Timeout);
void UART_AdvFeatureConfig(UART_HandleTypeDef *huart);
# 371 "../Inc\\stm32f7xx_hal_conf.h" 2



# 1 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_usart.h" 1
# 63 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_usart.h"
typedef struct
{
  uint32_t BaudRate;



  uint32_t WordLength;


  uint32_t StopBits;


  uint32_t Parity;






  uint32_t Mode;


  uint32_t OverSampling;


  uint32_t CLKPolarity;


  uint32_t CLKPhase;


  uint32_t CLKLastBit;


}USART_InitTypeDef;




typedef enum
{
  HAL_USART_STATE_RESET = 0x00U,
  HAL_USART_STATE_READY = 0x01U,
  HAL_USART_STATE_BUSY = 0x02U,
  HAL_USART_STATE_BUSY_TX = 0x12U,
  HAL_USART_STATE_BUSY_RX = 0x22U,
  HAL_USART_STATE_BUSY_TX_RX = 0x32U,
  HAL_USART_STATE_TIMEOUT = 0x03U,
  HAL_USART_STATE_ERROR = 0x04U
}HAL_USART_StateTypeDef;





typedef enum
{
  USART_CLOCKSOURCE_PCLK1 = 0x00U,
  USART_CLOCKSOURCE_PCLK2 = 0x01U,
  USART_CLOCKSOURCE_HSI = 0x02U,
  USART_CLOCKSOURCE_SYSCLK = 0x04U,
  USART_CLOCKSOURCE_LSE = 0x08U,
  USART_CLOCKSOURCE_UNDEFINED = 0x10U
}USART_ClockSourceTypeDef;





typedef struct
{
  USART_TypeDef *Instance;

  USART_InitTypeDef Init;

  uint8_t *pTxBuffPtr;

  uint16_t TxXferSize;

  volatile uint16_t TxXferCount;

  uint8_t *pRxBuffPtr;

  uint16_t RxXferSize;

  volatile uint16_t RxXferCount;

  uint16_t Mask;

  DMA_HandleTypeDef *hdmatx;

  DMA_HandleTypeDef *hdmarx;

  HAL_LockTypeDef Lock;

  HAL_USART_StateTypeDef State;

  volatile uint32_t ErrorCode;

}USART_HandleTypeDef;
# 478 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_usart.h"
# 1 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_usart_ex.h" 1
# 479 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_usart.h" 2
# 489 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_usart.h"
HAL_StatusTypeDef HAL_USART_Init(USART_HandleTypeDef *husart);
HAL_StatusTypeDef HAL_USART_DeInit(USART_HandleTypeDef *husart);
void HAL_USART_MspInit(USART_HandleTypeDef *husart);
void HAL_USART_MspDeInit(USART_HandleTypeDef *husart);
HAL_StatusTypeDef HAL_USART_CheckIdleState(USART_HandleTypeDef *husart);
# 502 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_usart.h"
HAL_StatusTypeDef HAL_USART_Transmit(USART_HandleTypeDef *husart, uint8_t *pTxData, uint16_t Size, uint32_t Timeout);
HAL_StatusTypeDef HAL_USART_Receive(USART_HandleTypeDef *husart, uint8_t *pRxData, uint16_t Size, uint32_t Timeout);
HAL_StatusTypeDef HAL_USART_TransmitReceive(USART_HandleTypeDef *husart, uint8_t *pTxData, uint8_t *pRxData, uint16_t Size, uint32_t Timeout);
HAL_StatusTypeDef HAL_USART_Transmit_IT(USART_HandleTypeDef *husart, uint8_t *pTxData, uint16_t Size);
HAL_StatusTypeDef HAL_USART_Receive_IT(USART_HandleTypeDef *husart, uint8_t *pRxData, uint16_t Size);
HAL_StatusTypeDef HAL_USART_TransmitReceive_IT(USART_HandleTypeDef *husart, uint8_t *pTxData, uint8_t *pRxData, uint16_t Size);
HAL_StatusTypeDef HAL_USART_Transmit_DMA(USART_HandleTypeDef *husart, uint8_t *pTxData, uint16_t Size);
HAL_StatusTypeDef HAL_USART_Receive_DMA(USART_HandleTypeDef *husart, uint8_t *pRxData, uint16_t Size);
HAL_StatusTypeDef HAL_USART_TransmitReceive_DMA(USART_HandleTypeDef *husart, uint8_t *pTxData, uint8_t *pRxData, uint16_t Size);
HAL_StatusTypeDef HAL_USART_DMAPause(USART_HandleTypeDef *husart);
HAL_StatusTypeDef HAL_USART_DMAResume(USART_HandleTypeDef *husart);
HAL_StatusTypeDef HAL_USART_DMAStop(USART_HandleTypeDef *husart);
void HAL_USART_IRQHandler(USART_HandleTypeDef *husart);
void HAL_USART_TxHalfCpltCallback(USART_HandleTypeDef *husart);
void HAL_USART_TxCpltCallback(USART_HandleTypeDef *husart);
void HAL_USART_RxCpltCallback(USART_HandleTypeDef *husart);
void HAL_USART_RxHalfCpltCallback(USART_HandleTypeDef *husart);
void HAL_USART_TxRxCpltCallback(USART_HandleTypeDef *husart);
void HAL_USART_ErrorCallback(USART_HandleTypeDef *husart);
# 530 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal_usart.h"
HAL_USART_StateTypeDef HAL_USART_GetState(USART_HandleTypeDef *husart);
uint32_t HAL_USART_GetError(USART_HandleTypeDef *husart);
# 375 "../Inc\\stm32f7xx_hal_conf.h" 2
# 47 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal.h" 2
# 178 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal.h"
HAL_StatusTypeDef HAL_Init(void);
HAL_StatusTypeDef HAL_DeInit(void);
void HAL_MspInit(void);
void HAL_MspDeInit(void);
HAL_StatusTypeDef HAL_InitTick (uint32_t TickPriority);
# 191 "../Drivers/STM32F7xx_HAL_Driver/Inc\\stm32f7xx_hal.h"
void HAL_IncTick(void);
void HAL_Delay(volatile uint32_t Delay);
uint32_t HAL_GetTick(void);
void HAL_SuspendTick(void);
void HAL_ResumeTick(void);
uint32_t HAL_GetHalVersion(void);
uint32_t HAL_GetREVID(void);
uint32_t HAL_GetDEVID(void);
uint32_t HAL_GetUIDw0(void);
uint32_t HAL_GetUIDw1(void);
uint32_t HAL_GetUIDw2(void);
void HAL_DBGMCU_EnableDBGSleepMode(void);
void HAL_DBGMCU_DisableDBGSleepMode(void);
void HAL_DBGMCU_EnableDBGStopMode(void);
void HAL_DBGMCU_DisableDBGStopMode(void);
void HAL_DBGMCU_EnableDBGStandbyMode(void);
void HAL_DBGMCU_DisableDBGStandbyMode(void);
void HAL_EnableCompensationCell(void);
void HAL_DisableCompensationCell(void);
void HAL_EnableFMCMemorySwapping(void);
void HAL_DisableFMCMemorySwapping(void);
# 166 "../Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_sai.c" 2
# 183 "../Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_sai.c"
typedef enum {
  SAI_MODE_DMA,
  SAI_MODE_IT
}SAI_ModeTypedef;
# 209 "../Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_sai.c"
static void SAI_FillFifo(SAI_HandleTypeDef *hsai);
static uint32_t SAI_InterruptFlag(SAI_HandleTypeDef *hsai, uint32_t mode);
static HAL_StatusTypeDef SAI_InitI2S(SAI_HandleTypeDef *hsai, uint32_t protocol, uint32_t datasize, uint32_t nbslot);
static HAL_StatusTypeDef SAI_InitPCM(SAI_HandleTypeDef *hsai, uint32_t protocol, uint32_t datasize, uint32_t nbslot);

static HAL_StatusTypeDef SAI_Disable(SAI_HandleTypeDef *hsai);
static void SAI_Transmit_IT8Bit(SAI_HandleTypeDef *hsai);
static void SAI_Transmit_IT16Bit(SAI_HandleTypeDef *hsai);
static void SAI_Transmit_IT32Bit(SAI_HandleTypeDef *hsai);
static void SAI_Receive_IT8Bit(SAI_HandleTypeDef *hsai);
static void SAI_Receive_IT16Bit(SAI_HandleTypeDef *hsai);
static void SAI_Receive_IT32Bit(SAI_HandleTypeDef *hsai);

static void SAI_DMATxCplt(DMA_HandleTypeDef *hdma);
static void SAI_DMATxHalfCplt(DMA_HandleTypeDef *hdma);
static void SAI_DMARxCplt(DMA_HandleTypeDef *hdma);
static void SAI_DMARxHalfCplt(DMA_HandleTypeDef *hdma);
static void SAI_DMAError(DMA_HandleTypeDef *hdma);
static void SAI_DMAAbort(DMA_HandleTypeDef *hdma);
# 281 "../Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_sai.c"
HAL_StatusTypeDef HAL_SAI_InitProtocol(SAI_HandleTypeDef *hsai, uint32_t protocol, uint32_t datasize, uint32_t nbslot)
{
  HAL_StatusTypeDef status = HAL_OK;


  ((void)0U);
  ((void)0U);

  switch(protocol)
  {
  case 0 :
  case 1 :
  case 2 :
    status = SAI_InitI2S(hsai, protocol, datasize, nbslot);
    break;
  case 3 :
  case 4 :
    status = SAI_InitPCM(hsai, protocol, datasize, nbslot);
    break;
  default :
    status = HAL_ERROR;
    break;
  }

  if(status == HAL_OK)
  {
    status = HAL_SAI_Init(hsai);
  }

  return status;
}
# 320 "../Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_sai.c"
HAL_StatusTypeDef HAL_SAI_Init(SAI_HandleTypeDef *hsai)
{
  uint32_t tmpregisterGCR = 0;
  uint32_t ckstr_bits = 0;
  uint32_t syncen_bits = 0;


  if(hsai == 0)
  {
    return HAL_ERROR;
  }


  ((void)0U);


  ((void)0U);
  ((void)0U);
  ((void)0U);
  ((void)0U);
  ((void)0U);
  ((void)0U);
  ((void)0U);
  ((void)0U);
  ((void)0U);
  ((void)0U);
  ((void)0U);
  ((void)0U);
  ((void)0U);
  ((void)0U);


  ((void)0U);
  ((void)0U);
  ((void)0U);
  ((void)0U);
  ((void)0U);


  ((void)0U);
  ((void)0U);
  ((void)0U);
  ((void)0U);

  if(hsai->State == HAL_SAI_STATE_RESET)
  {

    hsai->Lock = HAL_UNLOCKED;


    HAL_SAI_MspInit(hsai);
  }

  hsai->State = HAL_SAI_STATE_BUSY;


  SAI_Disable(hsai);



  switch(hsai->Init.SynchroExt)
  {
    case 0 :
      tmpregisterGCR = 0;
      break;
    case 1 :
      tmpregisterGCR = (0x1U << (4U));
      break;
    case 2 :
      tmpregisterGCR = (0x2U << (4U));
      break;
  default:
    break;
  }

  switch(hsai->Init.Synchro)
  {
    case 0 :
      {
        syncen_bits = 0;
      }
      break;
    case 1 :
      {
        syncen_bits = (0x1U << (10U));
      }
      break;
    case 2 :
      {
        syncen_bits = (0x2U << (10U));
      }
      break;
    case 3 :
      {
        syncen_bits = (0x2U << (10U));
        tmpregisterGCR |= (0x1U << (0U));
      }
      break;
  default:
    break;
  }

  if((hsai->Instance == ((SAI_Block_TypeDef *)(((0x40000000U + 0x00010000U) + 0x5800U) + 0x004U))) || (hsai->Instance == ((SAI_Block_TypeDef *)(((0x40000000U + 0x00010000U) + 0x5800U) + 0x024U))))
  {
    ((SAI_TypeDef *) ((0x40000000U + 0x00010000U) + 0x5800U))->GCR = tmpregisterGCR;
  }
  else
  {
    ((SAI_TypeDef *) ((0x40000000U + 0x00010000U) + 0x5C00U))->GCR = tmpregisterGCR;
  }

  if(hsai->Init.AudioFrequency != ((uint32_t)0U))
  {
    uint32_t freq = 0;
    uint32_t tmpval;

    if((hsai->Instance == ((SAI_Block_TypeDef *)(((0x40000000U + 0x00010000U) + 0x5800U) + 0x004U)) ) || (hsai->Instance == ((SAI_Block_TypeDef *)(((0x40000000U + 0x00010000U) + 0x5800U) + 0x024U)) ))
    {
      freq = HAL_RCCEx_GetPeriphCLKFreq(((uint32_t)0x00080000U));
    }
    if((hsai->Instance == ((SAI_Block_TypeDef *)(((0x40000000U + 0x00010000U) + 0x5C00U) + 0x004U)) ) || (hsai->Instance == ((SAI_Block_TypeDef *)(((0x40000000U + 0x00010000U) + 0x5C00U) + 0x024U)) ))
    {
      freq = HAL_RCCEx_GetPeriphCLKFreq(((uint32_t)0x00100000U));
    }






    tmpval = (freq * 10) / (hsai->Init.AudioFrequency * 2 * 256);
    hsai->Init.Mckdiv = tmpval / 10;


    if((tmpval % 10) > 8)
    {
      hsai->Init.Mckdiv+= 1;
    }
  }


  if((hsai->Init.AudioMode == ((uint32_t)0x00000000U)) || (hsai->Init.AudioMode == ((uint32_t)(0x2U << (0U)))))
  {
    ckstr_bits = (hsai->Init.ClockStrobing == 1) ? 0 : (0x1U << (9U));
  }
  else
  {
    ckstr_bits = (hsai->Init.ClockStrobing == 1) ? (0x1U << (9U)) : 0;
  }



  hsai->Instance->CR1&=~((0x3U << (0U)) | (0x3U << (2U)) | (0x7U << (5U)) | (0x1U << (8U)) | (0x1U << (9U)) | (0x3U << (10U)) | (0x1U << (12U)) | (0x1U << (13U)) | (0x1U << (17U)) | (0x1U << (19U)) | (0xFU << (20U)));




  hsai->Instance->CR1|=(hsai->Init.AudioMode | hsai->Init.Protocol | hsai->Init.DataSize | hsai->Init.FirstBit | ckstr_bits | syncen_bits | hsai->Init.MonoStereoMode | hsai->Init.OutputDrive | hsai->Init.NoDivider | (hsai->Init.Mckdiv << 20));






  hsai->Instance->CR2&= ~((0x7U << (0U)) | (0x1U << (3U)) | (0x3U << (14U)) | (0x1U << (13U)));
  hsai->Instance->CR2|= (hsai->Init.FIFOThreshold | hsai->Init.CompandingMode | hsai->Init.TriState);


  hsai->Instance->FRCR&=(~((0xFFU << (0U)) | (0x7FU << (8U)) | (0x1U << (16U)) | (0x1U << (17U)) | (0x1U << (18U))));

  hsai->Instance->FRCR|=((hsai->FrameInit.FrameLength - 1) |
                          hsai->FrameInit.FSOffset |
                          hsai->FrameInit.FSDefinition |
                          hsai->FrameInit.FSPolarity |
                          ((hsai->FrameInit.ActiveFrameLength - 1) << 8));



  hsai->Instance->SLOTR&= (~((0x1FU << (0U)) | (0x3U << (6U)) | (0xFU << (8U)) | (0xFFFFU << (16U)) ));


  hsai->Instance->SLOTR|= hsai->SlotInit.FirstBitOffset | hsai->SlotInit.SlotSize
                          | (hsai->SlotInit.SlotActive << 16) | ((hsai->SlotInit.SlotNumber - 1) << 8);


  hsai->ErrorCode = ((uint32_t)0x00000000U);


  hsai->State= HAL_SAI_STATE_READY;


  do{ (hsai)->Lock = HAL_UNLOCKED; }while (0);

  return HAL_OK;
}







HAL_StatusTypeDef HAL_SAI_DeInit(SAI_HandleTypeDef *hsai)
{

  if(hsai == 0)
  {
    return HAL_ERROR;
  }

  hsai->State = HAL_SAI_STATE_BUSY;


  hsai->Instance->IMR = 0;
  hsai->Instance->CLRFR = 0xFFFFFFFFU;


  SAI_Disable(hsai);


  ((hsai->Instance->CR2) |= ((0x1U << (3U))));


  HAL_SAI_MspDeInit(hsai);


  hsai->ErrorCode = ((uint32_t)0x00000000U);


  hsai->State = HAL_SAI_STATE_RESET;


  do{ (hsai)->Lock = HAL_UNLOCKED; }while (0);

  return HAL_OK;
}







__attribute__((weak)) void HAL_SAI_MspInit(SAI_HandleTypeDef *hsai)
{

  ((void)(hsai));




}







__attribute__((weak)) void HAL_SAI_MspDeInit(SAI_HandleTypeDef *hsai)
{

  ((void)(hsai));




}
# 644 "../Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_sai.c"
HAL_StatusTypeDef HAL_SAI_Transmit(SAI_HandleTypeDef *hsai, uint8_t* pData, uint16_t Size, uint32_t Timeout)
{
  uint32_t tickstart = HAL_GetTick();

  if((pData == 0 ) || (Size == 0))
  {
    return HAL_ERROR;
  }

  if(hsai->State == HAL_SAI_STATE_READY)
  {

    do{ if((hsai)->Lock == HAL_LOCKED) { return HAL_BUSY; } else { (hsai)->Lock = HAL_LOCKED; } }while (0);

    hsai->XferSize = Size;
    hsai->XferCount = Size;
    hsai->pBuffPtr = pData;
    hsai->State = HAL_SAI_STATE_BUSY_TX;
    hsai->ErrorCode = ((uint32_t)0x00000000U);


    if((hsai->Instance->CR1 & (0x1U << (16U))) == RESET)
    {

      SAI_FillFifo(hsai);

      ((hsai)->Instance->CR1 |= (0x1U << (16U)));
    }

    while(hsai->XferCount > 0)
    {

      if((hsai->Instance->SR & (0x7U << (16U))) != ((uint32_t)0x00050000U))
      {
        if((hsai->Init.DataSize == ((uint32_t)(0x2U << (5U)))) && (hsai->Init.CompandingMode == ((uint32_t)0x00000000U)))
        {
          hsai->Instance->DR = (*hsai->pBuffPtr++);
        }
        else if(hsai->Init.DataSize <= ((uint32_t)(0x4U << (5U))))
        {
          hsai->Instance->DR = *((uint16_t *)hsai->pBuffPtr);
          hsai->pBuffPtr+= 2;
        }
        else
        {
          hsai->Instance->DR = *((uint32_t *)hsai->pBuffPtr);
          hsai->pBuffPtr+= 4;
        }
        hsai->XferCount--;
      }
      else
      {

        if((Timeout != 0xFFFFFFFFU) && ((Timeout == 0)||((HAL_GetTick() - tickstart) > Timeout)))
        {

          hsai->ErrorCode |= ((uint32_t)0x00000040U);


          hsai->Instance->CLRFR = 0xFFFFFFFFU;


          SAI_Disable(hsai);


          ((hsai->Instance->CR2) |= ((0x1U << (3U))));


          hsai->State = HAL_SAI_STATE_READY;


          do{ (hsai)->Lock = HAL_UNLOCKED; }while (0);

          return HAL_ERROR;
        }
      }
    }

    hsai->State = HAL_SAI_STATE_READY;


    do{ (hsai)->Lock = HAL_UNLOCKED; }while (0);

    return HAL_OK;
  }
  else
  {
    return HAL_BUSY;
  }
}
# 744 "../Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_sai.c"
HAL_StatusTypeDef HAL_SAI_Receive(SAI_HandleTypeDef *hsai, uint8_t *pData, uint16_t Size, uint32_t Timeout)
{
  uint32_t tickstart = HAL_GetTick();

  if((pData == 0 ) || (Size == 0))
  {
    return HAL_ERROR;
  }

  if(hsai->State == HAL_SAI_STATE_READY)
  {

    do{ if((hsai)->Lock == HAL_LOCKED) { return HAL_BUSY; } else { (hsai)->Lock = HAL_LOCKED; } }while (0);

    hsai->pBuffPtr = pData;
    hsai->XferSize = Size;
    hsai->XferCount = Size;
    hsai->State = HAL_SAI_STATE_BUSY_RX;
    hsai->ErrorCode = ((uint32_t)0x00000000U);


    if((hsai->Instance->CR1 & (0x1U << (16U))) == RESET)
    {

      ((hsai)->Instance->CR1 |= (0x1U << (16U)));
    }


    while(hsai->XferCount > 0)
    {
      if((hsai->Instance->SR & (0x7U << (16U))) != ((uint32_t)0x00000000U))
      {
        if((hsai->Init.DataSize == ((uint32_t)(0x2U << (5U)))) && (hsai->Init.CompandingMode == ((uint32_t)0x00000000U)))
        {
          (*hsai->pBuffPtr++) = hsai->Instance->DR;
        }
        else if(hsai->Init.DataSize <= ((uint32_t)(0x4U << (5U))))
        {
          *((uint16_t*)hsai->pBuffPtr) = hsai->Instance->DR;
          hsai->pBuffPtr+= 2;
        }
        else
        {
          *((uint32_t*)hsai->pBuffPtr) = hsai->Instance->DR;
          hsai->pBuffPtr+= 4;
        }
        hsai->XferCount--;
      }
      else
      {

        if((Timeout != 0xFFFFFFFFU) && ((Timeout == 0)||((HAL_GetTick() - tickstart) > Timeout)))
        {

          hsai->ErrorCode |= ((uint32_t)0x00000040U);


          hsai->Instance->CLRFR = 0xFFFFFFFFU;


          SAI_Disable(hsai);


          ((hsai->Instance->CR2) |= ((0x1U << (3U))));


          hsai->State = HAL_SAI_STATE_READY;


          do{ (hsai)->Lock = HAL_UNLOCKED; }while (0);

          return HAL_ERROR;
        }
      }
    }

    hsai->State = HAL_SAI_STATE_READY;


    do{ (hsai)->Lock = HAL_UNLOCKED; }while (0);

    return HAL_OK;
  }
  else
  {
    return HAL_BUSY;
  }
}
# 841 "../Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_sai.c"
HAL_StatusTypeDef HAL_SAI_Transmit_IT(SAI_HandleTypeDef *hsai, uint8_t *pData, uint16_t Size)
{
  if((pData == 0) || (Size == 0))
  {
    return HAL_ERROR;
  }

  if(hsai->State == HAL_SAI_STATE_READY)
  {

    do{ if((hsai)->Lock == HAL_LOCKED) { return HAL_BUSY; } else { (hsai)->Lock = HAL_LOCKED; } }while (0);

    hsai->pBuffPtr = pData;
    hsai->XferSize = Size;
    hsai->XferCount = Size;
    hsai->ErrorCode = ((uint32_t)0x00000000U);
    hsai->State = HAL_SAI_STATE_BUSY_TX;

    if((hsai->Init.DataSize == ((uint32_t)(0x2U << (5U)))) && (hsai->Init.CompandingMode == ((uint32_t)0x00000000U)))
    {
      hsai->InterruptServiceRoutine = SAI_Transmit_IT8Bit;
    }
    else if(hsai->Init.DataSize <= ((uint32_t)(0x4U << (5U))))
    {
      hsai->InterruptServiceRoutine = SAI_Transmit_IT16Bit;
    }
    else
    {
      hsai->InterruptServiceRoutine = SAI_Transmit_IT32Bit;
    }


    SAI_FillFifo(hsai);


    ((hsai)->Instance->IMR |= (SAI_InterruptFlag(hsai, SAI_MODE_IT)));


    if((hsai->Instance->CR1 & (0x1U << (16U))) == RESET)
    {

      ((hsai)->Instance->CR1 |= (0x1U << (16U)));
    }

    do{ (hsai)->Lock = HAL_UNLOCKED; }while (0);

    return HAL_OK;
  }
  else
  {
    return HAL_BUSY;
  }
}
# 903 "../Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_sai.c"
HAL_StatusTypeDef HAL_SAI_Receive_IT(SAI_HandleTypeDef *hsai, uint8_t *pData, uint16_t Size)
{
  if((pData == 0) || (Size == 0))
  {
    return HAL_ERROR;
  }

  if(hsai->State == HAL_SAI_STATE_READY)
  {

    do{ if((hsai)->Lock == HAL_LOCKED) { return HAL_BUSY; } else { (hsai)->Lock = HAL_LOCKED; } }while (0);

    hsai->pBuffPtr = pData;
    hsai->XferSize = Size;
    hsai->XferCount = Size;
    hsai->ErrorCode = ((uint32_t)0x00000000U);
    hsai->State = HAL_SAI_STATE_BUSY_RX;

    if((hsai->Init.DataSize == ((uint32_t)(0x2U << (5U)))) && (hsai->Init.CompandingMode == ((uint32_t)0x00000000U)))
    {
      hsai->InterruptServiceRoutine = SAI_Receive_IT8Bit;
    }
    else if(hsai->Init.DataSize <= ((uint32_t)(0x4U << (5U))))
    {
      hsai->InterruptServiceRoutine = SAI_Receive_IT16Bit;
    }
    else
    {
      hsai->InterruptServiceRoutine = SAI_Receive_IT32Bit;
    }


    ((hsai)->Instance->IMR |= (SAI_InterruptFlag(hsai, SAI_MODE_IT)));


    if((hsai->Instance->CR1 & (0x1U << (16U))) == RESET)
    {

      ((hsai)->Instance->CR1 |= (0x1U << (16U)));
    }


    do{ (hsai)->Lock = HAL_UNLOCKED; }while (0);

    return HAL_OK;
  }
  else
  {
    return HAL_BUSY;
  }
}







HAL_StatusTypeDef HAL_SAI_DMAPause(SAI_HandleTypeDef *hsai)
{

  do{ if((hsai)->Lock == HAL_LOCKED) { return HAL_BUSY; } else { (hsai)->Lock = HAL_LOCKED; } }while (0);


  hsai->Instance->CR1 &= ~(0x1U << (17U));


  do{ (hsai)->Lock = HAL_UNLOCKED; }while (0);

  return HAL_OK;
}







HAL_StatusTypeDef HAL_SAI_DMAResume(SAI_HandleTypeDef *hsai)
{

  do{ if((hsai)->Lock == HAL_LOCKED) { return HAL_BUSY; } else { (hsai)->Lock = HAL_LOCKED; } }while (0);


  hsai->Instance->CR1 |= (0x1U << (17U));


  if ((hsai->Instance->CR1 & (0x1U << (16U))) == RESET)
  {

    ((hsai)->Instance->CR1 |= (0x1U << (16U)));
  }


  do{ (hsai)->Lock = HAL_UNLOCKED; }while (0);

  return HAL_OK;
}







HAL_StatusTypeDef HAL_SAI_DMAStop(SAI_HandleTypeDef *hsai)
{

  do{ if((hsai)->Lock == HAL_LOCKED) { return HAL_BUSY; } else { (hsai)->Lock = HAL_LOCKED; } }while (0);


  hsai->Instance->CR1 &= ~(0x1U << (17U));


  if(hsai->hdmatx != 0)
  {
    if(HAL_DMA_Abort(hsai->hdmatx) != HAL_OK)
    {
      return HAL_ERROR;
    }
  }

  if(hsai->hdmarx != 0)
  {
    if(HAL_DMA_Abort(hsai->hdmarx) != HAL_OK)
    {
      return HAL_ERROR;
    }
  }


  SAI_Disable(hsai);


  ((hsai->Instance->CR2) |= ((0x1U << (3U))));

  hsai->State = HAL_SAI_STATE_READY;


  do{ (hsai)->Lock = HAL_UNLOCKED; }while (0);

  return HAL_OK;
}







HAL_StatusTypeDef HAL_SAI_Abort(SAI_HandleTypeDef *hsai)
{

  do{ if((hsai)->Lock == HAL_LOCKED) { return HAL_BUSY; } else { (hsai)->Lock = HAL_LOCKED; } }while (0);


  if((hsai->Instance->CR1 & (0x1U << (17U))) == (0x1U << (17U)))
  {

    hsai->Instance->CR1 &= ~(0x1U << (17U));


    if(hsai->hdmatx != 0)
    {
      if(HAL_DMA_Abort(hsai->hdmatx) != HAL_OK)
      {
        return HAL_ERROR;
      }
    }

    if(hsai->hdmarx != 0)
    {
      if(HAL_DMA_Abort(hsai->hdmarx) != HAL_OK)
      {
        return HAL_ERROR;
      }
    }
  }

  hsai->Instance->IMR = 0;
  hsai->Instance->CLRFR = 0xFFFFFFFFU;


  SAI_Disable(hsai);


  ((hsai->Instance->CR2) |= ((0x1U << (3U))));

  hsai->State = HAL_SAI_STATE_READY;


  do{ (hsai)->Lock = HAL_UNLOCKED; }while (0);

  return HAL_OK;
}
# 1107 "../Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_sai.c"
HAL_StatusTypeDef HAL_SAI_Transmit_DMA(SAI_HandleTypeDef *hsai, uint8_t *pData, uint16_t Size)
{
  if((pData == 0) || (Size == 0))
  {
    return HAL_ERROR;
  }

  if(hsai->State == HAL_SAI_STATE_READY)
  {

    do{ if((hsai)->Lock == HAL_LOCKED) { return HAL_BUSY; } else { (hsai)->Lock = HAL_LOCKED; } }while (0);

    hsai->pBuffPtr = pData;
    hsai->XferSize = Size;
    hsai->XferCount = Size;
    hsai->ErrorCode = ((uint32_t)0x00000000U);
    hsai->State = HAL_SAI_STATE_BUSY_TX;


    hsai->hdmatx->XferHalfCpltCallback = SAI_DMATxHalfCplt;


    hsai->hdmatx->XferCpltCallback = SAI_DMATxCplt;


    hsai->hdmatx->XferErrorCallback = SAI_DMAError;


    hsai->hdmatx->XferAbortCallback = 0;


    if(HAL_DMA_Start_IT(hsai->hdmatx, (uint32_t)hsai->pBuffPtr, (uint32_t)&hsai->Instance->DR, hsai->XferSize) != HAL_OK)
    {
      do{ (hsai)->Lock = HAL_UNLOCKED; }while (0);
      return HAL_ERROR;
    }


    if((hsai->Instance->CR1 & (0x1U << (16U))) == RESET)
    {

      ((hsai)->Instance->CR1 |= (0x1U << (16U)));
    }


    ((hsai)->Instance->IMR |= (SAI_InterruptFlag(hsai, SAI_MODE_DMA)));


    hsai->Instance->CR1 |= (0x1U << (17U));


    do{ (hsai)->Lock = HAL_UNLOCKED; }while (0);

    return HAL_OK;
  }
  else
  {
    return HAL_BUSY;
  }
}
# 1176 "../Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_sai.c"
HAL_StatusTypeDef HAL_SAI_Receive_DMA(SAI_HandleTypeDef *hsai, uint8_t *pData, uint16_t Size)
{

  if((pData == 0) || (Size == 0))
  {
    return HAL_ERROR;
  }

  if(hsai->State == HAL_SAI_STATE_READY)
  {

    do{ if((hsai)->Lock == HAL_LOCKED) { return HAL_BUSY; } else { (hsai)->Lock = HAL_LOCKED; } }while (0);

    hsai->pBuffPtr = pData;
    hsai->XferSize = Size;
    hsai->XferCount = Size;
    hsai->ErrorCode = ((uint32_t)0x00000000U);
    hsai->State = HAL_SAI_STATE_BUSY_RX;


    hsai->hdmarx->XferHalfCpltCallback = SAI_DMARxHalfCplt;


    hsai->hdmarx->XferCpltCallback = SAI_DMARxCplt;


    hsai->hdmarx->XferErrorCallback = SAI_DMAError;


    hsai->hdmarx->XferAbortCallback = 0;


    if(HAL_DMA_Start_IT(hsai->hdmarx, (uint32_t)&hsai->Instance->DR, (uint32_t)hsai->pBuffPtr, hsai->XferSize) != HAL_OK)
    {
      do{ (hsai)->Lock = HAL_UNLOCKED; }while (0);
      return HAL_ERROR;
    }


    if((hsai->Instance->CR1 & (0x1U << (16U))) == RESET)
    {

      ((hsai)->Instance->CR1 |= (0x1U << (16U)));
    }


    ((hsai)->Instance->IMR |= (SAI_InterruptFlag(hsai, SAI_MODE_DMA)));


    hsai->Instance->CR1 |= (0x1U << (17U));


    do{ (hsai)->Lock = HAL_UNLOCKED; }while (0);

    return HAL_OK;
  }
  else
  {
    return HAL_BUSY;
  }
}
# 1245 "../Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_sai.c"
HAL_StatusTypeDef HAL_SAI_EnableTxMuteMode(SAI_HandleTypeDef *hsai, uint16_t val)
{
  ((void)0U);

  if(hsai->State != HAL_SAI_STATE_RESET)
  {
    ((hsai->Instance->CR2) &= ~((0x1U << (6U)) | (0x1U << (5U))));
    ((hsai->Instance->CR2) |= ((0x1U << (5U)) | val));
    return HAL_OK;
  }
  return HAL_ERROR;
}







HAL_StatusTypeDef HAL_SAI_DisableTxMuteMode(SAI_HandleTypeDef *hsai)
{
  if(hsai->State != HAL_SAI_STATE_RESET)
  {
    ((hsai->Instance->CR2) &= ~((0x1U << (6U)) | (0x1U << (5U))));
    return HAL_OK;
  }
  return HAL_ERROR;
}
# 1282 "../Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_sai.c"
HAL_StatusTypeDef HAL_SAI_EnableRxMuteMode(SAI_HandleTypeDef *hsai, SAIcallback callback, uint16_t counter)
{
  ((void)0U);

  if(hsai->State != HAL_SAI_STATE_RESET)
  {

    ((hsai->Instance->CR2) &= ~((0x3FU << (7U))));
    ((hsai->Instance->CR2) |= ((uint32_t)((uint32_t)counter << (7U))));
    hsai->mutecallback = callback;

    ((hsai)->Instance->IMR |= (((uint32_t)(0x1U << (1U)))));
    return HAL_OK;
  }
  return HAL_ERROR;
}







HAL_StatusTypeDef HAL_SAI_DisableRxMuteMode(SAI_HandleTypeDef *hsai)
{
  if(hsai->State != HAL_SAI_STATE_RESET)
  {

    hsai->mutecallback = (SAIcallback)0;

    ((hsai)->Instance->IMR &= (~(((uint32_t)(0x1U << (1U))))));
    return HAL_OK;
  }
  return HAL_ERROR;
}







void HAL_SAI_IRQHandler(SAI_HandleTypeDef *hsai)
{
  if(hsai->State != HAL_SAI_STATE_RESET)
  {
    uint32_t itflags = hsai->Instance->SR;
    uint32_t itsources = hsai->Instance->IMR;
    uint32_t cr1config = hsai->Instance->CR1;
    uint32_t tmperror;


    if(((itflags & (0x1U << (3U))) == (0x1U << (3U))) && ((itsources & ((uint32_t)(0x1U << (3U)))) == ((uint32_t)(0x1U << (3U)))))
    {
      hsai->InterruptServiceRoutine(hsai);
    }

    else if(((itflags & ((uint32_t)(0x1U << (0U)))) == ((uint32_t)(0x1U << (0U)))) && ((itsources & ((uint32_t)(0x1U << (0U)))) == ((uint32_t)(0x1U << (0U)))))
    {

      ((hsai)->Instance->CLRFR = (((uint32_t)(0x1U << (0U)))));

      tmperror = ((hsai->State == HAL_SAI_STATE_BUSY_RX) ? ((uint32_t)0x00000001U) : ((uint32_t)0x00000002U));

      hsai->ErrorCode |= tmperror;

      HAL_SAI_ErrorCallback(hsai);
    }

    else if(((itflags & ((uint32_t)(0x1U << (1U)))) == ((uint32_t)(0x1U << (1U)))) && ((itsources & ((uint32_t)(0x1U << (1U)))) == ((uint32_t)(0x1U << (1U)))))
    {

      ((hsai)->Instance->CLRFR = (((uint32_t)(0x1U << (1U)))));

      if(hsai->mutecallback != (SAIcallback)0)
      {

        hsai->mutecallback();
      }
    }

    else if(((itflags & ((uint32_t)(0x1U << (5U)))) == ((uint32_t)(0x1U << (5U)))) && ((itsources & ((uint32_t)(0x1U << (5U)))) == ((uint32_t)(0x1U << (5U)))))
    {

      hsai->ErrorCode |= ((uint32_t)0x00000004U);

      if((cr1config & (0x1U << (17U))) == (0x1U << (17U)))
      {

        if(hsai->hdmatx != 0)
        {

          hsai->hdmatx->XferAbortCallback = SAI_DMAAbort;


          HAL_DMA_Abort_IT(hsai->hdmatx);
        }
        else if(hsai->hdmarx != 0)
        {

          hsai->hdmarx->XferAbortCallback = SAI_DMAAbort;

          HAL_DMA_Abort_IT(hsai->hdmarx);
        }
      }
      else
      {

        HAL_SAI_Abort(hsai);


        HAL_SAI_ErrorCallback(hsai);
      }
    }

    else if(((itflags & ((uint32_t)(0x1U << (6U)))) == ((uint32_t)(0x1U << (6U)))) && ((itsources & ((uint32_t)(0x1U << (6U)))) == ((uint32_t)(0x1U << (6U)))))
    {

      hsai->ErrorCode |= ((uint32_t)0x00000008U);


      if((cr1config & (0x1U << (17U))) == (0x1U << (17U)))
      {

        if(hsai->hdmatx != 0)
        {

          hsai->hdmatx->XferAbortCallback = SAI_DMAAbort;

          HAL_DMA_Abort_IT(hsai->hdmatx);
        }
        else if(hsai->hdmarx != 0)
        {

          hsai->hdmarx->XferAbortCallback = SAI_DMAAbort;

          HAL_DMA_Abort_IT(hsai->hdmarx);
        }
      }
      else
      {

        HAL_SAI_Abort(hsai);


        HAL_SAI_ErrorCallback(hsai);
      }
    }

    else if(((itflags & ((uint32_t)(0x1U << (2U)))) == ((uint32_t)(0x1U << (2U)))) && ((itsources & ((uint32_t)(0x1U << (2U)))) == ((uint32_t)(0x1U << (2U)))))
    {

      hsai->ErrorCode |= ((uint32_t)0x00000020U);


      if(hsai->hdmatx != 0)
      {

        hsai->hdmatx->XferAbortCallback = SAI_DMAAbort;

        HAL_DMA_Abort_IT(hsai->hdmatx);
      }
      else if(hsai->hdmarx != 0)
      {

        hsai->hdmarx->XferAbortCallback = SAI_DMAAbort;

        HAL_DMA_Abort_IT(hsai->hdmarx);
      }
      else
      {


        hsai->Instance->IMR = 0U;
        hsai->Instance->CLRFR = 0xFFFFFFFFU;

        hsai->State = HAL_SAI_STATE_READY;


        hsai->XferCount = 0U;


        HAL_SAI_ErrorCallback(hsai);
      }
    }

    else if(((itflags & ((uint32_t)(0x1U << (4U)))) == ((uint32_t)(0x1U << (4U)))) && ((itsources & ((uint32_t)(0x1U << (4U)))) == ((uint32_t)(0x1U << (4U)))))
    {

      ((hsai)->Instance->CLRFR = (((uint32_t)(0x1U << (4U)))));

      hsai->ErrorCode |= ((uint32_t)0x00000010U);

      HAL_SAI_ErrorCallback(hsai);
    }
    else
    {

    }
  }
}







__attribute__((weak)) void HAL_SAI_TxCpltCallback(SAI_HandleTypeDef *hsai)
{

  ((void)(hsai));




}







 __attribute__((weak)) void HAL_SAI_TxHalfCpltCallback(SAI_HandleTypeDef *hsai)
{

  ((void)(hsai));




}







__attribute__((weak)) void HAL_SAI_RxCpltCallback(SAI_HandleTypeDef *hsai)
{

  ((void)(hsai));




}







__attribute__((weak)) void HAL_SAI_RxHalfCpltCallback(SAI_HandleTypeDef *hsai)
{

  ((void)(hsai));




}







__attribute__((weak)) void HAL_SAI_ErrorCallback(SAI_HandleTypeDef *hsai)
{

  ((void)(hsai));




}
# 1590 "../Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_sai.c"
HAL_SAI_StateTypeDef HAL_SAI_GetState(SAI_HandleTypeDef *hsai)
{
  return hsai->State;
}







uint32_t HAL_SAI_GetError(SAI_HandleTypeDef *hsai)
{
  return hsai->ErrorCode;
}
# 1630 "../Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_sai.c"
static HAL_StatusTypeDef SAI_InitI2S(SAI_HandleTypeDef *hsai, uint32_t protocol, uint32_t datasize, uint32_t nbslot)
{
  hsai->Init.Protocol = ((uint32_t)0x00000000U);
  hsai->Init.FirstBit = ((uint32_t)0x00000000U);

  if((hsai->Init.AudioMode == ((uint32_t)0x00000000U)) || (hsai->Init.AudioMode == ((uint32_t)(0x2U << (0U)))))
  {
    hsai->Init.ClockStrobing = 0;
  }
  else
  {
    hsai->Init.ClockStrobing = 1;
  }
  hsai->FrameInit.FSDefinition = ((uint32_t)(0x1U << (16U)));
  hsai->SlotInit.SlotActive = ((uint32_t)0x0000FFFFU);
  hsai->SlotInit.FirstBitOffset = 0;
  hsai->SlotInit.SlotNumber = nbslot;


  if((nbslot & 0x1) != 0 )
  {
    return HAL_ERROR;
  }

  switch(protocol)
  {
  case 0 :
    hsai->FrameInit.FSPolarity = ((uint32_t)0x00000000U);
    hsai->FrameInit.FSOffset = ((uint32_t)(0x1U << (18U)));
    break;
  case 1 :
  case 2 :
    hsai->FrameInit.FSPolarity = ((uint32_t)(0x1U << (17U)));
    hsai->FrameInit.FSOffset = ((uint32_t)0x00000000U);
    break;
  default :
    return HAL_ERROR;
  }


  switch(datasize)
  {
  case 0:
    hsai->Init.DataSize = ((uint32_t)(0x4U << (5U)));
    hsai->FrameInit.FrameLength = 32*(nbslot/2);
    hsai->FrameInit.ActiveFrameLength = 16*(nbslot/2);
    hsai->SlotInit.SlotSize = ((uint32_t)(0x1U << (6U)));
    break;
  case 1 :
    hsai->Init.DataSize = ((uint32_t)(0x4U << (5U)));
    hsai->FrameInit.FrameLength = 64*(nbslot/2);
    hsai->FrameInit.ActiveFrameLength = 32*(nbslot/2);
    hsai->SlotInit.SlotSize = ((uint32_t)(0x2U << (6U)));
    break;
  case 2:
    hsai->Init.DataSize = ((uint32_t)((0x4U << (5U)) | (0x2U << (5U))));
    hsai->FrameInit.FrameLength = 64*(nbslot/2);
    hsai->FrameInit.ActiveFrameLength = 32*(nbslot/2);
    hsai->SlotInit.SlotSize = ((uint32_t)(0x2U << (6U)));
    break;
  case 3:
    hsai->Init.DataSize = ((uint32_t)((0x4U << (5U)) | (0x2U << (5U)) | (0x1U << (5U))));
    hsai->FrameInit.FrameLength = 64*(nbslot/2);
    hsai->FrameInit.ActiveFrameLength = 32*(nbslot/2);
    hsai->SlotInit.SlotSize = ((uint32_t)(0x2U << (6U)));
    break;
  default :
    return HAL_ERROR;
  }
  if(protocol == 2)
  {
    if (datasize == 1)
    {
      hsai->SlotInit.FirstBitOffset = 16;
    }
    if (datasize == 2)
    {
      hsai->SlotInit.FirstBitOffset = 8;
    }
  }
  return HAL_OK;
}
# 1723 "../Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_sai.c"
static HAL_StatusTypeDef SAI_InitPCM(SAI_HandleTypeDef *hsai, uint32_t protocol, uint32_t datasize, uint32_t nbslot)
{
  hsai->Init.Protocol = ((uint32_t)0x00000000U);
  hsai->Init.FirstBit = ((uint32_t)0x00000000U);

  if((hsai->Init.AudioMode == ((uint32_t)0x00000000U)) || (hsai->Init.AudioMode == ((uint32_t)(0x2U << (0U)))))
  {
    hsai->Init.ClockStrobing = 1;
  }
  else
  {
    hsai->Init.ClockStrobing = 0;
  }
  hsai->FrameInit.FSDefinition = ((uint32_t)0x00000000U);
  hsai->FrameInit.FSPolarity = ((uint32_t)(0x1U << (17U)));
  hsai->FrameInit.FSOffset = ((uint32_t)(0x1U << (18U)));
  hsai->SlotInit.FirstBitOffset = 0;
  hsai->SlotInit.SlotNumber = nbslot;
  hsai->SlotInit.SlotActive = ((uint32_t)0x0000FFFFU);

  switch(protocol)
  {
  case 4 :
    hsai->FrameInit.ActiveFrameLength = 1;
    break;
  case 3 :
    hsai->FrameInit.ActiveFrameLength = 13;
    break;
  default :
    return HAL_ERROR;
  }

  switch(datasize)
  {
  case 0:
    hsai->Init.DataSize = ((uint32_t)(0x4U << (5U)));
    hsai->FrameInit.FrameLength = 16 * nbslot;
    hsai->SlotInit.SlotSize = ((uint32_t)(0x1U << (6U)));
    break;
  case 1 :
    hsai->Init.DataSize = ((uint32_t)(0x4U << (5U)));
    hsai->FrameInit.FrameLength = 32 * nbslot;
    hsai->SlotInit.SlotSize = ((uint32_t)(0x2U << (6U)));
    break;
  case 2 :
    hsai->Init.DataSize = ((uint32_t)((0x4U << (5U)) | (0x2U << (5U))));
    hsai->FrameInit.FrameLength = 32 * nbslot;
    hsai->SlotInit.SlotSize = ((uint32_t)(0x2U << (6U)));
    break;
  case 3:
    hsai->Init.DataSize = ((uint32_t)((0x4U << (5U)) | (0x2U << (5U)) | (0x1U << (5U))));
    hsai->FrameInit.FrameLength = 32 * nbslot;
    hsai->SlotInit.SlotSize = ((uint32_t)(0x2U << (6U)));
    break;
  default :
    return HAL_ERROR;
  }

  return HAL_OK;
}







static void SAI_FillFifo(SAI_HandleTypeDef *hsai)
{

  while(((hsai->Instance->SR & (0x7U << (16U))) != ((uint32_t)0x00050000U)) && (hsai->XferCount > 0))
  {
    if((hsai->Init.DataSize == ((uint32_t)(0x2U << (5U)))) && (hsai->Init.CompandingMode == ((uint32_t)0x00000000U)))
    {
      hsai->Instance->DR = (*hsai->pBuffPtr++);
    }
    else if(hsai->Init.DataSize <= ((uint32_t)(0x4U << (5U))))
    {
      hsai->Instance->DR = *((uint32_t *)hsai->pBuffPtr);
      hsai->pBuffPtr+= 2;
    }
    else
    {
      hsai->Instance->DR = *((uint32_t *)hsai->pBuffPtr);
      hsai->pBuffPtr+= 4;
    }
    hsai->XferCount--;
  }
}
# 1820 "../Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_sai.c"
static uint32_t SAI_InterruptFlag(SAI_HandleTypeDef *hsai, uint32_t mode)
{
  uint32_t tmpIT = ((uint32_t)(0x1U << (0U)));

  if(mode == SAI_MODE_IT)
  {
    tmpIT|= ((uint32_t)(0x1U << (3U)));
  }

  if((hsai->Init.Protocol == ((uint32_t)(0x2U << (2U)))) &&
    ((hsai->Init.AudioMode == ((uint32_t)((0x2U << (0U)) | (0x1U << (0U))))) || (hsai->Init.AudioMode == ((uint32_t)(0x1U << (0U))))))
  {
    tmpIT|= ((uint32_t)(0x1U << (4U)));
  }

  if((hsai->Init.AudioMode == ((uint32_t)((0x2U << (0U)) | (0x1U << (0U))))) || (hsai->Init.AudioMode == ((uint32_t)(0x2U << (0U)))))
  {
    tmpIT|= ((uint32_t)(0x1U << (5U))) | ((uint32_t)(0x1U << (6U)));
  }
  else
  {

    tmpIT|= ((uint32_t)(0x1U << (2U)));
  }
  return tmpIT;
}







static HAL_StatusTypeDef SAI_Disable(SAI_HandleTypeDef *hsai)
{
  register uint32_t count = 4 * (SystemCoreClock /7/1000);
  HAL_StatusTypeDef status = HAL_OK;


  ((hsai)->Instance->CR1 &= ~(0x1U << (16U)));

  do
  {

    if (count-- == 0)
    {

      hsai->ErrorCode |= ((uint32_t)0x00000040U);
      status = HAL_TIMEOUT;
      break;
    }
  } while((hsai->Instance->CR1 & (0x1U << (16U))) != RESET);

  return status;
}







static void SAI_Transmit_IT8Bit(SAI_HandleTypeDef *hsai)
{
  if(hsai->XferCount == 0)
  {


    ((hsai)->Instance->IMR &= (~(SAI_InterruptFlag(hsai, SAI_MODE_IT))));
    hsai->State = HAL_SAI_STATE_READY;
    HAL_SAI_TxCpltCallback(hsai);
  }
  else
  {

    hsai->Instance->DR = (*hsai->pBuffPtr++);
    hsai->XferCount--;
  }
}







static void SAI_Transmit_IT16Bit(SAI_HandleTypeDef *hsai)
{
  if(hsai->XferCount == 0)
  {


    ((hsai)->Instance->IMR &= (~(SAI_InterruptFlag(hsai, SAI_MODE_IT))));
    hsai->State = HAL_SAI_STATE_READY;
    HAL_SAI_TxCpltCallback(hsai);
  }
  else
  {

    hsai->Instance->DR = *(uint16_t *)hsai->pBuffPtr;
    hsai->pBuffPtr+=2;
    hsai->XferCount--;
  }
}







static void SAI_Transmit_IT32Bit(SAI_HandleTypeDef *hsai)
{
  if(hsai->XferCount == 0)
  {


    ((hsai)->Instance->IMR &= (~(SAI_InterruptFlag(hsai, SAI_MODE_IT))));
    hsai->State = HAL_SAI_STATE_READY;
    HAL_SAI_TxCpltCallback(hsai);
  }
  else
  {

    hsai->Instance->DR = *(uint32_t *)hsai->pBuffPtr;
    hsai->pBuffPtr+=4;
    hsai->XferCount--;
  }
}







static void SAI_Receive_IT8Bit(SAI_HandleTypeDef *hsai)
{

  (*hsai->pBuffPtr++) = hsai->Instance->DR;
  hsai->XferCount--;


  if(hsai->XferCount == 0)
  {

    ((hsai)->Instance->IMR &= (~(SAI_InterruptFlag(hsai, SAI_MODE_IT))));


    ((hsai)->Instance->CLRFR = (((uint32_t)(0x1U << (0U)))));

    hsai->State = HAL_SAI_STATE_READY;
    HAL_SAI_RxCpltCallback(hsai);
  }
}







static void SAI_Receive_IT16Bit(SAI_HandleTypeDef *hsai)
{

  *(uint16_t*)hsai->pBuffPtr = hsai->Instance->DR;
  hsai->pBuffPtr+=2;
  hsai->XferCount--;


  if(hsai->XferCount == 0)
  {

    ((hsai)->Instance->IMR &= (~(SAI_InterruptFlag(hsai, SAI_MODE_IT))));


    ((hsai)->Instance->CLRFR = (((uint32_t)(0x1U << (0U)))));

    hsai->State = HAL_SAI_STATE_READY;
    HAL_SAI_RxCpltCallback(hsai);
  }
}






static void SAI_Receive_IT32Bit(SAI_HandleTypeDef *hsai)
{

  *(uint32_t*)hsai->pBuffPtr = hsai->Instance->DR;
  hsai->pBuffPtr+=4;
  hsai->XferCount--;


  if(hsai->XferCount == 0)
  {

    ((hsai)->Instance->IMR &= (~(SAI_InterruptFlag(hsai, SAI_MODE_IT))));


    ((hsai)->Instance->CLRFR = (((uint32_t)(0x1U << (0U)))));

    hsai->State = HAL_SAI_STATE_READY;
    HAL_SAI_RxCpltCallback(hsai);
  }
}







static void SAI_DMATxCplt(DMA_HandleTypeDef *hdma)
{
  SAI_HandleTypeDef* hsai = (SAI_HandleTypeDef*)((DMA_HandleTypeDef* )hdma)->Parent;

  if((hdma->Instance->CR & (0x1U << (8U))) == 0)
  {
    hsai->XferCount = 0;


    hsai->Instance->CR1 &= (uint32_t)(~(0x1U << (17U)));


    ((hsai)->Instance->IMR &= (~(SAI_InterruptFlag(hsai, SAI_MODE_DMA))));

    hsai->State= HAL_SAI_STATE_READY;
  }
  HAL_SAI_TxCpltCallback(hsai);
}







static void SAI_DMATxHalfCplt(DMA_HandleTypeDef *hdma)
{
  SAI_HandleTypeDef* hsai = (SAI_HandleTypeDef*)((DMA_HandleTypeDef*)hdma)->Parent;

  HAL_SAI_TxHalfCpltCallback(hsai);
}







static void SAI_DMARxCplt(DMA_HandleTypeDef *hdma)
{
  SAI_HandleTypeDef* hsai = ( SAI_HandleTypeDef* )((DMA_HandleTypeDef* )hdma)->Parent;
  if((hdma->Instance->CR & (0x1U << (8U))) == 0)
  {

    hsai->Instance->CR1 &= (uint32_t)(~(0x1U << (17U)));
    hsai->XferCount = 0;


    ((hsai)->Instance->IMR &= (~(SAI_InterruptFlag(hsai, SAI_MODE_DMA))));

    hsai->State = HAL_SAI_STATE_READY;
  }
  HAL_SAI_RxCpltCallback(hsai);
}







static void SAI_DMARxHalfCplt(DMA_HandleTypeDef *hdma)
{
  SAI_HandleTypeDef* hsai = (SAI_HandleTypeDef*)((DMA_HandleTypeDef*)hdma)->Parent;

  HAL_SAI_RxHalfCpltCallback(hsai);
}






static void SAI_DMAError(DMA_HandleTypeDef *hdma)
{
  SAI_HandleTypeDef* hsai = ( SAI_HandleTypeDef* )((DMA_HandleTypeDef* )hdma)->Parent;


  hsai->ErrorCode |= ((uint32_t)0x00000080U);

  if((hsai->hdmatx->ErrorCode == ((uint32_t)0x00000001U)) || (hsai->hdmarx->ErrorCode == ((uint32_t)0x00000001U)))
  {

    hsai->Instance->CR1 &= ~(0x1U << (17U));


    SAI_Disable(hsai);


    hsai->State = HAL_SAI_STATE_READY;


    hsai->XferCount = 0U;
  }

  HAL_SAI_ErrorCallback(hsai);
}







static void SAI_DMAAbort(DMA_HandleTypeDef *hdma)
{
  SAI_HandleTypeDef* hsai = ( SAI_HandleTypeDef* )((DMA_HandleTypeDef* )hdma)->Parent;


  hsai->Instance->CR1 &= ~(0x1U << (17U));


  hsai->Instance->IMR = 0U;
  hsai->Instance->CLRFR = 0xFFFFFFFFU;

  if(hsai->ErrorCode != ((uint32_t)0x00000020U))
  {

    SAI_Disable(hsai);


    ((hsai->Instance->CR2) |= ((0x1U << (3U))));
  }

  hsai->State = HAL_SAI_STATE_READY;


  hsai->XferCount = 0U;


  HAL_SAI_ErrorCallback(hsai);
}
