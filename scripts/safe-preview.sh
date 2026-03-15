#!/usr/bin/env bash
set -euo pipefail

repo_root="$(git rev-parse --show-toplevel 2>/dev/null || true)"
if [[ -z "$repo_root" ]]; then
  echo "Error: run this command inside the git repository."
  exit 1
fi

cd "$repo_root"

branch="$(git rev-parse --abbrev-ref HEAD)"
if [[ "$branch" == "main" || "$branch" == "master" ]]; then
  cat <<'EOF'
Safety stop: you are on main/master.

Create a feature branch first, for example:
  git checkout -b feat/my-change

Then run:
  ./scripts/safe-preview.sh
EOF
  exit 1
fi

if ! command -v hugo >/dev/null 2>&1; then
  echo "Error: hugo is not installed. Install Hugo Extended first."
  exit 1
fi

echo "Branch: $branch"
echo "Initializing submodules (safe to re-run)..."
git submodule update --init --recursive

echo "Starting local preview on http://localhost:1313"
echo "(RSS disabled locally to avoid current PaperMod/Hugo RSS issue)"
echo "Tip: add -D if you want to include draft content."
exec hugo server --disableFastRender --disableKinds RSS "$@"
