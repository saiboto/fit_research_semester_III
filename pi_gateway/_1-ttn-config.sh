#!/bin/bash
#ttn-config.sh
echo '+================+'
echo '| Lösche user pi |'
echo '+================+'
userdel -rf pi

HOST=TTN-KBS-WASSERHAUS-FACW-01
EMAIL=Rainer.Wieland@TTN-KBS.de
echo '+====================================+'
echo 'Lese Konfig-Daten:                    '
echo "Host:$HOST                            "
echo "Email:$EMAIL                          "
echo '+====================================+'