#!/usr/bin/env bash
# -*- coding: utf-8 -*-
# Author: graypawn (choi.pawn @gmail.com)
# Created: 2017-03-23
MOUNT_DIR=/mnt/ice

# CONFIGURE FSTAB
cat >> /etc/fstab <<EOF
UUID=uuid   $MOUNT_DIR  vfat  user,noauto,noatime,flush  0 0
EOF

# DROPBOX
yaourt -S dropbox-cli
