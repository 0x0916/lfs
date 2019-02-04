#!/bin/sh

set -e

NAME=groff-1.22.3
TAR=tar.gz

SOURCE=/sources
cd $SOURCE
rm -fr $SOURCE/$NAME
tar -xf $NAME.$TAR
cd $SOURCE/$NAME

#From LFS

PAGE=A4 ./configure --prefix=/usr
make -j1

make install

#From LFS end

cd $SOURCE
rm -fr $SOURCE/$NAME
