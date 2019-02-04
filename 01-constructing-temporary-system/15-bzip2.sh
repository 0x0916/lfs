#!/bin/sh

NAME=bzip2-1.0.6
TAR=tar.gz

SOURCE=$LFS/sources
cd $SOURCE
rm -fr $SOURCE/$NAME
tar -xf $NAME.$TAR
cd $SOURCE/$NAME

#From LFS

make

make PREFIX=/tools install

#From LFS end

cd $SOURCE
rm -fr $SOURCE/$NAME
