#!/usr/bin/env sh
###################################################################################
# Run a test build of php-src/master in all configurations
###################################################################################
mkdir /home/travis/build/DatingVIP/multi/php-build/master
sudo  /home/travis/build/DatingVIP/multi/php.multi
###################################################################################
# Travis won't let us source a list of environments ...
###################################################################################
