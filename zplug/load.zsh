# If no plugins installed are installed, install all of them in parallel
if ! zplug check --verbose; then
  zplug install
fi

# Plugins to install
zplug "denysdovhan/spaceship-prompt", use:spaceship.zsh, from:github, as:theme

# Source plugins and add commands to `$PATH`
zplug load
