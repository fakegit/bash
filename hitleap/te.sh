#!/bin/sh
# apt-get update -y  # To get the latest package lists
# apt-get upgrade -y # To get the latest package lists
# apt-get install nano xorg xrdp jwm firefox chromium-browser flashplugin-installer -y
# service xrdp restart

# kilohits
wget -O "kilohits.zip" -P /root https://www.dropbox.com/s/akkpgc0jzck5eho/kilohits.com-viewer-linux-x64.zip?dl=1
tar xpvf "/root/kilohits.zip" -C /root
rm -rf "kilohits.zip"

wget -O "otohits.zip" -P /root http://www.otohits.net/dl/OtohitsApp_3107_Linux.zip
tar xpvf "/root/otohits.zip" -C /root
rm -rf "otohits.zip"
