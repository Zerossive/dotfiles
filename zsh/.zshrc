# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export EDITOR=nvim

# Other directories in Path
export PATH=$PATH:~/.local/bin

# API Keys
if [ -f ~/.api_keys ]; then
  source ~/.api_keys
fi

# Theme
ZSH_THEME="powerlevel10k/powerlevel10k" # default: robbyrussell
source ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/catppuccin_mocha-zsh-syntax-highlighting.zsh
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#cba6f7,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#74c7ec,pointer:#cba6f7 \
--color=marker:#cba6f7,fg+:#cdd6f4,prompt:#74c7ec,hl+:#f38ba8"

# Set default `bat` theme
export BAT_THEME="base16"

# Hyphen-insensitive completion
HYPHEN_INSENSITIVE="true"

# Completion waiting dots
COMPLETION_WAITING_DOTS="true"

# `history` command timestamp format
HIST_STAMPS="yyyy-mm-dd"

# Plugins
plugins=(zsh-vi-mode colored-man-pages zsh-completions zsh-autosuggestions zsh-syntax-highlighting zsh-fzf-history-search)

# vi-mode settings
ZVM_SYSTEM_CLIPBOARD_ENABLED=true
ZVM_LINE_INIT_MODE=i
ZVM_LAZY_KEYBINDINGS=true
ZVM_INIT_MODE=sourcing # fix keybindings being overwritten

# Homebrew (keep before omzsh)
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# Load omzsh script
source $ZSH/oh-my-zsh.sh

# Aliases
source $HOME/.config/.aliases

# Disable highlight on paste
zle_highlight+=(paste:none)

# [[ Custom Keybinds ]]
bindkey -s "^F" "cdi\n"
bindkey "^[h" backward-char
bindkey "^[l" forward-char
bindkey "^[w" forward-word
bindkey "^[b" backward-word
bindkey "^[e" emacs-forward-word
bindkey "^@" list-choices
bindkey -r "^d"
bindkey "^X^E" edit-command-line
bindkey "^[u" undo
bindkey "^[r" redo

# [[ Keep this at the end ]]

# Zoxide
eval "$(zoxide init --cmd cd zsh)"

# auto ls after cd
autoload -Uz add-zsh-hook
ls_after_cd() {
    eza --icons --group-directories-first
}
add-zsh-hook chpwd ls_after_cd

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
