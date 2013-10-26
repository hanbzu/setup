#!/bin/bash
# WARNING: This whole script should be run under bash

# Coot dependencies
sudo apt-get install -y libxmu-dev libgl1-mesa-dev libgtkglext1-dev patch m4 g++ libxext-dev libxt-dev libc6-dev libglu1-mesa-dev mesa-common-dev swig libgtk2.0-dev  libgnomecanvas2-dev
 
# Coot
# Buit from source by autobuild scripts
mkdir -p ~/bin/coot/autobuild
cd ~/bin/coot/autobuild
wget http://www.ysbl.york.ac.uk/~emsley/build-logs/build-it-gtk2-simple
export AUTOBUILD_INSTALLED=~/bin/coot
export AUTOBUILD_BUILD=~/bin/coot/autobuild
export LOGS=$AUTOBUILD_BUILD/logs
export NIGHTLY_DEST_DIR=$AUTOBUILD_BUILD
export STABLE_DEST_DIR=$AUTOBUILD_BUILD
export build_coot_prerelease=1
bash build-it-gtk2-simple python > build.log

