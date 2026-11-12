#!/usr/bin/env bash
# Zip each skill for upload in claude.ai / Claude Desktop (Settings > Capabilities > Skills).
# Each zip contains the skill folder at its root, which is the layout the uploader expects.
set -euo pipefail

root="$(cd "$(dirname "$0")/.." && pwd)"
out="$root/dist"
rm -rf "$out"
mkdir -p "$out"

for skill in "$root"/plugins/*/skills/*/; do
  name="$(basename "$skill")"
  (cd "$(dirname "$skill")" && zip -qr "$out/$name.zip" "$name" -x '*.DS_Store')
  echo "built dist/$name.zip"
done
