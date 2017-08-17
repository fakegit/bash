#!/bin/sh
# apt-get update -y  # To get the latest package lists
# apt-get upgrade -y # To get the latest package lists
# apt-get install nano xorg xrdp jwm firefox chromium-browser flashplugin-installer -y
# service xrdp restart

cd ~
mkdir te
cd ~/te
# kilohits
wget -O "kilohits.zip" https://www.dropbox.com/s/akkpgc0jzck5eho/kilohits.com-viewer-linux-x64.zip?dl=1
unzip kilohits.zip
mv kilohits.com-viewer* Kilohits
rm -rf "kilohits.zip"
apt-get install -y libnss3-dev
# ~/te/kilohits/kilohits.com-viewer

wget -O "otohits.zip" http://www.otohits.net/dl/OtohitsApp_3107_Linux.zip
unzip otohits.zip
rm -rf "otohits.zip"
apt-get install -y libcurl4-openssl-dev
# ~/te/OtohitsApp/OtohitsApp
