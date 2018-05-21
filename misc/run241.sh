#!/bin/sh

ps -ef|grep firefox|grep -v grep
if [ $? -ne 0 ]
then
echo "start firefox ..."
firefox
fi

while [ 1 ]
do
  sleep 3600
  killall firefox  > /dev/null 2>&1
  sleep 5
  firefox > /dev/null 2>&1 &
done
