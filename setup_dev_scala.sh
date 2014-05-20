#!/bin/bash
# This script will prepare a development environment for Scala
# It's based on the guidelines in the course 'Functional Programming
# principles in Scala' by the École Polytechnique Fédérale de Lausanne
# (with professor Martin Odersky)

# Prerrequisite
sudo apt-get install -y curl

# JDK
sudo apt-get install -y openjdk-7-jdk

# SBT
# remove sbt:>  sudo apt-get purge sbt.
SBT_VERSION=0.13.2
cd ~/Downloads
wget http://dl.bintray.com/sbt/debian/sbt-$SBT_VERSION.deb
sudo dpkg -i sbt-$SBT_VERSION.deb
sudo apt-get update -qq
sudo apt-get install -y sbt

# Scala-lang
# http://downloads.typesafe.com/scala/2.11.0/scala-2.11.0.deb
# But it changes according to version
SCALA_VERSION=2.11.0
sudo apt-get remove scala-library scala
wget http://downloads.typesafe.com/scala/$SCALA_VERSION/scala-$SCALA_VERSION.deb
sudo dpkg -i scala-$SCALA_VERSION.deb
sudo apt-get update -qq
sudo apt-get install -y scala

# eclipse SBT plugin
SBT_MAJOR_VERSION=0.13
SBT_PLUGIN_VERSION=2.5.0
mkdir -p ~/.sbt/$SBT_MAJOR_VERSION/plugins/
touch    ~/.sbt/$SBT_MAJOR_VERSION/plugins/plugins.sbt
echo "addSbtPlugin(\"com.typesafe.sbteclipse\" % \"sbteclipse-plugin\" % \"$SBT_PLUGIN_VERSION\")" >> ~/.sbt/$SBT_MAJOR_VERSION/plugins/plugins.sbt

# Get Scala Eclipse IDE from TypeSafe -- for Scala version 2.11.x (MAY-2014)
# Was: http://downloads.typesafe.com/scalaide-pack/3.0.4.vfinal-211-20140421/scala-SDK-3.0.4-2.11-2.11-linux.gtk.x86_64.tar.gz
sudo mkdir -p /opt/scalaide/
cd /opt/scalaide
MACHINE_TYPE=`uname -m`
if [ ${MACHINE_TYPE} == 'x86_64' ]; then
  # 64 bit Linux
  curl http://downloads.typesafe.com/scalaide-pack/3.0.4.vfinal-211-20140421/scala-SDK-3.0.4-2.11-2.11-linux.gtk.x86_64.tar.gz | sudo tar -xz
else
  # 32 bit Linux
  curl http://downloads.typesafe.com/scalaide-pack/3.0.4.vfinal-211-20140421/scala-SDK-3.0.4-2.11-2.11-linux.gtk.x86.tar.gz | sudo tar -xz
fi
sudo wget https://pbs.twimg.com/profile_images/1079285671/twitter.png -O icon.png
sudo ln -s /opt/scalaide/eclipse/eclipse /usr/local/bin/scalaide
sudo cp ~/setup/assets/scalaide.desktop /usr/share/applications/

# Temporary workaround for Scala REPL
#mkdir -p ~/bin/scala_workaround
#cd ~/bin/scala_workaround
#echo "#\!/bin/bash" >> scala.sh
#echo "sbt console" >> scala.sh
#chmod +x scala.sh
#sudo ln -s ~/bin/scala_workaround/scala.sh /usr/local/bin/scala

# Play Framework
# I'm using version 2.2.2 -- Change according to times
# Running play writes some files to directories within the archive,
# so don’t install to /opt, /usr/local or anywhere else you’d need special permission to write to.
mkdir -p ~/bin
cd ~/bin
PLAY_VERSION=2.2.2
curl http://downloads.typesafe.com/play/$PLAY_VERSION/play-$PLAY_VERSION.zip -o tmp.zip
unzip tmp.zip
rm tmp.zip
sudo ln -s ~/bin/play-$PLAY_VERSION/play /usr/local/bin/play

# Typesafe activator
mkdir -p ~/bin
cd ~/bin
ACTIVATOR_VERSION=1.1.3
curl http://downloads.typesafe.com/typesafe-activator/1.0.10/typesafe-activator-$ACTIVATOR_VERSION.zip -o tmp.zip
unzip tmp.zip
rm tmp.zip
sudo ln -s ~/bin/activator-$ACTIVATOR_VERSION/activator /usr/local/bin/activator