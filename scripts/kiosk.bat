@echo off
setlocal

:: Default lokasi Chrome
set "CHROME1=C:\Program Files\Google\Chrome\Application\chrome.exe"
set "CHROME2=C:\Program Files (x86)\Google\Chrome\Application\chrome.exe"

if exist "%CHROME1%" (
    set "CHROME=%CHROME1%"
) else if exist "%CHROME2%" (
    set "CHROME=%CHROME2%"
) else (
    echo Chrome tidak ditemukan!
    pause
    exit /b
)

set "URL=https://ujian.sma-abbs.sch.id/"
start "" "%CHROME%" --app=%URL% --start-fullscreen

endlocal
