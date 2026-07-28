---
applyTo: "**"
---

# Data Models
- This subproject is documentation-first and has no application database.
- Core artifacts and relationships:
  - README.md defines the setup workflow.
  - .github/copilot-instructions.md defines top-level context categories.
  - .github/instructions/*.instructions.md store section-level guidance.
  - .github/prompts/*.prompt.md store reusable prompt templates.
  - .github/skills/*/SKILL.md store reusable skill definitions.
- Naming conventions:
  - instruction files end with .instructions.md.
  - prompt files end with .prompt.md.
  - skill entry files are named SKILL.md.
- Monorepo generator schema reference (outside this folder):
  - directory-instructions.json items include id, directory, output_file,
    status, analyzed_at.
- Validation rule: every referenced path or command should exist in-repo or be
  explicitly marked as external.