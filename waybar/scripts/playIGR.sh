#!/bin/bash

# Check if an M3U8 URL or file path was provided
#if [ -z "$1" ]; then
#    echo "Usage: $0 <m3u8_url_or_path>"
#    exit 1
#fi

STREAM_URL="http://ibizaglobalradio.streaming-pro.com:8024"
FFPLAY_PID=0

if pgrep ffplay > /dev/null; then
  FFPLAY_PID=$(pgrep ffplay)
  echo "ffplay is active PID= $FFPLAY_PID"
  echo "Stopping stream: $STREAM_URL"
  #echo "q" > /proc/$FFPLAY_PID/fd/0
  #echo "▷" > ~/.config/waybar/scripts/IGRstatus 
  kill -KILL "$FFPLAY_PID" 
  echo "▶" > /home/rafa/.config/waybar/scripts/IGRstatus
else
  echo "ffplay is not active"
  echo "Initializing stream: $STREAM_URL"
  # Play the stream using ffplay with optimized streaming setting  
  #echo "□" > ~/.config/waybar/scripts/IGRstatus
  echo "■" > /home/rafa/.config/waybar/scripts/IGRstatus
  ffplay -nodisp -autoexit -loglevel quiet $STREAM_URL &
fi
