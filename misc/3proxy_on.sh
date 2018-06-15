#!/bin/sh

while [ 1 ]
do
  ps -ef|grep 3proxy|grep -v grep
  if [ $? -ne 0 ]
  then
  echo "start 3proxy ..."
  bash ~/3proxy_restart.sh
  else
  echo "3proxy is running."
  fi
  sleep 600
done
