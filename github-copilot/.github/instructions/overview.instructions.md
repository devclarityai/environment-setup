---
applyTo: "**"
---

# Overview
- Repository purpose: bootstrap AI-assistant context assets for project setup.
- Primary users: developers and enablement teams preparing repos for GitHub
  Copilot, Claude Code, Codex, and Cursor.
- Main deliverables: .github/instructions (context), .github/prompts
  (slash-prompt templates), and .github/skills (reusable skill packs).
- Core workflow from README: branch, copy assets, run /init-context, improve
  key areas, clean readability, customize prompts, commit, and push.
- Integration point: monorepo/generate-all-instructions.sh supports
  multi-directory generation workflows.
- Scope: documentation quality and maintainable guidance, not runtime
  application behavior.