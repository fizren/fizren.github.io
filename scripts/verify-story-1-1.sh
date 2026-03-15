#!/usr/bin/env bash
set -euo pipefail

repo_root="$(git rev-parse --show-toplevel 2>/dev/null || true)"
if [[ -z "$repo_root" ]]; then
  echo "Error: run this command inside the git repository."
  exit 1
fi

home_file="$repo_root/content/_index.pl.md"
if [[ ! -f "$home_file" ]]; then
  echo "Fail: Polish homepage content file is missing."
  exit 1
fi

for required in "prywatna strona" "publikowania i archiwizowania" "Małolacie" "Zbigniewie Czyżewskim"; do
  if ! grep -q "$required" "$home_file"; then
    echo "Fail: homepage is missing required phrase: $required"
    exit 1
  fi
done

for section in "notatek" "zdjęć" "historii rodzinnych" "informacji zawodowych" "Małolacie"; do
  if ! grep -q "$section" "$home_file"; then
    echo "Fail: homepage is missing section mention: $section"
    exit 1
  fi
done

intro_chars="$(wc -m < "$home_file")"
if [[ "$intro_chars" -gt 420 ]]; then
  echo "Fail: homepage intro is too long (${intro_chars} chars)."
  exit 1
fi

echo "Pass: Story 1.1 homepage checks are green."
