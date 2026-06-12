---
name: process-directory-list
description: Batch-process directory-instructions.json to generate context files in parallel. Use after create-directory-list to generate instructions for all pending directories.
---

# Process Directory List

Process the `directory-instructions.json` file and generate context files for each directory by invoking the `/generate-instructions` skill.

## Purpose

Orchestrate batch generation of agent context files for multiple directories in the monorepo. Reads the directory list JSON and processes each pending item.

## Input

Reads from `directory-instructions.json` in the project root:

```json
{
  "items": [
    {
      "id": "1",
      "directory": "app/controllers",
      "output_file": "CLAUDE.md",
      "status": "pending",
      "analyzed_at": null
    }
  ]
}
```

The `output_file` field determines the format (CLAUDE.md, AGENTS.md, .mdc, etc.).

## Steps

### 1. Read the Directory List

- Load `directory-instructions.json` from the current working directory
- Parse the JSON and extract the `items` array
- Display summary: "Found X directories to process"

### 2. Process Each Directory in Parallel

**For each item where `status` is `"pending"`:**

Spawn a sub-agent (Task tool, agent delegation, or equivalent) with this prompt:

```
Process directory "{directory_path}" from directory-instructions.json (ID: {id}):

Steps:
1. Read directory-instructions.json
2. Update item {id} to set status="in_progress"
3. Write the updated JSON back
4. Run: /generate-instructions {directory_path}
5. Read directory-instructions.json again
6. Update item {id} to set status="completed" and analyzed_at="{ISO timestamp}"
7. Write the final JSON back
8. If any errors occur, set status="error" instead

The /generate-instructions skill will analyze the directory and create the context file.
```

**CRITICAL**: Launch ALL sub-agents in a **single message** for true parallelism.

### 3. Monitor and Report Results

After all sub-agents complete, display a summary:

```
Completed: 6 directories
Errors: 1 directory
Skipped: 1 directory (already completed)

Launched 7 sub-agents in parallel
```

## Usage Notes

- **Idempotent**: Only processes `pending` items
- **Resumable**: Re-run to continue from where it left off
- **Parallel**: One sub-agent per directory, all launched concurrently
- **Status tracking**: Each sub-agent updates the JSON independently

## Example Workflow

```bash
# 1. Create the directory list
/create-directory-list

# 2. Process all directories
/process-directory-list

# 3. Check results
cat directory-instructions.json
```

## Important

- Use sub-agents for parallel processing; do not reimplement `/generate-instructions` logic
- Each sub-agent invokes `/generate-instructions` directly
- Preserve JSON structure when updating; do not add extra entries
- Launch all sub-agents in a single batch for maximum speed
