#!/bin/bash

URL="https://3vee813h71.alabidin.id"
FIREFOX="/usr/bin/firefox"

if [ ! -x "$FIREFOX" ]; then
    echo "Firefox tidak ditemukan di $FIREFOX"
    exit 1
fi

# Coba jalankan dengan --kiosk
$FIREFOX --kiosk "$URL" 2>/dev/null &

sleep 3
if ! pgrep -f "$FIREFOX.*$URL" > /dev/null; then
    echo "Mode kiosk gagal. Coba fullscreen biasa..."
    $FIREFOX --start-fullscreen "$URL" &
fi
