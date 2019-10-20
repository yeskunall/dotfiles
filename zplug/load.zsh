# Command(s)/plugin(s)/theme(s) to install
zplug "b4b4r07/enhancd", use:init.sh
zplug "bezhermoso/zsh-escape-backtick", use:escape-backtick.zsh
zplug "denysdovhan/spaceship-prompt", use:spaceship.zsh, from:github, as:theme

# If no plugins installed are installed, install all of them in parallel
if ! zplug check --verbose; then
  zplug install
fi

# Source plugins and add commands to `$PATH`
zplug load
