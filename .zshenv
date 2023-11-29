export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin

export XDF_CONFIG_HOME=$HOME/.config/nvim
export MYVIMRC=$HOME/.config/nvim/init.lua

# for windows
export PATH=$PATH:/mnt/c/Windows
# for powershell
export PATH=$PATH:/mnt/c/Windows/System32/WindowsPowerShell/v1.0

# clip.exe
export PATH=$PATH:/mnt/c/Windows/System32

# HOME/bin
export PATH=$PATH:$HOME/bin

# vscode
export PATH=/mnt/c/Users/koyam/AppData/Local/Programs/Microsoft\ VS\ Code/bin:$PATH

# rbenv
export PATH=$HOME/.rbenv/bin:$PATH
eval "$(rbenv init - zsh)"

# pyenv
export PYENV_ROOT=$HOME/.pyenv
command -v pyenv >/dev/null || export PATH=$PYENV_ROOT/bin:$PATH
eval "$(pyenv init -)"

# rust
export PATH=$HOME/.cargo/bin:$PATH
. "$HOME/.cargo/env"

# Go
export PATH=$PATH:/usr/local/go/bin

# deno
export PATH=$PATH:$HOME/.deno/bin:$PATH

# volta
export VOLTA_HOME=$HOME/.volta
export PATH=$VOLTA_HOME/bin:$PATH

# bun completions
[ -s "/root/.bun/_bun" ] && source "/root/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# TiDB
export PATH=/root/.tiup/bin:$PATH

export CLICOLOR=1
export LSCOLORS=Gxfxcxdxbxegedabagacad

# fzf config
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git"'
export FZF_DEFAULT_OPTS="--no-height --reverse --border"

# Preview file content using bat (https://github.com/sharkdp/bat)
export FZF_CTRL_T_OPTS="
  --preview 'bat -n --color=always {}'
  --bind 'ctrl-/:change-preview-window(down|hidden|)'"

# CTRL-Y to copy the command into clipboard using clip.exe
export FZF_CTRL_R_OPTS="
  --exact
  --preview 'echo {}' --preview-window up:3:hidden:wrap
  --bind 'ctrl-y:execute-silent(echo -n {2..} | iconv -f UTF-8 -t CP932 | clip.exe)+abort'"

# Print tree structure in the preview window
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"

# history
export HISTFILE=~/.zsh_history
export HISTSIZE=10000
export SAVEHIST=10000
