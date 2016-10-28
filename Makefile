###########################################################
#
# This Makefile can install or uninstall multi, nothing else
#
###########################################################
usage:
	@echo "usage: make install|uninstall"
 
install:
	@echo "Installing Commencing ..."
	@install -m 0755	-oroot	php.multi 		/usr/local/bin/php.multi
	@install -m 0755			php.env 		/usr/local/bin/php.env
	@install -m 0755	-oroot	php.pecl		/usr/local/bin/php.pecl
	@install -m 0755	-oroot	php.remote		/usr/local/bin/php.remote
	@echo "Installation Complete"

uninstall:
	@echo "Removal Commencing .."
	@rm -rf /usr/local/bin/php.multi
	@rm -rf /usr/local/bin/php.env
	@rm -rf /usr/local/bin/php.pecl
	@rm -rf /usr/local/bin/php.remote
	@echo "Removal Complete (but not really)"

all: install

.PHONY: install
