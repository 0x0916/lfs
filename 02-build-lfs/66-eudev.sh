#!/bin/sh

set -e
NAME=eudev-3.2.5
TAR=tar.gz

SOURCE=/sources
cd $SOURCE
rm -fr $SOURCE/$NAME
tar -xf $NAME.$TAR
cd $SOURCE/$NAME

#From LFS
cat > config.cache << "EOF"
HAVE_BLKID=1
BLKID_LIBS="-lblkid"
BLKID_CFLAGS="-I/tools/include"
EOF

./configure --prefix=/usr           \
            --bindir=/sbin          \
            --sbindir=/sbin         \
            --libdir=/usr/lib       \
            --sysconfdir=/etc       \
            --libexecdir=/lib       \
            --with-rootprefix=      \
            --with-rootlibdir=/lib  \
            --enable-manpages       \
            --disable-static        \
            --config-cache

LIBRARY_PATH=/tools/lib make

mkdir -pv /lib/udev/rules.d
mkdir -pv /etc/udev/rules.d

make LD_LIBRARY_PATH=/tools/lib check

make LD_LIBRARY_PATH=/tools/lib install

tar -xvf ../udev-lfs-20171102.tar.bz2
make -f udev-lfs-20171102/Makefile.lfs install

LD_LIBRARY_PATH=/tools/lib udevadm hwdb --update

#From LFS end

cd $SOURCE
rm -fr $SOURCE/$NAME
