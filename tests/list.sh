#!/usr/bin/env bash
# Smoke test: front matter is present, every reference linked from SKILL.md exists, no old-brand words.
set -euo pipefail
here="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
head -1 "$here/skill/SKILL.md" | grep -q '^---$'
grep -q '^name: noren$' "$here/skill/SKILL.md"
for ref in $(grep -o 'references/[a-z0-9-]*\.md' "$here/skill/SKILL.md" | sort -u); do
  test -f "$here/skill/$ref" || { echo "missing $ref" >&2; exit 1; }
done
if grep -r -i -E 'covenant|solana|usdc|devnet' "$here/skill" >/dev/null; then echo "old-brand word in skill/" >&2; exit 1; fi
echo "ok"
