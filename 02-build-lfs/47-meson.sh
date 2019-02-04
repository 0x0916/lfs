#!/bin/sh

set -e

NAME=meson-0.47.1
TAR=tar.gz

SOURCE=/sources
cd $SOURCE
rm -fr $SOURCE/$NAME
tar -xf $NAME.$TAR
cd $SOURCE/$NAME

#From LFS
python3 setup.py build


python3 setup.py install --root=dest
cp -rv dest/* /

#From LFS end

cd $SOURCE
rm -fr $SOURCE/$NAME
