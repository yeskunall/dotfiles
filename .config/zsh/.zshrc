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

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Pull-in custom config
for conf_file in "${ZDOTDIR}"/conf.d/*.zsh; do
  source "${conf_file}";
done
unset conf_file;

# Init `zinit`
source "${XDG_CONFIG_HOME}/zinit/init.zsh"

# Load all plugins
source "${XDG_CONFIG_HOME}/zinit/plugins.zsh";

# Load completions
autoload -Uz compinit && compinit;

# Enable replaying of cached completions
zinit cdreplay -q;

# Set up `fzf` key bindings and fuzzy completion
source <(fzf --zsh);

# Init `zoxide`
_zsh_eval_cache zoxide init zsh;

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh
[[ ! -f "${XDG_CONFIG_HOME}/zsh/.p10k.zsh" ]] || source "${XDG_CONFIG_HOME}/zsh/.p10k.zsh";
