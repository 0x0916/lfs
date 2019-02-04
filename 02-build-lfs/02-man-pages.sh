#!/bin/sh

set -e

NAME=man-pages-4.16
TAR=tar.xz

SOURCE=/sources
cd $SOURCE
rm -fr $SOURCE/$NAME
tar -xf $NAME.$TAR
cd $SOURCE/$NAME

#From LFS
make install

#From LFS end

cd $SOURCE
rm -fr $SOURCE/$NAME
