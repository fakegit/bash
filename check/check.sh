#!/bin/sh

echo "0 0 * * * python hostloc.py" >> /etc/crontab
echo "0 0 * * * python v2ex.py" >> /etc/crontab
service cron restart
