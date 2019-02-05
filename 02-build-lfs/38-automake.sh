#!/bin/sh

set -e

NAME=automake-1.16.1
TAR=tar.xz

SOURCE=/sources
cd $SOURCE
rm -fr $SOURCE/$NAME
tar -xf $NAME.$TAR
cd $SOURCE/$NAME

#From LFS
./configure --prefix=/usr --docdir=/usr/share/doc/automake-1.16.1

make

#make -j check

make install
#From LFS end

cd $SOURCE
rm -fr $SOURCE/$NAME
