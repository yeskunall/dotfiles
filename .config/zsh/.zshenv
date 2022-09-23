#!/bin/zsh

#                       __
#                      /  |
#     ________  _______$$ |____   ______  _______  __     __
#    /        |/       $$      \ /      \/       \/  \   /  |
#    $$$$$$$$//$$$$$$$/$$$$$$$  /$$$$$$  $$$$$$$  $$  \ /$$/
#      /  $$/ $$      \$$ |  $$ $$    $$ $$ |  $$ |$$  /$$/
#  __ /$$$$/__ $$$$$$  $$ |  $$ $$$$$$$$/$$ |  $$ | $$ $$/
# /  /$$      /     $$/$$ |  $$ $$       $$ |  $$ |  $$$/
# $$/$$$$$$$$/$$$$$$$/ $$/   $$/ $$$$$$$/$$/   $$/    $/
#
#
# There exists a `.zshenv` located in `$HOME/.zshenv` that simply
# `exports` `ZDOTDIR` and `source`s THIS `.zshenv`
# This redundancy is required as ZSH only looks/loads `.zshenv`
# from `$HOME`

export OS_TYPE=$(uname -s);

# Setup system folders according to the XDG Base Directory spec
# See https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html for more
export XDG_CACHE_HOME=${XDG_CACHE_HOME:-$HOME/.cache};
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-$HOME/.config};
export XDG_DATA_HOME=${XDG_DATA_HOME:-$HOME/.local/share};
# Do not enable this. A lot of applications _could_ break if you do.
# See https://github.com/microsoft/vscode/issues/22593#issuecomment-336099304
# for more
# export XDG_RUNTIME_DIR="${TMPDIR:-/tmp}/runtime-${USER}";

# See https://lists.freedesktop.org/archives/xdg/2016-December/013803.html for more
export XDG_STATE_HOME=${XDG_STATE_HOME:-$HOME/.local/state};

export ZPLUG_HOME=${ZPLUG_HOME:-"/usr/local/opt/zplug/"};
