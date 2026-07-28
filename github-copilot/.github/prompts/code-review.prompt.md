Use this template to review a PR diff with focused, actionable feedback.

## INPUTS

- PROJECT_CONTEXT
- PR_DIFF
- (optional) PR_DESCRIPTION
- (optional) TICKET_LINKS

## INSTRUCTIONS

1. Scan PR_DIFF for correctness, style, security, and performance.
2. Ground comments in PROJECT_CONTEXT.
3. Apply repository-specific checks for this project style:
  - This repo segment is documentation-first under .github assets.
  - Instruction files should stay concise (target: <=40 lines each).
  - Keep applyTo frontmatter valid in instruction files.
  - Do not allow absolute local file paths in shared docs.
  - Do not allow invented commands that are not verified in-repo.
  - Keep prompt and matching skill expectations aligned.
4. Prefer specific inline suggestions with minimal working patches.
5. Flag test gaps and missing docs. Propose concrete test cases.
6. Label severity: Blocker, Major, Minor, Nit.
7. Keep lines <=80 chars.

## OUTPUT FORMAT

### Summary
- **Scope:**
- **Impact:**
- **Risk level:**

### Positives
- **Code quality wins:**
- **Good patterns:**
- **Tests/documentation:**

### Issues by Severity

#### Blockers
- [file:line] Problem → Why it matters → Fix suggestion
  ```
  // patchlet
  ```

#### Major
- ...

#### Minor
- ...

#### Nits
- ...

### Security & Compliance
- **Authentication/authorization:**
- **Input validation/injection prevention:**
- **Secrets/logging/sensitive data:**
- **Third-party integrations:**
- **Data privacy/compliance:**

### Context Quality
- **Instruction clarity and specificity:**
- **Prompt/skill consistency:**
- **Command accuracy and reproducibility:**
- **Header/frontmatter correctness:**

### Performance
- **Hot paths:**
- **Database query optimization:**
- **Caching/TTL:**
- **Async/concurrency handling:**

### Testing Gaps
- **Unit:**
- **Integration/e2e:**
- **Property/fuzz:**
- **Load/reliability:**

### Documentation
- **Changelog:**
- **Architecture notes:**
- **README/code comments:**

### Inline Review
- [file path]
  - line X: comment
  - line Y: comment

### Review Checklist
- [ ] Builds/CI green
- [ ] Lint/format pass
- [ ] Tests updated/added
- [ ] Backward compatible
- [ ] Feature flagged
- [ ] Observability added
- [ ] Instruction files are concise and repository-specific
- [ ] No absolute local paths or sensitive values in docs
- [ ] Prompt and skill contracts remain aligned