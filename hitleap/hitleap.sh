#!/bin/sh
# apt-get update -y  # To get the latest package lists
# apt-get upgrade -y # To get the latest package lists
# apt-get install nano xorg xrdp jwm firefox chromium-browser flashplugin-installer -y
# service xrdp restart

wget -O "HitLeap Viewer.tar.xz" -P /root https://hitleap.com/viewer/download?platform=Linux
tar xpvf "/root/HitLeap Viewer.tar.xz" -C /root
#mv HitLeap-Viewer.desktop hitleap
#chmod +x hitleap
chmod +x HitLeap-Viewer.desktop

#cat > launch-hitleap.sh << EOF1
#until "./hitleap"; do                                 
#    echo "HitLeap crashed with exit code $?.  Respawning..." >&2
#    sleep 1
#done
#EOF1

cat > $HOME/hitleap_restart.sh << EOF #!/bin/sh
ps -ef | grep hitleap | grep -v grep | cut -c 9-15 | xargs kill -s 9 > /dev/null 2>&1
$HOME/HitLeap-Viewer.desktop > /dev/null 2>&1 &
EOF

echo "$HOME/hitleap_restart.sh" >> /etc/rc.local
echo "* /2 * * * $HOME/hitleap_restart.sh" >> /etc/crontab

#chmod +x launch-hitleap.sh
rm -rf "HitLeap Viewer.tar.xz"
#end
