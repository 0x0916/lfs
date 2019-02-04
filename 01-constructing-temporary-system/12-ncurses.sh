#!/bin/sh

NAME=ncurses-6.1
TAR=tar.gz

SOURCE=$LFS/sources
cd $SOURCE
rm -fr $SOURCE/$NAME
tar -xf $NAME.$TAR
cd $SOURCE/$NAME

#From LFS

sed -i s/mawk// configure

./configure --prefix=/tools \
            --with-shared   \
            --without-debug \
            --without-ada   \
            --enable-widec  \
            --enable-overwrite

make -j100

make install 

#From LFS end

cd $SOURCE
rm -fr $SOURCE/$NAME
