#!/bin/zsh

#                       __
#                      /  |
#     ________  _______$$ |____   ______   _______
#    /        |/       $$      \ /      \ /       |
#    $$$$$$$$//$$$$$$$/$$$$$$$  /$$$$$$  /$$$$$$$/
#      /  $$/ $$      \$$ |  $$ $$ |  $$/$$ |
#  __ /$$$$/__ $$$$$$  $$ |  $$ $$ |     $$ \_____
# /  /$$      /     $$/$$ |  $$ $$ |     $$       |
# $$/$$$$$$$$/$$$$$$$/ $$/   $$/$$/       $$$$$$$/

# Pull-in custom config
for conf_file in "${ZDOTDIR}"/conf.d/*.zsh; do
  source "${conf_file}";
done
unset conf_file;

source "${XDG_CONFIG_HOME}/zinit/init.zsh"

# Load all plugins
source "${XDG_CONFIG_HOME}/zinit/plugins.zsh";

# Init plugins
_zsh_eval_cache starship init zsh;
_zsh_eval_cache zoxide init zsh;
