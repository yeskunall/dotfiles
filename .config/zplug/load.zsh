# Command(s)/plugin(s)/theme(s) to install
zplug "b4b4r07/enhancd", use:init.sh
zplug "bezhermoso/zsh-escape-backtick", use:escape-backtick.zsh
zplug "lukechilds/zsh-nvm"
zplug "zsh-users/zsh-autosuggestions", defer:2
zplug "zsh-users/zsh-syntax-highlighting", defer:2

# If no plugins found, install all of them in parallel
if ! zplug check --verbose; then
  zplug install
fi

# Source plugins and add commands to `$PATH`
zplug load
