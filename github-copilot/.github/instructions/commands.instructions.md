---
applyTo: "**"
---

# Commands & Scripts
- Branch setup:
  - git checkout -b context-rules
- Safe copy without overwrite (example approach):
  - cp -rn <source>/instructions/. .github/instructions/
  - cp -rn <source>/prompts/. .github/prompts/
- Context generation in Copilot Chat:
  - /init-context
- Monorepo automation (optional, from workspace monorepo folder):
  - ./generate-all-instructions.sh
  - ./generate-all-instructions.sh --cli=claude
  - ./generate-all-instructions.sh --input=<path-to-json>
- Monorepo script dependency:
  - jq (required by generate-all-instructions.sh)
- Standard git flow for this task:
  - git status
  - git add .github
  - git commit -m "Add and refine Copilot context rules"
  - git push -u origin context-rules
- Verification:
  - ensure every .github/instructions file has repository-specific content.