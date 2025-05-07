@echo off
echo [Build] Starting build process...

rem Project directories setup
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

rem Check if ELF file exists
if exist stm32h750_winusb.elf (
    echo [Build] Found ELF file, generating binary and hex files...
    
    rem Generate BIN file
    arm-none-eabi-objcopy -O binary stm32h750_winusb.elf usb_app.bin
    echo [Build] Created: usb_app.bin
    
    rem Generate HEX file
    arm-none-eabi-objcopy -O ihex stm32h750_winusb.elf usb_app.hex
    echo [Build] Created: usb_app.hex
) else (
    echo [Build] ERROR: stm32h750_winusb.elf not found!
    echo [Build] Checking for other ELF files...
    dir *.elf
)

popd

echo [Build] Build process completed!
