# Codex Homework

## Step 1: Install skills

```bash
npx skills add devclarityai/environment-setup -a codex
```

Pick the core skills you want (code-review, implement-it, refactor, etc.).

Skills install to `.agents/skills/` in your project.

## Step 2: Add AGENTS.md

Add [`AGENTS.md`](AGENTS.md) to the root of your repo.

## Step 3: Improve context

```text
Gather more context about AREA. Summarize it for me and then update our @AGENTS.md file.
```

## Step 4: Cleanup the file

```text
Cleanup our @AGENTS.md file to use the following seven headers. Keep the content clear, but concise.
## Overview
## Architecture & Patterns
## Stack Best Practices
## Anti-Patterns
## Data Models
## Security & Configuration
## Commands & Scripts
```

## Step 5: Customize and push

1. Customize at least one skill for your codebase
2. Push your AGENTS.md file and skills to your repo

## Agent install path

| What                    | Path                    |
| ----------------------- | ----------------------- |
| Skills (via npx skills) | `.agents/skills/`       |
| Context file            | `AGENTS.md` (repo root) |
