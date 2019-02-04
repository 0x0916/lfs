#!/bin/sh

set -e

NAME=psmisc-23.1
TAR=tar.xz

SOURCE=/sources
cd $SOURCE
rm -fr $SOURCE/$NAME
tar -xf $NAME.$TAR
cd $SOURCE/$NAME

#From LFS
./configure --prefix=/usr

make -j100
make install

mv -v /usr/bin/fuser   /bin
mv -v /usr/bin/killall /bin

#From LFS end

cd $SOURCE
rm -fr $SOURCE/$NAME
