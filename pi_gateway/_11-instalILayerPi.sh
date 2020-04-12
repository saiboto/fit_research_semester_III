#!/bin/bash
cd /tmp
git clone https://github.com/Phaeilo/layerpie.git
cd layerpie
sh mk_installer
sh installer
lpie enable

