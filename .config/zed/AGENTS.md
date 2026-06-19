## Tool usage

### Context servers

1. Always prefer:
  - Context7 tools (`get-library-docs`, `query-docs`, `resolve-library-id`)
  - DeepWiki tools (`ask_question`, `read_wiki_content`, `read_wiki_structure`)

## Shell commands

These preferences apply to commands you run via the `terminal` tool. They do not override the built-in `grep` and `find_path` tools, which remain the right choice for in-project code search.

1. Use `gh` and NOT `fetch` when it comes to URLs beginning with `https://github.com/` or `https://raw.githubusercontent.com`
2. Prefer `fd` over `find` for locating files and directories. Use `find` only when `fd` is unavailable or when you need a `find`-specific predicate that has no `fd` equivalent.
3. Prefer `rg` over `grep` for searching file contents. Use `grep` only when `rg` is unavailable or when a script must remain POSIX-portable.

### Web search

1. When searching the web, use BOTH the built-in `search_web` and Parallel’s `web_search` (Parallel), then synthesize across the combined results and call out any disagreements between sources.
2. To read a specific URL, prefer Parallel’s `web_fetch` (token-efficient markdown). Keep using `gh` for github.com / raw.githubusercontent.com URLs.
