#!/bin/bash
vernum=$($TARGET/bin/php-config --vernum)

if [ $vernum -lt 50500 ]; then
	__msg "Installing opcache for $VERSION $ZTS $DBG from PECL"
	$TARGET/bin/pecl uninstall ZendOpcache                               2>&1 >/dev/null
	$TARGET/bin/pecl install channel://pecl.php.net/ZendOpcache-7.0.3    2>&1 >/dev/null
else
	__msg "Installing opcache for $VERSION $ZTS $DBG"
fi

extension_dir=$($TARGET/bin/php-config --extension-dir)
if [ -d $extension_dir ]; then
	echo zend_extension=$extension_dir/opcache.so               >>$TARGET/php.ini
else
	echo zend_extension=opcache.so                              >>$TARGET/php.ini
fi
return 0

