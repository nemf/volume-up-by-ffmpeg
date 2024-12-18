#!/bin/sh

TMP=hoho.m4a
if [ -f $1 ]; then
    mv $1 $TMP
else
    echo "File does not exist ( $1 )"
    exit
fi

TARGET=$1

echo "Detecting the current volume level"
VOL=`ffmpeg -i $TMP -vn -af volumedetect -f null - 2>&1 | grep max_volume | awk '{print $5}'| sed 's/-//'`

echo "max_volume=$VOL"

echo "Started to adjust the volume ...."
ffmpeg -loglevel error -i $TMP -af volume=${VOL}dB $TARGET 
echo "Completed !!"