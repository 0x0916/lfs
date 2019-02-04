#!/bin/sh

set -e

NAME=binutils-2.31.1
TAR=tar.xz

SOURCE=/sources
cd $SOURCE
rm -fr $SOURCE/$NAME
tar -xf $NAME.$TAR
cd $SOURCE/$NAME

#From LFS
set -x
expect -c "spawn ls"
set +x

mkdir -v build
cd       build

../configure --prefix=/usr       \
             --enable-gold       \
             --enable-ld=default \
             --enable-plugins    \
             --enable-shared     \
             --disable-werror    \
             --enable-64-bit-bfd \
             --with-system-zlib

make tooldir=/usr


make -k check

make tooldir=/usr install


#From LFS end

cd $SOURCE
rm -fr $SOURCE/$NAME
