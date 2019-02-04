#!/bin/sh

set -e

NAME=XML-Parser-2.44
TAR=tar.gz

SOURCE=/sources
cd $SOURCE
rm -fr $SOURCE/$NAME
tar -xf $NAME.$TAR
cd $SOURCE/$NAME

#From LFS
perl Makefile.PL

make -j100

make test

make install
#From LFS end

cd $SOURCE
rm -fr $SOURCE/$NAME
