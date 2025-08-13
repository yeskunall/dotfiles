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

# `git log` browser with `git show` preview using `fzf --preview`
fgl() {
    git rev-parse --is-inside-work-tree &> /dev/null || return
    git log --date=short --format="%C(green)%C(bold)%cd %C(auto)%h%d %s (%an)" --graph --color=always |
    fzf --height=50% --no-sort --layout=reverse-list --multi --bind='ctrl-s:toggle-sort' \
        --preview='grep -o "[a-f0-9]\{7,\}" <<< {} | xargs git show --color=always | head -210' |
    grep -o "[a-f0-9]\{7,\}"
}

# Quick utility tool to benchmark shell performance
# For better benchmarks, use [`zsh-bench`](https://github.com/romkatv/zsh-bench)
_time_zsh() {
  for i in $(seq 1 10); do /usr/bin/time $SHELL -ilc exit; done
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
