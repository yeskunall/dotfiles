# Path to your oh-my-zsh installation.
export ZSH=/Users/kimchi/.oh-my-zsh
ZSH_THEME="spaceship"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# I don't want this enabled
# Ref: http://zsh.sourceforge.net/Doc/Release/Redirection.html#Multios
unsetopt MULTIOS

# Do this here explicitly instead of doing
# it in `~/.exports``
export NVM_DIR=$HOME/.nvm
source $NVM_DIR/nvm.sh

WRKSPC=$HOME/Documents
export DEV=$WRKSPC/dev

export GOPATH=$DEV/go
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin

source $DEV/dotfiles/.zsh/.aliases.zsh
source $DEV/dotfiles/.zsh/.exports
source $DEV/dotfiles/.zsh/.functions
