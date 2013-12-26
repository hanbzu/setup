#!/bin/bash
# Basic Node.js development in a remote virtual machine.
# Emacs is used as editor.

# Color messages
MSGCOL="\033[37;44m"
ENDCOL="\033[0m"

# Install nvm: node-version manager
# https://github.com/creationix/nvm
echo -e "$MSGCOL NVM $ENDCOL"
sudo apt-get install -y git
sudo apt-get install -y curl
curl https://raw.github.com/creationix/nvm/master/install.sh | sh
# Load nvm and install latest production node
source $HOME/.nvm/nvm.sh
nvm install v0.10.12
nvm use v0.10.12

# Install jshint to allow checking of JS code within emacs
# http://jshint.com/
echo -e "$MSGCOL JsHint (for Emacs) $ENDCOL"
npm install -g jshint

# Install rlwrap to provide libreadline features with node
# See: http://nodejs.org/api/repl.html#repl_repl
echo -e "$MSGCOL rlwrap (libreadline in Node) $ENDCOL"
sudo apt-get install -y rlwrap

# Install emacs24
# https://launchpad.net/~cassou/+archive/emacs
echo -e "$MSGCOL Emacs24 $ENDCOL"
sudo add-apt-repository -y ppa:cassou/emacs
sudo apt-get -qq update
sudo apt-get install -y emacs24-nox emacs24-el emacs24-common-non-dfsg