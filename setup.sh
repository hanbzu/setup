#!/bin/bash
# Simple setup.sh for configuring a Ubuntu machine for headless setup.

# Install nvm: node-version manager
# https://github.com/creationix/nvm
sudo apt-get install -y git
sudo apt-get install -y curl
curl https://raw.github.com/creationix/nvm/master/install.sh | sh

# Load nvm and install latest production node
source $HOME/.nvm/nvm.sh
nvm install v0.10.12
nvm use v0.10.12

# Install jshint to allow checking of JS code within emacs
# http://jshint.com/
npm install -g jshint

# Install rlwrap to provide libreadline features with node
# See: http://nodejs.org/api/repl.html#repl_repl
sudo apt-get install -y rlwrap

# Install emacs24
# https://launchpad.net/~cassou/+archive/emacs
sudo add-apt-repository -y ppa:cassou/emacs
sudo apt-get -qq update
sudo apt-get install -y emacs24-nox emacs24-el emacs24-common-non-dfsg

# Install Heroku toolbelt
# https://toolbelt.heroku.com/debian
wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh

# Use ZSH as the default shell (if you use sudo it won't work)
sudo apt-get install zsh
chsh -s $(which zsh)

# git pull and install dotfiles as well
cd $HOME
if [ -d ./dotfiles/ ]; then
    mv dotfiles dotfiles~
fi
git clone https://github.com/hanbzu/dotfiles.git
dotfiles/makesymlinks.sh

# Add color to git
git config --global --add color.ui true

# Advice: git configuration
echo "Don't forget to configure git:"
echo "git config --global user.name \"John Doe\""
echo "$ git config --global user.email johndoe@example.com"
echo "More info here: http://git-scm.com/book/en/Customizing-Git-Git-Configuration"