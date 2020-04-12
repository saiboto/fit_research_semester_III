#!/bin/bash
#ttn-setup.sh
source _1-ttn-config.sh
source _2-pi-update.sh
source _3-setTimeZone.sh
source _4-setSPIon.sh
source _5-setFCMboot.sh
source _6-setFCMtemperatur.sh
source _7-setIfnames.sh
source _8-installIC880A.sh
source _9-setHostname.sh
source _10-ttn-config.sh
reboot now

