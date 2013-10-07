#!/bin/bash
# This script installs a development environment for the
# 'Programming Languages' (Dan Grossman) course, Univ. of Washington

# Install emacs24
# https://launchpad.net/~cassou/+archive/emacs
sudo add-apt-repository -y ppa:cassou/emacs
sudo apt-get -qq update
sudo apt-get install -y emacs24-nox emacs24-el emacs24-common-non-dfsg
