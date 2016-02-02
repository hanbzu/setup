#!/bin/bash
# This is the script I use for a fresh install 
# of another computer. It may or may not be suitable for you.
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
