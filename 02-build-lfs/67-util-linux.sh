#!/bin/sh

set -e

NAME=util-linux-2.32.1
TAR=tar.xz

SOURCE=/sources
cd $SOURCE
rm -fr $SOURCE/$NAME
tar -xf $NAME.$TAR
cd $SOURCE/$NAME

#From LFS
mkdir -pv /var/lib/hwclock
rm -vf /usr/include/{blkid,libmount,uuid}
./configure ADJTIME_PATH=/var/lib/hwclock/adjtime   \
            --docdir=/usr/share/doc/util-linux-2.32.1 \
            --disable-chfn-chsh  \
            --disable-login      \
            --disable-nologin    \
            --disable-su         \
            --disable-setpriv    \
            --disable-runuser    \
            --disable-pylibmount \
            --disable-static     \
            --without-python     \
            --without-systemd    \
            --without-systemdsystemunitdir

make -j100

#chown -Rv nobody .
#su nobody -s /bin/bash -c "PATH=$PATH make -k check"


make install

#From LFS end

cd $SOURCE
rm -fr $SOURCE/$NAME
