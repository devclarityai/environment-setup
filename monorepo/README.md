# Monorepo Instructions Generator

Generate context files for AI coding assistants across directories in a monorepo.

## Requirements

- **GitHub Copilot CLI**, **Claude Code CLI**, **Codex**, or **Cursor**
- **jq** (only required for bash script approach) — [Download here](https://jqlang.github.io/jq/download/)

## Quick Start

### Step 1: Install skills

```bash
npx skills add devclarityai/environment-setup \
  --skill create-directory-list \
  --skill generate-instructions \
  --skill process-directory-list \
  -a <your-agent> -y
```

Replace `<your-agent>` with `claude-code`, `cursor`, `codex`, or `github-copilot`.

Copy `generate-all-instructions.sh` to your repo root (optional, for bash script approach).

For Copilot-only workflows, you can also copy `.github/prompts/` from [`../github-copilot/`](../github-copilot/).

### Step 2: Create Directory List

Run `/create-directory-list` to interactively discover directories and create `directory-instructions.json`.

Review the proposed directories, add or remove as needed, and confirm to generate the file.

### Step 3: Generate Instructions

Choose one of three approaches:

#### Option A: Skill (Parallel Processing)

Run `/process-directory-list`. This spawns parallel sub-agents to process all directories simultaneously.

**Pros**: Faster (parallel execution), no additional dependencies  
**Cons**: Best suited to Claude Code or Codex

#### Option B: Bash Script (Sequential Processing)

```bash
# Using GitHub Copilot
./generate-all-instructions.sh

# Using Claude Code
./generate-all-instructions.sh --cli=claude
```

**Pros**: Works with Copilot and Claude, predictable sequential execution  
**Cons**: Slower (sequential), requires jq

#### Option C: Manual (Cursor)

Run `/generate-instructions` for each directory listed in `directory-instructions.json`.

**Pros**: Works with Cursor, no additional dependencies  
**Cons**: Manual, one directory at a time

### Step 4: Review and Commit

Review the generated files and commit them to your repo.

## Output

| Agent       | Output path                                       |
| ----------- | ------------------------------------------------- |
| Copilot     | `.github/instructions/{DIR_NAME}.instructions.md` |
| Claude Code | `{DIR}/CLAUDE.md`                                 |
| Codex       | `{DIR}/AGENTS.md`                                 |
| Cursor      | `.cursor/rules/{DIR_NAME}.mdc`                    |
