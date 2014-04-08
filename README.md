php.multi
=========
*Maintain multiple isolated builds and configurations of PHP ...*

This repository contains a couple of scripts we, and you, can use to build PHP (of any version) and all of the extensions we require for running unit tests in all configurations.

Usage
=====

    [ENV] php.multi
    
By default, ```php.multi``` will scan the ```php-build``` directory for versions to update, valid versions can be found here:

    http://git.php.net/?p=php-src.git;a=heads
    
To create a build of a new version simply set the version in the environment upon execution of ```php.multi```:

	VERSION=master ./php.multi

To include the version in a build en-masse

	mkdir php-build/master

**Version numbers do not require the PHP- prefix and the experimental branches are not supported**

Environment
===========

The following environment variables effect the behaviour of ```php.multi```:

 - VERSION                             - set specific version
 - ZTS[=zts]                           - set zts configuration, zts or no-zts
 - DBG[=debug]                         - set debug configuration, debug or no-debug
 - STEP[=no]                           - execute a specific step, steps explained below
 - ONE[=no]                            - set to yes to prohibit looping through all versions
 - UPDATE[=yes]                        - set to no to skip updating sources
 - CHECK[=yes]                         - set to no to disable the checking of dependencies
 - TARGET[=/opt/php]                   - set base directory for installations
 - INI[=multi/php.ini]                 - set the full path to default ini file to be installed
 - HOOKS[=multi/hooks]                 - set the full path to the hooks directory
 - BUILD[=multi/php-build]             - set the full path to the build directory
 - DEFAULTS[=multi/php.defaults]       - set the full path to the configuration defaults file
 - LIBS[=multi/php.libs]               - set the full path to the required libraries file
 - GIT[=git://git.php.net/php-src.git] - set the git repository to use as master source tree
 - UPSTREAM[=origin]				   - set the default upstream

Steps
=====
*How to do one thing only ...*

    STEP=update php.multi 5.4

The above command will run the update commands for 5.4 only.

Available steps:

    - check               - checks required libraries are present
    - clean               - cleans source directory
    - update              - update source tree
    - checkout            - checkout specific branch from source tree
    - buildconf           - generate configure script
    - configure           - configure php
    - make                - make all objects
    - install             - install build

Before each step is executed, and upon succesful completion of a step, ```php.multi``` will invoke hooks, see below.

Hooks
=====

Hooks should be shell scripts stored in a subfolder of /hooks folder, in the appropriate order
    
	- pre.update   - only receives version
	- pre.checkout - only receives version
    - pre.check
    - pre.buildconf
    - pre.clean
    - pre.configure
    - pre.make
    - pre.install

    - post.update   - only receives version
    - post.checkout - only receives version
    - post.check
    - post.buildconf
    - post.clean
    - post.configure
    - post.make
    - post.install

Hooks are executed with the following variables set

    SOURCE  = source directory where php was built (full path)
    TARGET  = target installation directory (full path)
    VERSION = really ?
    ZTS     = zts or no-zts
    DBG     = debug or no-debug
    
*Note: the default hooks can be found in default/hooks*

**Returning a non-zero value from a hook will halt execution !**

Binaries
========

Binaries are installed at the following location:
    
    /opt/php/$version/$zts/$debug

*It is advisable to use the ```php.env``` helper included*

Environments
============

Loading an environment specified by version using the following command:

    [TARGET=/opt/php] source php.env version|list [zts|no-zts [debug|no-debug]]

**Important: The environment loader must be sourced!**

Additional Sources
==================

Adding additional sources such that you can manage patched builds from another fork of ```php-src``` can be achieved using the ```php.remote``` helper

    [BUILD=multi/php-build] php.remote name|list [source]

The new remote can be used to build patched versions of ```php-src``` in the following way:

    ./php.remote krakjoe https://github.com/krakjoe/php-src
    
    UPSTREAM=krakjoe VERSION=returntypehinting ./php.multi

Setting ```UPSTREAM``` is only necessary on the first checkout, subsequent executions of ```php.multi``` do not require special action for versions built from additional sources.

License
-------
```multi``` is released under the terms of LGPL3.0, details can be found in LICENSE or online at http://opensource.org/licenses/lgpl-3.0.html
