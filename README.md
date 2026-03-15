# fizren.github.io

## Local preview (safe)

Run this from the repository root:

```bash
./scripts/safe-preview.sh
```

This command:

- stops if you are on `main`/`master`
- initializes the PaperMod submodule
- starts local Hugo preview with safe flags for this project

If you want to include drafts while previewing:

```bash
./scripts/safe-preview.sh -D
```

From OpenCode chat, you can also run:

```text
/preview
```

## E2E checks (shell + curl)

Run these from repository root:

```bash
./scripts/e2e-smoke.sh
./scripts/e2e-navigation.sh
```

What they validate:

- bilingual roots (`/` and `/en/`)
- core section routes in both languages
- navigation labels and links
- language switch links
- Małolat identity markers (`Małolat`, `Zbigniew Czyżewski`)

## Automated checks

Run all automated checks with one command:

```bash
./scripts/check-all.sh
```

This runs:

- `./scripts/verify-story-1-1.sh`
- `./scripts/verify-i18n-nav.sh`
- `./scripts/e2e-smoke.sh`
- `./scripts/e2e-navigation.sh`

## Before push checklist

From repository root:

1. `./scripts/check-all.sh`
2. `./scripts/safe-preview.sh`
3. Manually verify:
   - Polish homepage at `/`
   - English homepage at `/en/`
   - primary navigation and language switch

## Story workflow

Keep story implementation small and test-first:

1. Restate story goal and assumptions.
2. Add/update the smallest deterministic check first.
3. Implement the minimal content/config change.
4. Run `./scripts/check-all.sh`.
5. Run `./scripts/safe-preview.sh` for manual bilingual review.
