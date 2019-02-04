#!/bin/sh

set -e

NAME=iproute2-4.18.0
TAR=tar.xz

SOURCE=/sources
cd $SOURCE
rm -fr $SOURCE/$NAME
tar -xf $NAME.$TAR
cd $SOURCE/$NAME

#From LFS
sed -i /ARPD/d Makefile
rm -fv man/man8/arpd.8

sed -i 's/.m_ipt.o//' tc/Makefile


make 

make DOCDIR=/usr/share/doc/iproute2-4.18.0 install


#From LFS end

cd $SOURCE
rm -fr $SOURCE/$NAME
