# Scoped Instructions

This directory is for path-specific or agent-specific Copilot instructions that complement the main [copilot-instructions.md](../copilot-instructions.md).

## What are Scoped Instructions?

Scoped instructions allow you to provide targeted guidance that applies only to:
- **Specific file paths** (e.g., only for test files, or a specific module)
- **Specific agents** (e.g., different instructions for coding agent vs code review agent)

## File Format

Create `.instructions.md` files with frontmatter:

```markdown
---
applyTo: "app/src/test/**/*.kt"
excludeAgent: "code-review"
---

# Test-Specific Instructions

[Your scoped instructions here]
```

### Frontmatter Options

- **`applyTo`**: Glob pattern for files where instructions apply
  - Example: `"app/src/main/java/com/roomscanner/app/ui/**/*.kt"`
  
- **`excludeAgent`**: Which agent should NOT see these instructions
  - `"coding-agent"` - Hide from Copilot coding agent
  - `"code-review"` - Hide from Copilot code review agent

## Example Use Cases

### 1. Test-Specific Instructions
```
applyTo: "app/src/test/**/*.kt"
```
Instructions for testing conventions, mocking patterns, etc.

### 2. UI Component Instructions
```
applyTo: "app/src/main/java/com/roomscanner/app/ui/**/*.kt"
```
Compose-specific patterns, Material Design 3 guidelines.

### 3. Database Layer Instructions
```
applyTo: "app/src/main/java/com/roomscanner/app/data/**/*.kt"
```
Room database patterns, DAO conventions, repository patterns.

### 4. ARCore Module Instructions
```
applyTo: "app/src/main/java/com/roomscanner/app/arcore/**/*.kt"
```
ARCore-specific best practices, session management, performance tips.

## When to Use Scoped Instructions

Use scoped instructions when:
- Specific modules have unique conventions
- You want different guidance for tests vs production code
- Certain paths require specialized knowledge
- You need agent-specific instructions (coding vs review)

Use the main `copilot-instructions.md` when:
- Guidance applies project-wide
- Instructions are fundamental to all contributions
- You want all agents to see the same context

## Current Status

**No scoped instructions are currently defined.** The main [copilot-instructions.md](../copilot-instructions.md) provides comprehensive project-wide guidance that covers all needs at this time.

As the project grows and specific modules develop unique patterns, consider adding scoped instructions here.

## Resources

- [GitHub Copilot Instructions Documentation](https://docs.github.com/en/copilot)
- [Agent-Specific Instructions](https://github.blog/changelog/2025-11-12-copilot-code-review-and-coding-agent-now-support-agent-specific-instructions/)
