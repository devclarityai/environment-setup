---
applyTo: "**"
---

# Architecture & Patterns
- Primary layout: .github/copilot-instructions.md, .github/instructions,
  .github/prompts, and .github/skills.
- Instruction files: seven focused section files under .github/instructions.
- Prompt files: slash-prompt templates under .github/prompts/*.prompt.md.
- Skill files: reusable skill definitions under .github/skills/*/SKILL.md.
- Naming alignment across prompts and skills: code-review, implement-it,
  task-creator, refactor, test-writer, code-explainer, and file-cleaner.
- Prompt composition pattern: INPUTS -> INSTRUCTIONS -> OUTPUT FORMAT.
- Instruction composition pattern: concise bullets under fixed headers.
- Boundary: this folder defines guidance assets, not runtime service code.