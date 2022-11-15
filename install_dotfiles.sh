#!/bin/bash

export DOTFILES=$(find . -type f -regextype sed -regex ".*\/\.[a-z\_\.]\+" -printf '%P\n') 

for dfile in $DOTFILES
do 
    export SRC=$(readlink -f ./$dfile)
    export DEST="$HOME"/$dfile 

    if ! [ -L $DEST ] ; then
        ln -s $SRC $DEST
    fi
done
