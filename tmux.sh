#!/usr/bin/env bash

web=(nodejs npm)

compilers=(gcc clang g++ clang++)

editors=(noevim vim)

build_tools=(make)

devolop_tools=(python3 go eza yazi curl
	wget )

package_man=(python3-pip cargo)

shells=(zsh fish)

apps=(
	eza neovim tmux bash hyperfine
	zsh fish git gcc clang vim curl
	python3 python3-pip stow nodejs
	npm rust ffmpeg go zoxide
	bat
)

sudo apt install ${apps[@]}

# bash


# tmux tpm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# neovim
git clone https://github.com/NvChad/starter ~/.config/nvim && nvim

