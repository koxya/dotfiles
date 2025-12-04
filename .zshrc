# fzf config
source <(fzf --zsh)
FZF_CTRL_R_OPTS= source <(fzf --zsh)
FZF_ALT_C_COMMAND= source <(fzf --zsh)
export FZF_DEFAULT_COMMAND="rg --files --follow --no-ignore-vcs --hidden -g '!{**/node_modules/*,**/.git/*}'"
export FZF_DEFAULT_OPTS="--no-height --reverse --border"
# CTRL-/ to toggle small preview window to see the full command
# CTRL-Y to copy the command into clipboard using pbcopy
export FZF_CTRL_R_OPTS="
  --exact
  --preview 'echo {}' --preview-window up:3:hidden:wrap
  --bind '?:toggle-preview'
  --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
  --header 'Press CTRL-Y to copy command into clipboard'"
# Print tree structure in the preview window
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"

function fzf-cdr() {
    local target_dir=`cdr -l | sed 's/^[^ ][^ ]*  *//' | fzf --query "$LBUFFER"`
    if [ -n "$target_dir" ]; then
        BUFFER="cd ${target_dir}"
        zle accept-line
    fi
}
zle -N fzf-cdr
bindkey "^]" fzf-cdr

setopt hist_expire_dups_first # 履歴を切り詰める際に、重複する最も古いイベントから消す
setopt hist_ignore_all_dups   # 履歴が重複した場合に古い履歴を削除する
setopt share_history          # 全てのセッションで履歴を共有する

# copy and paste
# alias clip='iconv -f UTF-8 -t CP932 | clip.exe'
# alias paste='powershell.exe -Command Get-Clipboard'

# alias
alias bruby='bundle exec ruby'
alias brails='bundle exec rails'
alias brake='bundle exec rake'
alias brspec='bundle exec rspec'
alias bexec='bundle exec'
alias grun='go run'

alias gss='git branch --list | cut -c 3- | fzf | xargs git switch'

# ls拡張
alias la='ls -la --color=auto'
alias ll='ls -lht --color=auto'
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias ..='cd ../'
alias ...='cd ../../'

# parallel-ssh
alias pssh='parallel-ssh'

# cdr
autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs
zstyle ':chpwd:*' recent-dirs-max 500
zstyle ':chpwd:*' recent-dirs-default yes

# brew universal ctags
alias ctags="`brew --prefix`/bin/ctags"

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk

# Load pure theme
zinit ice pick"async.zsh" src"pure.zsh" # with zsh-async library that's bundled with it.
zinit light sindresorhus/pure
# promptの色を変える
zstyle :prompt:pure:path color green
zstyle :prompt:pure:git:branch color red

zinit wait lucid light-mode for \
    zdharma-continuum/fast-syntax-highlighting \
    zsh-users/zsh-completions \
    zsh-users/zsh-autosuggestions \
    chrissicool/zsh-256color \
    koya-masuda/peco-s3arch

zinit light olets/zsh-abbr
zshaddhistory() {
   [[ "$?" == 0 ]
}

# bun completions
[ -s "/Users/koyamasuda/.bun/_bun" ] && source "/Users/koyamasuda/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# gpg
export GPG_TTY=$TTY


