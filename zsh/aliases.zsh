alias v=nvim

if command -v exa &> /dev/null; then
    alias l='exa -lah --icons --git'
    alias la='exa -lAh --icons --git'
    alias ll='exa -lh --icons --git'
    alias ls='exa -G --icons'
    alias lsa='exa -lah --icons --git'
else
    # 回退到 ls（带颜色）
    alias l='ls -lah --color=auto'
    alias la='ls -lAh --color=auto'
    alias ll='ls -lh --color=auto'
    alias ls='ls --color=auto'
    alias lsa='ls -lah --color=auto'
fi

alias arm="arch -arm64 $SHELL --login"
alias intel="arch -x86_64 $SHELL --login"