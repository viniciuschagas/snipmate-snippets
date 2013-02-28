#!/bin/bash
VIM_DIR=$HOME/.vim
SNIPPETS_DIR=$VIM_DIR/snippets

SNIPPETS_DIRS=`ls -l | egrep '^d' | awk '{print $9}'`

function clear_old_snippets() {
    if [ -d $SNIPPETS_DIR ]; then
        echo "Removing old snippets dir..."
        rm -Rf $SNIPPETS_DIR
    fi
}

function copy_snippets() {
    clear_old_snippets
    if [ ! -d $SNIPPETS_DIR ]; then
        echo "Snippets not found!"
        echo "Creating it..."
        mkdir -p $SNIPPETS_DIR
    fi

    for DIR in $SNIPPETS_DIRS
    do
        echo "- Coping $DIR to snippet's folder..."
        cp -R $DIR $SNIPPETS_DIR
    done

    echo "- Coping support_functions.vim..."
    cp support_functions.vim $SNIPPETS_DIR
}

copy_snippets
