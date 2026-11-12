# Homebrew tap

Formulae for my command line tools.

```sh
brew install bixvongoeler/tap/<formula>
```

| Formula | What it does |
|---|---|
| [`raydump`](https://github.com/bixvongoeler/raydump) | Decrypts a Raycast export and extracts it as Markdown and JSON |

## Updating a formula

After tagging a new release, change `url` to the new tag and `sha256` to the output of:

```sh
curl -fsSL <url> | shasum -a 256
```
