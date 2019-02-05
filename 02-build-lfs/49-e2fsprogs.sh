#!/bin/sh

set -e

NAME=e2fsprogs-1.44.3
TAR=tar.gz

SOURCE=/sources
cd $SOURCE
rm -fr $SOURCE/$NAME
tar -xf $NAME.$TAR
cd $SOURCE/$NAME

#From LFS
mkdir -v build
cd build


../configure --prefix=/usr           \
             --bindir=/bin           \
             --with-root-prefix=""   \
             --enable-elf-shlibs     \
             --disable-libblkid      \
             --disable-libuuid       \
             --disable-uuidd         \
             --disable-fsck

make -j100

ln -sfv /tools/lib/lib{blk,uu}id.so.1 lib
#make LD_LIBRARY_PATH=/tools/lib check

make install

make install-libs


chmod -v u+w /usr/lib/{libcom_err,libe2p,libext2fs,libss}.a

gunzip -v /usr/share/info/libext2fs.info.gz
install-info --dir-file=/usr/share/info/dir /usr/share/info/libext2fs.info

makeinfo -o      doc/com_err.info ../lib/et/com_err.texinfo
install -v -m644 doc/com_err.info /usr/share/info
install-info --dir-file=/usr/share/info/dir /usr/share/info/com_err.info



#From LFS end

cd $SOURCE
rm -fr $SOURCE/$NAME
