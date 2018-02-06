#!/usr/bin/env bash
# -*- coding: utf-8 -*-
# Author: graypawn (choi.pawn @gmail.com)
# Created: 2018-02-05

BASEDIR=$(dirname "$0")
DCONF_DIR=$BASEDIR/../dconf/
CACHE_FILE=$BASEDIR/../dot.log

## PREPARE
echo [`date "+%Y-%m-%d %T"`] Start : $0 >> $CACHE_FILE


## FUNCTION
yaourt_s () {
    local pkg=$1
    yaourt -S $pkg --noconfirm || {
        echo [`date "+%Y-%m-%d %T"`] --install failed: $pkg >> $CACHE_FILE;
        echo [`date "+%Y-%m-%d %T"`] Failed: $0 >> $CACHE_FILE;
        exit 1;
    }
}

yaourt_sn () {
    local pkg=$1
    sudo yaourt -S $pkg --noconfirm --need || {
        echo [`date "+%Y-%m-%d %T"`] --install failed: $pkg >> $CACHE_FILE;
        echo [`date "+%Y-%m-%d %T"`] Failed: $0 >> $CACHE_FILE;
        exit 1;
    }
}


## INSTALL
yaourt_sn thunar-volman
yaourt_sn gvfs
yaourt_sn gvfs-mtp
yaourt_sn gvfs-smb


## CONFIG
xdg-mime default Thunar-folder-handler.desktop inode/directory


## FINISH
echo -e "\033[97m"Completed"\033[0m"
echo [`date "+%Y-%m-%d %T"`] Passed: $0 >> $CACHE_FILE
