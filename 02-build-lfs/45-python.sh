#!/bin/sh

set -e

NAME=Python-3.7.0
TAR=tar.xz

SOURCE=/sources
cd $SOURCE
rm -fr $SOURCE/$NAME
tar -xf $NAME.$TAR
cd $SOURCE/$NAME

#From LFS

./configure --prefix=/usr       \
            --enable-shared     \
            --with-system-expat \
            --with-system-ffi   \
            --with-ensurepip=yes


make -j100

make install
chmod -v 755 /usr/lib/libpython3.7m.so
chmod -v 755 /usr/lib/libpython3.so

install -v -dm755 /usr/share/doc/python-3.7.0/html 

tar --strip-components=1  \
    --no-same-owner       \
    --no-same-permissions \
    -C /usr/share/doc/python-3.7.0/html \
    -xvf ../python-3.7.0-docs-html.tar.bz2


#From LFS end

cd $SOURCE
rm -fr $SOURCE/$NAME
