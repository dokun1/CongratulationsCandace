#!/bin/bash
echo This is a test!
cd /home/
for filename in /home/images/*.jpg; do
  convert $filename -size 500x700 $filename
done
for filename in /home/videos/*.mov; do
  ffmpeg -i $filename -s 1280x720 edited-{$filename} | y
done
