#!/bin/bash
#_11-ttn-config.sh
source _1-ttn-config.sh
GATEWAY_EUI_NIC=$(ip -oneline link show up 2>&1 | grep -v LOOPBACK | sed -E 's/^[0-9]+: ([0-9a-z]+): .*/\1/' | head -1)
if [[ -z $GATEWAY_EUI_NIC ]]; then
  echo "ERROR: No network interface found. Cannot set gateway ID."
  exit 1
fi

# Then get EUI based on the MAC address of that device ans set it in local_conf.json
GATEWAY_EUI=$(cat /sys/class/net/$GATEWAY_EUI_NIC/address | awk -F\: '{print $1$2$3"FFFE"$4$5$6}')
GATEWAY_EUI=${GATEWAY_EUI^^} # toupper
sed -i 's/"gateway_ID.*$/"gateway_ID": "'$GATEWAY_EUI'",/' /opt/ttn-gateway/bin/local_conf.json
sed -i 's/"contact_email.*$/"contact_email": "'"$EMAIL"'",/' /opt/ttn-gateway/bin/local_conf.json
sed -i 's/"description.*$/"description": "'"$HOST"'"/' /opt/ttn-gateway/bin/local_conf.json

