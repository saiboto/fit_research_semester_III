#!/bin/bash
#-8-setIfnames.sh
echo '+==================+'
echo '| Schalte ifname auf eth (alt) um  |'
echo '+==================+'
# in /boot/cmdline.txt
# Ersetze "rootwait" mit "rootwait net.ifnames=0" AUSSER in Zeilen die "net.ifnames=0" enthalten
sed -i '/net.ifnames=0/!s/rootwait/rootwait net.ifnames=0/g' /boot/cmdline.txt
echo "okay"
echo '+==================+'
