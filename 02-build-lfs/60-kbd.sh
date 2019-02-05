#!/bin/sh

set -e

NAME=kbd-2.0.4
TAR=tar.xz

SOURCE=/sources
cd $SOURCE
rm -fr $SOURCE/$NAME
tar -xf $NAME.$TAR
cd $SOURCE/$NAME

#From LFS

patch -Np1 -i ../kbd-2.0.4-backspace-1.patch

sed -i 's/\(RESIZECONS_PROGS=\)yes/\1no/g' configure
sed -i 's/resizecons.8 //' docs/man/man8/Makefile.in

PKG_CONFIG_PATH=/tools/lib/pkgconfig ./configure --prefix=/usr --disable-vlock

make -j100

#make check

make install

mkdir -v       /usr/share/doc/kbd-2.0.4
cp -R -v docs/doc/* /usr/share/doc/kbd-2.0.4


#From LFS end

cd $SOURCE
rm -fr $SOURCE/$NAME
