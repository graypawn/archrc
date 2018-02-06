#!/usr/bin/env bash
# -*- coding: utf-8 -*-
# Author: graypawn (choi.pawn @gmail.com)
# Created: 2018-01-29
#
# antergos-gnome-meta와 같이 그룹화 되어 있는 패키지를 삭제하고
# 하위 항목을 직접 설치한다.
# 또한 다른 패키지로 교체하기도 한다.

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


## UNINSTALL
yaourt -Rs antergos-gnome-meta --noconfirm


## REINSTALL PACKAGES
packages=(
    #===========================================================================
    #=====================ANTERGOS-GNOME-META===================================
    #===========================================================================
    baobab
    # brasero
    evince
    eog
    file-roller
    # gedit
    emacs                       # Change: gedit
    gnome-backgrounds
    gnome-calculator
    gnome-calendar
    # gnome-contacts
    # gnome-control-center        # REINSTALL
    gnome-documents
    gnome-disk-utility
    gnome-font-viewer
    gnome-keyring
    gnome-logs
    # gnome-maps
    gnome-music
    # gnome-photos
    gnome-screenshot
    gnome-shell
    gnome-shell-extensions
    gnome-shell-extension-dash-to-dock
    gnome-shell-extension-status-menu-buttons
    gnome-shell-extension-topicons # Add
    # gnome-sound-recorder
    gnome-system-monitor
    # gnome-terminal
    guake                    # Change: gnome-terminal
    # gnome-themes-standard       # REINSTALL
    gnome-tweak-tool
    # gnome-weather
    # gvfs-google
    gvfs-mtp
    gvfs-smb
    # hicolor-icon-theme          # REINSTALL
    libgnome-keyring
    # nautilus                    # REINSTALL
    network-manager-applet
    networkmanager-openvpn
    networkmanager-pptp
    pamac
    # polari
    python-pysmbc
    qt5ct
    seahorse
    # totem
    mpv                         # Change: totem
    transmission-gtk
    xdg-user-dirs-gtk
    # xscreensaver                # REINSTALL

    #===========================================================================
    #=================================ETC=======================================
    #===========================================================================
    git
    xclip
    catfish
    keepassx
    alacarte
)

for pkg in ${packages[@]}; do
    yaourt_sn $pkg
done


## CONFIG
dconf load /org/gnome/shell/extensions/ < $DCONF_DIR/gnome.extensions.conf


## FINISH
echo -e "\033[97m"Completed"\033[0m"
echo [`date "+%Y-%m-%d %T"`] Passed: $0 >> $CACHE_FILE
