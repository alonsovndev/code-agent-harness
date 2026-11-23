---
description: "Prepare or create a pull request from a working branch into main using the GitHub workflow"
name: "Create PR"
argument-hint: "Optional title, issue links, and PR details"
agent: "agent"
---

Use the `git-create-pr`, `gh-prs`, and `git-repo-flow` skills to prepare a pull request.

Requirements:

- Run read-only preflight first: status, branch, remotes, log, diff stat. Run the independent commands (including `gh auth status` and the existing-PR check) as one parallel batch.
- Choose the PR target from detected topology: fork mode targets `upstream`, direct mode targets `origin`.
- Target `main` for every working branch (`feature/*`, `fix/*`, `chore/*`, `hotfix/*`).
- The invocation pre-approves committing, pushing, and PR creation — do not ask for approval again inside this flow.
- Inspect staged, unstaged, and untracked changes. If changes are pending, commit them first in logical Conventional Commits per the `git-commit` skill; split silently, and stop to ask only if changes cannot be grouped confidently or secrets are detected — never stage secrets. If the working tree is clean, continue without creating a commit.
- After committing, derive the PR title and body from the complete branch changes. The title must be a Conventional Commit (`type(scope): summary`) because it becomes the squash commit; a single commit uses its subject.
- Push the working branch and create the PR. If an existing PR is found, follow the skill's existing-PR flow rather than create a duplicate.
- Refuse to start on `main`, `master`, or a detached HEAD; tell the user to run start-feature first.
- Push only from a named working branch (`feature/*`, `fix/*`, `hotfix/*`, `chore/*`, or another named branch) — never push a protected branch.
- Still gated: force-push, PR edits, comments, and merges require explicit approval.
- Report the result: PR created or not (never claim success unless the command succeeded), PR URL, title, base ← head, verification status, and a one-line change summary; list commit subjects only when there is more than one commit.
- If `gh` is unavailable, provide a compare URL plus PR title/body.

Arguments: $ARGUMENTS
