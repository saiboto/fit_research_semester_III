#!/bin/bash
#-7-setFCMtemperatur.sh
echo '+============================+'
echo '| Installiere fcm-Temperatur-info  |'
echo '+============================+'

echo '#!/bin/sh' > /root/temperatur.sh
echo 'PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin' >> /root/temperatur.sh
echo 'set -e' >> /root/temperatur.sh
echo 'CURL=/usr/bin/curl' >> /root/temperatur.sh
echo 'TEMPERATURE=$(/usr/bin/vcgencmd measure_temp | cut -c 6- | cut -c -4)' >> /root/temperatur.sh
echo 'IPETH0=$(/sbin/ip -o -4 addr list eth0 | /usr/bin/awk '"'"'{printf $4}'"'"' | cut -d/ -f1)' >> /root/temperatur.sh
echo 'MACETH0=$(/sbin/ip link list eth0 | /usr/bin/awk '"'"'{printf $2}'"'"' | cut -d/ -f1)' >> /root/temperatur.sh
echo 'URL_BASE="https://espiot.io/fcm.php?messageTitle=IPAdresse:"$(hostname)"&messageBody="$IPETH0":"$TEMPERATURE"Grad&description="$MACETH0"+"$TEMPERATURE"&target=/topics/iotinfo"' >> /root/temperatur.sh
echo "CURL_OPTS='--stderr /tmp/err -v '" >> /root/temperatur.sh
echo '${CURL} ${CURL_OPTS} ${URL_BASE}' >> /root/temperatur.sh
echo 'exit 0' >> /root/temperatur.sh

chmod -v 711 /root/temperatur.sh
(crontab -u root -l ; echo "0 * * * * /root/temperatur.sh") | crontab -u root -
echo "okay"
echo '+==================+'
