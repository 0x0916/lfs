#!/bin/sh

set -e

NAME=grep-3.1
TAR=tar.xz

SOURCE=/sources
cd $SOURCE
rm -fr $SOURCE/$NAME
tar -xf $NAME.$TAR
cd $SOURCE/$NAME

#From LFS
./configure --prefix=/usr --bindir=/bin

make -j100

make -k check

make install
#From LFS end

cd $SOURCE
rm -fr $SOURCE/$NAME
