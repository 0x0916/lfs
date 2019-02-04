#!/bin/sh

NAME=bash-4.4.18
TAR=tar.gz

SOURCE=$LFS/sources
cd $SOURCE
rm -fr $SOURCE/$NAME
tar -xf $NAME.$TAR
cd $SOURCE/$NAME

#From LFS
./configure --prefix=/tools --without-bash-malloc

make

make install

ln -sv bash /tools/bin/sh

#From LFS end

cd $SOURCE
rm -fr $SOURCE/$NAME
