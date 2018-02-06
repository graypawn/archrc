#!/usr/bin/env bash
# -*- coding: utf-8 -*-
# Author: graypawn (choi.pawn @gmail.com)
# Created: 2018-02-02
#
# 이곳은 antergos를 설치한 후에 필요한 설정을 모아둔 디렉토리 입니다.
# gnome, emacs, linux와 같이 일반화가 가능한 설정은 상위 디렉토리에
# 다른 디렉토리를 생성해 기록해 주세요.

BASEDIR=$(dirname "$0")
CACHE_FILE=$BASEDIR/../dot.log

## PREPARE
echo [`date "+%Y-%m-%d %T"`] Start : antergos >> $CACHE_FILE


# 0
sudo $BASEDIR/00-locale.sh
$BASEDIR/00-interface.sh
$BASEDIR/00-recons.sh
$BASEDIR/00-theme.sh


# 1
$BASEDIR/01-ibus.sh


# Other
$BASEDIR/../link/install.sh
$BASEDIR/../icon/install.sh
$BASEDIR/../app/thunar.sh
$BASEDIR/../app/guake.sh
$BASEDIR/../app/dropbox.sh

sudo cp $BASEDIR/../script/* /usr/local/bin/
