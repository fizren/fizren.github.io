#!/usr/bin/env bash
set -euo pipefail

repo_root="$(git rev-parse --show-toplevel 2>/dev/null || true)"
if [[ -z "$repo_root" ]]; then
  echo "Error: run this command inside the git repository."
  exit 1
fi

for cmd in hugo curl grep; do
  if ! command -v "$cmd" >/dev/null 2>&1; then
    echo "Error: required command is missing: $cmd"
    exit 1
  fi
done

port="${E2E_NAV_PORT:-1315}"
base_url="http://127.0.0.1:${port}"
server_log="$(mktemp)"

cleanup() {
  if [[ -n "${server_pid:-}" ]] && kill -0 "$server_pid" >/dev/null 2>&1; then
    kill "$server_pid" >/dev/null 2>&1 || true
    wait "$server_pid" >/dev/null 2>&1 || true
  fi
  rm -f "$server_log"
}
trap cleanup EXIT

git -C "$repo_root" submodule update --init --recursive >/dev/null

hugo server \
  --source "$repo_root" \
  --disableFastRender \
  --disableKinds RSS \
  --renderToMemory \
  --bind 127.0.0.1 \
  --port "$port" \
  >"$server_log" 2>&1 &
server_pid="$!"

for _ in $(seq 1 60); do
  if curl -fsS "${base_url}/" >/dev/null 2>&1; then
    break
  fi
  sleep 0.2
done

if ! curl -fsS "${base_url}/" >/dev/null 2>&1; then
  echo "Fail: Hugo server did not become ready on ${base_url}."
  echo "--- server log ---"
  cat "$server_log"
  exit 1
fi

assert_body_contains() {
  local body="$1"
  local expected="$2"
  if ! grep -Fq "$expected" <<<"$body"; then
    echo "Fail: missing expected marker: $expected"
    exit 1
  fi
}

assert_body_matches() {
  local body="$1"
  local pattern="$2"
  if ! grep -Eq "$pattern" <<<"$body"; then
    echo "Fail: missing expected pattern: $pattern"
    exit 1
  fi
}

pl_home="$(curl -fsS "${base_url}/")"
en_home="$(curl -fsS "${base_url}/en/")"

# PL menu labels and links
assert_body_contains "$pl_home" ">Notatki<"
assert_body_contains "$pl_home" ">Zdjęcia<"
assert_body_contains "$pl_home" ">Praca<"
assert_body_contains "$pl_home" ">Rodzina<"
assert_body_contains "$pl_home" ">Małolat<"
for href in \
  'href="[^"]*/notes/"' \
  'href="[^"]*/photos/"' \
  'href="[^"]*/work/"' \
  'href="[^"]*/family/"' \
  'href="[^"]*/malolat/"'; do
  assert_body_matches "$pl_home" "$href"
done

# EN menu labels and links
assert_body_contains "$en_home" ">Notes<"
assert_body_contains "$en_home" ">Photos<"
assert_body_contains "$en_home" ">Work<"
assert_body_contains "$en_home" ">Family<"
assert_body_contains "$en_home" ">Małolat<"
for href in \
  'href="[^"]*/en/notes/"' \
  'href="[^"]*/en/photos/"' \
  'href="[^"]*/en/work/"' \
  'href="[^"]*/en/family/"' \
  'href="[^"]*/en/malolat/"'; do
  assert_body_matches "$en_home" "$href"
done

# Language switch links
assert_body_matches "$pl_home" 'href="[^"]*/en/"'
assert_body_matches "$en_home" 'href="[^"]*/"'

echo "Pass: e2e navigation checks are green."
