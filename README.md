# Dotfiles

## Usage

```bash
git clone https://github.com/BABA983/dotfiles.git ~/dotfiles
git pull --rebase && git submodule update --init --recursive

sh install-zsh.sh
sh install-tmux.sh
sh install-gitconfig.sh
```

## Software setup

tmux
exa
fzf
thefuck
difftastic

### MacOS

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install tmux
# brew install tmuxinator tmuxinator-completion
brew install exa

brew install --cask alacritty
brew install --cask wezterm
brew install --cask karabiner-elements
brew install --cask firefox

curl -s https://cht.sh/:cht.sh | sudo tee /usr/local/bin/cht.sh && sudo chmod +x /usr/local/bin/cht.sh
```

### Windows Subsystem for Linux 

```bash
# setup proxy in WSL
export ALL_PROXY="http://$(get-wsl-host-ip):7890"
# install zsh
sudo apt install zsh
chsh -s $(which zsh)
# install oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# install theme
git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
# install zsh plugins
sudo apt install autojump
git clone https://github.com/jeffreytse/zsh-vi-mode $ZSH_CUSTOM/plugins/zsh-vi-mode
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting
git clone https://github.com/zsh-users/zsh-completions.git ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions
# install neovim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz
# install Lazyvim
git clone git@github.com:BABA983/Lazyvim.git ~/.config/nvim
```

## References

[effective-shell](https://effective-shell.com/)

[oh-my-tmux](https://github.com/gpakosz/.tmux)

[LazyVim](https://github.com/LazyVim/LazyVim)

[oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh)

[Homebrew](https://brew.sh/)

[清华大学开源软件镜像站](https://mirrors.tuna.tsinghua.edu.cn/)
