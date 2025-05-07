/* USER CODE BEGIN Header */
/**
  ******************************************************************************
  * @file           : bsp_config.h
  * @brief          : Board Support Package configuration header file
  ******************************************************************************
  */
/* USER CODE END Header */

/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __BSP_CONFIG_H
#define __BSP_CONFIG_H

#ifdef __cplusplus
extern "C" {
#endif

/* Includes ------------------------------------------------------------------*/
#include "stm32h7xx_hal.h"

/* Exported functions prototypes ---------------------------------------------*/
void SystemClock_Config(void);

#ifdef __cplusplus
}
#endif

#endif /* __BSP_CONFIG_H */