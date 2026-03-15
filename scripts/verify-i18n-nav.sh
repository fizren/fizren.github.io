#!/usr/bin/env bash
set -euo pipefail

repo_root="$(git rev-parse --show-toplevel 2>/dev/null || true)"
if [[ -z "$repo_root" ]]; then
  echo "Error: run this command inside the git repository."
  exit 1
fi

hugo_config="$repo_root/hugo.toml"

for required in 'defaultContentLanguage = "pl"' '[languages.pl]' '[languages.en]'; do
  if ! grep -q "$required" "$hugo_config"; then
    echo "Fail: Hugo config missing: $required"
    exit 1
  fi
done

for label in "Notatki" "Zdjęcia" "Praca" "Rodzina" "Małolat"; do
  if ! grep -q "name = \"$label\"" "$hugo_config"; then
    echo "Fail: Polish navigation missing label: $label"
    exit 1
  fi
done

for label in "Notes" "Photos" "Work" "Family" "Małolat"; do
  if ! grep -q "name = \"$label\"" "$hugo_config"; then
    echo "Fail: English navigation missing label: $label"
    exit 1
  fi
done

for required in 'pageRef = "/notes"' 'pageRef = "/photos"' 'pageRef = "/work"' 'pageRef = "/family"' 'pageRef = "/malolat"'; do
  if ! grep -q "$required" "$hugo_config"; then
    echo "Fail: Missing menu pageRef in config: $required"
    exit 1
  fi
done

for required_file in \
  "$repo_root/content/_index.pl.md" \
  "$repo_root/content/_index.en.md" \
  "$repo_root/content/notes/_index.pl.md" \
  "$repo_root/content/notes/_index.en.md" \
  "$repo_root/content/photos/_index.pl.md" \
  "$repo_root/content/photos/_index.en.md" \
  "$repo_root/content/work/_index.pl.md" \
  "$repo_root/content/work/_index.en.md" \
  "$repo_root/content/family/_index.pl.md" \
  "$repo_root/content/family/_index.en.md" \
  "$repo_root/content/malolat/_index.pl.md" \
  "$repo_root/content/malolat/_index.en.md"; do
  if [[ ! -f "$required_file" ]]; then
    echo "Fail: Missing bilingual content file: $required_file"
    exit 1
  fi
done

if ! grep -q 'Małolat' "$repo_root/content/malolat/_index.pl.md"; then
  echo "Fail: Polish Małolat page content missing expected title/name."
  exit 1
fi

if ! grep -q 'Zbigniew Czyżewski' "$repo_root/content/malolat/_index.en.md"; then
  echo "Fail: English Małolat page missing full name."
  exit 1
fi

echo "Pass: bilingual navigation checks are green."
