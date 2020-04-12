#!/bin/sh
FLAGFILE=/var/run/work-was-already-done-for-eth0
# only run once
if [ -e $FLAGFILE ]; then
exit 0
fi

PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
set -e
sleep 10
CURL=/usr/bin/curl
IPETH0=$(/sbin/ip -o -4 addr list eth0 | /usr/bin/awk '{printf $4}'| cut -d/ -f1)
URL_BASE="https://espiot.io/fcm.php?messageTitle=IPAdresse:"$(hostname)"&messageBody="$IPETH0"&description="$IPETH0"&target=/topics/iotinfo"
CURL_OPTS='--stderr /tmp/err -v '
${CURL} ${CURL_OPTS} ${URL_BASE}
touch $FLAGFILE
exit 0
