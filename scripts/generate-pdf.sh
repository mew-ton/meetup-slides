#!/bin/sh
# Generate the archive PDF for a monthly slide deck.
# Usage: yarn pdf <YYYYMM>   (e.g. yarn pdf 202607)
set -eu

YM="${1:?Usage: yarn pdf <YYYYMM>}"
SRC="src/fe-meetup/$YM.md"
OUT="src/fe-meetup/archives/$YM.pdf"

[ -f "$SRC" ] || { echo "ERROR: $SRC not found" >&2; exit 1; }

# Headless environments (e.g. Claude Code cloud) ship Chromium via Playwright
# without registering it as the default browser — point Marp at it.
if [ "${CHROME_PATH:-}" = "" ]; then
  for c in /opt/pw-browsers/chromium*/chrome-linux/chrome; do
    if [ -x "$c" ]; then
      CHROME_PATH="$c"
      export CHROME_PATH
      break
    fi
  done
fi

# The theme's "Noto Sans JP" webfont cannot be fetched offline; without a local
# Japanese font, CJK glyphs silently fall back to Chinese-style fonts.
if command -v fc-match >/dev/null 2>&1; then
  case "$(fc-match 'Noto Sans JP' 2>/dev/null)" in
    *Noto*) ;;
    *) echo "WARN: 'Noto Sans JP' does not resolve to a local Noto font." >&2
       echo "      Install fonts-noto-cjk (and alias 'Noto Sans JP' to 'Noto Sans CJK JP')," >&2
       echo "      or Japanese text may render with Chinese glyph shapes." >&2 ;;
  esac
fi

npx marp --no-stdin --allow-local-files --theme-set ./styles/*.css --pdf --output "$OUT" "$SRC"
echo "Generated $OUT"
