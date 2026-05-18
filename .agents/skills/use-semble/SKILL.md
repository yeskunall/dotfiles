---
name: using-semble
description: Fast hybrid code search via the `semble` CLI. Use when finding code by intent or behavior ("how does auth work", "where is X handled", "find the entrypoint for Y"), locating implementations of a described concept, or discovering related code after a search hit. Prefer over `grep`, `find_path`, or `read_file` when the user describes WHAT the code does rather than naming an exact symbol or path. Do NOT use when the user already knows the exact identifier or filename — plain grep is faster.
---

# Using `semble` for code search

`semble` is a local CLI that combines BM25 (lexical) + static embeddings (semantic) for hybrid code search. Cold index ~250 ms, warm query ~1.5 ms. No network calls at query time.

## When to reach for it

- "how is authentication handled?"
- "where does the request lifecycle start?"
- "find code that saves a model to disk"
- "anything that does X" — described, not named

## When NOT to use it

- The user named an exact symbol or path → `grep` / `find_path`
- You only need to confirm a literal string exists → `grep`
- You're inside a file the user is editing → `read_file`

## Commands

Invoke via `terminal`. Default path is `.`, default `-k` is 5, default mode is `hybrid`.

```
semble search "<natural-language query>" [path] [-k N] [-m hybrid|semantic|bm25]
semble find-related <file_path> <line> [path] [-k N]
```

Examples:

```
semble search "user authentication flow" .
semble search "save_pretrained" . -k 10 -m bm25
semble find-related src/auth.py 42 . -k 5
```

`-m bm25` is best when the query is a literal symbol; `-m semantic` for pure prose; default `hybrid` is right for almost everything.

## Workflow

1. Run `semble search` with the user's described intent.
2. Output is markdown — each hit is `## N. file:start-end  [score=...]` followed by a fenced code block.
3. If the chunk is enough context, answer from it. If not, `read_file` for the surrounding lines.
4. Optionally chase a promising hit with `semble find-related <file_path> <line>` to surface related implementations elsewhere in the repo.

## Safety / hygiene

- Always pass a specific repo root as `path` (typically `.`). Never `/`, `~`, `/etc`, `~/.ssh`, etc. — `semble` will happily walk anywhere it has read access.
- Don't pass `--include-text-files` unless the user explicitly asks. It expands indexing to `.env` / `.conf` / `.pem`, which can contain secrets.
- Don't run `semble init` — it writes a Claude Code sub-agent file that doesn't apply here.
