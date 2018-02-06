#!/usr/bin/env bash
# -*- coding: utf-8 -*-
# Author: graypawn (choi.pawn @gmail.com)

ROOTDIR=$(readlink -f $(dirname $0)/../)

# prepare
echo $ROOTDIR/backup/
rm -r $ROOTDIR/backup/

dot_link () {
    # $1 = Target directory name (just name)
    # $2 - Link directory path

    TARGET_DIR=$ROOTDIR/link/$1
    BACKUP_DIR=$ROOTDIR/backup/$1

    # prepare
    mkdir -p $2
    mkdir -p $BACKUP_DIR

    # for item in $TARGET_DIR/*
    for item in `ls -A $TARGET_DIR`; do
        echo copy "$item"
        mv $2/$item $BACKUP_DIR 2>/dev/null
        echo link "$item"
        ln -s $TARGET_DIR/$item $2
        echo
    done
}

dot_link "home" "$HOME"
dot_link "config" "$HOME/.config"
dot_link "local_share" "$HOME/.local/share"
