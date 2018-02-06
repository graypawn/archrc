#!/usr/bin/env bash
# -*- coding: utf-8 -*-
# Author: graypawn (choi.pawn @gmail.com)
# Created: 2018-01-28
yaourt -S nimf-git
dconf load /org/nimf/ < $DCONF_DIR/nimf.dconf
