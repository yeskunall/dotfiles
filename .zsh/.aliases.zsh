# It’s all about saving keystrokes ↓
alias c='clear'

# Sexy `cat` https://github.com/sharkdp/bat
alias cat='bat'

# Copy the working directory path
alias cpwd='pwd | tr -d "\n" | pbcopy'

# Always enable colored `grep` output
#
# NOTE: `GREP_OPTIONS="--color=auto"` is deprecated, hence the alias usage.
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias grep='grep --color=auto'

# Use saner defaults for `ls`.
# See: https://github.com/DarrinTisdale/zsh-aliases-exa/blob/master/zsh-aliases-exa.plugin.zsh for more

# See: https://github.com/sindresorhus/trash-cli#cli-
# & see: https://github.com/sindresorhus/trash-cli#tip
alias rm='trash'
