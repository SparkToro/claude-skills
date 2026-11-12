#!/usr/bin/env bash
# Fail if a plugin's version differs between marketplace.json and its plugin.json,
# or (when TAG is set, e.g. v0.2.0) if the tag doesn't match.
set -euo pipefail

root="$(cd "$(dirname "$0")/.." && pwd)"
status=0

while IFS=$'\t' read -r name source mversion; do
  pversion="$(jq -r .version "$root/$source/.claude-plugin/plugin.json")"
  if [[ "$mversion" != "$pversion" ]]; then
    echo "::error::$name: marketplace.json says $mversion, plugin.json says $pversion"
    status=1
  fi
  if [[ -n "${TAG:-}" && "v$pversion" != "$TAG" ]]; then
    echo "::error::$name is $pversion but the tag is $TAG"
    status=1
  fi
done < <(jq -r '.plugins[] | [.name, .source, .version] | @tsv' "$root/.claude-plugin/marketplace.json")

exit $status
