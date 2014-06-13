#!/bin/bash
# This script installs a development environment for the
# 'Programming Languages' (Dan Grossman) course, Univ. of Washington

# Color messages
MSGCOL="\033[37;44m"
ENDCOL="\033[0m"

# Install emacs24
# https://launchpad.net/~cassou/+archive/emacs
echo -e "$MSGCOL Emacs24 $ENDCOL"
sudo add-apt-repository -y ppa:cassou/emacs
sudo apt-get -qq update
sudo apt-get install -y emacs24-nox emacs24-el emacs24-common-non-dfsg

# SML/NJ requires support for 32 bit executables
echo -e "$MSGCOL Support for 32 bit executables (SML) $ENDCOL"
sudo apt-get install -y gcc-multilib ia32-libs

# SML: Create the ~/bin/sml directory, download and install
echo -e "$MSGCOL SML $ENDCOL"
sudo mkdir -p /opt/sml
sudo cd /opt/sml
curl http://www.smlnj.org/dist/working/110.74/config.tgz | sudo tar -xz
sudo config/install.sh

# SML mode for emacs
echo -e "$MSGCOL SML mode for Emacs $ENDCOL"
sudo apt-get install -y sml-mode

# Racket from repos
echo -e "$MSGCOL Racket $ENDCOL"
sudo apt-get install -y racket

# Install RVM for Ruby development
echo -e "$MSGCOL RVM and Ruby version 1.9.3 $ENDCOL"
cd ~
curl -L https://get.rvm.io | bash -s stable --ruby=1.9.3

# Install Jekyll (Ruby gem for static website creation)
sudo gem install jekyll --no-rdoc --no-ri
