# Environment Setup

Agent skills and context templates for AI coding assistants. Install skills with [skills.sh](https://skills.sh) — the same tooling used by [mattpocock/skills](https://github.com/mattpocock/skills).

## Quickstart

```bash
# List available skills
npx skills add devclarityai/environment-setup --list

# Interactive install (pick skills + agents)
npx skills add devclarityai/environment-setup

# Install core skills for Cursor
npx skills add devclarityai/environment-setup \
  --skill code-review --skill init-context -a cursor -y

# Install all skills for Claude Code
npx skills add devclarityai/environment-setup --skill '*' -a claude-code -y
```

Install from a local checkout during development:

```bash
npx skills add ./ --list
```

## Skills catalog

| Skill                  | Category | Description                                                    |
| ---------------------- | -------- | -------------------------------------------------------------- |
| code-review            | core     | Review a PR diff with focused, actionable feedback             |
| code-explainer         | core     | Explain code at a high level and surface gotchas               |
| file-cleaner           | core     | Improve readability of a source file without changing behavior |
| implement-it           | core     | Turn a user story into a concrete plan, skeletons, and tests   |
| refactor               | core     | Refactor legacy code toward a stated goal with safety          |
| task-creator           | core     | Break a feature spec into sprint-ready engineering tasks       |
| test-writer            | core     | Generate thorough tests for a function or module               |
| init-context           | cursor   | Analyze the codebase and generate Cursor rules                 |
| create-directory-list  | monorepo | Discover monorepo directories and create a tracking JSON       |
| generate-instructions  | monorepo | Generate agent context files for a directory                   |
| process-directory-list | monorepo | Batch-process directory list in parallel                       |

## Tool-specific setup

Each folder has homework instructions for non-skill assets (rules, templates, prompts):

- [`cursor/`](cursor/) — Cursor rules templates
- [`claude-code/`](claude-code/) — CLAUDE.md template
- [`codex/`](codex/) — AGENTS.md template
- [`github-copilot/`](github-copilot/) — Copilot instructions and prompts
- [`monorepo/`](monorepo/) — Batch context generation for monorepos

## Local development

```bash
# List skills in this repo
./scripts/list-skills.sh

# Symlink skills to ~/.claude/skills for local Claude Code testing
./scripts/link-skills.sh
```

## Agent install paths

When you run `npx skills add`, skills are installed to the path your agent expects:

| Agent          | Install path      |
| -------------- | ----------------- |
| Claude Code    | `.claude/skills/` |
| Cursor         | `.agents/skills/` |
| Codex          | `.agents/skills/` |
| GitHub Copilot | `.agents/skills/` |
