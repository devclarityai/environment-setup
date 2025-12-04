# Homework

## Requirements

- [jq](https://jqlang.github.io/jq/download/)
- [GitHub Copilot CLI](https://docs.github.com/en/copilot/how-tos/set-up/install-copilot-cli) or [Claude Code CLI](https://code.claude.com/docs#get-started-in-30-seconds)

## Steps

1. Create a new branch: `git checkout -b monorepo-context`

2. Copy the prompts to your repo:
   - **For Copilot**: Copy `.github/prompts/` to your repo's `.github/prompts/`
   - **For Claude**: Copy `.claude/commands/` to your repo's `.claude/commands/`

3. Copy `generate-all-instructions.sh` to your repo root

4. Run `/create-directory-list` in your IDE
   - Review the proposed directories
   - Add or remove directories as needed
   - Confirm to generate `directory-instructions.json`

5. Run the script:
   ```bash
   # For Copilot
   ./generate-all-instructions.sh

   # For Claude
   ./generate-all-instructions.sh --cli=claude
   ```

6. Review the generated files:
   - **Copilot**: `.github/instructions/*.instructions.md`
   - **Claude**: `{DIR}/CLAUDE.md` in each target directory

7. Commit and push to the repo
