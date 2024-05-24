#!/bin/sh

LIST_OF_APPS="
	audacity
	awakened poe trade --------------
	blender
	bottles -------------------
	boxes ------------------
	brave --------------
	corectrl
	czkawka
	decoder -----------------
	denaro ---------------
	discord
	feishin ----------------
	firefox ---------------
	fragments ---------------
	frog --------------
	handbrake
	heroic games launcher
	inkscape
	jellyfin
	krita
	lorem
	lutris
	mousai ----------------
	musicbrainz picard
	nomachine
	obs
	obsidian
	openrgb
	parabolic
	path of building
	penpot
	pika backup
	piper
	portmaster
	protontricks
	protonup-qt
	syncthing
	steam
	text pieces
	upscaler
	vivaldi
	vlc
	vscodium
	warehouse
"

TERMINAL_TOOLS="
	bat
	btop
	fd-find
	figlet
	fzf
	git
	neofetch
	neovim
	npm
	nvtop
	ripgrep
	tldr
	thefuck
	zoxide
	eza
	duf
	bat
	scc--------
	speedtest-cli
	entr
	stow
"

# sudo dnf install -y $LIST_OF_APPS
echo "$LIST_OF_APPS"   # print list for testing
echo "$TERMINAL_TOOLS" # print list for testing

# stow nvim
# stow zsh
# stow ...
