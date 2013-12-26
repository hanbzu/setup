#!/bin/bash
# This is the script I use for a fresh install of one of 
# the computers I manage. It may or may not be suitable for you.
# --------------------------------------------
# CAUTION: In case you use this script make
# sure you understand the commands
# --------------------------------------------

# Basic for automatic installs
sudo apt-get install -y git
sudo apt-get install -y curl
sudo apt-get update -qq
sudo apt-get upgrade -y

# Desktop apps
source ~/setup/setup_desktop.sh
