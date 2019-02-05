#!/bin/sh

set -e

NAME=man-db-2.8.4
TAR=tar.xz

SOURCE=/sources
cd $SOURCE
rm -fr $SOURCE/$NAME
tar -xf $NAME.$TAR
cd $SOURCE/$NAME

#From LFS
./configure --prefix=/usr                        \
            --docdir=/usr/share/doc/man-db-2.8.4 \
            --sysconfdir=/etc                    \
            --disable-setuid                     \
            --enable-cache-owner=bin             \
            --with-browser=/usr/bin/lynx         \
            --with-vgrind=/usr/bin/vgrind        \
            --with-grap=/usr/bin/grap            \
            --with-systemdtmpfilesdir=
make -j100

#make check

make install
#From LFS end

cd $SOURCE
rm -fr $SOURCE/$NAME
