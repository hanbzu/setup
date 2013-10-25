#!/bin/bash
# Simple setup.sh for configuring a Ubuntu machine for headless setup.

# Download Sublime Text 2 into /opt
cd /opt
sudo curl http://c758482.r82.cf2.rackcdn.com/Sublime%20Text%202.0.2%20x64.tar.bz2 | sudo tar -xj

# To avoid problems spaces are removed
sudo mv /opt/Sublime\ Text\ 2 /opt/sublimetext2

# Add link into /usr/bin
sudo ln -s /opt/sublimetext2/sublime_text /usr/bin/sublime

# Add Ubuntu Unity launcher for Sublime Text
cp ~/setup/assets/sublime.desktop ~/.local/share/applications/

# And replace all occurrences of gedit.desktop with sublime.desktop
sed -i 's/gedit.desktop/sublime.desktop/g' /usr/share/applications/defaults.list

# Make sure customisation directories are there
mkdir -p ~/.config/sublime-text-2/Installed\ Packages
mkdir -p ~/.config/sublime-text-2/Packages/User

# Install the Sublime Text 'Package Control' plug-in
cd ~/.config/sublime-text-2/Installed\ Packages
wget https://sublime.wbond.net/Package%20Control.sublime-package

# Scala development in Sublime Text 2
# A sbt ensime plug-in
mkdir -p ~/.sbt/plugins
touch    ~/.sbt/plugins/plugins.sbt 
echo "addSbtPlugin(\"org.ensime\" % \"ensime-sbt-cmd\" % \"0.1.2\")" >> ~/.sbt/plugins/plugins.sbt

# Manual installation of Gist plug-in
cd ~/.config/sublime-text-2/Packages
git clone git://github.com/condemil/Gist
echo "DONT FORGET: You should configure your Sublime Text 2 Gist plug-in"

# Manual installation of SublimeREPL
cd ~/.config/sublime-text-2/Packages
git clone git@github.com:wuub/SublimeREPL.git SublimeREPL

# Manual installation of SML plug-in
cd ~/.config/sublime-text-2/Packages
git clone https://github.com/seanjames777/SML-Language-Definition.git "SML (Standard ML)"

# Configure SML to be usable in Sublime Text
mkdir -p ~/.config/sublime-text-2/Packages/SML
mv ~/setup/assets/sml_Default.sublime-commands ~/.config/sublime-text-2/Packages/SML/Default.sublime-commands
mv ~/setup/assets/sml_Main.sublime-menu ~/.config/sublime-text-2/Packages/SML/Main.sublime-menu

# A tweak in order to have a SML REPL in Sublime
cd ~/.config/sublime-text-2/Packages/User/
USER_NAME=`whoami`
echo "{" >> SublimeREPL.sublime-settings
echo "  \"default_extend_env\": {" >> SublimeREPL.sublime-settings
USER_NAME=`whoami`
echo "    \"PATH\": \"/home/$USER_NAME/bin/sml/bin/:{PATH}\"" >> SublimeREPL.sublime-settings
echo "  }" >> SublimeREPL.sublime-settings
echo "}" >> SublimeREPL.sublime-settings

# Manual installation of Ensime plugin for Sublime Editor 2
cd ~/.config/sublime-text-2/Packages
git clone git://github.com/sublimescala/sublime-ensime.git Ensime
cd Ensime
wget https://www.dropbox.com/sh/ryd981hq08swyqr/ZiCwjjr_vm/ENSIME%20Releases/ensime_2.10.0-0.9.8.9.tar.gz
tar zxvf ensime_2.10.0-0.9.8.9.tar.gz
mv ensime_2.10.0-0.9.8.9 server

# Install Conscript
mkdir -p ~/bin
curl https://raw.github.com/n8han/conscript/master/setup.sh | sh # Installs into ~/bin

# Using Conscript, install giter8
~/bin/cs n8han/giter8

# Some notes
echo "You may be interested in installing these Sublime Text packages through Package Manager:"
echo " * MarkdownEditing"