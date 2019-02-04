#!/bin/sh

set -e

NAME=mpfr-4.0.1
TAR=tar.xz

SOURCE=/sources
cd $SOURCE
rm -fr $SOURCE/$NAME
tar -xf $NAME.$TAR
cd $SOURCE/$NAME

#From LFS
./configure --prefix=/usr        \
            --disable-static     \
            --enable-thread-safe \
            --docdir=/usr/share/doc/mpfr-4.0.1

make
make html

make check


make install
make install-html

#From LFS end

cd $SOURCE
rm -fr $SOURCE/$NAME
