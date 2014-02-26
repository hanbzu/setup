#!/bin/bash

# HTML tidy HTML5 clone
# The version in the Ubuntu repository is only for HTML4
mkdir -p ~/tmp
cd ~/tmp
git clone https://github.com/w3c/tidy-html5.git
cd ~/tmp/tidy-html5
make -C build/gmake/
sudo make install -C build/gmake/
cd ~
rm -rf ~/tmp/tidy-html5