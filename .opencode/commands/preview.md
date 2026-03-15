---
allowed-tools: Bash
description: Safely run local Hugo preview on a feature branch
disable-model-invocation: false
---

# Safe Preview

Run the project's safe preview script:

1. Execute `./scripts/safe-preview.sh` from repository root.
2. If the script stops because the current branch is `main` or `master`, explain the safety message and tell the user to create a feature branch first.
3. If preview starts, report the local URL (`http://localhost:1313` unless overridden).
4. Keep the response concise and practical.
