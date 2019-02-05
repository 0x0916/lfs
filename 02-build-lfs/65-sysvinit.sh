#!/bin/sh

set -e

NAME=sysvinit-2.90
TAR=tar.xz

SOURCE=/sources
cd $SOURCE
rm -fr $SOURCE/$NAME
tar -xf $NAME.$TAR
cd $SOURCE/$NAME

#From LFS
patch -Np1 -i ../sysvinit-2.90-consolidated-1.patch

make -C src

make -C src install


#From LFS end

cd $SOURCE
rm -fr $SOURCE/$NAME
