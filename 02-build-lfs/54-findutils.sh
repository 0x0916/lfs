#!/bin/sh

set -e

NAME=findutils-4.6.0
TAR=tar.gz

SOURCE=/sources
cd $SOURCE
rm -fr $SOURCE/$NAME
tar -xf $NAME.$TAR
cd $SOURCE/$NAME

#From LFS
sed -i 's/test-lock..EXEEXT.//' tests/Makefile.in

sed -i 's/IO_ftrylockfile/IO_EOF_SEEN/' gl/lib/*.c
sed -i '/unistd/a #include <sys/sysmacros.h>' gl/lib/mountlist.c
echo "#define _IO_IN_BACKUP 0x100" >> gl/lib/stdio-impl.h

./configure --prefix=/usr --localstatedir=/var/lib/locate

make -j100

make check

make install

mv -v /usr/bin/find /bin
sed -i 's|find:=${BINDIR}|find:=/bin|' /usr/bin/updatedb

#From LFS end

cd $SOURCE
rm -fr $SOURCE/$NAME
