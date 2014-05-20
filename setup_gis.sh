#!/bin/bash
# --------------------------------------------
# CAUTION: In case you use this script make
# sure you understand the commands.
# --------------------------------------------

# Color messages
MSGCOL="\033[37;44m"
ENDCOL="\033[0m"

# QGIS
echo -e "$MSGCOL QGIS $ENDCOL"
CODENAME=`lsb_release --codename | cut -f2` # Ubuntu codename
echo "deb     http://qgis.org/debian $CODENAME main" | sudo tee -a /etc/apt/sources.list
echo "deb-src http://qgis.org/debian $CODENAME main" | sudo tee -a /etc/apt/sources.list
sudo apt-get update -qq
sudo apt-get install qgis python-qgis qgis-plugin-grass -y --force-yes
gpg --keyserver keyserver.ubuntu.com --recv 47765B75
gpg --export --armor 47765B75 | sudo apt-key add -

# GDAL
sudo apt-get install gdal-bin -y

# Tilemill
# Apparently it automatically installs it and it can be run with the Ubuntu launcher
echo -e "$MSGCOL TileMill $ENDCOL"
cd /opt
curl http://tilemill.s3.amazonaws.com/latest/install-tilemill.tar.gz | sudo tar -xz
sudo ./install-tilemill.sh
sudo rm install-tilemill.sh

# TOPOJSON
npm install -g topojson
