#!/bin/sh

while [ 1 ]
do
  ps -ef|grep firefox|grep -v grep
  if [ $? -ne 0 ]
  then
  echo "start firefox ..."
  firefox -new-tab https://google.com &> /dev/null &
  else
  echo "firefox is running."
  fi
  sleep 30
done
