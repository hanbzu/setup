#!/bin/bash
mkdir -p ~/bin
cd ~/bin
CCP4_VERSION=ccp4-6.4.0.1
curl ftp://ftp.ccp4.ac.uk/ccp4/6.4.0/${CCP4_VERSION}-linux-x86_64.tar.gz | tar -xz
cd ~/bin/ccp4-6.4.0
./BINARY.setup
# But a setup file should be called at each new session: add to zshrc