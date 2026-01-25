#!/usr/bin/env bash

apps=(
	eza
	neovim
	tmux
	bash
	hyperfine
	zsh
	fish
	git
	gcc
	clang
	vim
	curl
	python3
	python3-pip
	stow
	nodejs
	npm
	rust
	ffmpeg
	go
	zoxide
	bat
)

sudo apt install ${apps[@]}

# bash


# tmux tpm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# neovim
git clone https://github.com/NvChad/starter ~/.config/nvim && nvim

