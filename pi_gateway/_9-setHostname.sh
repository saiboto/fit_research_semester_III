#!/bin/bash
#setHostname.sh
source _1-ttn-config.sh
echo '+==================================+'
echo '| Konfiguriere hosts und hostname  |'
echo "| Host:$HOST"
echo '+==================================+'
sed -i 's/^127\.0\.0\.1.*/127\.0\.0\.1\tlocalhost/' /etc/hosts
sed -i "s/^127\.0\.1\.1.*/127\.0\.1\.1\t$HOST/" /etc/hosts
#sed -i "s/^127\.0\.1\.1.*/$(/sbin/ifconfig eth0 | grep 'inet ' | cut -dt  -f2 | awk '{ print $1}')\t$HOST/" /etc/hosts
hostnamectl set-hostname $HOST
hostname
hostname -f
echo '+==================================+'
