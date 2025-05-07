/**
  ******************************************************************************
  * @file    lcd.c
  * @brief   LCD背光控制源文件
  ******************************************************************************
  */

/* 包含头文件 */
#include "LCD/lcd.h"

/**
  * @brief  打开LCD背光
  * @note   包含完整的触发序列和必要的延时
  * @param  无
  * @retval 无
  */
void LCD_BacklightOn(void)
{
  /* 使能GPIOI时钟 */
  __HAL_RCC_GPIOI_CLK_ENABLE();

  /* 配置PI6为LCD_PWM引脚 */
  GPIO_InitTypeDef GPIO_InitStruct = {0};
  GPIO_InitStruct.Pin = GPIO_PIN_6;
  GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
  HAL_GPIO_Init(GPIOI, &GPIO_InitStruct);

  /* 执行点亮序列 - 这是已经测试成功的序列 */
  HAL_GPIO_WritePin(GPIOI, GPIO_PIN_6, GPIO_PIN_RESET);
  HAL_Delay(200);
  HAL_GPIO_WritePin(GPIOI, GPIO_PIN_6, GPIO_PIN_SET);
  HAL_Delay(100);
  HAL_GPIO_WritePin(GPIOI, GPIO_PIN_6, GPIO_PIN_RESET);
}