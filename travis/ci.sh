#!/usr/bin/env sh
###################################################################################
#  First install prerequisite libraries for php.defaults not available on travis  #
###################################################################################
sudo apt-get install -qq libmcrypt-dev libXpm-dev libpng-dev libjpeg-dev libvpx-dev
###################################################################################
CWD=$(pwd)
###################################################################################
# Run a test build of php-src/master in all configurations
###################################################################################
mkdir  php-build/master
sudo   $CWD/php.multi
###################################################################################
# List all configurations
###################################################################################
source $CWD/php.env list
