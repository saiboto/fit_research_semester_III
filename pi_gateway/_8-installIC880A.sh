#!/bin/bash
userdel -rf pi
source _1-ttn-config.sh

git clone -b spi https://github.com/ttn-zh/ic880a-gateway.git ~/ic880a-gateway
cd ~/ic880a-gateway
sed -i "s/^CURRENT_HOSTNAME=.*/CURRENT_HOSTNAME=$HOST/" ~/ic880a-gateway/install.sh
sed -i '/^echo "The system will reboot in 5 seconds..."/d' ~/ic880a-gateway/install.sh
sed -i '/^shutdown/d' ~/ic880a-gateway/install.sh
sed -i '/^sleep/d' ~/ic880a-gateway/install.sh
./install.sh spi
cd ..