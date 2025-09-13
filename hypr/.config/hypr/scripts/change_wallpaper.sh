#!/usr/bin/env bash

WALLPAPER_DIR="$HOME/.local/share/wallpapers"
THUMB_DIR="$HOME/.cache/wallpaper-thumbs"

mkdir -p "$THUMB_DIR"

for img in "$WALLPAPER_DIR"/*; do
    filename=$(basename "$img")
    thumb="$THUMB_DIR/$filename"
    if [ ! -f "$thumb" ]; then
        convert "$img" -resize 128x128^ -gravity center -extent 128x128 "$thumb"
    fi
done

choices=""
for img in "$WALLPAPER_DIR"/*; do
    filename=$(basename "$img")
    thumb="$THUMB_DIR/$filename"
    choices+="$filename\0icon\x1f$thumb\n"
done

SELECTED=$(echo -en "$choices" | rofi -dmenu -theme-str 'element-icon { size: 96; }')

[ -z "$SELECTED" ] && exit 0

WALLPAPER="$WALLPAPER_DIR/$SELECTED"

if ! pgrep -x "hyprpaper" >/dev/null; then
    hyprpaper &
    sleep 1
fi

hyprctl hyprpaper unload all
hyprctl hyprpaper preload "$WALLPAPER"
hyprctl hyprpaper wallpaper "eDP-1,$WALLPAPER"
