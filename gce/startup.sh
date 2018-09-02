#!/bin/bash

#
# runs as root
#

apt-get update
apt-get install unzip -y

mkdir -p /root/downloads

# go
cd /root/downloads
wget https://dl.google.com/go/go1.11.linux-amd64.tar.gz
tar xzf go1.11.linux-amd64.tar.gz -C /usr/local

# protoc
cd /root/downloads
wget https://github.com/protocolbuffers/protobuf/releases/download/v3.6.1/protoc-3.6.1-linux-x86_64.zip
mkdir -p /usr/local/protobuf
unzip -d /usr/local/protobuf protoc-3.6.1-linux-x86_64.zip

mkdir -p /root/go/bin

echo "export GOPATH=\$HOME/go" >> /root/.profile
echo "export PATH=\$GOPATH/bin:/usr/local/go/bin:/usr/local/protobuf/bin:\$PATH" >> /root/.profile
source /root/.profile
echo $PATH

go get github.com/googleapis/kiosk
