@echo off
setlocal enabledelayedexpansion

echo ========================================
echo        SISTEM UJIAN ONLINE
echo ========================================
echo.
echo Sedang mempersiapkan lingkungan ujian...
echo Mohon tunggu sebentar...

:: Cek apakah running sebagai administrator
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo PERINGATAN: Script ini memerlukan hak administrator
    echo untuk keamanan ujian yang optimal.
    echo.
    echo Silakan buka CMD sebagai administrator dan jalankan ulang perintah
    pause
    exit /b
)

:: Default lokasi Chrome
set "CHROME1=C:\Program Files\Google\Chrome\Application\chrome.exe"
set "CHROME2=C:\Program Files (x86)\Google\Chrome\Application\chrome.exe"

if exist "%CHROME1%" (
    set "CHROME=%CHROME1%"
) else if exist "%CHROME2%" (
    set "CHROME=%CHROME2%"
) else (
    echo ERROR: Google Chrome tidak ditemukan!
    echo Pastikan Google Chrome sudah terinstall.
    echo.
    pause
    exit /b
)

echo Mengaktifkan mode keamanan ujian...

:: Disable Task Manager
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v DisableTaskMgr /t REG_DWORD /d 1 /f >nul 2>&1

:: Disable Registry Editor
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v DisableRegistryTools /t REG_DWORD /d 1 /f >nul 2>&1

:: Disable Command Prompt
reg add "HKCU\Software\Policies\Microsoft\Windows\System" /v DisableCMD /t REG_DWORD /d 1 /f >nul 2>&1

echo Membuka aplikasi ujian dalam mode aman...

set "URL=https://ujian.pages.dev/masukujian"

:: Chrome dengan parameter keamanan maksimal
start "" "%CHROME%" ^
    --app=%URL% ^
    --start-fullscreen ^
    --kiosk ^
    --no-first-run ^
    --disable-session-crashed-bubble ^
    --disable-infobars ^
    --disable-web-security ^
    --disable-features=TranslateUI ^
    --disable-dev-tools ^
    --disable-extensions ^
    --disable-plugins ^
    --disable-print-preview ^
    --no-default-browser-check ^
    --disable-default-apps

echo.
echo ========================================
echo   UJIAN TELAH DIMULAI
echo ========================================
echo.
echo PENTING:
echo - Jangan tutup jendela browser
echo - Jangan tekan Alt+Tab atau Windows key  
echo - Fokus hanya pada ujian
echo.

:: Buat file restore di Desktop
echo @echo off > "%USERPROFILE%\Desktop\restore-ujian.bat"
echo echo ======================================== >> "%USERPROFILE%\Desktop\restore-ujian.bat"
echo echo    MENGEMBALIKAN PENGATURAN SISTEM >> "%USERPROFILE%\Desktop\restore-ujian.bat"
echo echo ======================================== >> "%USERPROFILE%\Desktop\restore-ujian.bat"
echo echo. >> "%USERPROFILE%\Desktop\restore-ujian.bat"
echo echo Sedang mengembalikan pengaturan normal... >> "%USERPROFILE%\Desktop\restore-ujian.bat"
echo reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v DisableTaskMgr /f ^>nul 2^>^&1 >> "%USERPROFILE%\Desktop\restore-ujian.bat"
echo reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v DisableRegistryTools /f ^>nul 2^>^&1 >> "%USERPROFILE%\Desktop\restore-ujian.bat"
echo reg delete "HKCU\Software\Policies\Microsoft\Windows\System" /v DisableCMD /f ^>nul 2^>^&1 >> "%USERPROFILE%\Desktop\restore-ujian.bat"
echo echo. >> "%USERPROFILE%\Desktop\restore-ujian.bat"
echo echo Pengaturan sistem telah dikembalikan ke normal. >> "%USERPROFILE%\Desktop\restore-ujian.bat"
echo echo. >> "%USERPROFILE%\Desktop\restore-ujian.bat"
echo pause >> "%USERPROFILE%\Desktop\restore-ujian.bat"

echo File restore-ujian.bat telah dibuat di Desktop.

timeout /t 3 /nobreak >nul

endlocal
