## Tool usage

### Context servers

1. Always prefer:
  - Context7 tools (`get-library-docs`, `query-docs`, `resolve-library-id`)
  - DeepWiki tools (`ask_question`, `read_wiki_content`, `read_wiki_structure`)

## Shell commands

These preferences apply to commands you run via the `terminal` tool. They do not override the built-in `grep` and `find_path` tools, which remain the right choice for in-project code search.

1. Prefer `gh` over web-fetch tools for GitHub repository content, issues, pull requests, Actions, releases, API endpoints, and gists. This includes URLs beginning with `https://github.com/`, `https://api.github.com/`, `https://raw.githubusercontent.com/`, `https://gist.github.com/`, and `https://gist.githubusercontent.com/`.
2. Prefer `fd` over `find` for locating files and directories. Use `find` only when `fd` is unavailable or when you need a `find`-specific predicate that has no `fd` equivalent.
3. Prefer `rg` over `grep` for searching file contents. Use `grep` only when `rg` is unavailable or when a script must remain POSIX-portable.

### Web search

1. When searching the web, use Parallel’s `web_search`.
2. To read a specific URL, prefer Parallel’s `web_fetch`, except for GitHub resources covered by the `gh` rule above.
