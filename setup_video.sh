#!/bin/bash

#sudo apt-add-repository -y --remove ppa:jon-severinsson/ffmpeg
#sudo apt-add-repository -y --remove ppa:sunab/kdenlive-release
#sudo apt-get purge -y ffmpeg libavcodec-extra-53
#sudo apt-get autoremove
#sudo apt-get update -qq
#sudo add-apt-repository -y ppa:samrog131/ppa
#sudo apt-get update -qq
#sudo apt-get install -y ffmpeg
#sudo apt-add-repository -y --remove ppa:samrog131/ppa
#sudo apt-get update -qq

# ffmpeg version 0.8.7-6:0.8.7-1ubuntu2, Copyright (c) 2000-2013 the Libav developers
#  built on Oct 11 2013 08:39:40 with gcc 4.8.1

#ffmpeg version 0.10.9-7:0.10.9-1~saucy1

sudo apt-get remove -y ffmpeg
sudo apt-get purge -y ffmpeg
sudo add-apt-repository -y ppa:jon-severinsson/ffmpeg
sudo apt-get -qq update
sudo apt-get install -y ffmpeg
sudo apt-get install libavformat-extra-53 libavcodec-extra-53

