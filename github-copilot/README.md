# GitHub Copilot Homework

## Step 1: Install skills

```bash
npx skills add jmsaucier/environment-setup -a github-copilot
```

Pick the core skills you want (code-review, implement-it, refactor, etc.).

Skills install to `.agents/skills/` in your project.

## Step 2: Copy instructions and prompts

Copy the `instructions` and `prompts` directories into your project's `.github/` directory:

```bash
mkdir -p .github
cp -r path/to/environment-setup/github-copilot/.github/instructions .github/
cp -r path/to/environment-setup/github-copilot/.github/prompts .github/
```

Do not overwrite instructions or prompts that already exist.

## Step 3: Run init-context

Run `/init-context` (or use the init-context prompt) to populate instruction files.

## Step 4: Improve context

```text
Gather more context about <AREA>. Summarize it for me and then update our @<FILE>.instructions.md file.
```

## Step 5: Cleanup and customize

1. Cleanup the instruction files for human readability
2. Customize at least one prompt for your codebase
3. Push to your repo

## Agent install paths

| What | Path |
|------|------|
| Skills (via npx skills) | `.agents/skills/` |
| Instructions (copy manually) | `.github/instructions/` |
| Prompts (copy manually) | `.github/prompts/` |
