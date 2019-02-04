#!/bin/sh

set -e

NAME=flex-2.6.4
TAR=tar.gz

SOURCE=/sources
cd $SOURCE
rm -fr $SOURCE/$NAME
tar -xf $NAME.$TAR
cd $SOURCE/$NAME

#From LFS
sed -i "/math.h/a #include <malloc.h>" src/flexdef.h

HELP2MAN=/tools/bin/true \
./configure --prefix=/usr --docdir=/usr/share/doc/flex-2.6.4


make -j100

make check

make install 

ln -sv flex /usr/bin/lex


#From LFS end

cd $SOURCE
rm -fr $SOURCE/$NAME
