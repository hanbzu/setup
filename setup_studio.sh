#!/bin/bash
# Installation AND REMOVAL of apps in order to configure the
# system for image and video editing 
# -------------------------------------------
# CAUTION: In case you use this script make
# sure you understand the commands
# -------------------------------------------

# REMOVING PACKAGES WE WONT USE
# We will not use Shotwell
sudo apt-get remove -y --purge shotwell

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
sudo apt-get -qq update

# Prerrequisites. From here (sept.2013):
# http://indykish.wordpress.com/2013/09/24/screencast-in-ubuntu-using-openshot/
sudo apt-get remove -y ffmpeg
sudo apt-get purge -y ffmpeg
sudo add-apt-repository -y ppa:jon-severinsson/ffmpeg
sudo apt-get -qq update
sudo apt-get install -y ffmpeg
sudo add-apt-repository -y ppa:sunab/kdenlive-release
sudo apt-get -qq update
sudo apt-get install -y libmlt5 libmlt-data libmlt++3 python-mlt5 melt libsox-fmt-all
sudo apt-get upgrade -y libmlt5 libmlt-data libmlt++3 python-mlt5 melt libsox-fmt-all
sudo apt-get install -y ladspa-sdk
sudo apt-get install -y frei0r-plugins

# INSTALLING PACKAGES
# We will use Darktable instead of Shotwell
sudo apt-get install -y darktable
# Raster & vector image editing: Gimp and Inkscape
sudo apt-get install -y gimp
sudo apt-get install -y inkscape
# Openshot video editor
rm -r  ~/.openshot
sudo apt-get install -y openshot openshot-doc
# Qgifer: gifs out of videos
sudo apt-get install -y qgifer
# Blender
sudo apt-get install blender
