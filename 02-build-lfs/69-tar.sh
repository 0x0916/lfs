#!/bin/sh

set -e

NAME=tar-1.30
TAR=tar.xz

SOURCE=/sources
cd $SOURCE
rm -fr $SOURCE/$NAME
tar -xf $NAME.$TAR
cd $SOURCE/$NAME

#From LFS
FORCE_UNSAFE_CONFIGURE=1  \
./configure --prefix=/usr \
            --bindir=/bin

make -j100

#make check

make install

make -C doc install-html docdir=/usr/share/doc/tar-1.30

#From LFS end

cd $SOURCE
rm -fr $SOURCE/$NAME
