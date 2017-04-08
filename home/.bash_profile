#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# Ruby
command -v ruby >/dev/null && PATH="$(rubd -e 'print Gem.user_dir')/bin:$PATH"
