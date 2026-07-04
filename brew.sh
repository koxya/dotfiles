#!/usr/bin/env zsh

commands=(
    awscli
    awslogs
    bat
    curl
    delta
    fzf
    git
    gh
    jq
    mise
    neovim
    pv
    rbenv
    ripgrep
    tmux
    tree
    volta
    watch
    zsh
)

for commands in "${commands[@]}" ; do
    `brew install ${commands}`
done

# cask
casks=(
    dbeaver-community
    font-hack-nerd-font
    google-japanese-ime
    karabiner-elements
    raycast
    visual-studio-code
    wezterm
    zed
)
for casks in "${casks[@]}" ; do
    `brew install --cask ${casks}`
done
