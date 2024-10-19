#!/bin/bash

# Directory containing wallpapers
WALLPAPER_DIR="$HOME/.config/wallpaper/"

# Get a random wallpaper from the directory
WALLPAPER=$(find "$WALLPAPER_DIR" -type f | shuf -n 1)

# Set the wallpaper using feh
feh --bg-fill "$WALLPAPER"

# Log the wallpaper change (optional)
echo "Wallpaper set to $WALLPAPER" >> "$HOME/.wallpaper_log"
