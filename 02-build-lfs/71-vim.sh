#!/bin/sh

set -e

NAME=vim-8.1 
TAR=tar.bz2

SOURCE=/sources
cd $SOURCE
rm -fr $SOURCE/vim81
tar -xf $NAME.$TAR
cd $SOURCE/vim81

#From LFS

echo '#define SYS_VIMRC_FILE "/etc/vimrc"' >> src/feature.h

./configure --prefix=/usr

make -j100

LANG=en_US.UTF-8 make -j1 test &> vim-test.log

make install


ln -sv vim /usr/bin/vi
for L in  /usr/share/man/{,*/}man1/vim.1; do
    ln -sv vim.1 $(dirname $L)/vi.1
done

ln -sv ../vim/vim81/doc /usr/share/doc/vim-8.1


cat > /etc/vimrc << "EOF"
" Begin /etc/vimrc

" Ensure defaults are set before customizing settings, not after
source $VIMRUNTIME/defaults.vim
let skip_defaults_vim=1 

set nocompatible
set backspace=2
set mouse=
syntax on
if (&term == "xterm") || (&term == "putty")
  set background=dark
endif

" End /etc/vimrc
EOF



#From LFS end

cd $SOURCE
rm -fr $SOURCE/vim81
