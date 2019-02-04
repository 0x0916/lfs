#!/bin/sh

set -e
exit 0

NAME=linux-4.18.5
TAR=tar.xz

SOURCE=/sources
cd $SOURCE
rm -fr $SOURCE/$NAME
tar -xf $NAME.$TAR
cd $SOURCE/$NAME

#From LFS

#From LFS end

cd $SOURCE
rm -fr $SOURCE/$NAME
