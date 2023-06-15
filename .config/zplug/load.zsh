# Command(s)/plugin(s)/theme(s) to install
zplug "b4b4r07/enhancd", use:init.sh
zplug "bezhermoso/zsh-escape-backtick", use:escape-backtick.zsh
zplug "lukechilds/zsh-nvm"
zplug "zsh-users/zsh-autosuggestions", defer:2
zplug "zdharma-continuum/fast-syntax-highlighting", defer:2

# If any plugin is not found, install them in parallel
if ! zplug check --verbose; then
  zplug install
fi

# Source plugins and add commands to `$PATH`
zplug load
