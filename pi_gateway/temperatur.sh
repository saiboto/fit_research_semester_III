#!/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
set -e
CURL=/usr/bin/curl
TEMPERATURE=$(/usr/bin/vcgencmd measure_temp | cut -c 6- | cut -c -4)
IPETH0=$(/sbin/ip -o -4 addr list eth0 | /usr/bin/awk '{printf $4}' | cut -d/ -f1)
MACETH0=$(/sbin/ip link list eth0 | /usr/bin/awk '{printf $2}' | cut -d/ -f1)
URL_BASE="https://espiot.io/fcm.php?messageTitle=IPAdresse:"$(hostname)"&messageBody="$IPETH0":"$TEMPERATURE"Grad&description="$MACETH0"+"$TEMPERATURE"&target=/topics/iotinfo"
CURL_OPTS='--stderr /tmp/err -v '
${CURL} ${CURL_OPTS} ${URL_BASE}
exit 0
