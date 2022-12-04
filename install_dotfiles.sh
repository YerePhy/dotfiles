#!/bin/bash

export DOTFILES=$(find . -type f -regextype sed -regex ".*\/\.[a-z\_\.]\+" -printf '%P\n') 

for dfile in $DOTFILES
do 
    export SRC=$(readlink -f ./$dfile)
    export DEST="$HOME"/$dfile 

    rm -f $DEST
    ln -s $SRC $DEST
done

