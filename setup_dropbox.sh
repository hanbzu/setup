#!/bin/bash
# --------------------------------------------
# CAUTION: In case you use this script make
# sure you understand the commands
# --------------------------------------------

CODENAME=`lsb_release --codename | cut -f2`

echo "deb http://linux.dropbox.com/ubuntu $CODENAME main">>'dropbox.list'
chmod 644 'dropbox.list'
sudo chown root:root 'dropbox.list'
sudo mv 'dropbox.list' '/etc/apt/sources.list.d/dropbox.list'
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 5044912E
sudo apt-get update -qq
sudo apt-get install dropbox -y

