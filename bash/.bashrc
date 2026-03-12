#
# ~/.bashrc
#
#
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi
if [ -f ~/.bash_functions ]; then
  . ~/.bash_functions
fi

eval "$(oh-my-posh init bash --config ~/.poshthemes/catppuccin_mocha.omp.json)"
eval "$(zoxide init bash)"

export TMUX_PLUGIN_MANAGER_PATH="$HOME/.tmux/plugins/"
export EDITOR=nvim
export PATH=/home/macho25/.opencode/bin:$PATH
export PATH="$HOME/.local/bin:$PATH"

PS1='[\u@\h \W]\$ '
CURRENT_WALLPAPER="$HOME/Pictures/blue.jpg"
