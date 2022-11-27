# Set up prompt.
# Colors are set as Bad_Wolf dark, a little too colorful, but whatever. :)
PS1="%F{#c7915b}[%F{#aeee00}%n%f%F{#fade3e}@%F{#ffa724}%M %F{#0a9dff}%~%f%F{#c7915b}]%F "
autoload -U colors && colors # Load colors

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# Change Default Editor to NeoVim
export EDITOR='/usr/bin/nvim'

# Enable Home/End/Delete and ctrl + Arrow Keys
# If this doesn't work use "cat" then press the key, replace with outputted string
bindkey  "^[[7~"   beginning-of-line
bindkey  "^[[8~"   end-of-line
bindkey  "^[[3~"  delete-char
bindkey "^[Od" backward-word
bindkey "^[Oc" forward-word

# History
HISTSIZE=500
SAVEHIST=500
HISTFILE=$HOME/.zhistory
setopt hist_ignore_dups # Ignore Duplicates
setopt hist_ignore_space # Ignore Commands that start with a space

# Command Alias 
setopt autocd # no need to type cd before changing directory
# For colors and all files (excluding . and ..) when using ls
#alias ls="ls --color=auto -A"
# exa is an ls alternative with better colors.
alias ls="exa -a"
# Grep Colors
alias grep="grep --color=auto"
# Prompt before overwriting
alias mv="mv -i"
alias rm="rm -i"


# Get new emails before opening neomutt
alias neomutt="mailsync && neomutt"
# Terminal weather forecast based on IP location
alias weather="curl wttr.in"
# Move to USB drive
alias usb="cd /media/usb_drive"
# Switched to neovim 2022-11-08
alias vim="nvim"

# Load syntax highlighting and autosuggestions; should be last.
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
