#!/bin/bash
# --------------------------------------------
# CAUTION: In case you use this script make
# sure you understand the commands.
# THESE COMMANDS APPLY TO UBUNTU SAUCY (13.10)
# --------------------------------------------

# Ubuntu codename and machine type
CODENAME=`lsb_release --codename | cut -f2`
MACHINE_TYPE=`uname -m`

# Skype. We need to add Canonical partner repositories
echo -e "$MSGCOL APP: Skype $ENDCOL"
sudo sh -c "echo 'deb http://archive.canonical.com/ubuntu/ $CODENAME partner' >> /etc/apt/sources.list.d/canonical_partner.list"
sudo apt-get update -qq
sudo apt-get install -y skype
# If there's any sound issue, read this:
# http://linuxg.net/how-to-fix-the-skype-sound-issue-on-ubuntu-13-10-saucy-salamander/

# Virtualbox
echo -e "$MSGCOL APP: VirtualBox $ENDCOL"
sudo apt-get install -y dkms
wget -q http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc -O- | sudo apt-key add -
CODENAME=`lsb_release --codename | cut -f2` # Ubuntu codename
echo "deb http://download.virtualbox.org/virtualbox/debian $CODENAME contrib" | sudo tee -a /etc/apt/sources.list.d/virtualbox.list
sudo apt-get update -qq
sudo apt-get install -y virtualbox-4.3

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
sudo dpkg -i $CHROME_FILE
# Fix errors encountered during install
sudo apt-get -f -y install
rm /tmp/$CHROME_FILE

# Install 'Caffeine' which prevents the OS from suspending while watching videos
echo -e "$MSGCOL APP: Caffeine $ENDCOL"
# Saucy repo not working
#sudo add-apt-repository -y ppa:caffeine-developers/caffeine-dev
#sudo apt-get update -qq
#sudo apt-get install -y caffeine
cd /tmp
wget -c https://launchpad.net/caffeine/2.4/2.4.1/+download/caffeine_2.4.1%2B419%7Eoneiric1_all.deb -O caffeine.deb
sudo dpkg -i /tmp/caffeine.deb
sudo apt-get install -f -y
rm /tmp/caffeine.deb

# Filezilla is useful for non automated FTP connections
echo -e "$MSGCOL APP: Filezilla $ENDCOL"
sudo apt-get install -y filezilla

# Useful to manage local files and do cleanups
echo -e "$MSGCOL APP: FSlint $ENDCOL"
sudo apt-get install -y fslint

# Gimp. I consider this now quite basic.
echo -e "$MSGCOL APP: Gimp $ENDCOL"
sudo add-apt-repository -y ppa:otto-kesselgulasch/gimp
sudo apt-get install -y gimp gimp-plugin-registry gimp-gmic

# Inconsolata: Useful font for coding and console
echo -e "$MSGCOL Inconsolata font $ENDCOL"
sudo apt-get install -y ttf-inconsolata

echo -e "$MSGCOL --> Desktop apps, done. $ENDCOL"