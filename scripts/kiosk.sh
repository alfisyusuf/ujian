#!/bin/bash

# URL tujuan ujian
URL="https://3vee813h71.alabidin.id"

# Cek apakah Firefox terinstal
if ! command -v firefox &> /dev/null
then
    echo "Firefox tidak ditemukan. Silakan install terlebih dahulu."
    exit 1
fi

# Jalankan Firefox dalam fullscreen mode
# --kiosk hanya tersedia di Firefox versi terbaru (v71+)
firefox --kiosk "$URL"
