#!/bin/sh

set -e
set -x

NAME=lfs-bootscripts-20180820
TAR=tar.bz2

SOURCE=/sources
cd $SOURCE
rm -fr $SOURCE/$NAME
tar -xf $NAME.$TAR
cd $SOURCE/$NAME

#From LFS
make install
#From LFS end

cd $SOURCE
rm -fr $SOURCE/$NAME


bash /lib/udev/init-net-rules.sh


cat /etc/udev/rules.d/70-persistent-net.rules
