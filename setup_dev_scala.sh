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
cd /opt
curl http://scalasbt.artifactoryonline.com/scalasbt/sbt-native-packages/org/scala-sbt/sbt/0.13.1/sbt.tgz | sudo tar -xz
sudo ln -s /opt/sbt/bin/sbt /usr/local/bin/sbt

# eclipse SBT plugin
mkdir -p ~/.sbt/0.13/plugins/
touch    ~/.sbt/0.13/plugins/plugins.sbt
echo "addSbtPlugin(\"com.typesafe.sbteclipse\" % \"sbteclipse-plugin\" % \"2.4.0\")" >> ~/.sbt/0.13/plugins/plugins.sbt

# Get Scala Eclipse IDE from TypeSafe (for Scala version 2.10.2)
sudo mkdir -p /opt/scalaide/
cd /opt/scalaide
MACHINE_TYPE=`uname -m`
if [ ${MACHINE_TYPE} == 'x86_64' ]; then
  # 64 bit Linux
  curl http://downloads.typesafe.com/scalaide-pack/3.0.2.vfinal-210-20131028/scala-SDK-3.0.2-vfinal-2.10-linux.gtk.x86_64.tar.gz | sudo tar -xz
else
  # 32 bit Linux
  curl http://downloads.typesafe.com/scalaide-pack/3.0.2.vfinal-210-20131028/scala-SDK-3.0.2-vfinal-2.10-linux.gtk.x86.tar.gz | sudo tar -xz
fi
sudo wget https://github.com/skyluc/scala-ide/diff_blob/e3989e512539d742582ff59774cd03fd7c7086ba/org.scala-ide.sdt.core/product.png?raw=true -O icon.png
sudo ln -s /opt/scalaide/eclipse/eclipse /usr/local/bin/scalaide
sudo cp ~/setup/assets/scalaide.desktop /usr/share/applications/

# Temporary workaround for Scala REPL
sudo mkdir -p ~/bin/scala_workaround
cd ~/bin/scala_workaround
echo "#\!/bin/bash" >> scala.sh
echo "sbt console" >> scala.sh
chmod +x scala.sh
sudo ln -s ~/bin/scala_workaround/scala.sh /usr/local/bin/scala

# Play Framework
# I'm using version 2.2.0 -- Change according to times
# Running play writes some files to directories within the archive,
# so don’t install to /opt, /usr/local or anywhere else you’d need special permission to write to.)
mkdir -p ~/bin
cd ~/bin
curl http://downloads.typesafe.com/play/2.2.0/play-2.2.0.zip -o tmp.zip
unzip tmp.zip
rm tmp.zip
sudo ln -s ~/bin/play-2.2.0/play /usr/local/bin/play
