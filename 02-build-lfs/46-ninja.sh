#!/bin/sh

set -e

NAME=ninja-1.8.2
TAR=tar.gz

SOURCE=/sources
cd $SOURCE
rm -fr $SOURCE/$NAME
tar -xf $NAME.$TAR
cd $SOURCE/$NAME

#From LFS
export NINJAJOBS=4

patch -Np1 -i ../ninja-1.8.2-add_NINJAJOBS_var-1.patch

python3 configure.py --bootstrap

python3 configure.py
./ninja ninja_test
./ninja_test --gtest_filter=-SubprocessTest.SetWithLots

install -vm755 ninja /usr/bin/
install -vDm644 misc/bash-completion /usr/share/bash-completion/completions/ninja
install -vDm644 misc/zsh-completion  /usr/share/zsh/site-functions/_ninja


#From LFS end

cd $SOURCE
rm -fr $SOURCE/$NAME
