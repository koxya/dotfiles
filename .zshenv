export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin

# homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# Neovim
export PATH=$PATH:$HOME/nvim-macos/bin
export XDF_CONFIG_HOME=$HOME/.config/nvim
export MYVIMRC=$HOME/.config/nvim/init.lua

# volta
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

# Go

# for windows
# export PATH=$PATH:/mnt/c/Windows
# for powershell
# export PATH=$PATH:/mnt/c/Windows/System32/WindowsPowerShell/v1.0

# mysql5.7 client
export PATH="/opt/homebrew/opt/mysql-client@5.7/bin:$PATH"

# rbenv
export PATH="$HOME/.rbenv/shims:$PATH"

export CLICOLOR=1
export LSCOLORS=Gxfxcxdxbxegedabagacad

# history
export HISTFILE=~/.zsh_history
export HISTSIZE=10000
export SAVEHIST=10000

