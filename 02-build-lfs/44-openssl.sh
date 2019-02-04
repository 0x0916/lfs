#!/bin/sh

set -e

NAME=openssl-1.1.0i
TAR=tar.gz

SOURCE=/sources
cd $SOURCE
rm -fr $SOURCE/$NAME
tar -xf $NAME.$TAR
cd $SOURCE/$NAME

#From LFS
./config --prefix=/usr         \
         --openssldir=/etc/ssl \
         --libdir=lib          \
         shared                \
         zlib-dynamic


make  -j100

# make test

sed -i '/INSTALL_LIBS/s/libcrypto.a libssl.a//' Makefile
make MANSUFFIX=ssl install

mv -v /usr/share/doc/openssl /usr/share/doc/openssl-1.1.0i
cp -vfr doc/* /usr/share/doc/openssl-1.1.0i



#From LFS end

cd $SOURCE
rm -fr $SOURCE/$NAME
