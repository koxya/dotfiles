# homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"
# brew bundle runs aqua's go proxy with a PATH that lacks aqua itself, so it fails.
export HOMEBREW_BUNDLE_DUMP_NO_GO=1
export HOMEBREW_BUNDLE_CLEANUP_NO_GO=1

# aqua
export PATH="${AQUA_ROOT_DIR:-${XDG_DATA_HOME:-$HOME/.local/share}/aquaproj-aqua}/bin:$PATH"

# mise
eval "$(mise activate zsh)"

# 1Password SSH agent
export SSH_AUTH_SOCK=~/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock

# cargo
source "$HOME/.cargo/env"

# Neovim
export PATH=$PATH:$HOME/nvim-macos/bin
export XDF_CONFIG_HOME=$HOME/.config/nvim
export MYVIMRC=$HOME/.config/nvim/init.lua

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

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# claude code
export PATH="$HOME/.local/bin:$PATH"

