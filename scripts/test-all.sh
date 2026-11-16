#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

for self_test in test-install.sh test-verify.sh test-run-agent.sh; do
  echo "==> $self_test"
  "$repo_root/scripts/$self_test"
done

if command -v shellcheck >/dev/null 2>&1; then
  echo "==> shellcheck"
  shellcheck "$repo_root"/scripts/*.sh "$repo_root"/scripts/lib/*.sh
else
  echo "==> shellcheck skipped (not installed)"
fi
