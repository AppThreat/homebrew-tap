# Homebrew Tap for Chennai

[Chennai](https://github.com/AppThreat/chennai) is a hybrid AI agent and terminal UI for exploring AppThreat atom files.

## Usage

```bash
brew tap appthreat/tap
brew trust --tap appthreat/tap   # only needed if HOMEBREW_REQUIRE_TAP_TRUST is set
brew install chennai
```

## Supported Platforms

- **macOS**: Apple Silicon (arm64)
- **Linux**: x86_64 (glibc) and arm64 (glibc)

Intel Macs are not supported natively — use the [npm package](https://www.npmjs.com/package/@appthreat/chennai) instead.

## Updating

This formula is updated automatically on each [Chennai release](https://github.com/AppThreat/chennai/releases). To manually update:

```bash
brew update && brew upgrade chennai
```
