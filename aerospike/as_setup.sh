#!/bin/bash

cd /tmp
wget -q -O as.tgz 'http://aerospike.com/download/server/latest/artifact/ubuntu12'

cd /tmp
tar -xvf as.tgz
cd ./aerospike-server-community-*-ubuntu*
sudo ./asinstall

sudo update-rc.d aerospike defaults
sudo service aerospike start
