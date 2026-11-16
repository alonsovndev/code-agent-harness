# Contributing

This repo stores portable configuration for AI coding agents, not application code. See `AGENTS.md` for canonical files and gotchas.

## Prerequisites

`git`, `bash`, `python3` (verify and menu tests), `gh` (PR flow), `npx` (third-party skills), and the CLI of each harness you install (`claude`, `codex`, `opencode`, `copilot`, `agy`). `shellcheck` is optional; `scripts/test-all.sh` runs it when present.

## Workflow

1. Sync `main` and start a branch: `/start-feature` (or `git feature <name>`). Use `feature/*`, `fix/*`, `chore/*`, or `hotfix/*`; never commit on `main`.
2. Make one concern per branch.
3. Verify: `./scripts/verify.sh --all`, then `./scripts/test-all.sh` when you touched scripts, guards, or launcher behavior.
4. Commit with a conventional message (`feat`, `fix`, `chore`, `docs`, `refactor`) and open a PR into `main` with `/create-pr`.

## Adding an agent

Add it to every harness in the same change, or `verify.sh` fails parity:

- `agents/claude/<name>.md`
- `agents/opencode/<name>.md`
- `agents/copilot/<name>.agent.md`, plus an entry in the Agent Registry in `adapters/copilot/instructions/copilot-instructions.md`
- `agents/antigravity/<name>/agent.md`
- `agents/codex/<name>.toml`
- A routing row in `orchestration/router.md`

## Adding a command

- `commands/claude/<name>.md`
- `commands/opencode/<name>.md`
- `commands/copilot-prompts/<name>.prompt.md`
- `adapters/codex/skills/<name>/SKILL.md`

Reference only skills and agents that exist; skills live under `skills/`, agents under `agents/`.

## Adding a skill

Create `skills/<name>/SKILL.md` with `name` and `description` frontmatter. Third-party skills are listed in `third-party/skills.txt` and credited in `THIRD_PARTY_NOTICES.md` instead of being copied.

## Instructions

`instructions/AGENTS.md` is the shared payload; `instructions/CLAUDE.md` is the Claude Code variant and may differ (it omits the Orchestration section and `vertical-slicing`). Keep the shared rules consistent between them.

## Never commit

Secrets, credentials, `.env` files, auth/session/cache/telemetry files, or machine-local state.
