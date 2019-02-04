#!/bin/sh

set -e

NAME=sed-4.5
TAR=tar.xz

SOURCE=/sources
cd $SOURCE
rm -fr $SOURCE/$NAME
tar -xf $NAME.$TAR
cd $SOURCE/$NAME

#From LFS
sed -i 's/usr/tools/'                 build-aux/help2man
sed -i 's/testsuite.panic-tests.sh//' Makefile.in

./configure --prefix=/usr --bindir=/bin


make -j100
make -j100 html
make -j100 check

make install
install -d -m755           /usr/share/doc/sed-4.5
install -m644 doc/sed.html /usr/share/doc/sed-4.5

#From LFS end

cd $SOURCE
rm -fr $SOURCE/$NAME
