#!/bin/bash
# Some changes made to the XPS 13 computer
# just after clean instalation of Ubuntu 13.XX
# --------------------------------------------
# CAUTION: In case you use this script make
# sure you understand the commands
# --------------------------------------------

# Ubuntu codename
CODENAME=`lsb_release --codename | cut -f2`

# The Sputnik repository is apparently no longer needed since 13.10
#sudo add-apt-repository -y ppa:canonical-hwe-team/sputnik-kernel
#sudo apt-get update -qq
#sudo apt-get upgrade -y

# Ubuntu restricted extras. For video playing -- Not sure about this
#sudo apt-get install ubuntu-restricted-extras

# We won't be using Thunderbird -- Maybe it's not safe to remove it
#sudo apt-get remove --purge thunderbird*

# For now, we'll be using Chrome instead of Firefox
sudo apt-get install -y libxss1
cd /tmp
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
# Fix errors encountered during install
sudo apt-get -f -y install

# Install 'Caffeine' which prevents the OS from suspending while whatching videos
#sudo add-apt-repository -y ppa:caffeine-developers/caffeine-dev
#sudo apt-get update -qq
#sudo apt-get install -y caffeine

# Disable Ubuntu Dash shopping suggestion scopes
gsettings set com.canonical.Unity.Lenses disabled-scopes "['more_suggestions-amazon.scope', 'more_suggestions-u1ms.scope', 'more_suggestions-populartracks.scope', 'music-musicstore.scope', 'more_suggestions-ebay.scope', 'more_suggestions-ubuntushop.scope', 'more_suggestions-skimlinks.scope']"

# Basic apps
sudo apt-get install -y filezilla fslint

# Inconsolata: Useful font for coding and console
sudo apt-get install ttf-inconsolata

# Spell cheking and dictionaries for EU, CA, EN-UK, DE, ES, FR
# More info at: http://packages.ubuntu.com/lucid/hunspell-dictionary
# Useful way of checking what's need:
# check-language-support -l fr
# check-language-support -l en_GB
sudo apt-get install -y libmythes-1.2-0 hunspell
sudo apt-get install -y hunspell-eu-es
sudo apt-get install -y hunspell-de-de mythes-de wngerman wogerman
sudo apt-get install -y myspell-ca mythes-ca wcatalan
sudo apt-get install -y myspell-es
sudo apt-get install -y hunspell-fr mythes-fr hyphen-fr wfrench

# Skype. We need to add Canonical partner repositories
sudo sh -c "echo 'deb http://archive.canonical.com/ubuntu/ raring partner' >> /etc/apt/sources.list.d/canonical_partner.list"
sudo apt-get update -qq
sudo apt-get install -y skype

# Virtualbox
sudo apt-get install -y dkms
wget -q http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc -O- | sudo apt-key add -
CODENAME=`lsb_release --codename | cut -f2` # Ubuntu codename
echo "deb http://download.virtualbox.org/virtualbox/debian $CODENAME contrib" | sudo tee -a /etc/apt/sources.list.d/virtualbox.list
sudo apt-get update -qq
sudo apt-get install -y virtualbox-4.3
echo "WARNING: Maybe this does not work for Saucy (13.10) because the PPA has not been updated."
echo "A workaround would be to change in etc/apt/sources.list.d/virtualbox.list"
echo "the line that says 'saucy' to 'raring'"

