# Dotfiles

## Usage

```bash
git clone https://github.com/BABA983/dotfiles.git ~/dotfiles
git pull --rebase && git submodule update --init --recursive
ln -s ~/dotfiles/zsh/.zshenv ~/.zshenv
ln -s ~/dotfiles/zsh/.zshrc ~/.zshrc
```

## Software setup

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
```

### Linux

## References

[effective-shell](https://effective-shell.com/)

[oh-my-tmux](https://github.com/gpakosz/.tmux)

[LazyVim](https://github.com/LazyVim/LazyVim)

[oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh)

[Homebrew](https://brew.sh/)

[清华大学开源软件镜像站](https://mirrors.tuna.tsinghua.edu.cn/)
