#!/bin/bash

URL="https://3vee813h71.alabidin.id"
FIREFOX="/usr/bin/firefox"

if [ ! -x "$FIREFOX" ]; then
    echo "Firefox tidak ditemukan di $FIREFOX"
    exit 1
fi

# Jalankan langsung, tanpa redirect error/output, di background
nohup $FIREFOX --kiosk "$URL" >/dev/null 2>&1 &
