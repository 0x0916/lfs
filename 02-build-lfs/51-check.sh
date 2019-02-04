#!/bin/sh

set -e

NAME=check-0.12.0
TAR=tar.gz

SOURCE=/sources
cd $SOURCE
rm -fr $SOURCE/$NAME
tar -xf $NAME.$TAR
cd $SOURCE/$NAME

#From LFS
./configure --prefix=/usr

make -j100

make check

make install
sed -i '1 s/tools/usr/' /usr/bin/checkmk

#From LFS end

cd $SOURCE
rm -fr $SOURCE/$NAME
