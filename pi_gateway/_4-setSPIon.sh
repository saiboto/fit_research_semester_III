#!/bin/bash
#spion.sh
echo '+==================+'
echo '| Schalte SPI ein  |'
echo '+==================+'
# in /boot/config.txt
#
# Add the following line at the bottom :
#
#dtparam=spi=on
sed -i 's/^\#dtparam\=spi\=.*$/dtparam\=spi=on/' /boot/config.txt
echo "okay"
echo '+==================+'
