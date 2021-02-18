#!/bin/bash

echo "Creating MP4 Web Optimized"
ffmpeg -an -i $1 -vcodec libx264 -pix_fmt yuv420p -profile:v baseline -level 3 optimized/$1

echo "Creating WebM Log"
ffmpeg -i optimized/cadastro-produtos-simples-unificado.mp4 -c:v libvpx-vp9 -pass 1 -b:v 1000K -threads 1 -speed 4 \
  -tile-columns 0 -frame-parallel 0 -auto-alt-ref 1 -lag-in-frames 25 \
  -g 9999 -aq-mode 0 -an -f webm optimized/$1.webm.log

echo "Creating WebM VP9 Optimized"
ffmpeg -i optimized/$1 -c:v libvpx-vp9 -pass 2 -b:v 1000K -threads 1 -speed 0 \
  -tile-columns 0 -frame-parallel 0 -auto-alt-ref 1 -lag-in-frames 25 \
  -g 9999 -aq-mode 0 -c:a libopus -b:a 64k -f webm optimized/$1.webm

echo "Removing Log"
rm -rf optimized/$1.webm.log