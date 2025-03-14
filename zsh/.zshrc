# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

export ZSH="$HOME/.oh-my-zsh"

# ZSH_THEME="robbyrussell"
# ZSH_THEME="agnoster"
# ZSH_THEME="spaceship"
# ZSH_THEME="powerlevel10k/powerlevel10k"
source "/opt/homebrew/opt/spaceship/spaceship.zsh"
SPACESHIP_TIME_SHOW=true

plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
  zsh-vi-mode
  autojump
)

source $ZSH/oh-my-zsh.sh

# PROMPT="%B%{$fg[blue]%}[%{$fg[white]%}%n%{$fg[red]%}@%{$fg[white]%}%m%{$fg[blue]%}] %(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )%{$fg[cyan]%}%c%{$reset_color%}"
# PROMPT+="\$vcs_info_msg_0_ "

# prompts
# DEFAULT_USER = prompt_context() {
#   if [[ "$USER" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
#     # prompt_segment black default "%(!.%{%F{yellow}%}.)%n@%m"
#     prompt_segment black default "%(!.%{%F{yellow}%}.)%n"
#   fi
# }
# DEFAULT_USER=$USER

source ~/dotfiles/zsh/nvm.zsh

# extra.zsh can be used for settings you don't want to commit.
for file in ~/dotfiles/zsh/{functions,exports,aliases,extra}.zsh; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/zsh/__tabtab.zsh ]] && . ~/.config/tabtab/zsh/__tabtab.zsh || true

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=4"

eval $(thefuck --alias)

# fzf key bindings for command-line
source <(fzf --zsh)

if command -v ngrok &>/dev/null; then
  eval "$(ngrok completion)"
fi

# https://zsh.sourceforge.io/Doc/Release/Options.html (16.2.4 History)

setopt EXTENDED_HISTORY      # Write the history file in the ':start:elapsed;command' format.
setopt INC_APPEND_HISTORY    # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY         # Share history between all sessions.
setopt HIST_IGNORE_DUPS      # Do not record an event that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS  # Delete an old recorded event if a new event is a duplicate.
setopt HIST_IGNORE_SPACE     # Do not record an event starting with a space.
setopt HIST_SAVE_NO_DUPS     # Do not write a duplicate event to the history file.
setopt HIST_VERIFY           # Do not execute immediately upon history expansion.
setopt APPEND_HISTORY        # append to history file (Default)
setopt HIST_NO_STORE         # Don't store history commands
setopt HIST_REDUCE_BLANKS    # Remove superfluous blanks from each command line being added to the history.

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

. "$HOME/.deno/env"
