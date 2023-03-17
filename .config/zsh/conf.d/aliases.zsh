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

# Human-readable file sizes by default
alias df="df -h";
alias du="du -hc";

# It’s all about saving keystrokes ↓
# The white-space before `clear` makes it so
# that ZSH does not record it in `HISTFILE`
alias c=" clear";

# Sexy `cat` https://github.com/sharkdp/bat
alias cat="bat";

# Always enable colored `grep` output
#
# NOTE: `GREP_OPTIONS="--color=auto"` is deprecated, hence the alias usage
alias egrep="egrep --color=auto";
alias fgrep="fgrep --color=auto";
alias grep="grep --color=auto";

# The command in the alias will most likely slow down
# over time as $HISTFILE grows in size
alias hf="history -E -$(echo `wc -l < $HISTFILE | bc`) | fzf";
alias hfr="history -E -$(echo `wc -l < $HISTFILE | bc`) | fzf --tac";
alias hfh="fzf --history=$HISTFILE --history-size=$(echo `wc -l < $HISTFILE | bc`)";

# General use
alias l="exa -lbF --git";
alias la="exa -lbhHigUmuSa --time-style=long-iso --git --color-scale";
alias ll="exa -lbGF --git";
alias llm="exa -lbGF --git --sort=modified";
alias ls="exa";
alias lx="exa -lbhHigUmuSa@ --time-style=long-iso --git --color-scale";
alias lt="exa --tree --level=2";
alias lS="exa -1";

# Expected `pnpx` (`pnpm dlx`) to operate _exactly_ like `npx`,
# but it does not.
# Usage:
# pnpe prettier --write . # this will use `prettier` installed in your project root
# For everything else:
# pnpx sort-package-json@latest
# See https://pnpm.io/cli/exec for more
alias pnpe="pnpm exec";

# See: https://github.com/sindresorhus/trash-cli#cli-
# & see: https://github.com/sindresorhus/trash-cli#tip
alias rm="trash";
