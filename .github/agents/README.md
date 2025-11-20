# Custom Copilot Agents

This directory is reserved for custom GitHub Copilot agents that provide specialized expertise for specific tasks in this repository.

## What are Custom Agents?

Custom agents are specialized AI assistants that can be configured with:
- **Domain-specific knowledge**: Tailored to specific aspects of your codebase
- **Custom instructions**: Specific prompts and guidelines
- **Tool access**: Controlled access to specific development tools
- **Scoped expertise**: Focus on particular languages, frameworks, or patterns

## How to Create a Custom Agent

Create a markdown file in this directory (e.g., `testing-agent.md`) with the following structure:

```markdown
---
name: Testing Agent
description: Specialized agent for writing and improving tests
---

# Testing Agent Instructions

[Your custom instructions here]

## Expertise Areas
- Unit testing with JUnit
- Instrumentation testing with Espresso
- Mocking with MockK
- Test coverage analysis

## Guidelines
[Specific testing guidelines]
```

## Potential Custom Agents for This Project

Based on the Room Scanner project needs, consider creating agents for:

### 1. **Android Testing Agent**
- Expertise in JUnit, Espresso, and AndroidX Test
- Knows how to test Compose UI
- Familiar with testing Room database and Firebase integration

### 2. **ARCore Integration Agent**
- Specialized in ARCore APIs and 3D scanning
- Knows best practices for AR session management
- Familiar with point cloud and mesh processing

### 3. **Firebase Integration Agent**
- Expert in Firestore, Cloud Functions, and Storage
- Knows offline-first patterns and sync strategies
- Familiar with Firebase security rules

### 4. **ML/AI Models Agent**
- Specialized in TensorFlow Lite integration
- Knows ML Kit APIs and custom model deployment
- Familiar with GPU/NNAPI acceleration

### 5. **Documentation Agent**
- Expert in technical writing
- Maintains consistency across docs
- Updates architecture diagrams

## Usage

Once a custom agent is created, it can be invoked by:
1. Mentioning it in issue descriptions when assigning to @copilot
2. Referencing it in PR comments for specialized reviews
3. Using it for focused tasks in its expertise area

## Best Practices

- Keep agent instructions focused on a specific domain
- Provide clear examples in agent definitions
- Update agents as the project evolves
- Document the agent's capabilities clearly
- Test agents with real tasks before relying on them

## Resources

- [GitHub Copilot Custom Agents Documentation](https://docs.github.com/en/copilot)
- [Best Practices for Custom Agents](https://docs.github.com/en/copilot/tutorials/coding-agent/get-the-best-results)

## Current Status

**No custom agents are currently configured.** This directory serves as a placeholder and guide for future custom agent implementations as the project grows and specialized needs arise.
