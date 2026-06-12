# Cursor Homework

## Step 1: Install skills

```bash
npx skills add devclarityai/environment-setup -a cursor
```

Pick the skills you want (at minimum: `init-context` plus any core skills).

Skills install to `.agents/skills/` in your project.

## Step 2: Copy rules templates

Copy the `rules` directory into your project's `.cursor/` directory:

```bash
mkdir -p .cursor
cp -r path/to/environment-setup/cursor/.cursor/rules .cursor/
```

Do not overwrite rules that already exist in your repo.

## Step 3: Run init-context

Run `/init-context` to analyze your codebase and populate the rules files.

## Step 4: Improve context

```text
Gather more context about <AREA>. Summarize it for me and then update our @RULES file.
```

## Step 5: Cleanup and customize

1. Cleanup the rules files for human readability
2. Customize at least one skill for your codebase
3. Push to your repo

## Agent install path

| What                    | Path              |
| ----------------------- | ----------------- |
| Skills (via npx skills) | `.agents/skills/` |
| Rules (copy manually)   | `.cursor/rules/`  |
