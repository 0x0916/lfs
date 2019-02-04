#!/bin/sh

set -e

NAME=bash-4.4.18
TAR=tar.gz

SOURCE=/sources
cd $SOURCE
rm -fr $SOURCE/$NAME
tar -xf $NAME.$TAR
cd $SOURCE/$NAME

#From LFS
./configure --prefix=/usr                       \
            --docdir=/usr/share/doc/bash-4.4.18 \
            --without-bash-malloc               \
            --with-installed-readline

make -j100

chown -Rv nobody .

su nobody -s /bin/bash -c "PATH=$PATH make tests"


make install
mv -vf /usr/bin/bash /bin

exec /bin/bash --login +h


#From LFS end

cd $SOURCE
rm -fr $SOURCE/$NAME
