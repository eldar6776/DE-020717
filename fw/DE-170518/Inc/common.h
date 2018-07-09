/**
 ******************************************************************************
 * File Name          : common.h
 * Date               : 10.3.2018
 * Description        : usefull function set and program shared constants
 ******************************************************************************
 */


/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __COMMON_H
#define __COMMON_H				211		// version


/* Includes ------------------------------------------------------------------*/
#include "stm32f7xx.h"


/* Exported types ------------------------------------------------------------*/
/* Exported constants --------------------------------------------------------*/
/* Exported macro ------------------------------------------------------------*/
#define IS_CAP_LETTER(c)    	(((c) >= 'A') && ((c) <= 'F'))
#define IS_LC_LETTER(c)     	(((c) >= 'a') && ((c) <= 'f'))
#define IS_09(c)            	(((c) >= '0') && ((c) <= '9'))
#define ISVALIDHEX(c)       	(IS_CAP_LETTER(c) || IS_LC_LETTER(c) || IS_09(c))
#define ISVALIDDEC(c)     		IS_09(c)
#define CONVERTDEC(c)       	(c - '0')
	
#define CONVERTHEX_ALPHA(c) 	(IS_CAP_LETTER(c) ? ((c) - 'A'+10) : ((c) - 'a'+10))
#define CONVERTHEX(c)       	(IS_09(c) ? ((c) - '0') : CONVERTHEX_ALPHA(c))

#define COUNTOF(__BUFFER__)   	(sizeof(__BUFFER__) / sizeof(*(__BUFFER__)))
#define ARRAY_LEN(a) 			(sizeof(a)/sizeof(a[0])) 
	

/* Exported functions ------------------------------------------------------- */
void Delay(__IO uint32_t nCount);
int GetLenght(char * p);
uint8_t Bcd2Dec(uint8_t bcd);
uint8_t Dec2Bcd(uint8_t dec);
uint8_t CalcCRC(uint8_t *buff, uint8_t size);
void Int2Str(uint8_t *p_str, uint32_t intnum);
void ClearBuffer(uint8_t *buffer, uint32_t size);
void ClearBuffer16(uint16_t * buffer, uint32_t size);
uint32_t Str2Int(uint8_t *inputstr, uint32_t *intnum);
uint16_t CalcChecksum(const uint8_t *p_data, uint32_t size);
void Str2Hex(uint8_t *p_str, uint16_t lenght, uint8_t *p_hex);
void Hex2Str(uint8_t *p_hex, uint16_t lenght, uint8_t *p_str);
void Int2StrSized(uint8_t *p_str, uint32_t intnum, uint8_t size);
void CharToBin(unsigned char c, char *out);


#endif  /* __COMMON_H */

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
