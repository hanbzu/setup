#!/bin/bash
# This is the script I use for a fresh install 
# of my own computer. It may or may not be suitable for you.
# --------------------------------------------
# CAUTION: In case you use this script make
# sure you understand the commands
# --------------------------------------------

MACHINE_TYPE=`uname -m`

# Color messages
MSGCOL="\033[37;44m"
ENDCOL="\033[0m"

# Basic for automatic installs
echo -e "$MSGCOL Preparing for *SPUTNIK* UBUNTU SAUCY setup $ENDCOL"
sudo apt-get install -y git
sudo apt-get install -y curl
sudo apt-get update -qq
sudo apt-get upgrade -y

# Disable Ubuntu Dash shopping suggestion scopes
gsettings set com.canonical.Unity.Lenses disabled-scopes "['more_suggestions-amazon.scope', 'more_suggestions-u1ms.scope', 'more_suggestions-populartracks.scope', 'music-musicstore.scope', 'more_suggestions-ebay.scope', 'more_suggestions-ubuntushop.scope', 'more_suggestions-skimlinks.scope']"

# Graphic capabilities benchmarking
sudo apt-get glmark2

# Spell cheking and dictionaries for EU, CA, EN-UK, DE, ES, FR
# More info at: http://packages.ubuntu.com/lucid/hunspell-dictionary
# Useful way of checking what's need:
# check-language-support -l fr
# check-language-support -l en_GB
# ----------- CHECK ALL THIS BEFORE USING -----------------
#echo -e "$MSGCOL Language support, spellchecking. $ENDCOL"
#sudo apt-get install -y libmythes-1.2-0 hunspell
#sudo apt-get install -y hunspell-eu-es
#sudo apt-get install -y hunspell-de-de mythes-de wngerman wogerman
#sudo apt-get install -y myspell-ca mythes-ca wcatalan
#sudo apt-get install -y myspell-es
#sudo apt-get install -y hunspell-fr mythes-fr hyphen-fr wfrench

# SMB networking
sudo apt-get install -y samba

# Dropbox
echo -e "$MSGCOL Installing dropbox $ENDCOL"
source ~/setup/setup_dropbox.sh

# Desktop apps
echo -e "$MSGCOL Desktop apps $ENDCOL"
source ~/setup/setup_desktop.sh

# Studio apps
echo -e "$MSGCOL Sputnik studio! $ENDCOL"
source ~/setup/setup_studio.sh

# Programming, additional capabilities
echo -e "$MSGCOL PROGRAMMING. Git environment. $ENDCOL"
sudo apt-get install -y meld
git config --global diff.tool meld
git config --global --add difftool.prompt false
git config --global --add color.ui true
echo -e "$MSGCOL PROGRAMMING. Python additional modules. $ENDCOL"
source ~/setup/setup_dev_python.sh
echo -e "$MSGCOL PROGRAMMING. HTML5 development. $ENDCOL"
source ~/setup/setup_dev_html5.sh
echo -e "$MSGCOL PROGRAMMING. Node.js development. $ENDCOL"
source ~/setup/setup_dev_node.sh
echo -e "$MSGCOL PROGRAMMING. Programming Languages set (SML, Racket, Ruby). $ENDCOL"
source ~/setup/setup_dev_proglangs.sh
echo -e "$MSGCOL PROGRAMMING. R and R Studio. $ENDCOL"
source ~/setup/setup_dev_rstudio.sh
echo -e "$MSGCOL PROGRAMMING. Scala and Play framework. Including ScalaIDE. $ENDCOL"
source ~/setup/setup_dev_scala.sh
echo -e "$MSGCOL PROGRAMMING. Neo4j database. $ENDCOL"
source ~/setup/setup_dev_neo4j.sh
echo -e "$MSGCOL PROGRAMMING. My current editor, Sublime Text 2. $ENDCOL"
source ~/setup/setup_dev_sublime.sh

# Install Heroku toolbelt
# https://toolbelt.heroku.com/debian
echo -e "$MSGCOL Heroku toolbelt $ENDCOL"
wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh

# GIS apps
# I install it 'once the war is over', because TileMill is a Node.js app
echo -e "$MSGCOL GIS $ENDCOL"
source ~/setup/setup_gis.sh

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

# Advice: git configuration
echo "Don't forget to configure git:"
echo "git config --global user.name \"John Doe\""
echo "$ git config --global user.email johndoe@example.com"
echo "More info here: http://git-scm.com/book/en/Customizing-Git-Git-Configuration"
echo "Also, don't forget to restart session if you want to use ZSH as default shell"
