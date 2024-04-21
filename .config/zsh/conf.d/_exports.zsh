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
# Disable Astro telemetry across all projects using an environment variable
# See https://astro.build/telemetry/ for more
export ASTRO_TELEMETRY_DISABLED="1";

export AWS_CONFIG_FILE="${XDG_CONFIG_HOME}/aws/config.ini";
export AWS_SHARED_CREDENTIALS_FILE="${XDG_CONFIG_HOME}/aws/credentials.ini";
export AWS_VAULT_BACKEND="keychain";

export BAT_THEME="OneHalfDark";

export BUN_BIN_DIR="${XDG_CACHE_HOME}/.bun/bin";

export BUNDLE_APP_CONFIG="${XDG_CONFIG_HOME}/bundler/config";

export CARGO_BIN="${XDG_CONFIG_HOME}/cargo/bin";
export CARGO_HOME="${XDG_CONFIG_HOME}/cargo";

# Opt-out of PlanetScale/Prisma Telemetry
export CHECKPOINT_DISABLE="1";

export DENO_DIR="${XDG_CACHE_HOME}/deno";
export DENO_INSTALL_ROOT="${XDG_CONFIG_HOME}/deno";

# Make VS Code the default editor
export EDITOR="code --wait";

export ENHANCD_DIR="${XDG_CONFIG_HOME}/enhancd";

export FF_PROFILE_FOLDER_PATH="/Users/kimchi/Library/Application Support/Firefox/Profiles/dcxvqf4t.default-nightly";

# Set `fd` as the default source for `fzf`
# export FZF_DEFAULT_COMMAND="fd --type file --follow --hidden --exclude .git --color=always";

# Make `fzf` extract and parse ANSI color codes in the input
export FZF_DEFAULT_OPTS="--ansi";

export GNUPGHOME="${XDG_CONFIG_HOME}/gnupg";

export HEX_HOME="${XDG_CONFIG_HOME}/hex";

export HISTFILE="${XDG_DATA_HOME}/.zsh_history";
export LESSHISTFILE="${XDG_DATA_HOME}/.lesshst";
# Both of these need to be set to the same value
export HISTSIZE="30000";
export SAVEHIST="30000";

# Don’t clear the screen after quitting a manual page
export MANPAGER="less -X";
# Colorize `man` pages
export MANROFFOPT="-c";

export MIX_HOME="${XDG_CONFIG_HOME}/mix";
# Specifies the directory where `Mix.install/2` keeps install cache
export MIX_INSTALL_DIR="${XDG_CACHE_HOME/mix}";

# Disable Mozilla Breakpad crash reporting entirely
export MOZ_CRASHREPORTER_DISABLE="1";

# Disable Next.js telemetry
# See https://nextjs.org/telemetry for more
export NEXT_TELEMETRY_DISABLED="1";

# Use persistent REPL history when available (Node >= 8)
export NODE_REPL_HISTORY="${XDG_DATA_HOME}/.node_history";

# Set location of `npm`’s cache directory
export NPM_CONFIG_CACHE="${XDG_CACHE_HOME}/npm";

# Set global `npm` configuration file
export NPM_CONFIG_GLOBALCONFIG="${XDG_CONFIG_HOME}/npm/.npmrc";
# Set per-user `npm` configuration file
export NPM_CONFIG_USERCONFIG="${XDG_CONFIG_HOME}/npm/user/.npmrc";

export NVM_COMPLETION="true";
export NVM_DIR="${XDG_CONFIG_HOME}/nvm";
export NVM_LAZY_LOAD="true";

# Postgres is keg-only, which means it is not symlinked into
# `/usr/local`, because this is an alternate version of another formula
export PSQL_CLIENT_KEG_ONLY="/usr/local/opt/postgresql@16/bin";
export PKG_CONFIG_PATH="/usr/local/opt/postgresql@16/lib/pkgconfig";

export PULUMI_HOME="${XDG_CONFIG_HOME}/pulumi";

export PYENV_ROOT="${XDG_CONFIG_HOME}/pyenv";

export PYTHONSTARTUP="${XDG_CONFIG_HOME}/python/.pythonrc.py";
# Store Pylint analysis data in `${HOME}/.local/share`
export PYLINTHOME="${XDG_DATA_HOME}";

export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@3)";

export RUSTUP_HOME="${XDG_CONFIG_HOME}/rustup";

# See https://docs.aws.amazon.com/serverless-application-model/latest/developerguide/serverless-sam-telemetry.html for more
export SAM_CLI_TELEMETRY="0";

export STARSHIP_CONFIG="${XDG_CONFIG_HOME}/starship/config.toml";

export SQLITE_HISTORY="${XDG_DATA_HOME}/.sqlite_history";

export WRANGLER_HOME="${XDG_CONFIG_HOME}/wrangler";

# Fetch suggestions asynchronously
export ZSH_AUTOSUGGEST_USE_ASYNC="true";

# Enable all available highlighter modes in `zsh-syntax-highlighting`
export ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor);

# ... Finally, export `PATH`
export PATH="/usr/local/sbin:${HOME}/.local/bin:${BUN_BIN_DIR}:${PSQL_CLIENT_KEG_ONLY}:/usr/local/opt/ruby/bin:/usr/local/opt/ruby/bin:/usr/local/lib/ruby/gems/3.2.0/bin:${PATH}";
