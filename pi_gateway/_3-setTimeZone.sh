#!/bin/bash
#setTimeZone.sh

echo '+====================================+'
echo '| Setze Zeitzone auf "Europe/Berlin" |'
echo '+====================================+'
echo "Europe/Berlin" > /etc/timezone
#dpkg-reconfigure -f noninteractive tzdata
#/usr/sbin/ntpdate 3.de.pool.ntp.org
timedatectl set-timezone Europe/Berlin
# crontab -e
# 0 0 * * * /usr/sbin/ntpdate 3.de.pool.ntp.org
(crontab -u root -l ; echo "0 0 * * * /usr/sbin/ntpdate 3.de.pool.ntp.org") | crontab -u root -
echo '+====================================+'
