---
applyTo: "**"
---

# Security & Configuration
- Never place secrets, API keys, tokens, or credentials in markdown files.
- Avoid publishing internal-only hostnames, private endpoints, or local paths.
- Keep prompt templates explicit about avoiding sensitive data exposure.
- Review generated context text for accidental leakage before commit.
- Use least-privilege branch workflow:
  - make changes on context-rules,
  - open PR,
  - require review before merge.
- If an example needs credentials, replace with clearly fake placeholders.
- Prefer relative paths in docs to reduce environment-specific disclosure.
- For automation scripts, keep allowed tool scopes minimal and explicit.
- Never suppress errors that would hide accidental file writes or leakage.