#!/bin/zsh

LOC="$HOME/.vim/bundle"
GIT=/usr/local/bin/hub

mkdir -p $LOC
cd $LOC

$GIT clone https://github.com/jamessan/vim-gnupg.git
$GIT clone https://github.com/parkr/vim-jekyll
$GIT clone https://github.com/scrooloose/nerdtree.git
$GIT clone https://github.com/tpope/vim-vividchalk.git
$GIT clone https://github.com/vim-airline/vim-airline
$GIT clone https://github.com/vimwiki/vimwiki
