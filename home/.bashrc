# #
# # ~/.bashrc
# #

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

# Screenfetch
if [ -f /usr/bin/screenfetch ]; then screenfetch; fi

# Terminal
export TERM=xterm-256color

# AUR
alias aur='ssh aur@aur4.archlinux.org'

# Xclip
alias copy='xclip -selection clipboard'

# Emacs
alias es='sudo emacs -nw'
alias ed='emacs --debug-init'
alias et='emacsclient -t'
alias ec='emacsclient -c -n'
alias emacsk='systemctl --user stop emacs'
export ALTERNATE_EDITOR=""
export EDITOR='emacsclient -t'
export VISUAL="emacsclient -t"

# Useful Alias
alias ..='cd ../'
alias ...='cd ../../'
alias ....='cd ../../../'

alias free='free -ht'

alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

alias ls='ls -A --color=auto'
alias ll='ls -lh | more'

alias psg="ps aux | grep -v grep | grep -i -e VSZ -e"

alias h='history'
alias j='jobs -l'

alias df='df -H'
alias du='du -ch'

alias ps3='toggle-monitor HDMI2'

# Useful Functions
function extract {
    if [ -z "$1" ]; then
        # display usage if no parameters given
        echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
    else
        if [ -f $1 ] ; then
            NAME=${1%.*}
            mkdir $NAME && cd $NAME
            case $1 in
                *.tar.bz2)   tar xvjf ../$1    ;;
                *.tar.gz)    tar xvzf ../$1    ;;
                *.tar.xz)    tar xvJf ../$1    ;;
                *.lzma)      unlzma ../$1      ;;
                *.bz2)       bunzip2 ../$1     ;;
                *.rar)       unrar x -ad ../$1 ;;
                *.gz)        gunzip ../$1      ;;
                *.tar)       tar xvf ../$1     ;;
                *.tbz2)      tar xvjf ../$1    ;;
                *.tgz)       tar xvzf ../$1    ;;
                *.zip)       unzip ../$1       ;;
                *.Z)         uncompress ../$1  ;;
                *.7z)        7z x ../$1        ;;
                *.xz)        unxz ../$1        ;;
                *.exe)       cabextract ../$1  ;;
                *)           echo "extract: '$1' - unknown archive method" ;;
            esac
        else
            echo "$1 - file does not exist"
        fi
    fi
}

function nospace {
    for file in *; do mv "$file" `echo $file | tr ' ' '_'` ; done
}
