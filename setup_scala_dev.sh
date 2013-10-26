#!/bin/bash
# This script will prepare a development environment for Scala
# It's based on the guidelines in the course 'Functional Programming
# principles in Scala' by the École Polytechnique Fédérale de Lausanne
# (with professor Martin Odersky)

# JDK
sudo apt-get install -y openjdk-7-jdk

# SBT
mkdir -p ~/bin
cd ~/bin
curl http://scalasbt.artifactoryonline.com/scalasbt/sbt-native-packages/org/scala-sbt/sbt/0.12.4/sbt.tgz | tar -xz

# Get Scala Eclipse IDE from TypeSafe (for Scala version 2.10.2)
cd ~/bin
MACHINE_TYPE=`uname -m`
if [ ${MACHINE_TYPE} == 'x86_64' ]; then
  # 64 bit Linux
  curl http://downloads.typesafe.com/scalaide-pack/3.0.1.vfinal-210-20130718/scala-SDK-3.0.1-vfinal-2.10-linux.gtk.x86_64.tar.gz | tar -xz
else
  # 32 bit Linux
  curl http://downloads.typesafe.com/scalaide-pack/3.0.1.vfinal-210-20130718/scala-SDK-3.0.1-vfinal-2.10-linux.gtk.x86.tar.gz | tar -xz
fi
