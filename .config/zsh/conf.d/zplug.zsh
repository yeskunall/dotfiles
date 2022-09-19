#!/bin/zsh

#       ____
#  ____|    \
# (____|     `._____
#  ____|       _|___
# (____|     .'
#      |____/
#
#  ________ _______  __       __    __  ______                      __
# /        /       \/  |     /  |  /  |/      \                    /  |
# $$$$$$$$/$$$$$$$  $$ |     $$ |  $$ /$$$$$$  |  ________  _______$$ |____
#     /$$/ $$ |__$$ $$ |     $$ |  $$ $$ | _$$/  /        |/       $$      \
#    /$$/  $$    $$/$$ |     $$ |  $$ $$ |/    | $$$$$$$$//$$$$$$$/$$$$$$$  |
#   /$$/   $$$$$$$/ $$ |     $$ |  $$ $$ |$$$$ |   /  $$/ $$      \$$ |  $$ |
#  /$$/____$$ |     $$ |_____$$ \__$$ $$ \__$$ __ /$$$$/__ $$$$$$  $$ |  $$ |
# /$$      $$ |     $$       $$    $$/$$    $$/  /$$      /     $$/$$ |  $$ |
# $$$$$$$$/$$/      $$$$$$$$/ $$$$$$/  $$$$$$/$$/$$$$$$$$/$$$$$$$/ $$/   $$/

if [[ -d $ZPLUG_HOME ]]; then
  ZPLUG_CACHE_DIR="$XDG_CACHE_HOME/zplug";
  ZPLUG_USE_CACHE="true";
fi