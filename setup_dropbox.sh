#!/bin/bash
# --------------------------------------------
# CAUTION: In case you use this script make
# sure you understand the commands
# --------------------------------------------

# www.dropbox.com/install
echo -e "$MSGCOL Installing Dropbox 1.6.0 with DEB package $ENDCOL"
sudo apt-get install python-gpgme
cd /tmp
if [ ${MACHINE_TYPE} == 'x86_64' ]; then
  # 64 bit Linux
  DROPBOX_FILE=dropbox_1.6.0_amd64.deb
else
  # 32 bit Linux
  DROPBOX_FILE=dropbox_1.6.0_i386.deb
fi
wget https://www.dropbox.com/download?dl=packages/ubuntu/$DROPBOX_FILE -O /tmp/dropbox.deb
sudo dpkg -i /tmp/dropbox.deb
# Fix errors encountered during install
sudo apt-get -f -y install
rm /tmp/dropbox.deb
