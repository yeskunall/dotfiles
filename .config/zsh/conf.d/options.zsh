#!/bin/zsh

#   ______  _______  ________ ______  ______  __    __  ______                      __
#  /      \/       \/        /      |/      \/  \  /  |/      \                    /  |
# /$$$$$$  $$$$$$$  $$$$$$$$/$$$$$$//$$$$$$  $$  \ $$ /$$$$$$  |  ________  _______$$ |____
# $$ |  $$ $$ |__$$ |  $$ |    $$ | $$ |  $$ $$$  \$$ $$ \__$$/  /        |/       $$      \
# $$ |  $$ $$    $$/   $$ |    $$ | $$ |  $$ $$$$  $$ $$      \  $$$$$$$$//$$$$$$$/$$$$$$$  |
# $$ |  $$ $$$$$$$/    $$ |    $$ | $$ |  $$ $$ $$ $$ |$$$$$$  |   /  $$/ $$      \$$ |  $$ |
# $$ \__$$ $$ |        $$ |   _$$ |_$$ \__$$ $$ |$$$$ /  \__$$ __ /$$$$/__ $$$$$$  $$ |  $$ |
# $$    $$/$$ |        $$ |  / $$   $$    $$/$$ | $$$ $$    $$/  /$$      /     $$/$$ |  $$ |
#  $$$$$$/ $$/         $$/   $$$$$$/ $$$$$$/ $$/   $$/ $$$$$$/$$/$$$$$$$$/$$$$$$$/ $$/   $$/

# Append history across multiple sessions. The entries
# are stored in `$HISTFILE`
setopt APPEND_HISTORY;

setopt EXTENDED_HISTORY;

# Remove any duped command lines
setopt HIST_IGNORE_ALL_DUPS;

setopt HIST_IGNORE_SPACE;

# Remove superfluous blanks from each command line being
# added to `$HISTFILE`
setopt HIST_REDUCE_BLANKS;

# Import new commands from other sessions
setopt SHARE_HISTORY;

# I don't want this enabled
# Ref: http://zsh.sourceforge.net/Doc/Release/Redirection.html#Multios
unsetopt MULTIOS;
