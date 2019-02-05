#!/bin/sh

set -e

NAME=coreutils-8.30
TAR=tar.xz

SOURCE=/sources
cd $SOURCE
rm -fr $SOURCE/$NAME
tar -xf $NAME.$TAR
cd $SOURCE/$NAME

#From LFS

patch -Np1 -i ../coreutils-8.30-i18n-1.patch


sed -i '/test.lock/s/^/#/' gnulib-tests/gnulib.mk

autoreconf -fiv
FORCE_UNSAFE_CONFIGURE=1 ./configure \
            --prefix=/usr            \
            --enable-no-install-program=kill,uptime

FORCE_UNSAFE_CONFIGURE=1 make


make NON_ROOT_USERNAME=nobody check-root


echo "dummy:x:1000:nobody" >> /etc/group


chown -Rv nobody . 


#su nobody -s /bin/bash \
#          -c "PATH=$PATH make RUN_EXPENSIVE_TESTS=yes check"

sed -i '/dummy/d' /etc/group

make install


mv -v /usr/bin/{cat,chgrp,chmod,chown,cp,date,dd,df,echo} /bin
mv -v /usr/bin/{false,ln,ls,mkdir,mknod,pwd,rm} /bin
mv -v /usr/bin/{rmdir,stty,sync,true,uname} /bin
mv -v /usr/bin/chroot /usr/sbin
mv -v /usr/share/man/man1/chroot.1 /usr/share/man/man8/chroot.8
sed -i s/\"1\"/\"8\"/1 /usr/share/man/man8/chroot.8

mv -v /usr/bin/{head,sleep,nice} /bin

#From LFS end

cd $SOURCE
rm -fr $SOURCE/$NAME
