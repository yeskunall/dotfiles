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

# Disable Astro telemetry
# See https://astro.build/telemetry/ for more
export ASTRO_TELEMETRY_DISABLED="1";

export AWS_CONFIG_FILE="${XDG_CONFIG_HOME}/aws/config.ini";
export AWS_SHARED_CREDENTIALS_FILE="${XDG_CONFIG_HOME}/aws/credentials.ini";
export AWS_VAULT_BACKEND="keychain";

export BAT_THEME="OneHalfDark";

export BUN_BIN_DIR="${XDG_CACHE_HOME}/.bun/bin";

# https://bundler.io/man/bundle-config.1.html#CONFIGURE-BUNDLER-DIRECTORIES
export BUNDLE_USER_HOME="${XDG_CONFIG_HOME}/bundler";

export CARGO_BIN="${XDG_CONFIG_HOME}/cargo/bin";
export CARGO_HOME="${XDG_CONFIG_HOME}/cargo";

# Opt-out of PlanetScale/Prisma Telemetry
export CHECKPOINT_DISABLE="1";

export COMPOSER_HOME="${XDG_CONFIG_HOME}/composer";
export COMPOSER_BIN_DIR="${COMPOSER_HOME}/vendor/bin";

export DENO_DIR="${XDG_CACHE_HOME}/deno";
export DENO_INSTALL_ROOT="${XDG_CONFIG_HOME}/deno";
export DENO_BIN_DIR="${DENO_INSTALL_ROOT}/bin";

# Make VS Codium the default editor
export EDITOR="nvim";

export ENHANCD_DIR="${XDG_CONFIG_HOME}/enhancd";

# Set `fd` as the default source for `fzf`
# export FZF_DEFAULT_COMMAND="fd --type file --follow --hidden --exclude .git --color=always";

# Make `fzf` extract and parse ANSI color codes in the input
export FZF_DEFAULT_OPTS="--ansi";

export GNUPGHOME="${XDG_CONFIG_HOME}/gnupg";

export GOMODCACHE="${XDG_CACHE_HOME}/go/pkg/mod";
export GOPATH="${XDG_DATA_HOME}/go";

export GPG_TTY=$(tty);

export HEX_HOME="${XDG_CONFIG_HOME}/hex";

export HISTCONTROL="ignoreboth";
export HISTDUP="erase";
export HISTFILE="${XDG_DATA_HOME}/.zsh_history";
export LESSHISTFILE="${XDG_DATA_HOME}/.lesshst";
# Both of these need to be set to the same value
export HISTSIZE="30000";
export SAVEHIST="30000";

export HOMEBREW_CASK_OPTS="${HOMEBREW_CASK_OPTS:---appdir=/Applications}";
export HOMEBREW_BIN="${HOMEBREW_PREFIX:-/opt/homebrew}/bin";
export HOMEBREW_SBIN="${HOMEBREW_PREFIX:-/opt/homebrew}/sbin";

export LLVM_PATH="$(brew --prefix)/opt/llvm/bin";
# Don’t clear the screen after quitting a manual page
export MANPAGER="less -X";
# Colorize `man` pages
export MANROFFOPT="-c";

export MISE_NODE_DEFAULT_PACKAGES_FILE="${XDG_CONFIG_HOME/npm/.default-npm-packages}";

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
# Allow 32³ entries
export NODE_REPL_HISTORY_SIZE="32768";
# Use sloppy mode by default, matching web browsers
export NODE_REPL_MODE="sloppy";

# Set location of `npm`’s cache directory
export NPM_CONFIG_CACHE="${XDG_CACHE_HOME}/npm";

# Set global `npm` configuration file
export NPM_CONFIG_GLOBALCONFIG="${XDG_CONFIG_HOME}/npm/.npmrc";
# Set per-user `npm` configuration file
export NPM_CONFIG_USERCONFIG="${XDG_CONFIG_HOME}/npm/user/.npmrc";

export PRETTIERD_LOCAL_PRETTIER_ONLY="1";

# Postgres is keg-only, which means it is not symlinked into
# `/usr/local`, because this is an alternate version of another formula
export PSQL_CLIENT_KEG_ONLY="/usr/local/opt/postgresql@17/bin";
export PSQL_HISTORY="${XDG_DATA_HOME}/postgresql/.psql_history"

export PULUMI_HOME="${XDG_CONFIG_HOME}/pulumi";

export PYENV_ROOT="${XDG_CONFIG_HOME}/pyenv";

export PYTHON_HISTORY="${XDG_CONFIG_HOME}/python/history";
export PYTHONSTARTUP="${XDG_CONFIG_HOME}/python/.pythonrc.py";
# Store Pylint analysis data in `${HOME}/.local/share`
export PYLINTHOME="${XDG_DATA_HOME}";

export RUSTUP_HOME="${XDG_CONFIG_HOME}/rustup";

# See https://docs.aws.amazon.com/serverless-application-model/latest/developerguide/serverless-sam-telemetry.html for more
export SAM_CLI_TELEMETRY="0";

export SQLITE_HISTORY="${XDG_DATA_HOME}/.sqlite_history";

# https://docs.trunk.io/cli/configuration/telemetry#can-i-disable-usage-data
export TRUNK_TELEMETRY="off";

export VERCEL_TELEMETRY_DISABLED="1";

# Enable once this is implemented: https://github.com/cloudflare/workers-sdk/blob/e87198a6f43a52ff3b1509e99023932e62de97fe/packages/create-cloudflare/src/helpers/global-wrangler-config-path.ts#L17
# export WRANGLER_HOME="${XDG_CONFIG_HOME}/wrangler";

# Fetch suggestions asynchronously
export ZSH_AUTOSUGGEST_USE_ASYNC="true";

# Enable all available highlighter modes in `zsh-syntax-highlighting`
export ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor);

# ... Finally, export `PATH`
export PATH="/usr/local/sbin:${HOME}/.local/bin:${BUN_BIN_DIR}:${COMPOSER_BIN_DIR}:${DENO_BIN_DIR}:${CARGO_BIN}:${PSQL_CLIENT_KEG_ONLY}:${HOMEBREW_BIN}:${HOMEBREW_SBIN}:${LLVM_PATH}:${PATH}";
