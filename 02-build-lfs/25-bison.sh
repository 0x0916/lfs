#!/bin/sh

set -e

NAME=bison-3.0.5
TAR=tar.xz

SOURCE=/sources
cd $SOURCE
rm -fr $SOURCE/$NAME
tar -xf $NAME.$TAR
cd $SOURCE/$NAME

#From LFS
./configure --prefix=/usr --docdir=/usr/share/doc/bison-3.0.5

make -j100
make install
#From LFS end

cd $SOURCE
rm -fr $SOURCE/$NAME
