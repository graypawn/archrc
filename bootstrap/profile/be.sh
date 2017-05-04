#!/usr/bin/env bash
# -*- coding: utf-8 -*-
# Author: graypawn (choi.pawn @gmail.com)
# Created: 2017-03-23

packages=(
    ## Font
    ttf-hack          # English(Coding)
    ttf-nanum         # Korean
    ttf-vlgothic      # Japanese
    fonts-tlwg        # Thai
    ttf-arphic-uming  # Chinese

    ## Input Method

    # Nimf
    audit
    nimf-git

    # # Fcitx
    # fcitx-hangul
    # fcitx-mozc

    ## Themes
    gtk-theme-arc-git
    paper-icon-theme-git
    screenfetch

    ## Sound
    alsa-utils
    pulseaudio

    ## Desktop notifications
    xfce4-notifyd

    ## wine
    wine
    lib32-libpulse
    lib32-mpg123
    winetricks

    ## Programming
    jdk8-openjdk
    cmake
    ruby

    ## For mount
    thunar-volman         # for auto-mount
    gvfs
    jmtpfs                # for Android

    # Format
    dosfstools
    ntfs-3g

    ## Media
    gpicview
    mplayer
    evince
    poppler-data
    audacious
    libcue

    ## Archiving and compression tools
    file-roller
    rar
    p7zip

    ## Utils
    emacs
    firefox
    dropbox-cli
    transmission-qt
    scrot
    xclip
    yusuke
    catfish
    keepassx
)

for pkg in ${packages[@]}; do
    yaourt -S pkg
done

# Virtualbox
yaourt -S virtualbox linux-headers virtualbox-ext-oracle
echo "vboxdrv" | sudo tee -a /etc/modules-load.d/virtualbox.conf

## Dconf
DCONF_DIR=../dconf/
dconf load /org/nimf/ < $DCONF_DIR/nimf.dconf

## toggle-monitor
yaourt -S xrandr

mkdir -p ~/tmp
cd ~/tmp
git clone https://github.com/graypawn/toggle-monitor
sudo mv toggle-monitor/toggle-monitor /usr/local/bin/
rm -rf ~/tmp/toggle-monitor

# fstab 설정 추가해야 한다.
