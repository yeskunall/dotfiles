#!/bin/zsh

#   ______  __       ______  ______   ______  ________  ______                      __
#  /      \/  |     /      |/      \ /      \/        |/      \                    /  |
# /$$$$$$  $$ |     $$$$$$//$$$$$$  /$$$$$$  $$$$$$$$//$$$$$$  |  ________  _______$$ |____
# $$ |__$$ $$ |       $$ | $$ |__$$ $$ \__$$/$$ |__   $$ \__$$/  /        |/       $$      \
# $$    $$ $$ |       $$ | $$    $$ $$      \$$    |  $$      \  $$$$$$$$//$$$$$$$/$$$$$$$  |
# $$$$$$$$ $$ |       $$ | $$$$$$$$ |$$$$$$  $$$$$/    $$$$$$  |   /  $$/ $$      \$$ |  $$ |
# $$ |  $$ $$ |_____ _$$ |_$$ |  $$ /  \__$$ $$ |_____/  \__$$ __ /$$$$/__ $$$$$$  $$ |  $$ |
# $$ |  $$ $$       / $$   $$ |  $$ $$    $$/$$       $$    $$/  /$$      /     $$/$$ |  $$ |
# $$/   $$/$$$$$$$$/$$$$$$/$$/   $$/ $$$$$$/ $$$$$$$$/ $$$$$$/$$/$$$$$$$$/$$$$$$$/ $$/   $$/

# AWS Vault shorthands
alias aw="aws-vault";

alias awe="aws-vault exec";

# Copy the working directory path
alias cpwd="pwd | tr -d "\n" | pbcopy";

# It’s all about saving keystrokes ↓
# PS: The white-space before `clear` makes it so that ZSH does not record it in `HISTFILE`
alias c=" clear";

# A cat(1) clone with wings.
# https://github.com/sharkdp/bat
alias cat="bat";

# Human-readable file sizes by default
alias df="df -h";

alias du="du -hc";

# Always enable colored `grep` output (`GREP_OPTIONS="--color=auto"` is deprecated)
alias egrep="egrep --color=auto";

alias fgrep="fgrep --color=auto";

alias grep="grep --color=auto";

# https://github.com/charmbracelet/glow?tab=readme-ov-file#word-wrapping
alias glow="glow -p -w 65";

# The command in the alias will most likely slow down
# over time as $HISTFILE grows in size
alias hf="history -E -$(echo `wc -l < $HISTFILE | bc`) | fzf";

alias hfr="history -E -$(echo `wc -l < $HISTFILE | bc`) | fzf --tac";

alias hfh="fzf --history=$HISTFILE --history-size=$(echo `wc -l < $HISTFILE | bc`)";

alias l="eza -lbF --git";

alias la="eza -lbhHigUmuSa --time-style=long-iso --git --color-scale";

alias ll="eza -lbGF --git";

alias llm="eza -lbGF --git --sort=modified";

alias ls="eza";

alias lx="eza -lbhHigUmuSa@ --time-style=long-iso --git --color-scale";

alias lt="eza --tree --level=2";

alias lS="eza -1";

# https://github.com/sindresorhus/trash-cli#tip
alias rm="trash";
