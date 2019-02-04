#!/bin/sh

NAME=diffutils-3.6
TAR=tar.xz

SOURCE=$LFS/sources
cd $SOURCE
rm -fr $SOURCE/$NAME
tar -xf $NAME.$TAR
cd $SOURCE/$NAME

#From LFS
./configure --prefix=/tools

make

make install

#From LFS end

cd $SOURCE
rm -fr $SOURCE/$NAME
