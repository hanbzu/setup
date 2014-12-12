#!/bin/bash

# VirtualBox
echo -e "$MSGCOL APP: VirtualBox $ENDCOL"
sudo apt-get install -y dkms
wget -q http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc -O- | sudo apt-key add -
CODENAME=`lsb_release --codename | cut -f2` # Ubuntu codename
echo "deb http://download.virtualbox.org/virtualbox/debian $CODENAME contrib" | sudo tee -a /etc/apt/sources.list.d/virtualbox.list
sudo apt-get update -qq
sudo apt-get install -y virtualbox-4.3

# Vagrant --- Command line control for VirtualBox
VAGRANT_VER=1.7.0
VAGRANT_PLATFORM=x86_64
DEB_NAME=vagrant_${VAGRANT_VER}_${VAGRANT_PLATFORM}.deb
mkdir -p ~/Downloads
cd ~/Downloads
wget https://dl.bintray.com/mitchellh/vagrant/${DEB_NAME}
sudo dpkg -i ${DEB_NAME}

