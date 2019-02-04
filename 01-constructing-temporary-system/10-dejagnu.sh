#!/bin/sh

NAME=dejagnu-1.6.1
TAR=tar.gz

SOURCE=$LFS/sources
cd $SOURCE
rm -fr $SOURCE/$NAME
tar -xf $NAME.$TAR
cd $SOURCE/$NAME

#From LFS
./configure --prefix=/tools
make install 

#From LFS end

cd $SOURCE
rm -fr $SOURCE/$NAME
