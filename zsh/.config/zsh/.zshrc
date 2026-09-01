# ---------- THEME ----------

# ZSH_THEME="powerlevel10k/powerlevel10k" # default: robbyrussell
# source "$OMZ/custom/plugins/zsh-syntax-highlighting/catppuccin_mocha-zsh-syntax-highlighting.zsh"

# Set default `bat` theme
export BAT_THEME="base16"

# ---------- HISTORY ----------

HISTFILE="$XDG_STATE_HOME/zsh/history"
HISTSIZE=10000
SAVEHIST=10000
HIST_STAMPS="yyyy-mm-dd"

setopt APPEND_HISTORY
setopt SHARE_HISTORY
setopt EXTENDED_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_FIND_NO_DUPS

# ---------- SHELL_BEHAVIOR ----------

setopt AUTOCD
setopt NOBEEP
setopt NUMERIC_GLOB_SORT

# auto ls after cd
autoload -Uz add-zsh-hook
ls_after_cd() {
  eza --icons --group-directories-first
}
add-zsh-hook chpwd ls_after_cd

# homebrew
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# Disable highlight on paste
zle_highlight+=(paste:none)

# ---------- SMART_NAVIGATION ----------

eval "$(zoxide init --cmd cd zsh)"

# ---------- COMPLETION ----------

# Load completion system
autoload -Uz compinit

# Initialize completion with cached metadata file
compinit -d "$XDG_CACHE_HOME/zsh/zcompdump"

# Enable interactive completion menu selection
zstyle ':completion:*' menu select

# Make completion case-insensitive
# Example: "doc" can complete to "Documents"
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'  # lowercase input matches upper and lower

# complte hidden files
_comp_options+=(globdots) # With hidden files

# Hyphen-insensitive completion
HYPHEN_INSENSITIVE="true"

# Completion waiting dots
COMPLETION_WAITING_DOTS="true"

# ---------- FUZZY_FINDER ----------

# source fzf key bindings
[[ -f /usr/share/fzf/shell/key-bindings.zsh ]] && source /usr/share/fzf/shell/key-bindings.zsh

# set default fzf options
export FZF_DEFAULT_OPTS='
  --color=border:#74c7ec,gutter:-1,label:#74c7ec,bg:-1,pointer:#74c7ec,hl:#74c7ec,hl+:#74c7ec,info:#CBA6F7
  --layout=reverse
  --info=inline-right
  --preview="
    if [[ -d {} ]]; then
      eza -alF --tree --icons --level=2 --no-permissions --no-user --group-directories-first --no-time --no-filesize --color=always {};
    else
      case {} in
        *.tar) tar -tf {} ;;
        *.tar.gz|*.tgz) tar -tzf {} ;;
        *.tar.bz2) tar -tjf {} ;;
        *.tar.xz) tar -tJf {} ;;
        *.zip) unzip -l {} ;;
        *.rar) unrar l {} ;;
        *) bat --color=always --style=numbers --line-range=:500 {} ;;
      esac;
    fi"
  --preview-border=left
  --preview-window=hidden
	--bind='alt-p:toggle-preview'
	--bind='alt-u:preview-half-page-up'
	--bind='alt-d:preview-half-page-down'
	--bind='ctrl-u:half-page-up'
	--bind='ctrl-d:half-page-down'
'

# set extra fzf options for shortcuts
export FZF_CTRL_T_OPTS="--preview-window=nohidden"
# export FZF_ALT_C_OPTS=""
# export FZF_CTRL_R_OPTS=""

# ---------- VI_MODE ----------

# vi mode
bindkey -v
export KEYTIMEOUT=1 # reduce delay when switching modes

# switch cursor shapes in vi mode
cursor_mode() {
    cursor_block='\e[2 q'
    cursor_beam='\e[6 q'

    function zle-keymap-select {
        if [[ ${KEYMAP} == vicmd ]] ||
            [[ $1 = 'block' ]]; then
            echo -ne "$cursor_block"
        elif [[ ${KEYMAP} == main ]] ||
            [[ ${KEYMAP} == viins ]] ||
            [[ ${KEYMAP} = '' ]] ||
            [[ $1 = 'beam' ]]; then
            echo -ne "$cursor_beam"
        fi
    }

    zle-line-init() {
        echo -ne "$cursor_beam"
    }

    zle -N zle-keymap-select
    zle -N zle-line-init
}
cursor_mode

# add text objects
autoload -Uz select-bracketed select-quoted
zle -N select-quoted
zle -N select-bracketed
for km in viopp visual; do
  bindkey -M $km -- '-' vi-up-line-or-history
  for c in {a,i}${(s..)^:-\'\"\`\|,./:;=+@}; do
    bindkey -M $km $c select-quoted
  done
  for c in {a,i}${(s..)^:-'()[]{}<>bB'}; do
    bindkey -M $km $c select-bracketed
  done
done

# ---------- KEYBINDS ----------

# edit current command in editor
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey "^E" edit-command-line

bindkey -s "^F" "cdi\n"
bindkey "^[h" backward-char
bindkey "^[l" forward-char
bindkey "^[w" forward-word
bindkey "^[b" backward-word
bindkey "^[e" emacs-forward-word
bindkey '^P' up-line-or-history
bindkey '^N' down-line-or-history

# ---------- PLUGINS ----------

ZPLUGINDIR="${ZDOTDIR:-$HOME/.config/zsh}/plugins"

_zplugin_load() {
  local plugin_path="${ZPLUGINDIR}/${2}"
  if [[ ! -d "$plugin_path" ]]; then
    mkdir -p "$ZPLUGINDIR"
    echo "Installing ${2}..."
    git clone --depth=1 "https://github.com/${1}/${2}" "$plugin_path" \
      || { echo "ERROR: failed to install ${2}" >&2; return 1; }
  fi
  source "${plugin_path}/${2}.plugin.zsh"
}

zplugin-update() {
  local dir
  for dir in "${ZPLUGINDIR}"/*/; do
    echo "Updating ${dir:t}..."
    git -C "$dir" pull --ff-only
  done
}

# _zplugin_load marlonrichert zsh-autocomplete
_zplugin_load zsh-users zsh-completions

_zplugin_load zsh-users zsh-autosuggestions

# _zplugin_load jeffreytse zsh-vi-mode
ZVM_SYSTEM_CLIPBOARD_ENABLED=true
ZVM_LINE_INIT_MODE=i
# ZVM_INIT_MODE=sourcing # fix keybindings being overwritten

_zplugin_load zdharma-continuum fast-syntax-highlighting

# ---------- PROMPT ----------

# initialize starship prompt
eval "$(starship init zsh)"

############################################
# ---------- Keep this at the end ----------
############################################

export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" --no-use  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# vim: set ft=bash:
