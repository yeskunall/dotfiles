#!/bin/zsh

#             .------.____
#          .-'       \ ___)
#       .-'         \\\
#    .-'        ___  \\)
# .-'          /  (\  |)
#          __  \  ( | |
#         /  \  \__'| |
#        /    \____).-'
#      .'       /   |
#     /     .  /    |
#   .'     / \/     |
#  /      /   \     |
#        /    /    _|_
#        \   /    /\ /\
#         \ /    /__v__\
#          '    |       |
#               |     .#|
#               |#.  .##|
#               |#######|
#               |#######|


SYSTEM_TYPE=$(uname -s);

if [[ "$SYSTEM_TYPE" == "Darwin" ]]; then
  if [[ -d /opt/homebrew ]]; then
    export HOMEBREW_PREFIX="/opt/homebrew";
  else
    export HOMEBREW_PREFIX="/usr/local";
  fi

  export HOMEBREW_CASK_OPTS="${HOMEBREW_CASK_OPTS:---appdir=/Applications}";
  export HOMEBREW_CELLAR="$HOMEBREW_PREFIX/Cellar";
  # Disable Homebrew analytics
  export HOMEBREW_NO_ANALYTICS="1";
  export HOMEBREW_REPOSITORY="$HOMEBREW_PREFIX";
fi
