#!/bin/sh
# apt-get update -y  # To get the latest package lists
# apt-get upgrade -y # To get the latest package lists
# apt-get install nano xorg xrdp jwm firefox chromium-browser flashplugin-installer -y
# service xrdp restart
apt-get install vim screen unzip firefox -y
apt-get install -y libnss3-dev
apt-get install -y libcurl4-openssl-dev

te_dir=$HOME/te
kh_dir=$HOME/te/Kilohits
oh_dir=$HOME/te/Otohits

mkdir -p $te_dir
cd $te_dir

# kilohits
wget -O "kilohits.zip" https://www.dropbox.com/s/akkpgc0jzck5eho/kilohits.com-viewer-linux-x64.zip?dl=1
unzip kilohits.zip
mv kilohits.com-viewer* $kh_dir
rm -rf kilohits.com-viewer-*
rm -rf "kilohits.zip"
# ~/te/Kilohits/kilohits.com-viewer

cat > $HOME/kilohits_restart.sh << EOF #!/bin/sh
ps -ef | grep -i kilohits | grep -v grep | cut -c 9-15 | xargs kill -s 9 > /dev/null 2>&1
$kh_dir/kilohits.com-viewer > /dev/null 2>&1 &
#$kh_dir/kilohits.com-viewer --username --password > /dev/null 2>&1 &
EOF

chmod +x $HOME/kilohits_restart.sh

echo "$HOME/kilohits_restart.sh" >> /etc/rc.local
echo "* /2 * * * $HOME/kilohits_restart.sh" >> /etc/crontab

wget -O "otohits.zip" http://www.otohits.net/dl/OtohitsApp_3107_Linux.zip
unzip otohits.zip
mv OtohitsApp $oh_dir
rm -rf "otohits.zip"
# ~/te/Otohits/OtohitsApp

cat > $HOME/otohits_restart.sh << EOF #!/bin/sh
ps -ef | grep -i otohits | grep -v grep | cut -c 9-15 | xargs kill -s 9 > /dev/null 2>&1
$oh_dir/OtohitsApp > /dev/null 2>&1 &
EOF

chmod +x $HOME/otohits_restart.sh

echo "$HOME/otohits_restart.sh" >> /etc/rc.local
#echo "* /2 * * * $HOME/otohits_restart.sh" >> /etc/crontab
