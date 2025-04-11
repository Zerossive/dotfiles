# source things
. $HOME/.config/.aliases
. "$HOME/.cargo/env"

# add local bin to PATH
[ -d "$HOME/.local/bin" ] && export PATH="$HOME/.local/bin:$PATH"

# XDG directories
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share

# other directories
export YAZI_CONFIG_HOME=$XDG_CONFIG_HOME/yazi

# other variables
export EDITOR="nvim"
