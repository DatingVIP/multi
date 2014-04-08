#!/bin/bash
vernum=$($TARGET/bin/php-config --vernum)

if [ $vernum -lt 50400 ] || [ "$ZTS" != "zts" ]; then
	__error "Installing pthreads for $VERSION $ZTS $DBG not allowed"
	return 0
fi

__msg "Installing pthreads for $VERSION $ZTS $DBG from PECL"
$TARGET/bin/pecl uninstall pthreads           2>&1 >/dev/null
$TARGET/bin/pecl install pthreads             2>&1 >/dev/null
echo extension=pthreads.so                    >$TARGET/modules.d/pthreads.ini
return 0

