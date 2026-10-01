# mise

[`config.toml`](./config.toml) is the source of truth for versioned developer
tools and host packages.

- `[tools]` installs runtimes and command-line tools behind mise shims.
- `[bootstrap.packages]` installs shared formulae and macOS casks directly from
  Homebrew metadata. The Homebrew package manager is not required.

Review the requested state without changing the machine:

```sh
mise ls
mise bootstrap packages status
```

After installing mise itself, explicitly apply each part of the configuration:

```sh
mise install
mise bootstrap packages apply
```

Existing Homebrew-owned casks satisfy matching declarations but remain
Homebrew-owned until they are migrated separately. Applying this configuration
does not remove undeclared packages.

---

## License

[MIT](../../license) © [Kunall Banerjee](https://kunall.dev/)
