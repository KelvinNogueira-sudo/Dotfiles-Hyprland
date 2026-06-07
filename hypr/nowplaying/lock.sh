#!/bin/bash

# Config
CONFIG="$HOME/.config/hypr/hyprlock.conf"
WALLPAPER_DIR="/usr/share/backgrounds/Live-wallpaper/"

# start songdetail to get the song info and album art
bash $HOME/.config/hypr/nowplaying/nowplaying.sh

# Finds a random img from img folder and set it as hyprlock background
NEW=$(find "$WALLPAPER_DIR" -type f -iregex '.*\.\(jpg\|jpeg\|png\|webp\)' | shuf -n 1)
sed -i "4 c\    path = $NEW" "$CONFIG"

# start hyprlock
hyprlock 



