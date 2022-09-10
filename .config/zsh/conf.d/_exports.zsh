#!/bin/zsh

#         ________ __    __ _______   ______  _______  ________ ______                      __
#        /        /  |  /  /       \ /      \/       \/        /      \                    /  |
#        $$$$$$$$/$$ |  $$ $$$$$$$  /$$$$$$  $$$$$$$  $$$$$$$$/$$$$$$  |  ________  _______$$ |____
#        $$ |__   $$  \/$$/$$ |__$$ $$ |  $$ $$ |__$$ |  $$ | $$ \__$$/  /        |/       $$      \
#        $$    |   $$  $$< $$    $$/$$ |  $$ $$    $$<   $$ | $$      \  $$$$$$$$//$$$$$$$/$$$$$$$  |
#        $$$$$/     $$$$  \$$$$$$$/ $$ |  $$ $$$$$$$  |  $$ |  $$$$$$  |   /  $$/ $$      \$$ |  $$ |
#        $$ |_____ $$ /$$  $$ |     $$ \__$$ $$ |  $$ |  $$ | /  \__$$ __ /$$$$/__ $$$$$$  $$ |  $$ |
#  ______$$       $$ |  $$ $$ |     $$    $$/$$ |  $$ |  $$ | $$    $$/  /$$      /     $$/$$ |  $$ |
# /      $$$$$$$$/$$/   $$/$$/       $$$$$$/ $$/   $$/   $$/   $$$$$$/$$/$$$$$$$$/$$$$$$$/ $$/   $$/
# $$$$$$/
#
#
# Top-level exports go here
# These are environment variables that are used across the system,
# so they must be loaded as soon as possible.
# The only exception is `$ZDOTDIR/.zshenv` which sets up the
# FS to follow the XDG Base Directory spec, which is loaded
# before this.
#
# tl;dr: the order (and therefore the file name) in which
# the configuration is loaded matters

export AWS_CONFIG_FILE="${XDG_CONFIG_HOME}/aws/config.ini";
export AWS_SHARED_CREDENTIALS_FILE="${XDG_CONFIG_HOME}/aws/credentials.ini";
export AWS_VAULT_BACKEND="keychain";

export BAT_THEME="OneHalfDark";

export CARGO_BIN="${XDG_CONFIG_HOME}/cargo/bin";
export CARGO_HOME="${XDG_CONFIG_HOME}/cargo";

# Opt-out of PlanetScale/Prisma Telemetry
export CHECKPOINT_DISABLE="1";

export DENO_DIR="${XDG_CACHE_HOME}/deno";
export DENO_INSTALL_ROOT="${XDG_CONFIG_HOME}/deno";

# Make VS Code the default editor
export EDITOR="code --wait";

export FF_PROFILE_FOLDER_PATH="/Users/kimchi/Library/Application Support/Firefox/Profiles/dcxvqf4t.default-nightly";

# Set `fd` as the default source for `fzf`
# export FZF_DEFAULT_COMMAND="fd --type file --follow --hidden --exclude .git --color=always";

# Make `fzf` extract and parse ANSI color codes in the input
export FZF_DEFAULT_OPTS="--ansi";

export GNUPGHOME="${XDG_CONFIG_HOME}/gnupg";

export HISTFILE="${XDG_DATA_HOME}/.zsh_history";
export LESSHISTFILE="${XDG_DATA_HOME}/.lesshst";
# Both of these need to be set to the same value
export HISTSIZE="30000";
export SAVEHIST="30000";

# Disable Next.js telemetry
# See https://nextjs.org/telemetry for more
export NEXT_TELEMETRY_DISABLED=1;

# Use persistent REPL history when available (Node >= 8)
export NODE_REPL_HISTORY="${XDG_DATA_HOME}/.node_history";

# Set location of `npm`’s cache directory
export NPM_CONFIG_CACHE="${XDG_CACHE_HOME}/npm";

# Set global `npm` configuration file
export NPM_CONFIG_GLOBALCONFIG="${XDG_CONFIG_HOME}/npm/.npmrc";
# Set per-user `npm` configuration file
export NPM_CONFIG_USERCONFIG="${XDG_CONFIG_HOME}/npm/user/.npmrc";

# Don’t clear the screen after quitting a manual page
export MANPAGER="less -X";

# Colorize `man` pages
export MANROFFOPT="-c";

# `mysql-client@5.7` is keg-only, which means it is not symlinked into
# `/usr/local`, because this is an alternate version of another formula
export MYSQL_CLIENT_KEG_ONLY="/usr/local/opt/mysql-client@5.7/bin";

# NOTE: Maybe turn this off?
export NVM_AUTO_USE="true";
export NVM_COMPLETION="true";
export NVM_DIR="${XDG_CONFIG_HOME}/nvm";
export NVM_LAZY_LOAD="true";

export PYENV_ROOT="${XDG_CONFIG_HOME}/pyenv";

export PYTHONSTARTUP="${XDG_CONFIG_HOME}/python/.pythonrc.py";
# Store Pylint analysis data in `${HOME}/.local/share`
export PYLINTHOME="${XDG_DATA_HOME}";

# Link Rubies to Homebrew’s OpenSSL 1.1 (which is automatically upgraded)
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)";

export RUSTUP_HOME="${XDG_CONFIG_HOME}/rustup";

export STARSHIP_CONFIG="${XDG_CONFIG_HOME}/starship/config.toml";

export SQLITE_HISTORY="${XDG_DATA_HOME}/.sqlite_history";

export WRANGLER_HOME="${XDG_CONFIG_HOME}/wrangler";

# Fetch suggestions asynchronously
export ZSH_AUTOSUGGEST_USE_ASYNC="true";

# Enable all available highlighter modes in `zsh-syntax-highlighting`
export ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor);

# NOTE(yeskunall): Should this be here?
# Ultimately, export `PATH`
export PATH="${PATH}:${HOME}/.local/bin:${CARGO_BIN}":${XDG_CONFIG_HOME}/deno/bin:${MYSQL_CLIENT_KEG_ONLY};
