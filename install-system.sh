#!/usr/bin/env bash
# -*- coding: utf-8 -*-
# Author: graypawn (choi.pawn @gmail.com)
# Created: 2016-07-02

function confirm() {
    # call with a prompt string or use a default
    read -r -p "${1:-Are you sure?} [y/N] " response
    response=${response,,}
    if [[ $response =~ ^(yes|y)$ ]]
    then
        true
    else
        false
    fi
}

## Support AUR
if confirm "Do you want install yaourt?"
then
    echo \
"[archlinuxfr]
SigLevel = Never
Server = http://repo.archlinux.fr/\$arch" | sudo tee -a /etc/pacman.conf

    sudo pacman -Sy yaourt
fi

## System Utils
yaourt -S git
yaourt -S openssh

## Font
if confirm "Do you want install font group?"
then
    yaourt -S ttf-hack          # English(Coding)
    yaourt -S ttf-nanum         # Korean
    yaourt -S ttf-vlgothic      # Japanese
    yaourt -S ttf-tlwg          # Thai
    yaourt -S ttf-arphic-uming  # Chinese
fi

## Input Method
if confirm "Do you want install input method?"
then
    sudo localectl set-locale LC_CTYPE=ko_KR.UTF-8
    yaourt -S fcitx-hangul
fi

## Themes
if confirm "Do you want install theme group?"
then
    yaourt -S gtk-theme-arc-git
    yaourt -S paper-icon-theme-git
    yaourt -S screenfetch
fi

## Sound
if confirm "Do you want install Sound system?"
then
    yaourt -S alsa-utils
    yaourt -S pulseaudio
fi

## Desktop notifications
yaourt xfce4-notifyd

## VirtualBox
if confirm "Do you want install VirtualBox"
then
    yaourt -S virtualbox linux-headers virtualbox-ext-oracle
    echo "vboxdrv" | sudo tee -a /etc/modules-load.d/virtualbox.conf
fi

## wine
if confirm "Do you want install wine"
then
    yaourt -S wine
fi

## Timezone
rm /etc/localtime
ln -s /usr/share/zoneinfo/Asia/Seoul /etc/localtime

## Java
yaourt -S jdk8-openjdk

## C/C++
yaourt -S cmake

## For auto-mount
yaourt -S thunar-volume gvfs

## Media
yaourt -S viewnior
yaourt -S mplayer
yaourt -S evince poppler-data
yaourt -S audacious

## Archiving and compression tools
yaourt -S file-roller
yaourt -S rar
yaourt -S p7zip

## Utils
yaourt -S emacs
yaourt -S firefox
yaourt -S dropbox-cli
yaourt -S transmission-qt
yaourt -S scrot
yaourt -S xclip
yaourt -S yusuke
yaourt -S catfish

## toggle-monitor
yaourt -S xrandr

mkdir -p ~/tmp
cd ~/tmp
git clone https://github.com/graypawn/toggle-monitor
sudo mv toggle-monitor/toggle-monitor /usr/local/bin/
rm -rf ~/tmp/toggle-monitor
