# kiosk.ps1
# Script PowerShell untuk membuka Chrome dalam mode app fullscreen

# Daftar kemungkinan lokasi Chrome
$chromePaths = @(
    "$env:ProgramFiles\Google\Chrome\Application\chrome.exe",
    "$env:ProgramFiles(x86)\Google\Chrome\Application\chrome.exe"
)

# Cek Chrome terinstal
$chrome = $chromePaths | Where-Object { Test-Path $_ } | Select-Object -First 1

if (-not $chrome) {
    Write-Host "Google Chrome tidak ditemukan!"
    pause
    exit
}

# URL ujian
$url = "https://3vee813h71.alabidin.id/"

# Jalankan Chrome dalam mode app + fullscreen
Start-Process $chrome "--app=$url --start-fullscreen"
