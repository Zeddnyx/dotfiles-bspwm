#!/bin/bash

read -p "Enter the file name (without extension): " filename

echo "Select recording source:"
echo "1. Laptop screen"
echo "2. External monitor"
read -p "Enter your choice (1 or 2): " choice

# Record laptop screen
if [ "$choice" == "1" ]; then
    laptop_width=1366  
    ffmpeg -y -f x11grab -framerate 30 -video_size 1920x1080 -i :0 \
           -f lavfi -i anullsrc=channel_layout=stereo:sample_rate=44100 \
           -vf "crop=${laptop_width}:1080:0:0" -c:v libx264 -pix_fmt yuv420p -preset veryfast -q:v 1 "$filename.mkv"

# Record external monitor
elif [ "$choice" == "2" ]; then
    # Use the coordinates obtained from xwininfo
    x_pos=1376
    y_pos=10
    width=1910  # width screen
    height=1070  # height screen

    # Record the specified window using ffmpeg
    ffmpeg -y -f x11grab -framerate 30 -video_size "${width}x${height}" -i ":0.0+$x_pos,$y_pos" \
           -f lavfi -i anullsrc=channel_layout=stereo:sample_rate=44100 \
           -c:v libx264 -pix_fmt yuv420p -preset veryfast -q:v 1 "$filename.mkv"

else
    echo "Invalid choice. Please enter 1 or 2."
    exit 1
fi

