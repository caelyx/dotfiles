#!/bin/bash

for x in muttrc muttrc.color pythonrc screenrc vimrc zshrc; do
	ln -s $(pwd)/$x ~/.$x;
done;
