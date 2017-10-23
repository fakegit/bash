cat /proc/sys/net/ipv6/conf/all/disable_ipv6
vim /etc/sysctl.conf
net.ipv6.conf.all.disable_ipv6 = 1
net.ipv6.conf.default.disable_ipv6 = 1
net.ipv6.conf.lo.disable_ipv6 = 1
sudo sysctl -p
cat /proc/sys/net/ipv6/conf/all/disable_ipv6
