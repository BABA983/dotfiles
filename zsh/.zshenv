# Zsh root
# ZDOTDIR=$HOME/dotfiles/zsh
# ZSHAREDIR=$HOME/.local/share/zsh

# Zsh related
# HISTFILE=$ZDOTDIR/.history
HISTSIZE=10000
SAVEHIST=10000
KEYTIMEOUT=1  # makes the switch between modes quicker
HISTORY_SUBSTRING_SEARCH_PREFIXED=1  # enables prefixed search for zsh-history-substring-search

# Software specific
[ -e "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"
