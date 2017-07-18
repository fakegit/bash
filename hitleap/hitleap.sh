#!/bin/sh
apt-get update -y  # To get the latest package lists
apt-get upgrade -y # To get the latest package lists
apt-get install nano xorg xrdp jwm firefox chromium-browser flashplugin-installer -y
service xrdp restart

wget -O "HitLeap Viewer.tar.xz" -P /root https://hitleap.com/viewer/latest?platform=Linux
tar xpvf "/root/HitLeap Viewer.tar.xz" -C /root
mv HitLeap-Viewer.desktop hitleap
chmod +x hitleap

cat > launch-hitleap.sh << EOF1
until "./hitleap"; do                                 
    echo "HitLeap crashed with exit code $?.  Respawning..." >&2
    sleep 1
done
EOF1

chmod +x launch-hitleap.sh
chmod +x hitleap
rm -rf "HitLeap Viewer.tar.xz"
#end
