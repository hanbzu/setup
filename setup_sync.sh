#!/bin/bash

USER_NAME=`whoami`

# More information on how to install bittorrent sync on Ubuntu
# https://www.digitalocean.com/community/articles/how-to-use-bittorrent-sync-to-synchronize-directories-in-ubuntu-12-04
sudo add-apt-repository ppa:tuxpoldo/btsync -y
sudo apt-get update -qq
sudo apt-get install btsync

# to run config again if needed
sudo dpkg-reconfigure btsync

# Add this user to the btsync group
sudo usermod -a -G btsync $USER_NAME

# This is the process of making a folder
#sudo mkdir shared_folder
#sudo chown root:btsync shared_folder -- maybe in my case not a good idea to use root
#sudo chmod 2775 shared_folder
#sudo usermod -a -G btsync your_user