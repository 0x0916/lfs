#!/bin/sh

NAME=file-5.34
TAR=tar.gz

SOURCE=$LFS/sources
cd $SOURCE
rm -fr $SOURCE/$NAME
tar -xf $NAME.$TAR
cd $SOURCE/$NAME

#From LFS
./configure --prefix=/tools

make -j100

make install

#From LFS end

cd $SOURCE
rm -fr $SOURCE/$NAME
