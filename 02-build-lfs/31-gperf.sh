#!/bin/sh

set -e

NAME=gperf-3.1
TAR=tar.gz

SOURCE=/sources
cd $SOURCE
rm -fr $SOURCE/$NAME
tar -xf $NAME.$TAR
cd $SOURCE/$NAME

#From LFS
./configure --prefix=/usr --docdir=/usr/share/doc/gperf-3.1


make -j100

make -j1 check

make install

#From LFS end

cd $SOURCE
rm -fr $SOURCE/$NAME
