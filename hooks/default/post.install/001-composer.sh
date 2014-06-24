#!/bin/bash
__msg "Installing composer for $VERSION $ZTS $DEBUG"
curl -sS https://getcomposer.org/installer | $TARGET/bin/php -- --install-dir=$TARGET/bin
echo "#!/bin/bash" > $TARGET/bin/composer
echo "$TARGET/bin/php $TARGET/bin/composer.phar \$@" >> $TARGET/bin/
composer
chmod +x $TARGET/bin/composer
return 0
