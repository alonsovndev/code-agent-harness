# Refactor Task Template

Behavior-preserving restructuring with a safety net.

## Workflow

```
Scope → Characterize → Refactor → Review → Gates
```

## Phase 1: Scope

**Agent**: Domain subagent for the touched layer, or `clean-architecture` for cross-layer moves
**Skills**: `programming-principles`, `code-generation-style`

- State the single goal (rename, extract, move across a layer, remove duplication) and why now
- List the files and public contracts affected
- Confirm no behavior change is intended; if one is needed, split it into a separate feature or fix
- Output: refactor scope and stop condition

## Phase 2: Characterize

**Skills**: `test-strategy`

- Confirm existing tests cover the code being moved; add characterization tests where they do not
- If no test framework exists, record that and define manual verification steps before editing
- Output: passing baseline run

## Phase 3: Refactor

**Build mode** — small, reversible steps

- Keep each step green; do not mix formatting or unrelated cleanups
- Do not change public APIs, schemas, or behavior
- Do not weaken or rewrite tests to keep them passing; if a test must change, explain why
- Extract shared logic only after real repetition
- Output: the refactor

## Phase 4: Review

**Agent**: `code-review` (read-only), plus `clean-architecture` when layers moved
**Skills**: `quality-gates`

- Verify behavior is unchanged and the scope was respected
- Check dependency direction and layer placement
- Output: findings with severity

## Phase 5: Quality Gates

Run required gates from `orchestration/quality-gates.md`, including the baseline tests from Phase 2.

## Done Criteria

- Baseline tests pass before and after, unmodified except for justified updates
- No behavior or public contract change
- No blocking or critical findings from review
- All required quality gates pass
- Changes committed with conventional commit message (type: `refactor`)
