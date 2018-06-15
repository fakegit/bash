#!/bin/sh

while [ 1 ]
do
  ps -ef|grep 3proxy|grep -v grep
  if [ $? -ne 0 ]
  then
  echo "start 3proxy ..."
  /usr/bin/3proxy $HOME/3proxy.cfg > /dev/null 2>&1 &
  else
  echo "3proxy is running."
  fi
  sleep 600
done
