#!/bin/sh

set -e

NAME=gdbm-1.17
TAR=tar.gz

SOURCE=/sources
cd $SOURCE
rm -fr $SOURCE/$NAME
tar -xf $NAME.$TAR
cd $SOURCE/$NAME

#From LFS
./configure --prefix=/usr \
            --disable-static \
            --enable-libgdbm-compat

make -j100

make check

make install

#From LFS end

cd $SOURCE
rm -fr $SOURCE/$NAME
