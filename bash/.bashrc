#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

alias gt='git status'
alias gc='git commit -m'
alias ga='git add'
alias gp='git push'
alias gl='git log --oneline'
alias cl='clear'
alias Python='source ./venv/bin/activate'
alias py='python'
alias bashrc='source ~/.bashrc'
alias burp='/data/BurpSuiteCommunity/Burp'
alias cat='bat'
alias l='lsd'
alias ls='lsd -l'
alias la='lsd -a'
alias ll='lsd -la'
alias lt='lsd --tree'
x() {
  chmod +x "$1"

}

mkcd() {
  mkdir "$1" && cd "$1"

}

c() {
  if [ -z "$1" ]; then
    echo "Usage: c <filename without .c> [output path]"
    return 1
  fi

  if [ ! -f "./$1.c" ]; then
    echo "Error: '$1.c' does not exist."
    return 1
  fi

  if [ -n "$2" ]; then
    gcc "$1.c" -o "$2"
  else
    gcc "$1.c" -o "$1"
  fi

  if [ $? -eq 0 ]; then
    echo "Compiled successfully."
  else
    echo "Compilation failed."
  fi
}

if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi
eval "$(oh-my-posh init bash --config ~/.poshthemes/catppuccin_mocha.omp.json)"
export TMUX_PLUGIN_MANAGER_PATH="$HOME/.tmux/plugins/"

alias vim='nvim'
alias vimconf='cd ~/.config/nvim && vim .'
alias vimbash='vim ~/.bashrc'
alias vimi3='cd ~/.config/i3 && vim .'
alias cigan='clear;fastfetch --logo arch'
export PATH="$HOME/.local/bin:$PATH"
alias homescan='sudo nmap 192.168.0.0/24 -A -T5 -sV -sC -O --osscan-guess > cigan'
CURRENT_WALLPAPER="$HOME/Pictures/blue.jpg"
alias wallpaper='feh --bg-scale "$CURRENT_WALLPAPER"'
export EDITOR=nvim
alias pa='source ./venv/bin/activate'
alias py='python'

# opencode
export PATH=/home/macho25/.opencode/bin:$PATH
eval "$(zoxide init bash)"
alias cd='z'
