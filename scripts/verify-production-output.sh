#!/usr/bin/env bash
set -euo pipefail

repo_root="$(git rev-parse --show-toplevel 2>/dev/null || true)"
if [[ -z "$repo_root" ]]; then
  echo "Error: run this command inside the git repository."
  exit 1
fi

docs_dir="$repo_root/docs"
if [[ ! -d "$docs_dir" ]]; then
  echo "Fail: docs directory does not exist."
  exit 1
fi

if grep -R -nE "127\\.0\\.0\\.1|localhost:1313|livereload\\.js" "$docs_dir" >/dev/null; then
  echo "Fail: production output contains local preview URLs or livereload references."
  echo "Run a production build before committing docs output."
  exit 1
fi

if ! grep -q "https://piotrstatkiewicz.pl" "$docs_dir/index.html"; then
  echo "Fail: docs/index.html is missing production base URL markers."
  exit 1
fi

echo "Pass: production docs output contains no local preview URLs."
