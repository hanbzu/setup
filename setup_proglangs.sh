#!/bin/bash
# This script installs a development environment for the
# 'Programming Languages' (Dan Grossman) course, Univ. of Washington

# Install emacs24
# https://launchpad.net/~cassou/+archive/emacs
sudo add-apt-repository -y ppa:cassou/emacs
sudo apt-get -qq update
sudo apt-get install -y emacs24-nox emacs24-el emacs24-common-non-dfsg

# SML/NJ requires support for 32 bit executables
sudo apt-get install -y gcc-multilib ia32-libs

# SML: Create the ~/bin/sml directory, download and install
mkdir -p ~/bin/sml
cd ~/bin/sml
curl http://www.smlnj.org/dist/working/110.74/config.tgz | tar -xz
config/install.sh

# SML mode for emacs
sudo apt-get install -y sml-mode

# Racket from repos
sudo apt-get install -y racket

# Install RVM for Ruby development
curl -L https://get.rvm.io | bash -s stable --ruby=1.9.3
