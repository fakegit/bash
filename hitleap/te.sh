#!/bin/sh
# apt-get update -y  # To get the latest package lists
# apt-get upgrade -y # To get the latest package lists
# apt-get install nano xorg xrdp jwm firefox chromium-browser flashplugin-installer -y
# service xrdp restart
apt-get install vim screen unzip -y

cd ~
mkdir te
cd ~/te
# kilohits
wget -O "kilohits.zip" https://www.dropbox.com/s/akkpgc0jzck5eho/kilohits.com-viewer-linux-x64.zip?dl=1
unzip kilohits.zip
mv kilohits.com-viewer* Kilohits
rm -rf "kilohits.zip"
apt-get install -y libnss3-dev
# ~/te/Kilohits/kilohits.com-viewer

wget -O "otohits.zip" http://www.otohits.net/dl/OtohitsApp_3107_Linux.zip
unzip otohits.zip
rm -rf "otohits.zip"
apt-get install -y libcurl4-openssl-dev
# ~/te/OtohitsApp/OtohitsApp

cat > $HOME/kilohits_restart.sh << EOF #!/bin/sh
ps -ef | grep kilohits | grep -v grep | cut -c 9-15 | xargs kill -s 9 > /dev/null 2>&1
/usr/bin/3proxy $HOME/3proxy.cfg > /dev/null 2>&1 &
EOF
chmod +x $HOME/3proxy_restart.sh

echo "$HOME/3proxy_restart.sh" >> /etc/rc.local
echo "* /24 * * * $HOME/3proxy_restart.sh" >> /etc/crontab
