#!/bin/bash

yum install -y make gcc

# Creating temporary working directory
mkdir /tmp/3proxy
cd /tmp/3proxy

# Downloading latest stable 3proxy 0.8.11
wget --no-check-certificate https://github.com/z3APA3A/3proxy/archive/0.8.11.tar.gz

# Extracting archive
tar -xvzf 0.8.11.tar.gz

# Compiling
cd 3proxy-0.8.11
make -f Makefile.Linux

# Moving executable file to current user home directory
cd src/
# mv 3proxy $HOME

# Fixing permission on files
# chmod +x 3proxy

mv 3proxy /usr/bin
chmod +x /usr/bin/3proxy

# Downloading sample configuration to current user home directory
cd $HOME
wget --no-check-certificate https://raw.githubusercontent.com/fakegit/bash/master/misc/3proxy.cfg



# Removing temporary working directory from tmp
rm -rf /tmp/3proxy

# Creating folder for logs or otherwise 3proxy won't work
mkdir /var/log/3proxy

# /usr/bin/3proxy $HOME/3proxy.cfg
# ps ax | grep 3proxy | grep -v grep
# kill -9 pid

