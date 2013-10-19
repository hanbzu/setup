#!/bin/bash

sudo apt-get install dkms
sudo apt-get install -y virtualbox-ose
wget -q http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc -O- | sudo apt-key add -
CODENAME=`lsb_release --codename | cut -f2` # Ubuntu codename
echo "deb http://download.virtualbox.org/virtualbox/debian $CODENAME contrib" | sudo tee -a /etc/apt/sources.list.d/virtualbox.list
sudo apt-get update -qq
sudo apt-get install -y virtualbox-4.3
