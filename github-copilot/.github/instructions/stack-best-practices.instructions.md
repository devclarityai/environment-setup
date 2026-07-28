---
applyTo: "**"
---

# Stack Best Practices
- Keep guidance markdown short, factual, and tied to verified repo artifacts.
- Preserve fixed section names across all instruction files for consistency.
- Keep prompt templates structurally stable: explicit inputs, numbered
  instructions, and predictable output schema.
- Ground examples in current files under .github/prompts and .github/skills.
- Treat skill and prompt names as shared contracts; avoid silent renames.
- Validate every command reference before documenting it.
- Prefer small branch-based updates and focused commits for context changes.
- Re-run /init-context after major repo structure changes, then reconcile
  generated text manually.