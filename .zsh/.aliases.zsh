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

# Use `colorls` for a prettier `ls`. See:
# https://github.com/athityakumar/colorls for more
#
# Sort directories first
alias ls='colorls --sd'
alias l1='colorls -1'

# This doesn’t work ↓
alias la='colorls --almost-all'

alias lsd='colorls --dirs'
alias lsf='colorls --files'
alias lsg='colorls --git-status'
alias lsr='colorls --report'

# See: https://github.com/sindresorhus/trash-cli#cli-
# & see: https://github.com/sindresorhus/trash-cli#tip
alias rm='trash'

# Some cool stuff ↓
# List FIX/NOTE/TODO lines from the current project
alias todos="ack -n --nogroup '(NOTE|TODO|FIX(ME)?):'"

alias weather='curl -4 http://wttr.in/'
alias week='echo "You’re on week $(date +%V)" of the year'
