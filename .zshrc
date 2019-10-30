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

# `spaceship-prompt` stuff ↓

# Manually add options to the array. This should make the prompt a little faster
SPACESHIP_PROMPT_ORDER=(
  user          # Username section
  dir           # Current directory section
  host          # Hostname section
  package       # Package version
  git           # Git section (git_branch + git_status)
  node          # Node.js section
  golang        # Go section
  docker        # Docker section
  exec_time     # Execution time
  line_sep      # Line break
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)

SPACESHIP_CHAR_SUFFIX=" "
SPACESHIP_CHAR_SYMBOL="❯"

# I don't want this enabled
# Ref: http://zsh.sourceforge.net/Doc/Release/Redirection.html#Multios
unsetopt MULTIOS
