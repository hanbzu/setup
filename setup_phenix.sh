#!/bin/bash

# Dependencies
sudo apt-get install -y libjpeg62

# Install following instructions in:
# http://www.phenix-online.org/documentation/install.htm
mkdir -p ~/bin
cd ~/bin
tar xvf ~/setup/packages/phenix-installer-1.8.4-1496-intel-linux-2.6-x86_64-fc3.tar
cd ~/bin/phenix-installer-1.8.4-1496
./install --prefix=/home/$USER/bin
echo "You may want to delete now the folder ~/bin/phenix-installer-1.8.4-1496"

# Add Ubuntu Unity launcher for Phenix
cp ~/setup/assets/phenix_icon.png ~/bin/phenix-1.8.4-1496/
cp ~/setup/assets/phenix.desktop ~/.local/share/applications/