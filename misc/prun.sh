#!/usr/bin/env bash

pgrep -f "$1"

if [ $? -ne 0 ]
then
eval " $1" > /dev/null 2>&1
fi
