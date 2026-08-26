# PlainRouter Homebrew tap

Official Homebrew distribution for the [PlainRouter](https://plainrouter.com) command-line interface.

## Install

```sh
brew install plainrouter/tap/plainrouter
```

Then authenticate without putting a token in shell history:

```sh
plainrouter auth login
plainrouter --help
```

The formula installs the same signed-release CLI published as [`@plainrouter/cli`](https://www.npmjs.com/package/@plainrouter/cli). The CLI delegates API operations to the official TypeScript SDK and never embeds credentials.

## Update

```sh
brew update
brew upgrade plainrouter
```

## License

Apache-2.0
