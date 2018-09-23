export ZSH=/Users/kimchi/.oh-my-zsh
ZSH_THEME="spaceship"

SPACESHIP_PROMPT_SYMBOL=❯

plugins=(
  z,
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh
# `zsh-autosuggestions` won't work if placed in
# $ZSH_CUSTOM/plugins/ or ~/.oh-my-zsh/plugins/
# so `source`-ing it from Homebrew cellar instead
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# I don't want this enabled
# Ref: http://zsh.sourceforge.net/Doc/Release/Redirection.html#Multios
unsetopt MULTIOS

# Do this here explicitly instead of doing
# it in `~/.exports`
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

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /Users/kimchi/.nvm/versions/node/v10.3.0/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /Users/kimchi/.nvm/versions/node/v10.3.0/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /Users/kimchi/.nvm/versions/node/v10.3.0/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /Users/kimchi/.nvm/versions/node/v10.3.0/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh
