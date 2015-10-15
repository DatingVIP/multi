#!/bin/bash
vernum=$($TARGET/bin/php-config --vernum)
[[ $vernum -lt 70000 ]] &&
	branch="master" ||
	 branch="php7"

__msg "Installing memcached for $VERSION $ZTS $DBG from github"
git clone https://github.com/php-memcached-dev/php-memcached		2>&1 >/dev/null
cd php-memcached
git checkout $branch
$TARGET/bin/phpize					2>&1 >/dev/null
./configure --with-php-config=$TARGET/bin/php-config	2>&1 >/dev/null
make install						2>&1 >/dev/null

if [ $? -eq 0 ]; then
	echo extension=memcached.so     >$TARGET/modules.d/memcached.ini
	return 0
else
	__error "Failed to install memcached for $VERSION $ZTS $DBG from github"
	return 1
fi
