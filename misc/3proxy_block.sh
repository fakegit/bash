#!/bin/sh

sed -i '
/#Nsrecord End/ i\
nsrecord wafijaya.com 0.0.0.0\
nsrecord bitcoincoral.com 0.0.0.0
' < 3proxy.cfg
