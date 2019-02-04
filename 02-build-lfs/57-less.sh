#!/bin/sh

set -e

NAME=less-530
TAR=tar.gz

SOURCE=/sources
cd $SOURCE
rm -fr $SOURCE/$NAME
tar -xf $NAME.$TAR
cd $SOURCE/$NAME

#From LFS
./configure --prefix=/usr --sysconfdir=/etc
make -j100
make install

#From LFS end

cd $SOURCE
rm -fr $SOURCE/$NAME
