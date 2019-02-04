#!/bin/sh

set -e

NAME=libffi-3.2.1
TAR=tar.gz

SOURCE=/sources
cd $SOURCE
rm -fr $SOURCE/$NAME
tar -xf $NAME.$TAR
cd $SOURCE/$NAME

#From LFS


sed -e '/^includesdir/ s/$(libdir).*$/$(includedir)/' \
    -i include/Makefile.in

sed -e '/^includedir/ s/=.*$/=@includedir@/' \
    -e 's/^Cflags: -I${includedir}/Cflags:/' \
    -i libffi.pc.in

./configure --prefix=/usr --disable-static --with-gcc-arch=native

make -j100

make check

make install

#From LFS end

cd $SOURCE
rm -fr $SOURCE/$NAME
