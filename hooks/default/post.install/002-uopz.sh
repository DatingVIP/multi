#!/bin/bash
vernum=$($TARGET/bin/php-config --vernum)

if [ $vernum -lt 70000 ];
then
	__msg "Installing uopz for $VERSION $ZTS $DBG from PECL"
	$TARGET/bin/pecl uninstall uopz                             2>&1 >/dev/null
	$TARGET/bin/pecl install uopz                               2>&1 >/dev/null

	if [ $? -eq 0 ]; then
		extension_dir=$($TARGET/bin/php-config --extension-dir)
	
		if [ -d $extension_dir ]; then
			echo zend_extension=$extension_dir/uopz.so        >>$TARGET/php.ini
		else
			echo zend_extension=uopz.so                       >>$TARGET/php.ini
		fi
		echo uopz.overloads=1                                 >>$TARGET/php.ini
	else
		__error "Failed to install uopz for $VERSION $ZTS $DBG from PECL"
		return 1
	fi
else
	__error "Cannot install uopz for $VERSION $ZTS $DBG"
	return 1
fi

return 0
