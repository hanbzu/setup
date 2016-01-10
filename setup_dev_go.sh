#!/bin/bash

GO_VERSION=1.5.2

sudo apt-get update
sudo apt-get -y upgrade

cd ~/Downloads
wget https://storage.googleapis.com/golang/go${GO_VERSION}.linux-amd64.tar.gz

tar -xvf go${GO_VERSION}.linux-amd64.tar.gz
sudo mv go /usr/local

sudo ln -s /usr/local/go/bin/go /usr/bin/go
sudo ln -s /usr/local/go/bin/gofmt /usr/bin/gofmt
sudo ln -s /usr/local/go/bin/godoc /usr/bin/godoc

