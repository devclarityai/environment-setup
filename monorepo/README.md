# Monorepo Instructions Generator

Generate context files for AI coding assistants across directories in a monorepo.

## Quick Start

### Step 1: Create Directory List

Run `/create-directory-list` in your IDE (GitHub Copilot or Claude Code) to interactively discover directories and create `directory-instructions.json`.

### Step 2: Generate Instructions

```bash
# Using GitHub Copilot
./generate-all-instructions.sh

# Using Claude Code
./generate-all-instructions.sh --cli=claude
```

### Step 3: Review and Commit

Review the generated files and commit them to your repo.

## Usage

```bash
./generate-all-instructions.sh [OPTIONS]

Options:
  --cli=TOOL      CLI tool to use: 'copilot' or 'claude' (default: copilot)
  --input=FILE    Path to input JSON file (default: directory-instructions.json)
  -h, --help      Show help message
```

## Output

- **Copilot**: `.github/instructions/{DIR_NAME}.instructions.md`
- **Claude**: `{DIR}/CLAUDE.md`
