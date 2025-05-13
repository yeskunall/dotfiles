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

# Append history across multiple sessions. The entries are stored in `$HISTFILE`
setopt APPEND_HISTORY;

setopt EXTENDED_HISTORY;

# Prevent dupes in search history
setopt HIST_FIND_NO_DUPS;

# Remove any duped command lines
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_DUPS;

setopt HIST_IGNORE_SPACE;

# Remove superfluous blanks from each command line being added to `$HISTFILE`
setopt HIST_REDUCE_BLANKS;

setopt HIST_SAVE_NO_DUPS;

# Wait 10 seconds until executing `rm` with a star
# Example: rm folder/*
setopt RM_STAR_WAIT;

# Import new commands from other sessions
setopt SHARE_HISTORY;

# I don't want this enabled
# Ref: http://zsh.sourceforge.net/Doc/Release/Redirection.html#Multios
unsetopt MULTIOS;

# Ask before executing `rm` with a star
# Example: rm folder/*
unsetopt RM_STAR_SILENT;
