#!/bin/sh

set -e

NAME=make-4.2.1
TAR=tar.bz2

SOURCE=/sources
cd $SOURCE
rm -fr $SOURCE/$NAME
tar -xf $NAME.$TAR
cd $SOURCE/$NAME

#From LFS
sed -i '211,217 d; 219,229 d; 232 d' glob/glob.c

./configure --prefix=/usr

make -j100

#make PERL5LIB=$PWD/tests/ check


make install
#From LFS end

cd $SOURCE
rm -fr $SOURCE/$NAME
