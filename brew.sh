#!/usr/bin/env zsh

commands=(
    zsh
    awscli
    awslogs
    curl
    fzf
    jq
    pv
    rbenv
    ripgrep
    tmux
    tree
    volta
    watch
    bat
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
)
for casks in "${casks[@]}" ; do
    `brew install --cask ${casks}`
done

