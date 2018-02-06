#!/usr/bin/env bash
# -*- coding: utf-8 -*-
# Author: graypawn (choi.pawn @gmail.com)
# Created: 2018-02-05
BASEDIR=$(dirname "$0")

scp -r $BASEDIR/  $1:~/dotfiles
