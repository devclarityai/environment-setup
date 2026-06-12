#!/usr/bin/env bash
set -euo pipefail

REPO="$(cd "$(dirname "$0")/.." && pwd)"

find "$REPO/skills" -name SKILL.md -not -path '*/node_modules/*' | while read -r skill_md; do
  dir="$(dirname "$skill_md")"
  echo "$(basename "$dir")"
done | sort -u
