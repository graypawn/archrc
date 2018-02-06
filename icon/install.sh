#!/usr/bin/env bash
# -*- coding: utf-8 -*-
# Author: graypawn (choi.pawn @gmail.com)
# Created: 2018-02-06

BASEDIR=$(dirname "$0")

install_icon_with_size () {
    local icon_size_dir=$BASEDIR/$1
    for item in `ls -A $icon_size_dir`; do
        xdg-icon-resource install --size $1 $icon_size_dir/$item
    done
}

install_icon_with_size 48
install_icon_with_size 128
