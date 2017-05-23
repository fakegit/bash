#!/bin/bash
yum install -y epel-release
yum groupinstall -y xfce
yum install -y tigervnc-server
cp /usr/lib/systemd/system/vncserver@.service /etc/systemd/system/vncserver@.service
echo && stty erase '^H' && read -p "Input User:" user
sed -i -- "s/<USER>/${user}/g" /etc/systemd/system/vncserver@.service
su - ${user}
vncserver
cat > /home/${user}/.vnc/xstartup<<EOF
#!/bin/sh
unset SESSION_MANAGER
unset DBUS_SESSION_BUS_ADDRESS
exec /etc/X11/xinit/xinitrc
/usr/bin/startxfce4
EOF
chmod +x ~/.vnc/xstartup
sudo su
systemctl daemon-reload
echo && stty erase '^H' && read -p "Input Display:" display
systemctl start vncserver@:${display}.service
systemctl enable vncserver@:${display}.service
ln -s '/etc/systemd/system/vncserver@:${display}.service' '/etc/systemd/system/multi-user.target.wants/vncserver@:${display}.service'
