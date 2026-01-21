# Monorepo Instructions Generator

Generate context files for AI coding assistants across directories in a monorepo.

## Requirements

- **GitHub Copilot CLI** or **Claude Code CLI**
- **jq** (only required for bash script approach) - [Download here](https://jqlang.github.io/jq/download/)

## Quick Start

### Step 1: Setup

1. Create a new branch in the repository you are adding context to:
   ```bash
   git checkout -b monorepo-context
   ```

2. Copy the prompts from this repo to your repo:
   - **For Copilot**: Copy `.github/prompts/` to your repo's `.github/prompts/`
   - **For Claude**: Copy `.claude/commands/` to your repo's `.claude/commands/`

3. Copy `generate-all-instructions.sh` to your repo root 

### Step 2: Create Directory List

Run `/create-directory-list` in your IDE (GitHub Copilot or Claude Code) to allow AI to interactively discover directories and create `directory-instructions.json`.

Review the proposed directories, add or remove as needed, and confirm to generate the file.

### Step 3: Generate Instructions

Choose one of two approaches:

#### Option A: Slash Command (Parallel Processing)

Run `/process-directory-list` in your IDE. This spawns parallel sub-agents to process all directories simultaneously.

**Pros**: Faster (parallel execution), no additional dependencies
**Cons**: Requires Claude Code CLI with Task tool support

#### Option B: Bash Script (Sequential Processing)

```bash
# Using GitHub Copilot
./generate-all-instructions.sh

# Using Claude Code
./generate-all-instructions.sh --cli=claude
```

**Pros**: Works with both Copilot and Claude, predictable sequential execution
**Cons**: Slower (sequential), requires jq

### Step 4: Review and Commit

Review the generated files and commit them to your repo.

## Output

- **Copilot**: `.github/instructions/{DIR_NAME}.instructions.md`
- **Claude**: `{DIR}/CLAUDE.md`
