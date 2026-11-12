# Homebrew Tap for AppThreat Tools

Homebrew formulas for the standalone binaries published by [AppThreat](https://github.com/AppThreat)
projects. Every formula installs the pre-built release binary, so nothing is compiled on your
machine.

## Usage

```bash
brew tap appthreat/tap
brew trust --tap appthreat/tap   # only needed if HOMEBREW_REQUIRE_TAP_TRUST is set
brew install <formula>
```

Replace `<formula>` with one of the tools below, for example `brew install parsa`.

## Formulas

| Formula | Tool | Repository |
| --- | --- | --- |
| `atom` | Standalone tool for the atom intermediate representation, powered by chen | [AppThreat/atom](https://github.com/AppThreat/atom) |
| `parsa` | Standalone parsers that complement the atom project | [AppThreat/atom-parsetools](https://github.com/AppThreat/atom-parsetools) |
| `edga` | EDG C/C++ front end that writes a translation unit as JSON | [AppThreat/edga](https://github.com/AppThreat/edga) |
| `chennai` | Hybrid AI agent and TUI for exploring AppThreat atom files | [AppThreat/chennai](https://github.com/AppThreat/chennai) |
| `ruby-ast-gen` | Ruby AST generator with support for Ruby 1.8 to 4.0 syntax | [AppThreat/ruby_ast_gen](https://github.com/AppThreat/ruby_ast_gen) |

## Platform support

| Formula | macOS (Apple Silicon) | macOS (Intel) | Linux (x86_64) | Linux (arm64) |
| --- | --- | --- | --- | --- |
| `atom` | yes (macOS 15+) | no | yes | yes |
| `parsa` | yes (macOS 13+) | yes (macOS 13+) | yes | yes |
| `edga` | yes (macOS 13+) | no | yes | yes |
| `chennai` | yes | no | yes | yes |
| `ruby-ast-gen` | yes (macOS 14+) | yes (macOS 14+) | yes (glibc 2.31+) | yes (glibc 2.31+) |

The Linux formulas use the glibc binaries, which is what Homebrew on Linux runs on. If you are on
Alpine or another musl system, download the `linuxmusl` (edga) or `linux-musl` (ruby-ast-gen)
binaries from the releases pages instead; the parsa Linux binaries are static and work on both.

On Intel Macs, `atom`, `edga` and `chennai` have no native binary: use the
[npm packages](https://www.npmjs.com/package/@appthreat/atom) or the container images published on
ghcr.io.

## Tool notes

`atom` is a GraalVM native image of the atom driver, including the chen platform, so a Java
installation is not required. The same tool is also installable with
`npm install -g @appthreat/atom` and as OCI images under `ghcr.io/appthreat/atom-*`.

`parsa` is the Go parser used by `astgen` for TypeScript type maps and related outputs. It is not
part of the npm package; this formula is the only package manager install for it.

`edga` runs the EDG C/C++ front end over a translation unit and emits the program it built as JSON
for chen's C/C++ frontend.

`chennai` needs a Python 3 installation with `chen` (`pip install chen`) for full functionality;
the formula itself installs the two Rust binaries `chennai` and `chennai-engine`.

`ruby-ast-gen` installs the self-contained executables introduced with release v2.1.0, which embed
the CRuby runtime and the parser and prism gems. On first run the binary unpacks its runtime into
`~/.tebako` (override with `TEBAKO_HOME`), and on every run it extracts prism's native extension
into `$TMPDIR`; both directories must be writable and allow executing files.

## Updating

The `chennai` formula is updated automatically by the Chennai release workflow. The other formulas
are bumped by hand from each project's GitHub release until the same automation is added there:

```bash
brew update && brew upgrade <formula>
```

To add or refresh a formula by hand, set the new `version`, update each `url` platform block, and
fill the `sha256` values from the release's `.sha256` sidecar files (atom ships `.sha512` sidecars;
run `shasum -a 256` on the downloaded binaries). The `ruby-ast-gen` formula currently uses
`sha256 :no_check` for its four platform blocks: replace those with the values from the release's
`SHA256SUMS` once v2.1.0 is published. Check the result with:

```bash
brew audit --tap appthreat/tap
brew test --tap appthreat/tap
```
