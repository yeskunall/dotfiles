# Sexy `cat` https://github.com/sharkdp/bat
alias cat='bat'

alias c='clear'

# Copy the working directory path
alias cpwd='pwd | tr -d "\n" | pbcopy'

# Always enable colored `grep` output
# Note: `GREP_OPTIONS="--color=auto"` is deprecated, hence the alias usage.
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# List only directories
alias lsd="ls -lF ${colorflag} | grep --color=never '^d'"

# pip and Python
alias pip='pip3'

# list FIX/NOTE/TODO lines from the current project
alias todos="ack -n --nogroup '(NOTE|TODO|FIX(ME)?):'"

alias weather='curl -4 http://wttr.in/'
alias week='date +%V'
