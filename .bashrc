# #
# # ~/.bashrc
# #

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

# Screenfetch
if [ -f /usr/bin/screenfetch ]; then screenfetch; fi

# Terminal
export TERM=xterm-256color

# AUR
alias aur='ssh aur@aur4.archlinux.org'

# Xclip
alias copy='xclip -selection clipboard'

# Guile
# export GUILE_WARN_DEPRECATED="detailed"

# Emacs
alias es='sudo emacs -nw'
alias et='emacsclient -t'
alias ec='emacsclient -c -n'
alias emacsk="emacsclient -e '(kill-emacs)'"
export ALTERNATE_EDITOR=""
export EDITOR='emacsclient -t'
export VISUAL="emacsclient -t"

# Power
alias poweroff='systemctl hibernate'
