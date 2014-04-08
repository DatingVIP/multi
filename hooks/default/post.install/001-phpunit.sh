#!/bin/bash
__msg "Installing PHPUnit and DBUnit for $VERSION $ZTS $DBG from PEAR"
$TARGET/bin/pear clear-cache                             2>&1 >/dev/null
$TARGET/bin/pear config-set auto_discover 1              2>&1 >/dev/null
$TARGET/bin/pear install pear.phpunit.de/PHPUnit         2>&1 >/dev/null
$TARGET/bin/pear install pear.phpunit.de/DBUnit          2>&1 >/dev/null
$TARGET/bin/pear install pear.phpunit.de/PHP_Timer       2>&1 >/dev/null
$TARGET/bin/pear install pear.phpunit.de/File_Iterator   2>&1 >/dev/null
return 0
