#!/bin/bash
# Temporary NA-lab script 
# --------------------------------------------
# CAUTION: In case you use this script make
# sure you understand the commands
# --------------------------------------------

MACHINE_TYPE=`uname -m`

# Color messages
MSGCOL="\033[37;44m"
ENDCOL="\033[0m"

# Basic for automatic installs
echo -e "$MSGCOL Preparing for *SPUTNIK* UBUNTU TRUSTY setup $ENDCOL"
sudo apt-get install -y git
sudo apt-get install -y curl
sudo apt-get update -qq
sudo apt-get upgrade -y

# Disable Ubuntu Dash shopping suggestion scopes
gsettings set com.canonical.Unity.Lenses disabled-scopes "['more_suggestions-amazon.scope', 'more_suggestions-u1ms.scope', 'more_suggestions-populartracks.scope', 'music-musicstore.scope', 'more_suggestions-ebay.scope', 'more_suggestions-ubuntushop.scope', 'more_suggestions-skimlinks.scope']"

# Graphic capabilities benchmarking
sudo apt-get install -y glmark2

# SMB networking
sudo apt-get install -y samba

# Virtualbox
echo -e "$MSGCOL APP: VirtualBox $ENDCOL"
sudo apt-get install -y dkms
wget -q http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc -O- | sudo apt-key add -
CODENAME=`lsb_release --codename | cut -f2` # Ubuntu codename
echo "deb http://download.virtualbox.org/virtualbox/debian $CODENAME contrib" | sudo tee -a /etc/apt/sources.list.d/virtualbox.list
sudo apt-get update -qq
sudo apt-get install -y virtualbox-4.3

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
sudo apt-get install -y fonts-inconsolata

# CLI improvements
echo -e "$MSGCOL Command line improvements $ENDCOL"
# Useful for viewing small directory structures
sudo apt-get install -y tree
# Easy scheduler for delaying commands
sudo apt-get install at
# z: Easy go-to app
cd /opt
sudo git clone https://github.com/rupa/z.git

# git pull and install dotfiles as well
echo -e "$MSGCOL Dotfiles $ENDCOL"
cd $HOME
if [ -d ./dotfiles/ ]; then
    mv dotfiles dotfiles~
fi
git clone https://github.com/hanbzu/dotfiles.git
dotfiles/makesymlinks.sh

# Use ZSH as the default shell (if you use sudo it won't work)
sudo apt-get install -y zsh zsh-doc
chsh -s $(which zsh)
