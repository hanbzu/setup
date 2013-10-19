#!/bin/bash
# Some changes made to the XPS 13 computer
# just after clean istalation of Ubuntu 13.04
# -------------------------------------------
# CAUTION: In case you use this script make
# sure you understand the commands
# -------------------------------------------

sudo add-apt-repository -y ppa:canonical-hwe-team/sputnik-kernel
sudo apt-get update -qq
sudo apt-get upgrade -y

# We won't be using Thunderbird 
sudo apt-get remove --purge thunderbird*

# For now, we'll be using Chrome instead of Firefox
cd /tmp
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
sudo apt-get -f install # Fix errors encountered during install

# Install 'Caffeine' which prevents the OS from suspending while whatching videos
sudo add-apt-repository -y ppa:caffeine-developers/caffeine-dev
sudo apt-get update -qq
sudo apt-get install -y caffeine
