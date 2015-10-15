#!/bin/bash
vernum=$($TARGET/bin/php-config --vernum)
[[ $vernum -lt 70000 ]] &&
	branch="simplify" ||
	branch="seven"

__msg "Installing apcu for $VERSION $ZTS $DBG from github"
git clone https://github.com/krakjoe/apcu		2>&1 >/dev/null
cd apcu
git checkout $branch
$TARGET/bin/phpize					2>&1 >/dev/null
./configure --with-php-config=$TARGET/bin/php-config	2>&1 >/dev/null
make install						2>&1 >/dev/null

if [ $? -eq 0 ]; then
	echo extension=apcu.so          >$TARGET/modules.d/apcu.ini
	return 0
else
	__error "Failed to install apcu for $VERSION $ZTS $DBG from github"
	return 1
fi
