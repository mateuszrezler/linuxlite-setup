#!/bin/bash

# IMPORTANT! Before running:
# 1. Install Skype and Webcam Software using Lite Software tool
# 2. Replace DUMMY DATA with your personal data
# 3. Make your custom modifications

# Tidy up the desktop
# Leave "recyclebin.desktop" and "userfiles.desktop" files only
mkdir ~/.Desktop
mv ~/Desktop/computer.desktop ~/.Desktop/computer.desktop
mv ~/Desktop/helpmanual.desktop ~/.Desktop/helpmanual.desktop
mv ~/Desktop/network.desktop ~/.Desktop/network.desktop
mv ~/Desktop/settings.desktop ~/.Desktop/settings.desktop

# Fix webcam problems in Skype
sudo apt -y install v4l2loopback-dkms
sudo apt -y install ffmpeg
echo "sudo modprobe v4l2loopback
ffmpeg -i /dev/video0 -vcodec rawvideo -pix_fmt yuv420p -vsync 2 -threads 0 \\
-f v4l2 /dev/video1
" > ~/.skype.sh

# Turn on echo cancellation
sudo sed -i \
"/load-module module-filter-apply/a load-module module-echo-cancel" \
/etc/pulse/default.pa
pulseaudio -k

# Install and configure Git
sudo apt -y install git
git config --global user.name "DUMMY NAME"
git config --global user.email "DUMMY@EMAIL.COM"

# Install utilities
sudo apt -y install gedit

