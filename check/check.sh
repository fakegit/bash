#!/bin/sh

if [ ! -f "hostloc.py" ]; then
  wget https://github.com/fakegit/bash/raw/master/check/hostloc.py
fi
if [ ! -f "v2ex.py" ]; then
  wget https://github.com/fakegit/bash/raw/master/check/v2ex.py
fi

echo -e "Hostloc Account Info"
stty erase '^H' && read -p "Username: " hostloc_username
sed -i "s/username='/username='${hostloc_username}/g" hostloc.py
stty erase '^H' && read -s -p "Password: " hostloc_password
sed -i "s/passwd='/passwd='${hostloc_password}/g" hostloc.py

echo -e "V2ex Account Info"
stty erase '^H' && read -p "Username: " v2ex_username
sed -i "s/username='/username='${v2ex_username}/g" v2ex.py
stty erase '^H' && read -s -p "Password: " v2ex_password
sed -i "s/passwd='/passwd='${v2ex_password}/g" v2ex.py

#pip install requests
#python hostloc.py
#python v2ex.py

#echo "0 0 * * * python hostloc.py" >> /etc/crontab
#echo "0 0 * * * python v2ex.py" >> /etc/crontab
#service crond restart
