#!/bin/sh

NAME=expect5.45.4 
TAR=tar.gz

SOURCE=$LFS/sources
cd $SOURCE
rm -fr $SOURCE/$NAME
tar -xf $NAME.$TAR
cd $SOURCE/$NAME

#From LFS
cp -v configure{,.orig}
sed 's:/usr/local/bin:/bin:' configure.orig > configure

./configure --prefix=/tools       \
            --with-tcl=/tools/lib \
            --with-tclinclude=/tools/include
make

make SCRIPTS="" install

#From LFS end

cd $SOURCE
rm -fr $SOURCE/$NAME
