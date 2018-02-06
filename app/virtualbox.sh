#!/usr/bin/env bash
# -*- coding: utf-8 -*-
# Author: graypawn (choi.pawn @gmail.com)
# Created: 2018-01-27
yaourt -S virtualbox virtualbox-ext-oracle
echo "vboxdrv" | sudo tee -a /etc/modules-load.d/virtualbox.conf
