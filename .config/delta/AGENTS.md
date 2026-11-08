## Command-line tool preferences

These preferences apply to commands you run via the `terminal` tool. They do not override the built-in `grep` tool, which remains the right choice for in-project code search.

1. Prefer `gh` over web-fetch tools for GitHub repository content, issues, pull requests, Actions, releases, API endpoints, and gists. This includes URLs beginning with `https://github.com/`, `https://api.github.com/`, `https://raw.githubusercontent.com/`, `https://gist.github.com/`, and `https://gist.githubusercontent.com/`.
2. Prefer `fd` over `find` for locating files and directories. Use `find` only when `fd` is unavailable or when you need a `find`-specific predicate that has no `fd` equivalent.
3. Prefer `rg` over `grep` for searching file contents. Use `grep` only when `rg` is unavailable or when a script must remain POSIX-portable.
