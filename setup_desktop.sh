#!/bin/bash
# --------------------------------------------
# CAUTION: In case you use this script make
# sure you understand the commands.
# --------------------------------------------

# Ubuntu codename and machine type
CODENAME=`lsb_release --codename | cut -f2`
MACHINE_TYPE=`uname -m`

# Color messages
MSGCOL="\033[37;44m"
ENDCOL="\033[0m"

# Virtualbox and Vagrant
#echo -e "$MSGCOL VIRTUAL MACHINES. VirtualBox and Vagrant. $ENDCOL"
#source ~/setup/setup_dev_scala.sh

# Skype. We need to add Canonical partner repositories
echo -e "$MSGCOL APP: Skype $ENDCOL"
sudo sh -c "echo 'deb http://archive.canonical.com/ubuntu/ $CODENAME partner' >> /etc/apt/sources.list.d/canonical_partner.list"
sudo apt-get update -qq
sudo apt-get install -y skype
# If there's any sound issue, read this:
# http://linuxg.net/how-to-fix-the-skype-sound-issue-on-ubuntu-13-10-saucy-salamander/

# For now, we'll be using Chrome instead of Firefox
echo -e "$MSGCOL APP: Chrome $ENDCOL"
sudo apt-get install -y libxss1
cd /tmp
if [ ${MACHINE_TYPE} == 'x86_64' ]; then
  # 64 bit Linux
  CHROME_FILE=google-chrome-stable_current_amd64.deb
else
  # 32 bit Linux
  CHROME_FILE=google-chrome-stable_current_i386.deb
fi
wget https://dl.google.com/linux/direct/$CHROME_FILE
sudo dpkg -i $CHROME_FILE -y
# Fix errors encountered during install
sudo apt-get -f -y install
rm /tmp/$CHROME_FILE

# Filezilla is useful for non automated FTP connections
echo -e "$MSGCOL APP: Filezilla $ENDCOL"
sudo apt-get install -y filezilla

# Batch image editing in Nautilus
sudo add-apt-repository ppa:atareao/nautilus-extensions
sudo apt-get update -qq
sudo apt-get install -y nautilus-image-tools

# Useful to manage local files and do cleanups
echo -e "$MSGCOL APP: FSlint $ENDCOL"
sudo apt-get install -y fslint

# Gimp. I consider this now quite basic.
echo -e "$MSGCOL APP: Gimp $ENDCOL"
sudo add-apt-repository -y ppa:otto-kesselgulasch/gimp
sudo apt-get install -y gimp gimp-plugin-registry gimp-gmic

# Inconsolata: Useful font for coding and console
echo -e "$MSGCOL Inconsolata font $ENDCOL"
sudo apt-get install -y fonts-inconsolata

echo -e "$MSGCOL --> Desktop apps, done. $ENDCOL"
