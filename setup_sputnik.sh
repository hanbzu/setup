#!/bin/bash
# Some changes made to the XPS 13 computer
# just after clean istalation of Ubuntu 13.04
# -------------------------------------------
# CAUTION: In case you use this script make
# sure you understand the commands
# -------------------------------------------

sudo add-apt-repository ppa:canonical-hwe-team/sputnik-kernel
sudo apt-get update
sudo apt-get upgrade

# We won't be using Thunderbird 
sudo apt-get remove --purge thunderbird*

# For now, we'll be using Chrome instead of Firefox
sudo apt-get install google-chrome-stable
