#!/bin/bash

mkdir -p ~/bin
cd ~/bin
tar xvf ~/phenix-installer-1.8.4-1496-intel-linux-2.6-x86_64-fc3.tar
cd ~/bin/phenix-installer-1.8.4-1496
./install --prefix=/home/$USER/bin
echo "You may want to delete now the folder ~/bin/phenix-installer-1.8.4-1496"
