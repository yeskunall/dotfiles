export NVM_DIR=$HOME/.nvm
export ZSH=/Users/kimchi/.oh-my-zsh
export dev=$HOME/Documents/dev
export GOPATH=$dev/go
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin

ZSH_THEME="spaceship"

# spaceship-prompt stuff ↓

# This should make the prompt a little faster
SPACESHIP_PROMPT_ORDER=(
  time          # Time stamps section
  user          # Username section
  dir           # Current directory section
  host          # Hostname section
  package       # Package version
  git           # Git section (git_branch + git_status)
  node          # Node.js section
  xcode         # Xcode section
  golang        # Go section
  docker        # Docker section
  aws           # Amazon Web Services section
  venv          # virtualenv section
  pyenv         # Pyenv section
  exec_time     # Execution time
  line_sep      # Line break
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)

SPACESHIP_GIT_PREFIX=" "
SPACESHIP_GIT_SYMBOL="\ufb2b "
SPACESHIP_NODE_SYMBOL="\uf898 "
SPACESHIP_PACKAGE_PREFIX="＠ "
SPACESHIP_PACKAGE_SYMBOL="📦 "

plugins=(
  fast-syntax-highlighting
)

# I don't want this enabled
# Ref: http://zsh.sourceforge.net/Doc/Release/Redirection.html#Multios
unsetopt MULTIOS

source $dev/uses/.zsh/.aliases.zsh
source $dev/uses/.zsh/.exports
source $dev/uses/.zsh/.functions
source $NVM_DIR/nvm.sh
source $ZSH/oh-my-zsh.sh

# `zsh-autosuggestions` won't work if placed in
# $ZSH_CUSTOM/plugins/ or ~/.oh-my-zsh/plugins/
# so `source`-ing it from Homebrew cellar instead
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /Users/kimchi/.nvm/versions/node/v10.3.0/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /Users/kimchi/.nvm/versions/node/v10.3.0/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /Users/kimchi/.nvm/versions/node/v10.3.0/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /Users/kimchi/.nvm/versions/node/v10.3.0/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh
