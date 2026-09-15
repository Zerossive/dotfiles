#!/usr/bin/env bash
# ==============================================================================
# Script Name: install-script.sh
# Description: A script to install various applications and utilities.
# Usage: install-script.sh [-h | -d | -l | -i] <cateogry>
# Author: Danny Harris
# Dependencies: dnf, flatpak, brew, npm, cargo
# ==============================================================================

# -e: exit on error, -u: treat unset variables as errors, -o pipefail: pipe will fail if any command fails
set -euo pipefail

# set options
dev_only=false

action=
category=

# parse options
while getopts ":hdl:i:" option; do
	case "$option" in
	h) # first: check for help
		action=help
		;;
	d) # dev essentials
		dev_only=true
		;;
	l) # list apps by category
		action=list
		category="$OPTARG"
		;;
	i) # install apps by category
		action=install
		category="$OPTARG"
		;;
	\?) # second: check for invalid options
		printf "Error: Invalid option: -%s\n" "$OPTARG" >&2
		exit 1
		;;
	:)
		printf "Error: Option -%s requires an argument\n" "$OPTARG" >&2
		exit 1
		;;
	esac
done

# H1: category lists
installable_categories=(
	package
	flatpak
	brew
	npm
	cargo
)
listable_categories=("${installable_categories[@]}" "other")

# H1: application lists
package_list=(
	# general
	flatpak
	mediainfo
	nicotine+
	obs-studio
	openrgb
	piper
	qbittorrent
	syncthing
	tailscale

	# terminal
	starship
	fish

	# media
	beets
	beets-doc
	beets-plugins
	mp3gain # for beets plugin
	imagemagick

	# tools
	btop
	fastfetch
	nvtop
	qalc
	speedtest-cli
	stow
	trash-cli
	scrcpy # mirror android screen and camera
	fuzzel # application launcher
	pv     # pipe viewer progress monitor

	# other
	cava
	figlet
)
package_list_dev=(
	bat
	docker-ce
	distrobox
	entr
	atool
	eza
	fd-find
	fzf
	git
	git-delta
	lazygit
	neovim
	mise # version manager (used to install npm)
	# npm # potentially not needed with mise?
	ripgrep
	tmux
	zoxide
)

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
	com.valvesoftware.Steam

	# MEDIA TOOLS
	fr.handbrake.ghb
	io.gitlab.theevilskeleton.Upscaler
	org.nickvision.tubeconverter # parabolic media downloader
	org.kde.krita
	org.audacityteam.Audacity
	org.musicbrainz.Picard    # music tagger
	com.github.qarmin.czkawka # duplicate finder
	io.github.seadve.Mousai   # music recognition

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
)
flatpak_list_dev=(
	org.inkscape.Inkscape
	com.authormore.penpotdesktop
	com.github.Matoking.protontricks
	me.iepure.devtoolbox # dev tools
)

brew_list=(
	pastel # color manipulation
	typst
)
brew_list_dev=(
	yazi
	resvg    # svg renderer (for yazi)
	exiftool # file metadata viewer
	tlrc     # tldr in rust
	dysk     # disk usage analyzer
	xh       # easier curl
	fx       # json viewer
)

cargo_list=(
	wiki-tui
)
cargo_list_dev=(
	cargo-list
	cargo-update
	bacon
)

npm_list=(
	@bitwarden/cli
)
npm_list_dev=(
	typescript
	@earendil-works/pi-coding-agent
)

# things like app images, docker containers, etc.
other_list=(
	"awakened poe trade"
	"exiled exchange 2"
	"path of building 1/2"
	feishin
	krohnkite # (kwin script, fork)
	portmaster
	scc # estimate code complexity/cost
)

build_lists() {
	local category

	for category in "${installable_categories[@]}"; do
		declare -n list="${category}_list"
		declare -n dev_list="${category}_list_dev"

		if $dev_only; then
			list=("${dev_list[@]}")
		else
			list+=("${dev_list[@]}")
		fi
	done
}

# colorize output
colorize() {
	for line in "${@}"; do
		if [[ -t 1 ]]; then
			printf "\e[1;36m%s\e[0m\n" "$line"
		else
			printf "%s\n" "$line"
		fi
	done
}

list_apps() {
	local category="${1:-all}"

	if [[ $category == all ]]; then
		for category in "${listable_categories[@]}"; do
			declare -n list="${category}_list"

			printf "\n"
			colorize "[${category^^}]"
			printf "%s\n" "${list[@]}"
		done
		return
	fi

	for valid_category in "${listable_categories[@]}"; do
		[[ $category == "$valid_category" ]] && {
			declare -n list="${category}_list"
			printf "%s\n" "${list[@]}"
			return
		}
	done

	printf "Invalid argument: %s (valid arguments: all %s)\n" "$category" "${listable_categories[*]}" >&2
	exit 1
}

# H1: Installers
install_package() {
	if command -v dnf &>/dev/null; then
		colorize "Installing packages..."
		sudo dnf install "${package_list[@]}"
	# elif command -v OTHER_PACKAGE_MANAGER &>/dev/null; then
	else
		printf "Error: package manager not found\n" >&2
	fi
}
install_flatpak() {
	if command -v flatpak &>/dev/null; then
		colorize "Installing flatpak applications..."
		flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
		flatpak install "${flatpak_list[@]}"
	else
		printf "Error: flatpak not found\n" >&2
	fi
}
install_brew() {
	if command -v brew &>/dev/null; then
		colorize "Installing brew applications..."
		brew install "${brew_list[@]}"
	else
		printf "Error: brew not found\n" >&2
	fi
}
install_npm() {
	if command -v npm &>/dev/null; then
		colorize "Installing npm applications..."
		npm install -g "${npm_list[@]}"
	else
		printf "Error: npm not found\n" >&2
	fi
}
install_cargo() {
	if command -v cargo &>/dev/null; then
		colorize "Installing cargo applications..."
		cargo install "${cargo_list[@]}"
	else
		printf "Error: cargo not found\n" >&2
	fi
}

install_apps() {
	local category="${1:-all}"

	if [[ $category == all ]]; then
		for category in "${installable_categories[@]}"; do
			"install_$category"
		done
		return
	fi

	for valid_category in "${installable_categories[@]}"; do
		[[ $category == "$valid_category" ]] && {
			"install_$category"
			return
		}
	done

	printf "Invalid argument: %s (valid arguments: %s)\n" "$category" "${installable_categories[*]}" >&2
	exit 1
}

help() {
	cat <<EOF
▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁
▏Install Script▕
▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔
Usage: install-script.sh [-h | -d | -l | -i] <category>

-l	LIST applications by category
	Requires one of the following arguments:
		all ${listable_categories[*]}
	Example:
		install-script.sh -l all
	Example:
		install-script.sh -l package | OTHER_COMMANDS

-i	INSTALL applications by category
	Requires one of the following arguments:
		all ${installable_categories[*]}
	Example:
		install-script.sh -i package

-d	Only list/install essential development applications

-h	Print this help page
EOF
}

case "$action" in
list)
	build_lists
	list_apps "$category"
	;;
install)
	build_lists
	install_apps "$category"
	;;
*)
	help
	;;
esac

# vim: set ft=sh:
