#!/bin/bash
vernum=$($TARGET/bin/php-config --vernum)

if [ $vernum -lt 50400 ] || [ "$ZTS" != "zts" ]; then
	__error "Installing pthreads for $VERSION $ZTS $DBG not allowed"
	return 0
fi

if [ $vernum -lt 70000 ]; then
	__msg "Installing pthreads for $VERSION $ZTS $DBG from PECL"
	$TARGET/bin/pecl uninstall pthreads           2>&1 >/dev/null
	$TARGET/bin/pecl install pthreads            2>&1 >/dev/null
	echo extension=pthreads.so                    >$TARGET/modules.d/pthreads.ini
else
	__msg "Installing pthreads for $VERSION $ZTS $DBG from github"
	git clone https://github.com/krakjoe/pthreads		2>&1 >/dev/null
	cd pthreads
	git checkout seven
	$TARGET/bin/phpize					2>&1 >/dev/null
	./configure --with-php-config=$TARGET/bin/php-config	2>&1 >/dev/null
	make install						2>&1 >/dev/null
	echo extension=pthreads.so		     >$TARGET/modules.d/pthreads.ini
fi
return 0

