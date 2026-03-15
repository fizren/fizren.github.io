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

port="${E2E_PORT:-1314}"
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
  --bind 127.0.0.1 \
  --port "$port" \
  --baseURL "${base_url}/" \
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

assert_status_200() {
  local url="$1"
  local code
  code="$(curl -sS -o /dev/null -w '%{http_code}' "$url")"
  if [[ "$code" != "200" ]]; then
    echo "Fail: expected 200 for $url, got $code"
    exit 1
  fi
}

assert_contains() {
  local url="$1"
  local expected="$2"
  local body
  body="$(curl -fsS "$url")"
  if ! grep -Fq "$expected" <<<"$body"; then
    echo "Fail: $url missing expected marker: $expected"
    exit 1
  fi
}

# Language roots
assert_status_200 "${base_url}/"
assert_status_200 "${base_url}/en/"
assert_contains "${base_url}/" '<html lang="pl"'
assert_contains "${base_url}/en/" '<html lang="en"'

# Core route availability
for path in \
  "/notes/" "/photos/" "/work/" "/family/" "/malolat/" \
  "/en/notes/" "/en/photos/" "/en/work/" "/en/family/" "/en/malolat/"; do
  assert_status_200 "${base_url}${path}"
done

# Małolat identity markers
assert_contains "${base_url}/malolat/" "Małolat"
assert_contains "${base_url}/en/malolat/" "Zbigniew Czyżewski"

echo "Pass: e2e smoke checks are green."
