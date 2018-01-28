@echo off
SETLOCAL

IF NOT EXIST "out/" MD "out/"

REM Build Embeder
pushd "src"
call vcvarsall.bat
msbuild
copy "Debug console\embeder.exe" "../out/console.exe" || exit /b 1
popd

del /q /f "emebeder2.exe" 2>nul
IF NOT EXIST "php.exe" echo Error, PHP not found. && exit /b 1
php.exe php/embeder2.php new console
php.exe php/embeder2.php type console CONSOLE
php.exe php/embeder2.php main console php/embeder2.php
php.exe php/embeder2.php add console out/console.exe out/console.exe

pause
echo Done
ENDLOCAL

