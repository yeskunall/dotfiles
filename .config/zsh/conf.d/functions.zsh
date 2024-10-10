#!/bin/zsh

#  ________ __    __ __    __  ______  ________ ______  ______  __    __  ______                      __
# /        /  |  /  /  \  /  |/      \/        /      |/      \/  \  /  |/      \                    /  |
# $$$$$$$$/$$ |  $$ $$  \ $$ /$$$$$$  $$$$$$$$/$$$$$$//$$$$$$  $$  \ $$ /$$$$$$  |  ________  _______$$ |____
# $$ |__   $$ |  $$ $$$  \$$ $$ |  $$/   $$ |    $$ | $$ |  $$ $$$  \$$ $$ \__$$/  /        |/       $$      \
# $$    |  $$ |  $$ $$$$  $$ $$ |        $$ |    $$ | $$ |  $$ $$$$  $$ $$      \  $$$$$$$$//$$$$$$$/$$$$$$$  |
# $$$$$/   $$ |  $$ $$ $$ $$ $$ |   __   $$ |    $$ | $$ |  $$ $$ $$ $$ |$$$$$$  |   /  $$/ $$      \$$ |  $$ |
# $$ |     $$ \__$$ $$ |$$$$ $$ \__/  |  $$ |   _$$ |_$$ \__$$ $$ |$$$$ /  \__$$ __ /$$$$/__ $$$$$$  $$ |  $$ |
# $$ |     $$    $$/$$ | $$$ $$    $$/   $$ |  / $$   $$    $$/$$ | $$$ $$    $$/  /$$      /     $$/$$ |  $$ |
# $$/       $$$$$$/ $$/   $$/ $$$$$$/    $$/   $$$$$$/ $$$$$$/ $$/   $$/ $$$$$$/$$/$$$$$$$$/$$$$$$$/ $$/   $$/

# Usage:
#
# bak <file1> <file2> <file3> ...
bak() {
  local f;
  local now=$(date +"%Y%m%d-%H%M%S");

  for f in "$@"; do
    if [[ ! -e "$f" ]]; then
      echo "File not found: $f" >&2;
      continue
    fi
    cp -R "$f" "$f".$now.bak;
  done
}

# `git branch` selector with `git log` preview using `fzf --preview`
fgb() {
    git rev-parse --is-inside-work-tree &> /dev/null || return
    git checkout $(
      git branch --all | grep -v 'HEAD' | sort --ignore-case |
      fzf --height=50% --no-sort --layout=reverse-list --preview-window=right:70% \
      --query="${@}" --tac --preview='git log --color=always --oneline --graph \
      --date=short --pretty="format:%C(auto)%cd %h%d %s" \
      $(sed s/^..// <<< {} | cut -d" " -f1) | head -210' |
      sed 's/^..//' | sed 's#^remotes/origin/##'
    )
}

# `git log` browser with `git show` preview using `fzf --preview`
fgl() {
    git rev-parse --is-inside-work-tree &> /dev/null || return
    git log --date=short --format="%C(green)%C(bold)%cd %C(auto)%h%d %s (%an)" --graph --color=always |
    fzf --height=50% --no-sort --layout=reverse-list --multi --bind='ctrl-s:toggle-sort' \
        --preview='grep -o "[a-f0-9]\{7,\}" <<< {} | xargs git show --color=always | head -210' |
    grep -o "[a-f0-9]\{7,\}"
}

# Create a new directory and `cd` into it
# FIXME(yeskunall): this doesn’t work because `cd` is
# aliased to `enhancd`
# mkd() {
#   (mkdir -p "$@" && cd "$_") || exit;
# }

_set_current_node_version() {
  if command -v node &> /dev/null; then
    export CURRENT_NODE_VERSION=`node -v | sed 's/^v//'`;
  fi
}

# Quick utility tool to benchmark shell performance
# For better benchmarks, use [`zsh-bench`](https://github.com/romkatv/zsh-bench)
_time_zsh() {
  for i in $(seq 1 10); do /usr/bin/time $SHELL -ilc exit; done
}

# Auto-expand `...` to `../..` and so on
_zsh_dot() {
    if [[ ${LBUFFER} = *.. ]]; then
        LBUFFER+=/..
    else
        LBUFFER+=.
    fi
}

# See https://github.com/mroth/evalcache/blob/master/evalcache.plugin.zsh
_zsh_eval_cache() {
  # Default cache directory
  local zsh_eval_cache_dir=${zsh_eval_cache_dir:-"${XDG_CACHE_HOME}/zsh_eval_cache"};
  local cache_file="$zsh_eval_cache_dir/init-${1##*/}.zsh";

  if [ -s "$cache_file" ]; then
    source "$cache_file";
  else
    if type "$1" > /dev/null; then
      mkdir -p "$zsh_eval_cache_dir";
      "$@" > "$cache_file";
      source "$cache_file";
    else
      echo "_zsh_eval_cache ERROR: $1 is either not installed or not setup in `PATH`";
    fi
  fi
}

zle -N _zsh_dot;
bindkey . _zsh_dot;
