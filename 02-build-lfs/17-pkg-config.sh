#!/bin/sh

set -e

NAME=pkg-config-0.29.2
TAR=tar.gz

SOURCE=/sources
cd $SOURCE
rm -fr $SOURCE/$NAME
tar -xf $NAME.$TAR
cd $SOURCE/$NAME

#From LFS
./configure --prefix=/usr              \
            --with-internal-glib       \
            --disable-host-tool        \
            --docdir=/usr/share/doc/pkg-config-0.29.2

make -j100

make check

make install

#From LFS end

cd $SOURCE
rm -fr $SOURCE/$NAME
