#!/usr/bin/env bash
# Sync this fork with the original Chinese repo (cx330-TXY/CxChanger).
#   main  = pristine mirror of upstream/main (never commit to it)
#   m3dp  = Mike's build branch (notes live in m3dp/ only)
# Usage: m3dp/tools/sync-upstream.sh [--no-merge]
set -euo pipefail
cd "$(git rev-parse --show-toplevel)"

UPSTREAM_URL="https://github.com/cx330-TXY/CxChanger.git"
git remote get-url upstream >/dev/null 2>&1 || git remote add upstream "$UPSTREAM_URL"
git remote set-url --push upstream DISABLE          # never push to the original author
git config core.quotepath false                     # show Chinese filenames, not \346\211...

if [[ -n "$(git status --porcelain)" ]]; then
  echo "Working tree not clean. Commit or stash first."; exit 1
fi

START_BRANCH="$(git branch --show-current)"
git fetch upstream --prune
git fetch origin --prune

NEW=$(git rev-list --count main..upstream/main)
if [[ "$NEW" -eq 0 ]]; then
  echo "main is already up to date with upstream."
else
  echo "== $NEW new upstream commit(s) =="
  git log --format='%h %ci %s' main..upstream/main
  echo; echo "== Files changed =="
  git diff --stat main upstream/main
  git switch main
  git merge --ff-only upstream/main   # fails loudly if someone committed to main
  git push origin main
  TAG="upstream-$(git log -1 --format=%cd --date=format:%Y-%m-%d upstream/main)"
  git tag -f "$TAG" upstream/main && git push -f origin "refs/tags/$TAG"
  echo "Tagged upstream snapshot: $TAG"
fi

if [[ "${1:-}" != "--no-merge" ]]; then
  git switch m3dp
  git merge --no-edit main
  git push origin m3dp
fi
git switch "$START_BRANCH"
echo "Done. Log what changed in m3dp/UPSTREAM-CHANGELOG.md."
