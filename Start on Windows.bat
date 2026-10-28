@echo off
setlocal
title Hand Tracking Filter Capture

cd /d "%~dp0"

echo.
echo ==========================================
echo   Hand Tracking Filter Capture
echo ==========================================
echo.
echo This launcher will set up the project the first time,
echo then start the webcam effect.
echo.

where py >nul 2>nul
if %errorlevel%==0 (
    py -3.11 --version >nul 2>nul
    if not errorlevel 1 (
        set "PYTHON_CMD=py -3.11"
        goto python_found
    )
    py -3.10 --version >nul 2>nul
    if not errorlevel 1 (
        set "PYTHON_CMD=py -3.10"
        goto python_found
    )
)

where python >nul 2>nul
if %errorlevel%==0 (
    python --version
    set "PYTHON_CMD=python"
    goto python_found
)

echo ERROR: Python was not found.
echo.
echo Install Python 3.11 from https://www.python.org/downloads/
echo During installation, tick "Add python.exe to PATH".
echo Then close this window and double-click this file again.
echo.
pause
exit /b 1

:python_found
echo Using Python:
%PYTHON_CMD% --version
echo.

if not exist ".venv\Scripts\python.exe" (
    echo Creating a private Python environment...
    %PYTHON_CMD% -m venv .venv
    if errorlevel 1 goto failed
)

echo Installing or checking required packages...
".venv\Scripts\python.exe" -m pip install --upgrade pip
if errorlevel 1 goto failed
".venv\Scripts\python.exe" -m pip install -r requirements.txt
if errorlevel 1 goto failed

echo.
echo Starting the application. Press Q in the camera window to quit.
echo.
".venv\Scripts\python.exe" main.py
if errorlevel 1 (
    echo.
    echo The app stopped with an error. Read the message above.
    echo If the camera did not open, allow camera access in Windows Settings.
    pause
)
exit /b 0

:failed
echo.
echo Setup failed. Check your internet connection and Python version.
echo Python 3.10 or 3.11 is recommended for MediaPipe 0.10.14.
pause
exit /b 1
