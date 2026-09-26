#!/usr/bin/env bash
# Publish site/ to the gh-pages branch (GitHub Pages serves that branch).
set -euo pipefail
cd "$(dirname "$0")"
tmp=$(mktemp -d); cp -R site/. "$tmp"; touch "$tmp/.nojekyll"
cd "$tmp"; git init -q -b gh-pages; git add -A; git commit -qm "Deploy $(date -u +%Y-%m-%dT%H:%MZ)"
git push -qf "$(git -C "$OLDPWD" remote get-url origin)" gh-pages; echo deployed
