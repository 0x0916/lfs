#!/bin/sh

set -e

NAME=gzip-1.9
TAR=tar.xz

SOURCE=/sources
cd $SOURCE
rm -fr $SOURCE/$NAME
tar -xf $NAME.$TAR
cd $SOURCE/$NAME

#From LFS
sed -i 's/IO_ftrylockfile/IO_EOF_SEEN/' lib/*.c
echo "#define _IO_IN_BACKUP 0x100" >> lib/stdio-impl.h

./configure --prefix=/usr

make -j100

make check

make install

mv -v /usr/bin/gzip /bin

#From LFS end

cd $SOURCE
rm -fr $SOURCE/$NAME
