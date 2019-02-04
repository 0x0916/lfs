#!/bin/sh

set -e

NAME=texinfo-6.5
TAR=tar.xz

SOURCE=/sources
cd $SOURCE
rm -fr $SOURCE/$NAME
tar -xf $NAME.$TAR
cd $SOURCE/$NAME

#From LFS

sed -i '5481,5485 s/({/(\\{/' tp/Texinfo/Parser.pm

./configure --prefix=/usr --disable-static

make -j100

make check

make install

make TEXMF=/usr/share/texmf install-tex

pushd /usr/share/info
rm -v dir
for f in *
  do install-info $f dir 2>/dev/null
done
popd

#From LFS end

cd $SOURCE
rm -fr $SOURCE/$NAME
