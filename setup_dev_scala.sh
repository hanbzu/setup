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
SBT_VERSION=0.13.5
cd ~/Downloads
wget http://dl.bintray.com/sbt/debian/sbt-$SBT_VERSION.deb
sudo dpkg -i sbt-$SBT_VERSION.deb
rm ~/Downloads/sbt-$SBT_VERSION.deb

# Scala-lang
# http://downloads.typesafe.com/scala/2.11.0/scala-2.11.0.deb
# But it changes according to version
SCALA_VERSION=2.11.2
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
sudo mkdir -p /usr/lib/jvm
cd /usr/lib/jvm
TUX_JVM_VER=jdk-8u25-tuxjdk-b01
URL=https://googledrive.com/host/0B68yuEpDuq6waUl5UjNTUWRlYTQ/${TUX_JVM_VER}.tar.xz
echo ${URL}
curl -L ${URL} | sudo tar -xJ
# The JDK will be in /usr/lib/jvm/${TUX_JVM_VER}

# Install IntelliJ IDEA from JetBrains
IDEA_VER=14.0.1
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
# Once TuxJDK has been installed in /usr/lib/jvm you need to change a line in /opt/idea/bin/idea.sh:
# FROM this:
# eval "$JDK/bin/java" $ALL_JVM_ARGS -Djb.restart.code=88 $MAIN_CLASS_NAME "$@"
# TO this:
# eval "/usr/lib/jvm/jdk-8u25-tuxjdk-b01/bin/java" $ALL_JVM_ARGS -Djb.restart.code=88 $MAIN_CLASS_NAME "$@"
# Please update the TuxJDK version accordingly

# Typesafe activator
mkdir -p ~/bin
cd ~/bin
ACTIVATOR_VERSION=1.2.7
curl -L http://downloads.typesafe.com/typesafe-activator/$ACTIVATOR_VERSION/typesafe-activator-$ACTIVATOR_VERSION.zip -o tmp.zip
unzip tmp.zip
rm tmp.zip
sudo ln -s ~/bin/activator-$ACTIVATOR_VERSION/activator /usr/local/bin/activator

