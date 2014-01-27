#!/bin/bash

# Import our signing key
wget -O - http://debian.neo4j.org/neotechnology.gpg.key | sudo apt-key add - 
# Create an Apt sources.list file
sudo echo 'deb http://debian.neo4j.org/repo stable/' > /etc/apt/sources.list.d/neo4j.list
# Find out about the files in our repository
sudo apt-get update -qq
# Install Neo4j, community edition
sudo apt-get install -y neo4j
# start neo4j server, available at http://localhost:7474 of the target machine
# I don't have to start it right now
#neo4j start
