# m3dp — Minimal3DP CxChanger build (Voron 2.4 350, 6 tools)

Everything in this folder is mine. Nothing outside `m3dp/` (and `.github/`) is edited,
so merges from the original repo never conflict.

## Branches and remotes

| Name | What it is | Rule |
|---|---|---|
| `upstream` | https://github.com/cx330-TXY/CxChanger (original, Chinese) | fetch only (push disabled) |
| `origin` | https://github.com/minimal3dp/CxChanger (my fork) | push here |
| `main` | exact mirror of `upstream/main` | never commit; fast-forward only |
| `m3dp` | my build branch (default branch on GitHub) | all my work; merge `main` in |
| `upstream-YYYY-MM-DD` tags | snapshot of upstream at each sync | diff between versions |

## Sync with upstream

1. Commit or stash your work.
2. Run `m3dp/tools/sync-upstream.sh`.
3. Read the printed commit list / file stats.
4. Add an entry to `UPSTREAM-CHANGELOG.md` (what changed, translated, BOM impact).

The GitHub Action `.github/workflows/upstream-watch.yml` checks daily and opens an issue
when upstream changes, so you don't have to remember.

Compare two upstream versions: `git diff --stat upstream-2026-09-29 upstream-<newer>`

## Rules that keep sync painless

1. Never edit upstream files. To change a config, copy it into `m3dp/klipper/` and edit the copy.
2. Never commit to `main`.
3. Merge (don't rebase) `main` into `m3dp`, because `m3dp` is pushed.
4. Contributing back (e.g., translation fixes): branch from `main`, not `m3dp`, and open a PR to cx330-TXY.
5. Upstream renames/deletes CAD often (2026-09-29 removed all 4.x/5.x STEP files).
   The `upstream-*` tags keep old versions reachable.

## Folder map

- `bom/` — BOM notes. **Live BOM (source of truth): [CxChanger_BOM_6tool Google Sheet](https://docs.google.com/spreadsheets/d/1XKfhXYksS0HXqKZEymX-_Pp8U7Hs6pY4Yzv2Vwxhv8M/edit)**. The .xlsx in `bom/` is an old snapshot (2026-09-30).
- `build-log/` — dated build notes (copy `_template.md`)
- `klipper/` — my Voron-specific config copies (6 tools, M8P + 2× EBB36 pins)
- `translations/` — my English notes on Chinese docs not covered by `EN-translation/`
- `tools/` — scripts (sync)
- `UPSTREAM-CHANGELOG.md` — what upstream changed at each sync, and its effect on my build
