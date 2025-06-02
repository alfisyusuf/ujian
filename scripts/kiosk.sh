#!/bin/bash

URL="https://3vee813h71.alabidin.id"

# Lokasi Chromium
BROWSER=$(which chromium || which google-chrome)

if [ -z "$BROWSER" ]; then
    echo "Chromium/Chrome tidak ditemukan."
    exit 1
fi

$BROWSER --app="$URL" --start-fullscreen
