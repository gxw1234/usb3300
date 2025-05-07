@echo off
echo [Build] Starting build process...

rem 设置项目和构建目录
set PROJECT_DIR=%~dp0..
set BUILD_DIR=%PROJECT_DIR%\build

echo [Build] Project directory: %PROJECT_DIR%
echo [Build] Build directory: %BUILD_DIR%

if not exist "%BUILD_DIR%" (
    echo [Build] Creating build directory...
    mkdir "%BUILD_DIR%"
)

pushd "%BUILD_DIR%"

echo [Build] Running CMake...
cmake -G "Ninja" "%PROJECT_DIR%"

echo [Build] Running Ninja...
ninja

echo [Build] Generating binary and hex files...
rem 生成BIN文件
arm-none-eabi-objcopy -O binary stm32h750_winusb.elf usb_app.bin
echo [Build] Created: usb_app.bin

rem 生成HEX文件
arm-none-eabi-objcopy -O ihex stm32h750_winusb.elf usb_app.hex
echo [Build] Created: usb_app.hex

popd

echo [Build] Build completed successfully!
