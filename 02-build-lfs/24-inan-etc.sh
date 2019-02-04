#!/bin/sh

set -e

NAME=iana-etc-2.30
TAR=tar.bz2

SOURCE=/sources
cd $SOURCE
rm -fr $SOURCE/$NAME
tar -xf $NAME.$TAR
cd $SOURCE/$NAME

#From LFS
make -j100

make install

#From LFS end

cd $SOURCE
rm -fr $SOURCE/$NAME
