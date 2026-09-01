# ---------- EXPORT_VARIABLES ----------

# XDG directories
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-"$HOME/.config"}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-"$HOME/.cache"}"
export XDG_DATA_HOME="${XDG_DATA_HOME:-"$HOME/.local/share"}"
export XDG_STATE_HOME="${XDG_STATE_HOME:-"$HOME/.local/state"}"

# other directories
export YAZI_CONFIG_HOME="$XDG_CONFIG_HOME/yazi"

# other variables
export EDITOR="nvim"
export VISUAL="$EDITOR"

# colorize man pages
if command -v bat >/dev/null 2>&1; then
  export MANPAGER="bat --language man --style=plain --strip-ansi=always"
fi

# starship
export STARSHIP_CONFIG="$ZDOTDIR/starship.toml"

# ---------- EDIT_PATH ----------

# add local bin to PATH
[[ -d "$HOME/.local/bin" ]] && export PATH="$HOME/.local/bin:$PATH"

# add cargo to PATH
[[ -f "$HOME/.cargo/env" ]] && source "$HOME/.cargo/env"

# ---------- SOURCE_FILES ----------

[[ -f "$XDG_CONFIG_HOME/.aliases" ]] && source "$XDG_CONFIG_HOME/.aliases"

[[ -f "$XDG_CONFIG_HOME/.api_keys" ]] && source "$XDG_CONFIG_HOME/.api_keys"
