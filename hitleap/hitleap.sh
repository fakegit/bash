#!/bin/sh
# apt-get update -y  # To get the latest package lists
# apt-get upgrade -y # To get the latest package lists
# apt-get install nano xorg xrdp jwm firefox chromium-browser flashplugin-installer -y
# service xrdp restart
apt-get install vim screen unzip firefox -y

te_dir=$HOME/te
hl_dir=$HOME/te/Hitleap
mkdir -p $hl_dir
cd $hl_dir

wget -O "HitLeap Viewer.tar.xz" https://hitleap.com/viewer/download?platform=Linux
tar xpvf "HitLeap Viewer.tar.xz"
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
cd $hl_dir
./HitLeap-Viewer.desktop > /dev/null 2>&1 &
cd $HOME
EOF

chmod +x $HOME/hitleap_restart.sh

echo "$HOME/hitleap_restart.sh" >> /etc/rc.local
echo "* /2 * * * $HOME/hitleap_restart.sh" >> /etc/crontab

#chmod +x launch-hitleap.sh
rm -rf "$hl_dir/HitLeap Viewer.tar.xz"
cd $HOME
#$HOME/hitleap_restart.sh
#end
