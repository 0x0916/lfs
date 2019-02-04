#!/bin/sh

set -e

NAME=gawk-4.2.1
TAR=tar.xz

SOURCE=/sources
cd $SOURCE
rm -fr $SOURCE/$NAME
tar -xf $NAME.$TAR
cd $SOURCE/$NAME

#From LFS

sed -i 's/extras//' Makefile.in
./configure --prefix=/usr

make -j100
make check
make install

mkdir -v /usr/share/doc/gawk-4.2.1
cp    -v doc/{awkforai.txt,*.{eps,pdf,jpg}} /usr/share/doc/gawk-4.2.1

#From LFS end

cd $SOURCE
rm -fr $SOURCE/$NAME
