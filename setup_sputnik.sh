#!/bin/bash
# This is the script I use for a fresh install 
# of my own computer. It may or may not be suitable for you.
# --------------------------------------------
# CAUTION: In case you use this script make
# sure you understand the commands
# --------------------------------------------

# Basic for automatic installs
sudo apt-get install -y git
sudo apt-get install -y curl
sudo apt-get update -qq
sudo apt-get upgrade -y

# The Sputnik repository is apparently no longer needed since 13.10
#sudo add-apt-repository -y ppa:canonical-hwe-team/sputnik-kernel
#sudo apt-get update -qq
#sudo apt-get upgrade -y

# Disable Ubuntu Dash shopping suggestion scopes
gsettings set com.canonical.Unity.Lenses disabled-scopes "['more_suggestions-amazon.scope', 'more_suggestions-u1ms.scope', 'more_suggestions-populartracks.scope', 'music-musicstore.scope', 'more_suggestions-ebay.scope', 'more_suggestions-ubuntushop.scope', 'more_suggestions-skimlinks.scope']"

# Graphic capabilities benchmarking
sudo apt-get glmark2

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

# Desktop apps
source ~/setup/setup_desktop.sh
