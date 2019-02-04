#!/bin/sh

set -e

NAME=libtool-2.4.6
TAR=tar.xz

SOURCE=/sources
cd $SOURCE
rm -fr $SOURCE/$NAME
tar -xf $NAME.$TAR
cd $SOURCE/$NAME

#From LFS

./configure --prefix=/usr

make -j100

#make check

make install
#From LFS end

cd $SOURCE
rm -fr $SOURCE/$NAME
