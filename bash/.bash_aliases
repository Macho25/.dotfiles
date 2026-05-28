#
# ~/.bash_aliases
#
# tools

alias grep='rg --color=auto'
alias cat='bat'

alias l='lsd'
alias ls='lsd -lL'
alias la='lsd -a'
alias ll='lsd -laL'
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
alias gh='git checkout'
alias gm='git merge'
alias gp='git push origin main'

# --- Core & Status ---
alias g='git'
alias gs='git status -b' # smart status with branch info
alias gi='git init'

# --- Adding & Staging ---
alias ga='git add'
alias gapa='git add --patch' # Interactively choose parts of files to stage
alias gall='git add -A'      # Stage absolutely everything

# --- Committing ---
alias gc='git commit --verbose'           # Shows diff inline in editor while writing msg
alias gcm='git commit -m'                 # Quick commit with message
alias gca='git commit --amend'            # Fix/modify the last commit inline
alias gcav='git commit --verbose --amend' # Open editor to change code + msg of last commit
alias gcfx='git commit --fixup'           # Create a fixup! commit (e.g., gcfx <hash>)

# --- Branching & Navigation ---
alias gb='git branch'
alias gba='git branch -a'               # List both local and remote branches
alias gbd='git branch --delete'         # Safe delete branch
alias gbD='git branch --delete --force' # Hard delete branch
alias gco='git checkout'                # Clean checkout shortcut (no 'gc' conflict)
alias gcb='git checkout -b'             # Create and switch to branch instantly

# --- Logging & Inspection ---
alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias glo='git log --oneline --decorate'          # Compact line view
alias glog='git log --oneline --decorate --graph' # Compact line view WITH graph branches
alias gd='git diff'
alias gds='git diff --staged' # See what you staged BEFORE committing
alias gsh='git show'
alias gshs='git show --stat' # See what changed, file summaries only

# --- Pulling & Syncing (Bulletproof Workflows) ---
alias gf='git fetch'
alias gpl='git pull'
alias gplr='git pull --rebase'                       # Pull updates, slide your commits on top
alias gpristine='git reset --hard && git clean -fdx' # Reset changes and delete ALL untracked files

# --- Rebasing & Squashing ---
alias grb='git rebase'
alias grba='git rebase --abort'        # Kill rebase, return to safety
alias grbc='git rebase --continue'     # Continue after conflict resolution
alias grbi='git rebase --interactive'  # Standard interactive rebase
alias gas='git rebase -i --autosquash' # Direct autosquash execution (e.g., gas HEAD~3)

# --- Pushing ---
alias gps='git push'
alias gpsup='git push --set-upstream origin HEAD' # Push new local branch and link it to GitHub
alias gpsf='git push --force-with-lease'          # Safe force push (protects remote work)

# --- Stashing (The Junk Drawer) ---
alias gst='git stash'
alias gstp='git stash pop'   # Pull latest stash out
alias gstl='git stash list'  # View everything in stash drawer
alias gsta='git stash apply' # Apply stash but keep it in the list
alias gstd='git stash drop'  # Permanently discard latest stash

# --- Advanced OMZ Inventions (WIP & Automation) ---

# 🚧 Work In Progress (WIP) System: Save dirty code state without making real commits
alias gwip='git add -A; git rm $(git ls-files --deleted) 2> /dev/null; git commit --no-verify --no-gpg-sign --message "--wip-- [skip ci]"'
alias gunwip='git rev-list --max-count=1 --format="%s" HEAD | grep -q "--wip--" && git reset HEAD~1'

# 🧹 Clean Up Dead Local Branches: Delete any local branches that were already deleted on remote origin
alias gbda='git fetch -p && git branch -vv | grep ": gone\]" | awk '"'"'{print $1}'"'"' | xargs -r git branch -d'

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

alias setw='feh --bg-scale'

alias aliases='nvim ~/.bash_aliases'
