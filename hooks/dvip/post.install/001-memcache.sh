#!/bin/bash
__msg "Installing memcache for $VERSION $ZTS $DBG from PECL"
$TARGET/bin/pecl uninstall memcache                             2>&1 >/dev/null
yes | $TARGET/bin/pecl install   memcache                       2>&1 >/dev/null
if [ $? == 0 ]; then
	echo extension=memcache.so                                        >$TARGET/modules.d/memcache.ini
	return 0
else
	__error "Failed to install memcache in $VERSION $ZTS $DBG"
	return 1
fi
