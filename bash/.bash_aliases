#
# ~/.bash_aliases
#
# tools

alias grep='rg --color=auto'
alias cat='bat'

alias l='lsd'
alias ls='lsd -l'
alias la='lsd -a'
alias ll='lsd -la'
alias lt='lsd --tree'

alias mv='mv -v'
alias cp='cp -v'
alias mkdir='mkdir -v'

alias cd='z'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# git
alias gt='git status'
alias gc='git commit -m'
alias ga='git add'
alias gp='git push origin main'
alias gl='git log --oneline'
alias gb='git branch'
alias gh='git checkout'
alias gm='git merge'
alias gd='git diff'

# general
alias cl='clear'
alias Python='source ./venv/bin/activate'
alias bashrc='source ~/.bashrc'
alias py='python'
alias burp='/data/BurpSuiteCommunity/Burp'
alias vim='nvim'
alias vimconf='cd ~/.config/nvim && vim .'
alias vimbash='vim ~/.bashrc'
alias vimi3='cd ~/.config/i3 && vim .'
alias cigan='clear;fastfetch --logo arch'
alias homescan='sudo nmap 192.168.0.0/24 -A -T5 -sV -sC -O --osscan-guess > cigan'
alias wallpaper='feh --bg-scale "$CURRENT_WALLPAPER"'
alias pa='source ./venv/bin/activate'
alias py='python'
