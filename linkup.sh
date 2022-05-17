#!/bin/bash

for x in muttrc muttrc.color pythonrc screenrc vimrc gvimrc zshrc; do
	ln -s $(pwd)/$x ~/.$x;
done;

mkdir -p ~/.vim/bundle
cd ~/.vim/bundle
for x in https://github.com/scrooloose/nerdtree https://github.com/tpope/vim-vividchalk https://github.com/vimwiki/vimwiki https://github.com/jamessan/vim-gnupg https://github.com/vim-airline/vim-airline https://github.com/parkr/vim-jekyll; do
 git clone $x; 
done;