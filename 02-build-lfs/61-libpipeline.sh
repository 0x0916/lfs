#!/bin/sh

set -e

NAME=libpipeline-1.5.0
TAR=tar.gz

SOURCE=/sources
cd $SOURCE
rm -fr $SOURCE/$NAME
tar -xf $NAME.$TAR
cd $SOURCE/$NAME

#From LFS
./configure --prefix=/usr

make -j100

#make check

make install
#From LFS end

cd $SOURCE
rm -fr $SOURCE/$NAME
