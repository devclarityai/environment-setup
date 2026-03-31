# Monorepo Instructions Generator

Generate context files for AI coding assistants across directories in a monorepo.

## Requirements

- **GitHub Copilot CLI**, **Claude Code CLI**, **Codex**, or **Cursor**
- **jq** (only required for bash script approach) - [Download here](https://jqlang.github.io/jq/download/)

## Quick Start

### Step 1: Setup

1. Create a new branch in the repository you are adding context to:
   ```bash
   git checkout -b monorepo-context
   ```

2. Copy the skills/prompts from this repo to your repo:
   - **For Copilot**: Copy `.github/prompts/` to your repo's `.github/prompts/`
   - **For Claude**: Copy `.claude/skills/` to your repo's `.claude/skills/`
   - **For Codex**: Copy `.codex/skills/` to your repo's `.codex/skills/`
   - **For Cursor**: Copy `.cursor/skills/` to your repo's `.cursor/skills/`

3. Copy `generate-all-instructions.sh` to your repo root (optional for Cursor)

### Step 2: Create Directory List

Run `/create-directory-list` in your IDE (GitHub Copilot, Claude Code, Codex,
or Cursor) to interactively discover directories and create
`directory-instructions.json`.

Review the proposed directories, add or remove as needed, and confirm to generate the file.

### Step 3: Generate Instructions

Choose one of three approaches:

#### Option A: Skill (Parallel Processing)

Run `/process-directory-list` in your IDE. This spawns parallel sub-agents to process all directories simultaneously.

**Pros**: Faster (parallel execution), no additional dependencies
**Cons**: Best suited to Claude Code or Codex

#### Option B: Bash Script (Sequential Processing)

```bash
# Using GitHub Copilot
./generate-all-instructions.sh

# Using Claude Code
./generate-all-instructions.sh --cli=claude

# Using Codex conventions manually
# Copy the Codex skills and run them from Codex
```

**Pros**: Works with both Copilot and Claude, predictable sequential execution
**Cons**: Slower (sequential), requires jq

#### Option C: Manual (Cursor)

Run `/generate-instructions` for each directory listed in `directory-instructions.json`.

**Pros**: Works with Cursor, no additional dependencies
**Cons**: Manual, one directory at a time

### Step 4: Review and Commit

Review the generated files and commit them to your repo.

## Output

- **Copilot**: `.github/instructions/{DIR_NAME}.instructions.md`
- **Claude**: `{DIR}/CLAUDE.md`
- **Codex**: `{DIR}/AGENTS.md`
- **Cursor**: `.cursor/rules/{DIR_NAME}.mdc`
