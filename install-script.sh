#!/usr/bin/env bash
# ==============================================================================
# Script Name: install-script.sh
# Description: A script to install various applications and utilities.
# Usage: install-script.sh [-h | -l | -i] <cateogry>
# Author: Danny Harris
# Dependencies: dnf, flatpak, brew, npm, cargo
# ==============================================================================

# -e: exit on error, -u: treat unset variables as errors, -o pipefail: pipe will fail if any command fails
set -euo pipefail

# set options
testing=false
steam_flatpak=true

# application lists
package_list=(
	# GENERAL
	corectrl
	firefox
	flatpak
	mediainfo
	nicotine+
	obs-studio
	openrgb
	piper
	qbittorrent
	syncthing

	# MEDIA
	beets
	beets-doc
	beets-plugins
	ImageMagick
	mp3gain

	# TOOLS
	btop
	fastfetch
	nvtop
	qalc
	speedtest-cli
	stow
	thefuck
	timew
	trash-cli

	# OTHER
	cava
	figlet
)
$steam_flatpak || package_list+=(
	steam protontricks
)
$testing && package_list=("qalc" "figlet")

# TODO: refactor to make dev_essentials a boolean that lists/installs a subset of all other lists
dev_list=(
	bat
	docker-ce
	distrobox
	entr
	eza
	fd-find
	fzf
	git
	git-delta
	lazygit
	neovim
	npm
	ripgrep
	tmux
	zoxide
)
$testing && dev_list=("git" "fzf")

flatpak_list=(
	# GENERAL
	com.heroicgameslauncher.hgl
	md.obsidian.Obsidian
	org.nickvision.money
	app.zen_browser.zen
	com.brave.Browser
	com.vivaldi.Vivaldi
	com.github.iwalton3.jellyfin-media-player
	com.usebottles.bottles
	org.gnome.Boxes
	org.videolan.VLC

	# MEDIA TOOLS
	fr.handbrake.ghb
	io.gitlab.theevilskeleton.Upscaler
	org.nickvision.tubeconverter # parabolic media downloader
	org.kde.krita
	org.inkscape.Inkscape
	org.audacityteam.Audacity
	org.musicbrainz.Picard    # music tagger
	com.github.qarmin.czkawka # duplicate finder
	io.github.seadve.Mousai   # music recognition
	com.authormore.penpotdesktop

	# TOOLS
	com.github.tenderowl.frog # ocr
	io.github.flattool.Warehouse
	org.gnome.World.PikaBackup
	org.gnome.SimpleScan # document scanner
	com.protonvpn.www    # proton vpn
	org.localsend.localsend_app
	it.mijorus.gearlever
	com.github.tchx84.Flatseal
	net.davidotek.pupgui2 # protonup-qt
	me.iepure.devtoolbox  # dev tools
)
$steam_flatpak && flatpak_list+=(
	com.valvesoftware.Steam
	com.github.Matoking.protontricks
)
$testing && flatpak_list=("io.github.flattool.Warehouse" "io.github.flattool.Warehouse")

brew_list=(
	yazi
	aichat
	sshs     # ssh tui
	exiftool # file metadata viewer
	timer
	tlrc   # tldr in rust
	dysk   # disk usage analyzer
	xh     # easier curl
	pastel # color manipulation
	fx     # json viewer
)
$testing && brew_list=("exiftool")

# TODO: add cargo list
cargo_list=(
	cargo-list
	cargo-update
	cargo-watch
	wiki-tui
)
$testing && cargo_list=("cargo-list")

npm_list=(
	typescript
)
$testing && npm_list=("typescript")

# things like app images, docker containers, etc.
other_list=(
	"awakened poe trade"
	"exiled exchange 2"
	"path of building 1/2"
	feishin
	krohnkite # (kwin script, fork)
	nomachine
	portmaster
	scc
)
$testing && other_list=("other item")

listApps() {
	local category="${1:-all}"
	case "$category" in
	"package") printf "%s\n" "${package_list[@]}" ;;
	"dev") printf "%s\n" "${dev_list[@]}" ;;
	"flatpak") printf "%s\n" "${flatpak_list[@]}" ;;
	"brew") printf "%s\n" "${brew_list[@]}" ;;
	"npm") printf "%s\n" "${npm_list[@]}" ;;
	"other") printf "%s\n" "${other_list[@]}" ;;
	"all")
		printf "[PACKAGE]\n"
		printf "%s\n" "${package_list[@]}"
		printf "\n[DEV]\n"
		printf "%s\n" "${dev_list[@]}"
		printf "\n[FLATPAK]\n"
		printf "%s\n" "${flatpak_list[@]}"
		printf "\n[BREW]\n"
		printf "%s\n" "${brew_list[@]}"
		printf "\n[NPM]\n"
		printf "%s\n" "${npm_list[@]}"
		printf "\n[OTHER]\n"
		printf "%s\n" "${other_list[@]}"
		;;
	*) printf "Invalid argument (valid arguments: package, dev, flatpak, brew, npm, other, all)\n" ;;
	esac
}

# Installers
packageInstall() {
	printf "Installing packages...\n"
	sudo dnf install "${package_list[@]}"
}
devInstall() {
	printf "Installing dev tools...\n"
	sudo dnf install "${dev_list[@]}"
}
flatpakInstall() {
	if command -v flatpak &>/dev/null; then
		printf "Installing flatpak applications...\n"
		flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
		sudo flatpak install "${flatpak_list[@]}"
	else
		printf "Error: flatpak not found\n"
	fi
}
brewInstall() {
	if command -v brew &>/dev/null; then
		printf "Installing brew applications...\n"
		brew install "${brew_list[@]}"
	else
		printf "Error: brew not found\n"
	fi
}
npmInstall() {
	if command -v npm &>/dev/null; then
		printf "Installing npm applications...\n"
		sudo npm install -g "${npm_list[@]}"
	else
		printf "Error: npm not found\n"
	fi
}

install_apps() {
	local category="${1:-all}"
	case "$category" in
	"package") packageInstall ;;
	"dev") devInstall ;;
	"flatpak") flatpakInstall ;;
	"brew") brewInstall ;;
	"npm") npmInstall ;;
	"all")
		packageInstall
		devInstall
		flatpakInstall
		brewInstall
		npmInstall
		packageInstall
		;;
	*) printf "Invalid argument (valid arguments: package, dev, flatpak, brew, npm, all)\n" ;;
	esac
}

help() {
	cat <<"EOF"
▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁
▏Install Script▕
▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔
Usage: install-script.sh [-h | -l | -i] <cateogry>

-l	LIST applications by category
	Requires one of the following arguments:
		package, dev, flatpak, brew, other, all
	Example:
		install-script.sh -l all
	Example:
		install-script.sh -l package | OTHER_COMMANDS

-i	INSTALL applications by category
	Requires one of the following arguments:
		package, dev, flatpak, brew, all
	Example:
		install-script.sh -i package

-h	Print this help page
EOF
}

while getopts ":hl:i:" option; do
	case "$option" in
	h) # First: check for help
		help
		exit
		;;
	\?) # Second: check for invalid options
		printf "Error: Invalid option\n"
		exit
		;;
	l) # List apps by category
		listApps "$OPTARG"
		exit
		;;
	i) # Install apps by category
		install_apps "$OPTARG"
		exit
		;;
	*)
		printf "Error: Invalid option, or missing arguments\n"
		exit
		;;
	esac
done

help

# vim: set ft=sh:
