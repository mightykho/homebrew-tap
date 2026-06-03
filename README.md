# homebrew-tap

Homebrew tap for tools maintained by [@mightykho](https://github.com/mightykho).

## Usage

```bash
brew tap mightykho/tap
brew install claude-jam      # then run `cj setup`
```

## Available formulae

| Formula | Description |
|---------|-------------|
| [`claude-jam`](Formula/claude-jam.rb) | Fancy tmux window switcher and TUI dashboard for modern agentic workflows. See [`mightykho/claude-jam`](https://github.com/mightykho/claude-jam). |

## Updating

Bumping a formula here just means editing the `url`/`sha256`/`version` in
`Formula/<name>.rb` and pushing. Users run `brew update && brew upgrade <name>`
to pick up the new version.

## License

MIT for the formulae themselves. Each upstream project has its own license —
see the source repos linked above.
