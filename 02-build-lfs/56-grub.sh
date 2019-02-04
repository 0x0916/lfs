#!/bin/sh

set -e

NAME=grub-2.02
TAR=tar.xz

SOURCE=/sources
cd $SOURCE
rm -fr $SOURCE/$NAME
tar -xf $NAME.$TAR
cd $SOURCE/$NAME

#From LFS
./configure --prefix=/usr          \
            --sbindir=/sbin        \
            --sysconfdir=/etc      \
            --disable-efiemu       \
            --disable-werror

make -j100

make install

#From LFS end

cd $SOURCE
rm -fr $SOURCE/$NAME
