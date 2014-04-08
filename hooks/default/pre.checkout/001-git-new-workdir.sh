#!/bin/bash
#
# The git-new-workdir is magic that we require, so get it and make it available ...
where=$(which git-new-workdir 2>&1 >/dev/null)
if [ $? != 0 ]; then
	if [ ! -f $BASE/bin/git-new-workdir ]; then
		[ -d $BASE/bin ] || mkdir $BASE/bin
		
		if [ $? != 0 ]; then
			__error "Failed to create bin directory"
			return 1
		fi
		
		__msg "Fetching git-new-workdir helper"
		
		wget https://raw.githubusercontent.com/git/git/master/contrib/workdir/git-new-workdir -O $BASE/bin/git-new-workdir 2>&1 >/dev/null
		if [ $? != 0 ]; then
			__error "Failed to download git-new-workdir"
			return 1
		fi
		
		chmod +x $BASE/bin/git-new-workdir
	fi
	export PATH=$PATH:$BASE/bin
fi

return 0
