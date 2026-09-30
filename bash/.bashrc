#
# ~/.bashrc
#
#
# export TAILSCALE_IP=$(tailscale ip -4)
export SECRET="ServeR317250+"

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi
if [ -f ~/.bash_functions ]; then
  . ~/.bash_functions
fi
# if [ -f ~/.mc_server_aliases_functions ]; then
#   . ~/.mc_server_aliases_functions
# fi

eval "$(oh-my-posh init bash --config ~/.poshthemes/catppuccin_mocha.omp.json)"
eval "$(zoxide init bash)"

export TMUX_PLUGIN_MANAGER_PATH="$HOME/.tmux/plugins/"
export EDITOR=nvim
export PATH=/home/macho25/.opencode/bin:$PATH
export PATH="$HOME/.local/bin:$PATH"
export VCPKG_ROOT="/home/macho25/vcpkg/"
export PATH="$VCPKG_ROOT:$PATH"

PS1='[\u@\h \W]\$ '
# CURRENT_WALLPAPER="$HOME/Pictures/blue.jpg"
CURRENT_WALLPAPER="$HOME/Pictures/deep-space.jpg"
