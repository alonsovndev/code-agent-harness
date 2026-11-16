# Hotfix Task Template

Urgent production fix branched from `main`. Same discipline as `bugfix.md`, with a smaller scope and a release step.

## Workflow

```
Branch → Isolate → Minimal Fix → Regression Test → Review → Gates → PR → Tag
```

## Phase 1: Branch

- Start with `/start-feature` and choose the `hotfix/*` type from `main`
- Never commit or push on `main`

## Phase 2: Isolate and Fix

Follow `orchestration/task-templates/bugfix.md` phases 1–3 with these tightenings:

- Smallest possible change; no refactors, cleanups, or dependency upgrades
- If the root cause needs a larger change, ship the mitigation now and open a follow-up for the proper fix

## Phase 3: Review and Gates

**Agent**: `code-review` (read-only)

- Run all required gates from `orchestration/quality-gates.md`; do not skip gates to save time
- Treat security and data-exposure findings as blockers

## Phase 4: PR and Release

- `/create-pr` into `main`, noting impact and rollback in the body
- After merge, `/tag-release` for the patch version

## Done Criteria

- Production issue is fixed and covered by a regression test
- All required quality gates pass
- PR merged and patch tag created, or the exact commands handed to the user if the tag step is not run
- Commit type: `fix`
