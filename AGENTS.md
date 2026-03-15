# Personal Website Repo

This repository contains a **Hugo-based personal website**.

The site is intended to remain **simple, readable, and low-maintenance**.

---

# Persistent context

Long-term context for this project may exist outside the repository.

Location:

~/.opencode/opencode-notes/decisions/

If the file below exists, read it before making decisions:

`~/.opencode/opencode-notes/decisions/opencode-environment.md`

This file may contain:

- development environment details
- repository structure
- workflow preferences
- important constraints
- notes about tooling or deployment

Never store session summaries or notes inside this repository.

Use the `/save-decision` command only for durable decisions worth reusing in future sessions.

---

# Project context

Always read:

docs/PRD.md

when planning changes.

This file defines:

- site goals
- product direction
- content structure
- design philosophy

---

# Core priorities

When working in this repository:

1. keep the site **simple**
2. preserve a **low-maintenance structure**
3. avoid unnecessary dependencies
4. prefer **incremental improvements**
5. avoid redesigns unless explicitly requested

---

# Agent workflow

Before making any change:

1. Restate the task.
2. Identify assumptions.
3. Inspect relevant repository files.
4. Confirm or invalidate assumptions.
5. Propose the **smallest safe change**.

Do not modify files until the plan has been confirmed.

---

# Test-first preference

When implementing a change:

1. Start with the **smallest verification step** possible.
2. Prefer **unit-level tests or isolated checks**.
3. If unit tests are not realistic (e.g. static site content), use the smallest deterministic validation available.
4. Implement the minimal change required.
5. Validate the result.

---

# Planning rules

Before editing files:

- explain the plan briefly
- list files to inspect
- list files likely to change
- identify risks or uncertainties
- mention potential publishing side effects

Prefer **small reversible edits**.

Avoid large multi-file changes unless necessary.

---

# Validation rules

After making a change:

- explain what changed
- state which assumptions were verified
- state which assumptions remain uncertain
- describe how the change was validated

---

# Publishing safety

This repository deploys a Hugo site.

Be careful with changes affecting:

- `hugo.toml`
- content structure
- theme configuration
- build output directories
- GitHub Pages deployment

Never change publishing directories or domain configuration unless explicitly requested.

Flag any change that might affect:

- Hugo build output
- GitHub Pages deployment
- the custom domain
