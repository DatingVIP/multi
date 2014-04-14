#!/usr/bin/env sh
sudo apt-get install -qq libmcrypt-dev libXpm-dev libpng-dev libjpeg-dev libvpx-dev
mkdir php-build/master
sudo ./php.multi
source ./php.env master

