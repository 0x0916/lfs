#!/bin/sh

set -e

NAME=mpc-1.1.0
TAR=tar.gz

SOURCE=/sources
cd $SOURCE
rm -fr $SOURCE/$NAME
tar -xf $NAME.$TAR
cd $SOURCE/$NAME

#From LFS

./configure --prefix=/usr    \
            --disable-static \
            --docdir=/usr/share/doc/mpc-1.1.0

make
make html

make check


make install
make install-html


#From LFS end

cd $SOURCE
rm -fr $SOURCE/$NAME
