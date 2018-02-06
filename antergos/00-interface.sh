#!/usr/bin/env bash
# -*- coding: utf-8 -*-
# Author: graypawn (choi.pawn @gmail.com)
# Created: 2018-01-29

BASEDIR=$(dirname "$0")
DCONF_DIR=$BASEDIR/../dconf/
CACHE_FILE=$BASEDIR/../dot.log

## PREPARE
echo [`date "+%Y-%m-%d %T"`] Start : $0 >> $CACHE_FILE


## CONFIG
dconf load /org/gnome/ < $DCONF_DIR/gnome.interface.conf
dconf load /org/ < $DCONF_DIR/gnome.files.conf
dconf load /org/gnome/ < $DCONF_DIR/gnome.keybindings.conf


## FINISH
echo -e "\033[97m"Completed"\033[0m"
echo [`date "+%Y-%m-%d %T"`] Passed: $0 >> $CACHE_FILE
