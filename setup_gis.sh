#!/bin/bash
# --------------------------------------------
# CAUTION: In case you use this script make
# sure you understand the commands.
# --------------------------------------------

# Color messages
MSGCOL="\033[37;44m"
ENDCOL="\033[0m"

# Tilemill
# Apparently it automatically installs it and it can be run with the Ubuntu launcher
echo -e "$MSGCOL TileMill $ENDCOL"
cd /opt
curl http://tilemill.s3.amazonaws.com/latest/install-tilemill.tar.gz | sudo tar -xz
sudo ./install-tilemill.sh