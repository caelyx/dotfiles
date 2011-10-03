#!/bin/bash

for x in muttrc muttrc.color pydf pythonrc screenrc vimrc zlogin zshrc; do
    ln -s $x ~/.$x;
done;

