#!/usr/bin/env sh
sudo apt-get install -qq libmcrypt-dev
mkdir php-build/master
sudo ./php.multi
source ./php.env master

