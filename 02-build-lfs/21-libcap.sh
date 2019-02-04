#!/bin/sh

set -e

NAME=libcap-2.25
TAR=tar.xz

SOURCE=/sources
cd $SOURCE
rm -fr $SOURCE/$NAME
tar -xf $NAME.$TAR
cd $SOURCE/$NAME

#From LFS
sed -i '/install.*STALIBNAME/d' libcap/Makefile


make -j100

make RAISE_SETFCAP=no lib=lib prefix=/usr install
chmod -v 755 /usr/lib/libcap.so

mv -v /usr/lib/libcap.so.* /lib
ln -sfv ../../lib/$(readlink /usr/lib/libcap.so) /usr/lib/libcap.so


#From LFS end

cd $SOURCE
rm -fr $SOURCE/$NAME
