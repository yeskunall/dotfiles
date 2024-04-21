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

# Pull-in `zplug`
source /usr/local/opt/zplug/init.zsh;

# Load all plugins
source "${XDG_CONFIG_HOME}/zplug/load.zsh";

# Init `starship`
_zsh_eval_cache starship init zsh;
