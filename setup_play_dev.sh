#!/bin/bash
# This script will install the Play Framework
# in the ~/bin/ directory.

if [ ! -d ~/bin/ ]; then
	mkdir ~/bin
fi

cd ~/bin

# I'm using version 2.2.0 -- Change according to times
curl http://downloads.typesafe.com/play/2.2.0/play-2.2.0.zip -o tmp.zip
unzip tmp.zip
rm tmp.zip
