#!/bin/bash
# Installation AND REMOVAL of apps in order to configure the
# system for image and video editing 
# -------------------------------------------
# CAUTION: In case you use this script make
# sure you understand the commands
# -------------------------------------------

# REMOVING PACKAGES WE WONT USE
# We will not use Shotwell
sudo apt-get remove --purge shotwell

# ADDING REPOSITORIES
# Darktable
sudo add-apt-repository -y ppa:pmjdebruijn/darktable-release-plus
# Openshot
sudo add-apt-repository -y ppa:openshot.developers/ppa
# Qgifer
sudo add-apt-repository -y ppa:samrog131/ppa
# Inkscape
sudo add-apt-repository -y ppa:inkscape.dev/stable
# ...and now update
sudo apt-get update

# INSTALLING PACKAGES
# We will use Darktable instead of Shotwell
sudo apt-get install -y darktable
# Raster & vector image editing: Gimp and Inkscape
sudo apt-get install -y gimp
sudo apt-get install -y inkscape
# Openshot video editor
sudo apt-get install -y openshot openshot-doc
# Qgifer: gifs out of videos
sudo apt-get install -y qgifer