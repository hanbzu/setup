#!/bin/bash
# This script installs some bioinformatics tools

# Preparing...
MACHINE_TYPE=`uname -m`
mkdir -p ~/bin

# Pymol: From Ubuntu repositories,
# not latest version but may be the most stable way
sudo apt-get install -y pymol

# Coot dependencies
sudo apt-get install -y libxmu-dev libglu1-mesa-dev mesa-common-dev libgnomecanvas2-dev

# Coot
# Buit from source by autobuild scripts
mkdir -p ~/bin/coot/autobuild
cd ~/bin/coot/autobuild
wget http://www.ysbl.york.ac.uk/~emsley/build-logs/build-it-gtk2-simple
export AUTOBUILD_INSTALLED=~/bin/coot
export AUTOBUILD_BUILD=~/bin/coot/autobuild/
export LOGS=$AUTOBUILD_BUILD/logs
export NIGHTLY_DEST_DIR=$AUTOBUILD_BUILD
export STABLE_DEST_DIR=$AUTOBUILD_BUILD
export build_coot_prerelease=1
bash build-it-gtk2-simple python > build.log

# XDS
# Download tarfile and extract to a certain tools folder
# Then Path will have to be modified so that the system
# locates the executables from everywhere
mkdir -p ~/bin/xds
cd ~/bin/xds
if [ ${MACHINE_TYPE} == 'x86_64' ]; then
  # 64 bit Linux
  curl ftp://ftp.mpimf-heidelberg.mpg.de/pub/kabsch/XDS-INTEL64_Linux_x86_64.tar.gz | tar -xz
  mv XDS-INTEL64_Linux_x86_64/* .
  rm -r XDS-INTEL64_Linux_x86_64
else
  # 32 bit Linux
  curl ftp://ftp.mpimf-heidelberg.mpg.de/pub/kabsch/XDS-IA32_Linux_x86.tar.gz | tar -xz
  mv XDS-IA32_Linux_x86/* .
  rm -r XDS-IA32_Linux_x86
fi

# Some messages
echo "Maybe you want to do some clean-up:"
echo "* For example there is a ~/bin/coot/autobuild directory"
echo "  used by coot compilation. You can now delete that."

# PHENIX: Dependencies
sudo apt-get install -y libjpeg62

# PHENIX: Install following instructions in:
# http://www.phenix-online.org/documentation/install.htm
mkdir -p ~/bin
cd ~/bin
tar xvf ~/setup/packages/phenix-installer-1.8.4-1496-intel-linux-2.6-x86_64-fc3.tar
cd ~/bin/phenix-installer-1.8.4-1496
./install --prefix=/home/$USER/bin
echo "You may want to delete now the folder ~/bin/phenix-installer-1.8.4-1496"

# Add Ubuntu Unity launcher for Phenix
#cp ~/setup/assets/phenix_icon.png ~/bin/phenix-1.8.4-1496/
#cp ~/setup/assets/phenix.desktop ~/.local/share/applications/

