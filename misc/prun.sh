#!/usr/bin/env bash

pgrep -f "$1"

if [ $? -ne 0 ]
then
$1
fi
