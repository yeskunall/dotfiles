# Make these variables available everywhere
export dev=$HOME/Documents/dev
export GOPATH=$dev/go
export GOROOT=/usr/local/opt/go/libexec
export NVM_DIR=$HOME/.nvm
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin
export ZPLUG_HOME=/usr/local/opt/zplug

# TODO: `source` just one file, I already don’t like how this file is growing
# large already

# Pull-in `nvm`
source $NVM_DIR/nvm.sh

# Pull-in `zplug`
source $ZPLUG_HOME/init.zsh

# Load all plugins
source $dev/uses/zplug/load.zsh

# Pull-in custom config
source $dev/uses/.zsh/.aliases.zsh
source $dev/uses/.zsh/.exports
source $dev/uses/.zsh/.functions

# I don't want this enabled
# Ref: http://zsh.sourceforge.net/Doc/Release/Redirection.html#Multios
unsetopt MULTIOS

# Init `starship`
eval "$(starship init zsh)"
