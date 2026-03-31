---
name: "process-directory-list"
description: "Batch-process directory-instructions.json to generate AGENTS.md files in parallel"
---

# Process Directory List

Process the `directory-instructions.json` file and generate `AGENTS.md` files
for each directory by invoking the `/generate-instructions` skill.

## Purpose

This skill orchestrates the batch generation of `AGENTS.md` files for multiple
directories in the monorepo. It reads the directory list JSON file and
systematically processes each directory item.

## Input

Reads from `directory-instructions.json` in the project root, which has this
structure:

```json
{
  "items": [
    {
      "id": "1",
      "directory": "app/controllers",
      "output_file": "AGENTS.md",
      "status": "pending",
      "analyzed_at": null
    }
  ]
}
```

## Steps

### 1. Read the Directory List
- Load `directory-instructions.json` from the current working directory
- Parse the JSON and extract the `items` array
- Display summary: "Found X directories to process"

### 2. Spawn Agents for Each Directory

**For each item in the `items` array where `status` is `"pending"`:**

#### Create Agents
Use Codex agent delegation to process each pending directory in parallel.

Each agent receives this prompt:
```
Process directory "{directory_path}" from directory-instructions.json
(ID: {id}):

Steps:
1. Read directory-instructions.json
2. Update item {id} to set status="in_progress"
3. Write the updated JSON back
4. Run: /generate-instructions {directory_path}
5. Read directory-instructions.json again
6. Update item {id} to set status="completed" and
   analyzed_at="{ISO timestamp}"
7. Write the final JSON back
8. If any errors occur, set status="error" instead

The /generate-instructions skill will analyze the directory and create the
AGENTS.md file.
```

#### Launch All Agents in Parallel
**CRITICAL**: Spawn all agents in a **single batch** so each directory is
processed concurrently.

Example:
```text
spawn_agent(worker, "Process app/controllers and generate AGENTS.md")
spawn_agent(worker, "Process app/models and generate AGENTS.md")
spawn_agent(worker, "Process app/services and generate AGENTS.md")
... (one agent per pending directory)
```

This allows all directories to be processed simultaneously.

### 3. Monitor and Report Results
After all agents have completed, display a summary:
```
Completed: 6 directories
Errors: 1 directory
Skipped: 1 directory (already completed)

Launched 7 agents in parallel
```

## Usage Notes

- **Idempotent**: Running this skill multiple times will only process `pending`
  items
- **Resumable**: If interrupted, re-run to continue from where it left off
- **Parallel Processing**: Spawns multiple agents simultaneously, one per
  directory
- **Status tracking**: Each agent updates the JSON file for its directory
  independently
- **Efficient**: All directories are processed concurrently for maximum speed

## Example Workflow

```bash
# 1. First create the directory list
/create-directory-list

# 2. Then process all directories
/process-directory-list

# 3. Check results
cat directory-instructions.json
```

## Important

- Use Codex agent delegation for parallel processing
- Each agent should invoke `/generate-instructions` directly; do not reimplement
  its logic
- Each directory gets its own dedicated agent for independent processing
- Agents must update the JSON file after their directory completes
- Preserve the JSON structure and formatting when updating the file. Do not add
  entries.
- Launch all agents in a single batch for true parallelism
