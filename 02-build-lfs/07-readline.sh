#!/bin/sh

set -e

NAME=readline-7.0
TAR=tar.gz

SOURCE=/sources
cd $SOURCE
rm -fr $SOURCE/$NAME
tar -xf $NAME.$TAR
cd $SOURCE/$NAME

#From LFS
sed -i '/MV.*old/d' Makefile.in
sed -i '/{OLDSUFF}/c:' support/shlib-install

./configure --prefix=/usr    \
            --disable-static \
            --docdir=/usr/share/doc/readline-7.0


make SHLIB_LIBS="-L/tools/lib -lncursesw"


make SHLIB_LIBS="-L/tools/lib -lncurses" install

mv -v /usr/lib/lib{readline,history}.so.* /lib
chmod -v u+w /lib/lib{readline,history}.so.*
ln -sfv ../../lib/$(readlink /usr/lib/libreadline.so) /usr/lib/libreadline.so
ln -sfv ../../lib/$(readlink /usr/lib/libhistory.so ) /usr/lib/libhistory.so

install -v -m644 doc/*.{ps,pdf,html,dvi} /usr/share/doc/readline-7.0

#From LFS end

cd $SOURCE
rm -fr $SOURCE/$NAME
