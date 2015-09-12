#!/bin/bash
# This script will prepare a development environment for Scala
# It's based on the guidelines in the course 'Functional Programming
# principles in Scala' by the École Polytechnique Fédérale de Lausanne
# (with professor Martin Odersky)

# Prerrequisite
sudo apt-get install -y curl

# JDK
sudo apt-get install -y openjdk-7-jdk
# openjdk-8 is not available for 14.04 only later versions, so use repo
sudo add-apt-repository ppa:openjdk-r/ppa
sudo apt-get update -qq
sudo apt-get install -y openjdk-8-jdk
# Choose java alternatives
sudo update-alternatives --config java

# SBT
# remove sbt:>  sudo apt-get purge sbt.
echo "deb https://dl.bintray.com/sbt/debian /" | sudo tee -a /etc/apt/sources.list.d/sbt.list
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 642AC823
sudo apt-get update
sudo apt-get install sbt
# Old method:
#SBT_VERSION=0.13.7
#cd ~/Downloads
#wget http://dl.bintray.com/sbt/debian/sbt-$SBT_VERSION.deb
#sudo dpkg -i sbt-$SBT_VERSION.deb
#rm ~/Downloads/sbt-$SBT_VERSION.deb

# Scala-lang
# http://downloads.typesafe.com/scala/2.11.0/scala-2.11.0.deb
# But it changes according to version
SCALA_VERSION=2.11.7
sudo apt-get remove scala-library scala
cd ~/Downloads
wget http://downloads.typesafe.com/scala/$SCALA_VERSION/scala-$SCALA_VERSION.deb
sudo dpkg -i scala-$SCALA_VERSION.deb
rm ~/Downloads/scala-$SCALA_VERSION.deb

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
# ScalaIde icon
sudo wget https://lh3.googleusercontent.com/-OygjFJlNgQQ/AAAAAAAAAAI/AAAAAAAAAFQ/FPtP5KKkWEc/photo.jpg -O icon.png
sudo ln -s /opt/scalaide/eclipse/eclipse /usr/local/bin/scalaide
sudo cp ~/setup/assets/scalaide.desktop /usr/share/applications/

# TuxJDK https://code.google.com/p/tuxjdk/ is an alternative JVM for Linux
# It is made for Linux developers and I download it because it solves some font issues with IntelliJ IDEA
# See here:
# http://askubuntu.com/questions/454361/font-in-intellij-idea-on-ubuntu-14-04
TUX_JVM_VER=jdk-8u5-tuxjdk-b08
wget http://urshulyak.com:85/${TUX_JVM_VER}.tar.gz
tar -zxvf ${TUX_JVM_VER}.tar.gz
sudo mv ${TUX_JVM_VER} /usr/lib/jvm
rm ${TUX_JVM_VER}.tar.gz

# Install IntelliJ IDEA from JetBrains
IDEA_VER=14.1.4
mkdir -p ~/Downloads/idea_install
cd ~/Downloads/idea_install
curl http://download-cf.jetbrains.com/idea/ideaIC-${IDEA_VER}.tar.gz | tar -xz
sudo mkdir -p /opt/idea/
cd /opt/idea
sudo mv ~/Downloads/idea_install/idea*/* .
sudo wget http://drslash.com/wp-content/uploads/2014/07/Intellij-Idea.png -O icon.png
sudo ln -s /opt/idea/bin/idea.sh /usr/local/bin/idea
sudo cp ~/setup/assets/idea.desktop /usr/share/applications/
# Once everything is setup, a scala plugin needs to be added through the IDEA interface.
# Additionally, if you want to correct the poor appearance under Ubuntu Linux,
# Follow the instructions here:
# http://askubuntu.com/questions/454361/font-in-intellij-idea-on-ubuntu-14-04

# Typesafe activator
mkdir -p ~/bin
cd ~/bin
ACTIVATOR_VERSION=1.3.6
curl -L http://downloads.typesafe.com/typesafe-activator/$ACTIVATOR_VERSION/typesafe-activator-$ACTIVATOR_VERSION.zip -o tmp.zip
unzip tmp.zip
rm tmp.zip
sudo ln -s ~/bin/activator-$ACTIVATOR_VERSION/activator /usr/local/bin/activator

