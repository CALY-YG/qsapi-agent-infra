#!/usr/bin/env bash
set -euo pipefail

source "scripts/lib/project-config.sh"
cmd="$(command_for_gate \"typecheck\")"

if [ -z "$cmd" ] || [ "$cmd" = "N/A" ]; then
  echo "[SKIP] G6 TypeScript type verification: no configured command"
  exit 0
fi

echo "[RUN] G6 TypeScript type verification: $cmd"
bash -lc "$cmd"
