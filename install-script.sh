#!/usr/bin/env sh
# ==============================================================================
# Script Name: install-script.sh
# Description: A script to install various applications and utilities.
# Author: Danny Harris
# Dependencies: dnf, flatpak, brew, npm
# ==============================================================================

PACKAGE_LIST="audacity
blender
bottles
boxes
corectrl
firefox
inkscape
krita
lutris
picard
obs-studio
openrgb
piper
protontricks
syncthing
vlc
flatpak
steam
discord
jellyfin
nicotine+
qbittorrent
mediainfo"

FLATPAK_LIST="com.github.qarmin.czkawka
com.belmoussaoui.Decoder
org.nickvision.money
com.github.tenderowl.frog
fr.handbrake.ghb
com.heroicgameslauncher.hgl
org.gnome.design.Lorem
io.github.seadve.Mousai
md.obsidian.Obsidian
org.nickvision.tubeconverter
community.pathofbuilding.PathOfBuilding
org.gnome.World.PikaBackup
net.davidotek.pupgui2
io.gitlab.theevilskeleton.Upscaler
io.github.flattool.Warehouse"

BREW_LIST="yazi
sshs
aichat
exiftool
timer"

TERMINAL_LIST="bat
btop
fd-find
figlet
fzf
git
fastfetch
neovim
npm
nvtop
ripgrep
tldr
thefuck
zoxide
eza
duf
speedtest-cli
entr
stow
trash-cli
cava
qalc
git-delta
beets
beets-doc
beets-plugins
mp3gain
docker-ce
timew
lazygit
tmux
imagemagick"

OTHER_LIST="feishin
portmaster
nomachine
awakened poe trade
exiled exchange 2
brave
vivaldi
scc
krohnkite (kwin script, fork)"

NPM_LIST="typescript"

list_apps() {
	local category="${1:-all}"
	if [ $category == "package" ]; then
		echo "$PACKAGE_LIST"
	elif [ $category == "flatpak" ]; then
		echo "$FLATPAK_LIST"
	elif [ $category == "brew" ]; then
		echo "$BREW_LIST"
	elif [ $category == "terminal" ]; then
		echo "$TERMINAL_LIST"
	elif [ $category == "npm" ]; then
		echo "$NPM_LIST"
	elif [ $category == "other" ]; then
		echo "$OTHER_LIST"
	elif [ $category == "all" ]; then
		echo "$PACKAGE_LIST"
		echo "$FLATPAK_LIST"
		echo "$BREW_LIST"
		echo "$TERMINAL_LIST"
		echo "$OTHER_LIST"
	else
		echo "Invalid argument (valid arguments: package, flatpak, brew, terminal, npm, other, all)"
	fi
}

# Installers
packageInstall() {
	echo "Installing packages..."
	sudo dnf install $1
}
flatpakInstall() {
	if command -v flatpak &>/dev/null; then
		echo "Installing flatpak apps..."
		flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
		sudo flatpak install $1
	else
		echo "Error: flatpak not found"
	fi
}
brewInstall() {
	if command -v brew &>/dev/null; then
		echo "Installing brew apps..."
		brew install $1
	else
		echo "Error: brew not found"
	fi
}
npmInstall() {
	if command -v npm &>/dev/null; then
		echo "Installing npm apps..."
		sudo npm install -g $1
	else
		echo "Error: npm not found"
	fi
}

install_apps() {
	local category="${1:-all}"
	if [ $category == "package" ]; then
		packageInstall "$PACKAGE_LIST"
	elif [ $category == "flatpak" ]; then
		flatpakInstall "$FLATPAK_LIST"
	elif [ $category == "brew" ]; then
		brewInstall "$BREW_LIST"
	elif [ $category == "terminal" ]; then
		packageInstall "$TERMINAL_LIST"
	elif [ $category == "npm" ]; then
		packageInstall "$NPM_LIST"
	elif [ $category == "all" ]; then
		packageInstall "$PACKAGE_LIST"
		flatpakInstall "$FLATPAK_LIST"
		brewInstall "$BREW_LIST"
		packageInstall "$TERMINAL_LIST"
	else
		echo "Invalid argument (valid arguments: package, flatpak, brew, terminal, all)"
	fi
}

help() {
	cat <<"EOF"
▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁
▏Install Script▕
▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔
Syntax: install-script.sh [-h|l|i]

-l	LIST applications by category
	Requires one of the following arguments:
		package, flatpak, brew, terminal, other, all
	Example:
		install-script.sh -l all
	Example:
		install-script.sh -l package | OTHER_COMMANDS

-i	INSTALL applications by category
	Requires one of the following arguments:
		package, flatpak, brew, terminal, all
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
		echo "Error: Invalid option"
		exit
		;;
	l) # List apps by category
		list_apps "$OPTARG"
		exit
		;;
	i) # Install apps by category
		install_apps "$OPTARG"
		exit
		;;
	*)
		echo "Error: Invalid option, or missing arguments"
		exit
		;;
	esac
done

help
