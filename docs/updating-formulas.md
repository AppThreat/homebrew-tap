# Updating formulas

Each formula in this tap points at the pre-built binaries of one AppThreat project. A formula bump
changes the `version` line and the `sha256` value of every platform block; the URLs derive from the
version already. The general steps:

1. Find the new release on the project's GitHub releases page and confirm it has binaries for the
   platforms the formula covers.
2. Set the new `version` at the top of the formula.
3. Fill each `sha256` from the release's checksum sidecars, or compute it from the downloaded
   binary with `shasum -a 256`. Never keep a hash from the previous version.
4. Check the result before pushing:

```bash
brew audit --tap appthreat/tap
brew test --tap appthreat/tap
```

## Where the checksums come from

| Formula | Release assets | Checksum source |
| --- | --- | --- |
| `atom` | `atom-<platform>` plus `.sha512` sidecars | compute `shasum -a 256` of each binary, the sidecars are SHA-512 |
| `parsa` | `parsa-<platform>` plus `.sha256` sidecars | the matching `.sha256` asset |
| `edga` | `edga-<platform>` plus `.sha256` sidecars | the matching `.sha256` asset |
| `chennai` | `chennai-<platform>.tar.gz` plus `.sha256` sidecars | the matching `.sha256` asset |
| `ruby-ast-gen` | `ruby_ast_gen-<version>-<platform>` plus `SHA256SUMS` | `SHA256SUMS` or the per-file `.sha256` assets |

The `ruby-ast-gen` formula uses `sha256 :no_check` in its four platform blocks until the v2.1.0
release is published; the first update of that formula must replace all four with real values from
`SHA256SUMS`.

## Automated updates from a release workflow

The Chennai release workflow keeps its formula current by checking out this repository, rewriting
the version and hashes with `sed`, and pushing a one-line commit. The job needs a personal access
token with `repo` scope stored as `HOMEBREW_TAP_TOKEN` in the tool repository.

The pattern, adapted for a tool that publishes `.sha256` sidecars:

```yaml
update-homebrew:
  runs-on: ubuntu-24.04
  if: startsWith(github.ref, 'refs/tags/')
  steps:
    - uses: actions/checkout@v4
      with:
        repository: appthreat/homebrew-tap
        token: ${{ secrets.HOMEBREW_TAP_TOKEN }}
    - run: |
        VERSION="${GITHUB_REF_NAME#v}"
        sed -i "s/  version \".*\"/  version \"${VERSION}\"/" Formula/parsa.rb
        for arch in darwin-arm64 darwin-amd64 linux-arm64 linux-amd64; do
          sha=$(curl -sL "https://github.com/AppThreat/atom-parsetools/releases/download/${GITHUB_REF_NAME}/parsa-${arch}.sha256" | cut -d' ' -f1)
          sed -i "/url.*parsa-${arch}/{n;s/sha256 \".*\"/sha256 \"${sha}\"/;}" Formula/parsa.rb
        done
        git config user.name "AppThreat Bot"
        git config user.email "bot@appthreat.com"
        git add Formula/parsa.rb
        git commit -m "parsa ${GITHUB_REF_NAME}"
        git push
```

For `atom`, download each binary in the job and run `sha256sum` on it, because its releases carry
SHA-512 sidecars rather than SHA-256. For `ruby-ast-gen`, the release publishes a `SHA256SUMS`
manifest plus per-file `.sha256` assets; the update job should also replace any `sha256 :no_check`
placeholders.
