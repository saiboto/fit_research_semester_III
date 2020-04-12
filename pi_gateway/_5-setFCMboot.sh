#!/bin/bash
#-6-setFCMboot.sh
echo '+============================+'
echo '| Installiere fcm-Boot-info  |'
echo '+============================+'

echo '#!/bin/sh' > /root/fcm.sh
echo 'FLAGFILE=/var/run/work-was-already-done-for-eth0' >> /root/fcm.sh
echo '# only run once' >> /root/fcm.sh
echo 'if [ -e $FLAGFILE ]; then' >> /root/fcm.sh
echo 'exit 0' >> /root/fcm.sh
echo 'fi' >> /root/fcm.sh
echo '' >> /root/fcm.sh
echo 'PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin' >> /root/fcm.sh
echo 'set -e' >> /root/fcm.sh
echo 'sleep 10' >> /root/fcm.sh
echo 'CURL=/usr/bin/curl' >> /root/fcm.sh
echo "IPETH0="'$(/sbin/ip -o -4 addr list eth0 | /usr/bin/awk '"'"'{printf $4}'"'"'| cut -d/ -f1)' >> /root/fcm.sh
echo 'URL_BASE="https://espiot.io/fcm.php?messageTitle=IPAdresse:"$(hostname)"&messageBody="$IPETH0"&description="$IPETH0"&target=/topics/iotinfo"' >> /root/fcm.sh
echo "CURL_OPTS='--stderr /tmp/err -v '" >> /root/fcm.sh
#Debug only
#printf 'IP: %s' "${IPETH0}" > /tmp/ip-eth0
#printf 'IP: %s' "${IPWLAN0}" > /tmp/ip-wlan0
#printf 'URL_BASE: %s' "${URL_BASE}" > /tmp/url_base
#printf "${WGET} ${WGET_OPTS} ${URL_BASE}" > /tmp/wgetCMD
#printf "${CURL} ${CURL_OPTS} ${URL_BASE}" > /tmp/curlCMD

echo '${CURL} ${CURL_OPTS} ${URL_BASE}' >> /root/fcm.sh
echo 'touch $FLAGFILE' >> /root/fcm.sh
echo 'exit 0' >> /root/fcm.sh
chmod -v 711 /root/fcm.sh

# Ersetze "foo" mit "bar" AUSSER in Zeilen die "baz" enthalten
sed -i '/exit/d' /etc/rc.local
sed -i '/fcm/d' /etc/rc.local
echo '/root/fcm.sh &>null' >> /etc/rc.local
echo 'exit 0' >> /etc/rc.local

echo "okay"
echo '+==================+'
