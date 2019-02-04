#!/bin/sh

NAME=util-linux-2.32.1
TAR=tar.xz

SOURCE=$LFS/sources
cd $SOURCE
rm -fr $SOURCE/$NAME
tar -xf $NAME.$TAR
cd $SOURCE/$NAME

#From LFS

./configure --prefix=/tools                \
            --without-python               \
            --disable-makeinstall-chown    \
            --without-systemdsystemunitdir \
            --without-ncurses              \
            PKG_CONFIG=""

make -j100

make install
#From LFS end

cd $SOURCE
rm -fr $SOURCE/$NAME
