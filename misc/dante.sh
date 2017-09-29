#!/bin/bash

yum -y install wget gcc openssl-devel pcre-devel zlib-devel libtool c++ pam-devel pam ||exit

wget http://www.inet.no/dante/files/dante-1.4.2.tar.gz && tar -xvzf dante-1.4.2.tar.gz && cd dante-1.4.2
./configure && make && make install

cat > /etc/sockd.conf << EOF
logoutput: /var/log/socks.log

internal: eth0 port = 6572
external: eth0

method: none
user.privileged: root
user.notprivileged: nobody

client pass {
        from: 0.0.0.0/0 to: 0.0.0.0/0
        log: error connect disconnect
}


client block {
        from: 0.0.0.0/0 to: 0.0.0.0/0
        log: connect error
}

pass {
        from: 0.0.0.0/0 to: 0.0.0.0/0
        log: error connect disconnect
}

block {
        from: 0.0.0.0/0 to: 0.0.0.0/0
        log: connect error
}
EOF

echo "/usr/local/sbin/sockd &" >> /etc/rc.local
crontab -l | { cat; echo "* /2 * * * sockd restart"; } | crontab -
