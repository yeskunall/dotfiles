# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Custom theme
# Need to find a better name  for it
ZSH_THEME="custom"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"
DISABLE_AUTO_TITLE="true"

source $ZSH/oh-my-zsh.sh
source ~/.zsh/.aliases.zsh
source ~/.zsh/.functions

DEFAULT_USER='Kimchi'

# Set window title
export PROMPT_COMMAND='echo -ne "\033];${PWD##*/}\007"; ':"$PROMPT_COMMAND"