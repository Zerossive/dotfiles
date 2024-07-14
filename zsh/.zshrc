# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# node (node version manager)
source ~/.nvm/nvm.sh

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export EDITOR=nvim

# Other directories in Path
export PATH=$PATH:~/.local/bin

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

### Updates

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Completion waiting dots
COMPLETION_WAITING_DOTS="true"

# `history` command timestamp format
HIST_STAMPS="yyyy-mm-dd"

# Plugins
plugins=(vi-mode colored-man-pages zsh-completions zsh-autosuggestions command-not-found zsh-syntax-highlighting thefuck zsh-fzf-history-search taskwarrior)

# vi-mode settings
VI_MODE_SET_CURSOR=true
VI_MODE_RESET_PROMPT_ON_MODE_CHANGE=true

# Load omzsh script
source $ZSH/oh-my-zsh.sh

# Aliases
source /home/danny/.config/.aliases

# Disable highlight on paste
zle_highlight+=(paste:none)

# It said to put this after installing thefuck rpm (pip didn't work)
eval $(thefuck --alias)

# Zoxide
eval "$(zoxide init --cmd cd zsh)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Homebrew
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
