#!/bin/bash

packages=(
    "stow"
    "nvim"
    "tmux"
    "xclip"
    "go"
    "fzf"
    "neofetch"
    "htop"
    "rg"
    "ghostty"
)

for package in "${packages[@]}"; do
    if command -v $package >/dev/null 2>&1; then
        echo -e "\e[32m\e[0m $package"
    else
        echo -e "\e[31m\e[0m $package"
    fi
done
