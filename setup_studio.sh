#!/bin/bash
# Installation AND REMOVAL of apps in order to configure the
# system for image and video editing 
# -------------------------------------------
# CAUTION: In case you use this script make
# sure you understand the commands
# -------------------------------------------
echo "We're going to remove Shotwell, and then install"
echo "Darktable, Gimp, Inkscape, Pitivi, Qgifer, Blender and Ufraw."
read -p "Are you sure? " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
	# ADDING REPOSITORIES
	# Darktable
	sudo add-apt-repository -y ppa:pmjdebruijn/darktable-release-plus
	# Gimp
	sudo add-apt-repository -y ppa:otto-kesselgulasch/gimp
	# Qgifer
	sudo add-apt-repository -y ppa:samrog131/ppa
	# Inkscape
	sudo add-apt-repository -y ppa:inkscape.dev/stable
	# SimpleScreenRecorder
	sudo add-apt-repository -y ppa:maarten-baert/simplescreenrecorder
	# ...and now update
	sudo apt-get -qq update

	# INSTALLING PACKAGES
	# We will use Darktable instead of Shotwell
	sudo apt-get install -y darktable
	# Raster & vector image editing: Gimp and Inkscape
	sudo apt-get install -y gimp gimp-plugin-registry gimp-gmic
	sudo apt-get install -y inkscape
	# Pitivi video editor
	sudo apt-get install -y pitivi
	# Qgifer: gifs out of videos
	sudo apt-get install -y qgifer
	# Blender
	sudo apt-get install -y blender
	# RAW image support
	sudo apt-get install -y ufraw gimp-ufraw ufraw-batch
	# Screencasting applications
  sudo apt-get install -y recordmydesktop simplescreenrecorder
  # Command line video manipulation
  sudo apt-get install -y libav-tools transcode

fi
