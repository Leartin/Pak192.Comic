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
           ./makeobj pak$1 test.pak $x/theme.dat
	   mv -v test.pak trunk/$x.pak
		else
			cp -r $x trunk/theme/
		fi
	done
}

echo -n 'Checking for makeobj... '

if [ ! -f 'makeobj' ]; then
    echo 'ERROR: makeobj not found in root folder.'
    exit 1
fi

echo -e 'OK\n'

mkdir trunk
cd trunk
mkdir theme
cd ..


compile '64' 'themes' 'theme/*'
cp -v ./trunk/theme /themes
zip themes.zip themes
echo dir

echo '======================================================'
echo 'theme complete!'
echo '======================================================'
