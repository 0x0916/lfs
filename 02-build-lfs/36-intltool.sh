#!/bin/sh

set -e

NAME=intltool-0.51.0
TAR=tar.gz

SOURCE=/sources
cd $SOURCE
rm -fr $SOURCE/$NAME
tar -xf $NAME.$TAR
cd $SOURCE/$NAME

#From LFS
sed -i 's:\\\${:\\\$\\{:' intltool-update.in

./configure --prefix=/usr


make -j100

make check

make install

install -v -Dm644 doc/I18N-HOWTO /usr/share/doc/intltool-0.51.0/I18N-HOWTO


#From LFS end

cd $SOURCE
rm -fr $SOURCE/$NAME
