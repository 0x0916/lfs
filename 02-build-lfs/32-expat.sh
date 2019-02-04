#!/bin/sh

set -e

NAME=expat-2.2.6
TAR=tar.bz2

SOURCE=/sources
cd $SOURCE
rm -fr $SOURCE/$NAME
tar -xf $NAME.$TAR
cd $SOURCE/$NAME

#From LFS

sed -i 's|usr/bin/env |bin/|' run.sh.in

./configure --prefix=/usr    \
            --disable-static \
            --docdir=/usr/share/doc/expat-2.2.6

make -j100

make check

make install

install -v -m644 doc/*.{html,png,css} /usr/share/doc/expat-2.2.6


#From LFS end

cd $SOURCE
rm -fr $SOURCE/$NAME
