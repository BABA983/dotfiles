alias v=nvim

if command -v eza &> /dev/null; then
    alias l='eza -lah --icons --git'
    alias la='eza -lAh --icons --git'
    alias ll='eza -lh --icons --git'
    alias ls='eza -G --icons'
    alias lsa='eza -lah --icons --git'
else
    alias l='ls -lah --color=auto'
    alias la='ls -lAh --color=auto'
    alias ll='ls -lh --color=auto'
    alias ls='ls --color=auto'
    alias lsa='ls -lah --color=auto'
fi

alias arm="arch -arm64 $SHELL --login"
alias intel="arch -x86_64 $SHELL --login"
