#!/bin/bash

for x in muttrc muttrc.color pythonrc screenrc zshrc; do
	ln -s `pwd`/$x ~/.$x;
done;

ln -s `pwd`/vimrc ~/.vimrc.after;
ln -s `pwd`/vimrc ~/.gvimrc.after;
