#!/bin/sh

set -e

NAME=gmp-6.1.2
TAR=tar.xz

SOURCE=/sources
cd $SOURCE
rm -fr $SOURCE/$NAME
tar -xf $NAME.$TAR
cd $SOURCE/$NAME

#From LFS
cp -v configfsf.guess config.guess
cp -v configfsf.sub   config.sub


./configure --prefix=/usr    \
            --enable-cxx     \
            --disable-static \
            --docdir=/usr/share/doc/gmp-6.1.2

make
make html

make check 2>&1 | tee gmp-check-log

awk '/# PASS:/{total+=$3} ; END{print total}' gmp-check-log

make install
make install-html

#From LFS end

cd $SOURCE
rm -fr $SOURCE/$NAME
