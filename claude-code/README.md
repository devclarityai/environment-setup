# Claude Code Homework

## Step 1: Install skills

```bash
npx skills add devclarityai/environment-setup -a claude-code
```

Pick the core skills you want (code-review, implement-it, refactor, etc.).

Skills install to `.claude/skills/` in your project.

## Step 2: Initialize context

1. Checkout a branch called `context-rules`
2. Run `/init` inside Claude Code in your repo

## Step 3: Improve context

```text
Gather more context about AREA. Summarize it for me and then update our @CLAUDE.md file.
```

## Step 4: Cleanup the file

```text
Cleanup our @CLAUDE.md file to use the following seven headers. Keep the content clear, but concise.
## Overview
## Architecture & Patterns
## Stack Best Practices
## Anti-Patterns
## Data Models
## Security & Configuration
## Commands & Scripts
```

Use [`CLAUDE.md`](CLAUDE.md) in this folder as a starting template if needed.

## Step 5: Customize and push

1. Customize at least one skill for your codebase
2. Push your CLAUDE.md file and skills to your repo

## Agent install path

| What                    | Path                    |
| ----------------------- | ----------------------- |
| Skills (via npx skills) | `.claude/skills/`       |
| Context file            | `CLAUDE.md` (repo root) |
