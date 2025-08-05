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

# mysql8.0 client
export PATH="/opt/homebrew/opt/mysql-client@8.0/bin:$PATH"

# postgres17 client
export PATH="/opt/homebrew/opt/postgresql@17/bin:$PATH"

# For compilers to find mysql-client@8.0 you may need to set:
export LDFLAGS="-L/opt/homebrew/opt/mysql-client@8.0/lib"
export CPPFLAGS="-I/opt/homebrew/opt/mysql-client@8.0/include"

# rbenv
export PATH="$HOME/.rbenv/shims:$PATH"

export CLICOLOR=1
export LSCOLORS=Gxfxcxdxbxegedabagacad

# history
export HISTFILE=~/.zsh_history
export HISTSIZE=10000
export SAVEHIST=10000

# Android SDK tools
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools

# bison
export PATH="/opt/homebrew/opt/bison/bin:$PATH"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

