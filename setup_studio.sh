#!/bin/bash
# Installation AND REMOVAL of apps in order to configure the
# system for image and video editing 
# -------------------------------------------
# CAUTION: In case you use this script make
# sure you understand the commands
# -------------------------------------------
echo "We're going to remove Shotwell, and then install"
echo "Darktable, Gimp, Inkscape, Openshot, Qgifer, Blender and Ufraw."
read -p "Are you sure? " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
	# REMOVING PACKAGES WE WONT USE
	# We will not use Shotwell
	sudo apt-get remove -y --purge shotwell

	# ADDING REPOSITORIES
	# Darktable
	sudo add-apt-repository -y ppa:pmjdebruijn/darktable-release-plus
	# Gimp
	sudo add-apt-repository -y ppa:otto-kesselgulasch/gimp
	# Openshot
	# IMPORTANT !!!!!
	# This PPA is sometimes giving problems
	sudo add-apt-repository -y ppa:openshot.developers/ppa
	# Qgifer
	sudo add-apt-repository -y ppa:samrog131/ppa
	# Inkscape
	sudo add-apt-repository -y ppa:inkscape.dev/stable
	# ...and now update
	sudo apt-get -qq update

  # Screencasting applications
  sudo apt-get install recordmydesktop

	# INSTALLING PACKAGES
	# We will use Darktable instead of Shotwell
	sudo apt-get install -y darktable
	# Raster & vector image editing: Gimp and Inkscape
	sudo apt-get install -y gimp
	sudo apt-get install -y gimp-plugin-registry
	sudo apt-get install -y gimp-gmic
	sudo apt-get install -y inkscape
	# Openshot video editor
	rm -r  ~/.openshot
	sudo apt-get install -y openshot openshot-doc
	# Qgifer: gifs out of videos
	sudo apt-get install -y qgifer
	# Blender
	sudo apt-get install -y blender
	# RAW image support
	sudo apt-get install -y ufraw gimp-ufraw ufraw-batch
fi
