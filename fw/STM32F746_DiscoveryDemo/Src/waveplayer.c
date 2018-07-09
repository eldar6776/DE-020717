/**
  ******************************************************************************
  *
  ******************************************************************************
  *
  ******************************************************************************
  */

/* Includes ------------------------------------------------------------------*/
#include "waveplayer.h"
#include "stm32746g_audio.h"
#include "Resource.h"


/* Private define ------------------------------------------------------------*/
/* Private macro -------------------------------------------------------------*/
/* Private typedef -----------------------------------------------------------*/
AUDIO_PLAYBACK_StateTypeDef AudioState;


/* Private variables ---------------------------------------------------------*/
AUDIO_OUT_BufferTypeDef  BufferCtl; //__attribute__ ((section(".sdram"))); // put in sdram
static __IO uint32_t uwVolume = 127;
WAVE_FormatTypeDef WaveFile;


/* Private function prototypes -----------------------------------------------*/
static AUDIO_ErrorTypeDef GetFileInfo(WAVE_FormatTypeDef *info);
static uint8_t PlayerInit(uint32_t AudioFreq);


/* Private functions ---------------------------------------------------------*/
/* Program code  -------------------------------------------------------------*/
AUDIO_ErrorTypeDef AUDIO_PLAYER_Init(void)
{
	BSP_AUDIO_OUT_Init(OUTPUT_DEVICE_SPEAKER, uwVolume, I2S_AUDIOFREQ_48K);
	BSP_AUDIO_OUT_SetAudioFrameSlot(CODEC_AUDIOFRAME_SLOT_13);
	return AUDIO_ERROR_NONE;
}


AUDIO_ErrorTypeDef AUDIO_PLAYER_Play(const uint8_t* audio_file)
{
	uint32_t buffbytes = 0;
	WaveFile.file_name = audio_file;
	GetFileInfo(&WaveFile);
	PlayerInit(WaveFile.SampleRate); 
	BufferCtl.state = BUFFER_OFFSET_NONE;
	AudioState = AUDIO_STATE_PLAY;
	BufferCtl.fptr = 44;
	
	while(buffbytes < AUDIO_OUT_BUFFER_SIZE)
	{
		BufferCtl.buff[buffbytes++] = WaveFile.file_name[BufferCtl.fptr++];
	}
	
	BSP_AUDIO_OUT_Play((uint16_t*)&BufferCtl.buff[0], AUDIO_OUT_BUFFER_SIZE);	
	return AUDIO_ERROR_NONE;
}


AUDIO_ErrorTypeDef AUDIO_PLAYER_Stop(void)
{
	AudioState = AUDIO_STATE_STOP;
	BSP_AUDIO_OUT_Stop(CODEC_PDWN_SW);
	return AUDIO_ERROR_NONE;
}


void BSP_AUDIO_OUT_TransferComplete_CallBack(void)
{
	uint32_t buffbyte = 0;
	
	if(AudioState == AUDIO_STATE_PLAY)
	{
		BSP_AUDIO_OUT_ChangeBuffer((uint16_t*)&BufferCtl.buff[0], (AUDIO_OUT_BUFFER_SIZE / 2));
		
		if(BufferCtl.fptr > (WaveFile.SubChunk2Size - (AUDIO_OUT_BUFFER_SIZE / 2)))
		{
			AudioState = AUDIO_STATE_STOP;
		}
		else
		{
			while(buffbyte < (AUDIO_OUT_BUFFER_SIZE / 2))
			{
				BufferCtl.buff[(AUDIO_OUT_BUFFER_SIZE / 2) + buffbyte++] = WaveFile.file_name[BufferCtl.fptr++];
			}
		}
	}
	else if(AudioState == AUDIO_STATE_STOP)
	{
		AUDIO_PLAYER_Stop();
	}
}


void BSP_AUDIO_OUT_HalfTransfer_CallBack(void)
{ 
	uint32_t buffbyte = 0;
	
	if(AudioState == AUDIO_STATE_PLAY)
	{
		BSP_AUDIO_OUT_ChangeBuffer((uint16_t*)&BufferCtl.buff[AUDIO_OUT_BUFFER_SIZE / 2], (AUDIO_OUT_BUFFER_SIZE / 2));
		
		if(BufferCtl.fptr > (WaveFile.SubChunk2Size - (AUDIO_OUT_BUFFER_SIZE / 2)))
		{
			AudioState = AUDIO_STATE_STOP;
		}
		else
		{
			while(buffbyte < (AUDIO_OUT_BUFFER_SIZE / 2))
			{
				BufferCtl.buff[buffbyte++] = WaveFile.file_name[BufferCtl.fptr++];
			}
		}
	}
	else if(AudioState == AUDIO_STATE_STOP)
	{
		AUDIO_PLAYER_Stop();
	}
}


void BSP_AUDIO_OUT_Error_CallBack(void)
{
	AUDIO_PLAYER_Stop();
}


static AUDIO_ErrorTypeDef GetFileInfo(WAVE_FormatTypeDef *info)
{
	info->ChunkID = ((info->file_name[0] << 24) + (info->file_name[1] << 16) +(info->file_name[2] << 8) + info->file_name[3]);
	info->FileSize = ((info->file_name[7] << 24) + (info->file_name[6] << 16) +(info->file_name[5] << 8) + info->file_name[4]);
	info->FileFormat = ((info->file_name[8] << 24) + (info->file_name[9] << 16) +(info->file_name[10] << 8) + info->file_name[11]);
	info->SubChunk1ID = ((info->file_name[12] << 24) + (info->file_name[13] << 16) +(info->file_name[14] << 8) + info->file_name[15]);
	info->SubChunk1Size = ((info->file_name[19] << 24) + (info->file_name[18] << 16) +(info->file_name[17] << 8) + info->file_name[16]);
	info->AudioFormat = ((info->file_name[21] << 8) + info->file_name[20]);
	info->NbrChannels = ((info->file_name[23] << 8) + info->file_name[22]);
	info->SampleRate = ((info->file_name[27] << 24) + (info->file_name[26] << 16) +(info->file_name[25] << 8) + info->file_name[24]);
	info->ByteRate = ((info->file_name[31] << 24) + (info->file_name[30] << 16) +(info->file_name[29] << 8) + info->file_name[28]);
	info->BlockAlign = ((info->file_name[33] << 8) + info->file_name[32]);
	info->BitPerSample = ((info->file_name[35] << 8) + info->file_name[34]);
	info->SubChunk2ID = ((info->file_name[36] << 24) + (info->file_name[37] << 16) +(info->file_name[38] << 8) + info->file_name[39]);
	info->SubChunk2Size = ((info->file_name[43] << 24) + (info->file_name[42] << 16) +(info->file_name[41] << 8) + info->file_name[40]);
	return AUDIO_ERROR_NONE;
}


static uint8_t PlayerInit(uint32_t AudioFreq)
{ 
	if(BSP_AUDIO_OUT_Init(OUTPUT_DEVICE_SPEAKER, uwVolume, AudioFreq) != 0) return 1;
	else BSP_AUDIO_OUT_SetAudioFrameSlot(CODEC_AUDIOFRAME_SLOT_13);
		
	return 0;
}


/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
