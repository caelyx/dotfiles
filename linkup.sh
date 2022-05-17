#!/bin/bash

for x in muttrc muttrc.color pythonrc screenrc vimrc gvimrc zshrc; do
	ln -s $(pwd)/$x ~/.$x;
done;
