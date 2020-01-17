#!/bin/bash

echo 'pak192.comic open-source repository compiler for Linux'
echo -e '======================================================\n'

echo 'This bash compiles the theme into a new folder'
echo -e 'called trunk/theme, makeobj must be in root folder.\n'

# Does all the heavy work
# @param $1 pakset size
# @param $2 log message
# @param $* list of files to compile
compile() {
    echo '------------------------------------------------------'
    echo -e "Compiling $2...\n"
	
	
	for x in $3; do
		if [ -d ${x} ]
		then
			echo ./makeobj pak$1 ./trunk/$x.pak ./$x/theme.dat
           ./makeobj pak$1 ./trunk/$x.pak ./$x/theme.dat
		else
			cp -r .$x trunk
		fi
	done
}

echo -n 'Checking for makeobj... '

if [ ! -f 'makeobj' ]; then
    echo 'ERROR: makeobj not found in root folder.'
    exit 1
fi

echo -e 'OK\n'

compile '64' 'themes' 'theme/*'

mv trunk/theme themes
zip themes

echo '======================================================'
echo 'theme complete!'
echo '======================================================'
