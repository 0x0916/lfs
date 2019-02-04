#!/bin/sh

set -e

NAME=elfutils-0.173
TAR=tar.bz2

SOURCE=/sources
cd $SOURCE
rm -fr $SOURCE/$NAME
tar -xf $NAME.$TAR
cd $SOURCE/$NAME

#From LFS

./configure --prefix=/usr


make -j100

make check

make -C libelf install
install -vm644 config/libelf.pc /usr/lib/pkgconfig

#From LFS end

cd $SOURCE
rm -fr $SOURCE/$NAME
