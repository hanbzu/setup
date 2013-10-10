#!/bin/bash
# This script installs some bioinformatics tools

if [ ! -d ~/tools/ ]; then
	mkdir ~/tools
fi

# Pymol: From Ubuntu repositories,
# not latest version but may be the most stable way
sudo apt-get install pymol

# Coot dependencies
sudo apt-get install libxmu-dev libglu1-mesa-dev mesa-common-dev libgnomecanvas2-dev

# Coot
# Buit from source by autobuild scripts
if [ ! -d ~/tools/coot ]; then
	mkdir ~/tools/coot
fi
if [ ! -d ~/tools/coot/autobuild ]; then
	mkdir ~/tools/coot/autobuild
fi
cd ~/tools/coot/autobuild
wget http://www.ysbl.york.ac.uk/~emsley/build-logs/build-it-gtk2-simple
export AUTOBUILD_INSTALLED=~/tools/coot
export AUTOBUILD_BUILD=~/tools/coot/autobuild/
export LOGS=$AUTOBUILD_BUILD/logs
export NIGHTLY_DEST_DIR=$AUTOBUILD_BUILD
export STABLE_DEST_DIR=$AUTOBUILD_BUILD
export build_coot_prerelease=1
bash build-it-gtk2-simple python > build.log

# XDS
# Download tarfile and extract to a certain tools folder
# Then Path will have to be modified so that the system
# locates the executables from everywhere
if [ ! -d ~/tools/xds ]; then
	mkdir ~/tools/xds
fi
cd ~/tools/xds
# 64 bit
curl ftp://ftp.mpimf-heidelberg.mpg.de/pub/kabsch/XDS-INTEL64_Linux_x86_64.tar.gz | tar -xz
mv XDS-INTEL64_Linux_x86_64/* .
rm -r XDS-INTEL64_Linux_x86_64
# 32 bit
#curl ftp://ftp.mpimf-heidelberg.mpg.de/pub/kabsch/XDS-IA32_Linux_x86.tar.gz | tar -xz
#mv XDS-IA32_Linux_x86/* .
#rm -r XDS-IA32_Linux_x86

# Some messages
echo "Maybe you want to do some clean-up:"
echo "* For example there is a ~/tools/coot/autobuild directory"
echo "  used by coot compilation. You can now delete that."
