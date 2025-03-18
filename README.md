编译命令：
cmake -G "Ninja" ..
ninja
arm-none-eabi-objcopy -O ihex stm32h750_winusb.elf stm32h750_winusb.hex