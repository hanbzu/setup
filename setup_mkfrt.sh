#!/bin/bash
# This is the script I use for a fresh install of one of 
# the computers I manage. It may or may not be suitable for you.
# --------------------------------------------
# CAUTION: In case you use this script make
# sure you understand the commands
# THIS IS VALID ONLY FOR LUBUNTU SAUCY (_L_UBUNTU)
# --------------------------------------------

# Color messages
MSGCOL="\033[37;44m"

# Basic for automatic installs
echo -e "$MSGCOL Preparing for LUBUNTU MKFRT setup "
sudo apt-get install -y git
sudo apt-get install -y curl
sudo apt-get update -qq
sudo apt-get upgrade -y

# Desktop apps
#echo -e "$MSGCOL Desktop apps "
#source ~/setup/setup_desktop.sh

# Removing unnecessary packages from this Lubuntu distribution
# << lubuntu-desktop is just a metapackage that install all lubuntu-related packages in a single step >>
# http://askubuntu.com/questions/317464/can-i-safely-remove-lubuntu-desktop
echo -e "$MSGCOL Removing unnecessary packages from Lubuntu "
sudo apt-get remove -y lubuntu-desktop
sudo apt-get purge -y ace-of-penguins abiword gnumeric

# LibreOffice 4.1 (only that version in PPA)
# << It should be noted that this ppa will only produce updates for the 4.1 series >>
# http://askubuntu.com/questions/252612/how-do-i-install-libreoffice-4
echo -e "$MSGCOL Installing LibreOffice 4.1 (PPA) "
sudo add-apt-repository -y ppa:libreoffice/libreoffice-4-1
sudo apt-get update -qq
sudo apt-get install -y libreoffice

# Synapse is a fast app launcher
echo -e "$MSGCOL Installing Synapse "
sudo apt-get install -y synapse