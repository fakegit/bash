yum install -y epel-release
yum -y update
yum install -y transmission
service transmission-daemon start
service transmission-daemon stop
killall transmission-daemon

cp /var/lib/transmission/.config/transmission-daemon/settings.json /var/lib/transmission/.config/transmission-daemon/settings.json.org

vim /var/lib/transmission/.config/transmission-daemon/settings.json
service transmission-daemon restart
chkconfig transmission-daemon on



# CentOS 6
iptables -A INPUT -p tcp -m tcp --dport 80 -j ACCEPT
iptables -A INPUT -p tcp -m tcp --dport 443 -j ACCEPT
iptables -A INPUT -p tcp -m tcp --dport 9091 -j ACCEPT
iptables-save > /etc/sysconfig/iptables
service iptables restart


systemctl stop transmission-daemon # CentOS 7
systemctl restart transmission-daemon # CentOS 7
systemctl enable transmission-daemon # CentOS 7
# CentOS 7
firewall-cmd --permanent --zone=public --add-port=80/tcp
firewall-cmd --permanent --zone=public --add-port=443/tcp
firewall-cmd --permanent --zone=public --add-port=9091/tcp
firewall-cmd --reload
