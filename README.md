# Plainrouter Homebrew tap

Official Homebrew distribution for the [Plainrouter](https://plainrouter.com) command-line interface.

Plainrouter is the paid ads platform for developers and agents. Its hosted [Meta Ads MCP server](https://plainrouter.com/solutions/meta-ads-mcp) lets Claude, ChatGPT, Codex, Cursor and other MCP clients read a Meta ad account and propose changes that pass policy checks. MCP setup, Agent Skills and the other SDKs live in [plainrouter/sdk](https://github.com/plainrouter/sdk).

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
