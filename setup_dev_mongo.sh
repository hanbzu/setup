#!/bin/bash
# MongoDB database install script
# Installs latest stable mongodb-org package
# including mongodb-org-{server,shell,mongos,tools}

sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | sudo tee /etc/apt/sources.list.d/mongodb.list
sudo apt-get update -qq
sudo apt-get install -y mongodb-org

# The install process for Ubuntu is explained here
# http://docs.mongodb.org/manual/tutorial/install-mongodb-on-ubuntu/
# This file installs latest stable version but a specific version can also be installed
# The package can also be pinned so that Ubuntu does not automatically upgrade it when new vesions appear
# This is done the following way:
# echo "mongodb-org hold" | sudo dpkg --set-selections
# echo "mongodb-org-server hold" | sudo dpkg --set-selections
# echo "mongodb-org-shell hold" | sudo dpkg --set-selections
# echo "mongodb-org-mongos hold" | sudo dpkg --set-selections
# echo "mongodb-org-tools hold" | sudo dpkg --set-selections

# QUICKSTART
# ----------
#
# 1. Start MongoDB.
# sudo service mongod start
#
# 2. Verify that MongoDB has started successfully
# Check if file at
# /var/log/mongodb/mongod.log
# has line
# [initandlisten] waiting for connections on port <port>
# where <port> is the port configured in /etc/mongod.conf, 27017 by default.
#
# 3. Stop MongoDB.
# sudo service mongod stop
#
# 4. Restart MongoDB.
# sudo service mongod restart
