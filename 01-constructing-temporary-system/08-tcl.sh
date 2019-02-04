#!/bin/sh

NAME=tcl8.6.8
TAR=tar.gz

SOURCE=$LFS/sources
cd $SOURCE
rm -fr $SOURCE/$NAME
tar -xf $NAME-src.$TAR
cd $SOURCE/$NAME

#From LFS
cd unix
./configure --prefix=/tools
make -j100
make install
chmod -v u+w /tools/lib/libtcl8.6.so
make install-private-headers
ln -sv tclsh8.6 /tools/bin/tclsh

#From LFS end

cd $SOURCE
rm -fr $SOURCE/$NAME
