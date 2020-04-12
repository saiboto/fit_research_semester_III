#!/bin/bash
#pi-update.h
echo '+====================================+'
echo '| Aktualisiere Sourcelist und System |'
echo '+====================================+'

apt-get -y update
apt-get -y upgrade
apt-get -y dist-upgrade

apt-get -y install ntpdate
apt-get -y install incron
apt-get -y install curl
apt-get -y install unzip
apt-get -y install git
apt-get -y install lsof
apt-get -y install mlocate
updatedb
