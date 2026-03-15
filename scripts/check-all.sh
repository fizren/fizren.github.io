#!/usr/bin/env bash
set -euo pipefail

repo_root="$(git rev-parse --show-toplevel 2>/dev/null || true)"
if [[ -z "$repo_root" ]]; then
  echo "Error: run this command inside the git repository."
  exit 1
fi

cd "$repo_root"

echo "[1/4] verify-story-1-1"
./scripts/verify-story-1-1.sh

echo "[2/4] verify-i18n-nav"
./scripts/verify-i18n-nav.sh

echo "[3/5] verify-production-output"
./scripts/verify-production-output.sh

echo "[4/5] e2e-smoke"
./scripts/e2e-smoke.sh

echo "[5/5] e2e-navigation"
./scripts/e2e-navigation.sh

echo "Pass: all automated checks are green."
