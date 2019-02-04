#!/bin/sh

NAME=coreutils-8.30
TAR=tar.xz

SOURCE=$LFS/sources
cd $SOURCE
rm -fr $SOURCE/$NAME
tar -xf $NAME.$TAR
cd $SOURCE/$NAME

#From LFS

./configure --prefix=/tools --enable-install-program=hostname


make -j100

# make RUN_EXPENSIVE_TESTS=yes check

make install


#From LFS end

cd $SOURCE
rm -fr $SOURCE/$NAME
