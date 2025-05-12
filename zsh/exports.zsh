export EDITOR=nvim
export MANPAGER='nvim +Man!'

export TMUX_TMPDIR=~/.tmux/tmp

if [ -d "/opt/homebrew/opt/gnu-getopt" ]; then
  export PATH="/opt/homebrew/opt/gnu-getopt/bin:$PATH"
fi
if [[ "$(uname)" == "Linux" ]]; then
  export PATH="$PATH:/opt/nvim-linux-x86_64/bin"
fi

if [ -d "/usr/local/go" ]; then
    export PATH="$PATH:/usr/local/go/bin"
fi

# pnpm
export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

export PATH="$HOME/Documents/workspace_github/depot_tools:$PATH"

# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"


