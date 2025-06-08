# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

export ZSH="$HOME/.oh-my-zsh"

# ZSH_THEME="robbyrussell"
# ZSH_THEME="agnoster"
# ZSH_THEME="spaceship"
# ZSH_THEME="powerlevel10k/powerlevel10k"
ZSH_THEME="spaceship"
SPACESHIP_TIME_SHOW=true

desired_plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
  zsh-vi-mode
  zoxide
)

plugins=()
for plugin in "${desired_plugins[@]}"; do
  if [ -d "$ZSH/custom/plugins/$plugin" ] || [ -d "$ZSH/plugins/$plugin" ]; then
    plugins+=("$plugin")
  fi
done

fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src
autoload -U compinit && compinit
source "$ZSH/oh-my-zsh.sh"
source "$ZSH_CUSTOM/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh"

# source ~/dotfiles/zsh/nvm.zsh

# extra.zsh can be used for settings you don't want to commit.
for file in ~/dotfiles/zsh/{functions,exports,aliases,extra}.zsh; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/zsh/__tabtab.zsh ]] && . ~/.config/tabtab/zsh/__tabtab.zsh || true

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=4"

if command -v thefuck &> /dev/null; then
    eval $(thefuck --alias)
fi

# fzf key bindings for command-line
if [[ "$(uname)" == "Darwin" ]]; then
  source <(fzf --zsh)
else
  # apt show fzf -a
  source /usr/share/doc/fzf/examples/key-bindings.zsh
fi

if command -v ngrok &>/dev/null; then
  eval "$(ngrok completion)"
fi

if command -v fnm &>/dev/null; then
  eval "$(fnm env --use-on-cd --shell zsh)"
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

[ -s "$HOME/.deno/env" ] && source "$HOME/.deno/env"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

