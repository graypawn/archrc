#!/usr/bin/env bash
# -*- coding: utf-8 -*-
# Author: graypawn (choi.pawn @gmail.com)
# Created: 2018-01-30
#
# ROOT 권한으로 실행하자!

BASEDIR=$(dirname "$0")
DCONF_DIR=$BASEDIR/../dconf/
CACHE_FILE=$BASEDIR/../dot.log

## PREPARE
echo [`date "+%Y-%m-%d %T"`] Start : $0 >> $CACHE_FILE


## LOCALE-GEN
cat > /etc/locale.gen << END
en_US.UTF-8 UTF-8
ko_KR.UTF-8 UTF-8
ja_JP.UTF-8 UTF-8
END

locale-gen


## FINISH
echo -e "\033[97m"Completed"\033[0m"
echo [`date "+%Y-%m-%d %T"`] Passed: $0 >> $CACHE_FILE
