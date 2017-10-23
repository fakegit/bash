#!/bin/bash

# Creating temporary working directory
mkdir /tmp/proxy
cd /tmp/proxy

# Downloading latest stable 3proxy 0.8.11
wget --no-check-certificate https://github.com/z3APA3A/3proxy/archive/0.8.11.tar.gz

# Extracting archive
tar -xvzf 3proxy-0.8.11.tar.gz

# Compiling
cd 3proxy/
make -f Makefile.Linux

# Moving executable file to current user home directory
cd src/
mv 3proxy $HOME

# Downloading sample configuration to current user home directory
cd $HOME
wget --no-check-certificate https://raw.githubusercontent.com/fakegit/bash/master/misc/3proxy.cfg

# Fixing permission on files
chmod +x 3proxy

# Removing temporary working directory from tmp
rm -rf /tmp/proxy

# Creating folder for logs or otherwise 3proxy won't work
mkdir /var/log/3proxy
