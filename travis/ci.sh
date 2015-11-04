#!/usr/bin/env sh
###################################################################################
#  First install prerequisite libraries for php.defaults not available on travis  #
###################################################################################
sudo add-apt-repository ppa:travis-ci/memcached-sasl
sudo apt-get update 
sudo apt-get install -qq libmcrypt-dev libXpm-dev libpng-dev libjpeg-dev libvpx-dev re2c libmemcached-dev
###################################################################################
# Run a test build of php-src/master in all configurations
###################################################################################
mkdir /home/travis/build/DatingVIP/multi/php-build/master
sudo  /home/travis/build/DatingVIP/multi/php.multi
###################################################################################
# Travis won't let us source a list of environments ...
###################################################################################
