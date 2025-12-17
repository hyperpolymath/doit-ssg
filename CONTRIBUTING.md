# Contributing to doit-ssg

Thank you for your interest in contributing to doit-ssg! This document provides guidelines and information for contributors.

## Table of Contents

- [Getting Started](#getting-started)
- [Repository Structure](#repository-structure)
- [How to Contribute](#how-to-contribute)
- [Development Workflow](#development-workflow)
- [Code Standards](#code-standards)
- [Security Guidelines](#security-guidelines)

---

## Getting Started

### Prerequisites

- [Deno](https://deno.land/) runtime (for adapter development)
- Git
- Familiarity with JavaScript/TypeScript

### Setup

```bash
# Clone the repository
git clone https://github.com/hyperpolymath/doit-ssg.git
cd doit-ssg

# Using Nix (recommended for reproducibility)
nix develop

# Or using toolbox/distrobox
toolbox create doit-ssg-dev
toolbox enter doit-ssg-dev
# Install dependencies manually

# Verify setup
just check   # Run checks
just test    # Run test suite
```

### Repository Structure

```
doit-ssg/
├── adapters/            # SSG adapters (28 total, synced from hub)
├── .github/             # GitHub config (Perimeter 1)
│   ├── ISSUE_TEMPLATE/
│   └── workflows/
├── CHANGELOG.md
├── CODE_OF_CONDUCT.md
├── CONTRIBUTING.md      # This file
├── ECOSYSTEM.scm        # Ecosystem position
├── LICENSE.txt
├── META.scm             # Architecture decisions
├── README.adoc
├── SECURITY.md
├── STATE.scm            # Project state & roadmap
├── flake.nix            # Nix flake (Perimeter 1) - planned
└── justfile             # Task runner (Perimeter 1) - planned
```

---

## How to Contribute

### Reporting Bugs

**Before reporting**:
1. Search existing issues
2. Check if it's already fixed in `main`
3. Determine which perimeter the bug affects

**When reporting**:

Use the [bug report template](.github/ISSUE_TEMPLATE/bug_report.md) and include:

- Clear, descriptive title
- Environment details (OS, versions, toolchain)
- Steps to reproduce
- Expected vs actual behaviour
- Logs, screenshots, or minimal reproduction

### Suggesting Features

**Before suggesting**:
1. Check the roadmap in STATE.scm
2. Search existing issues and discussions
3. Consider which perimeter the feature belongs to

**When suggesting**:

Use the [feature request template](.github/ISSUE_TEMPLATE/feature_request.md) and include:

- Problem statement (what pain point does this solve?)
- Proposed solution
- Alternatives considered
- Which perimeter this affects

### Your First Contribution

Look for issues labelled:

- [`good first issue`](https://github.com/hyperpolymath/doit-ssg/labels/good%20first%20issue) — Simple Perimeter 3 tasks
- [`help wanted`](https://github.com/hyperpolymath/doit-ssg/labels/help%20wanted) — Community help needed
- [`documentation`](https://github.com/hyperpolymath/doit-ssg/labels/documentation) — Docs improvements
- [`perimeter-3`](https://github.com/hyperpolymath/doit-ssg/labels/perimeter-3) — Community sandbox scope

---

## Development Workflow

### Branch Naming

```
docs/short-description       # Documentation (P3)
test/what-added              # Test additions (P3)
feat/short-description       # New features (P2)
fix/issue-number-description # Bug fixes (P2)
refactor/what-changed        # Code improvements (P2)
security/what-fixed          # Security fixes (P1-2)
```

### Commit Messages

We follow [Conventional Commits](https://www.conventionalcommits.org/):

```
<type>(<scope>): <description>

[optional body]

[optional footer]
```

**Types:**
- `feat`: New feature
- `fix`: Bug fix
- `docs`: Documentation only
- `style`: Formatting, no code change
- `refactor`: Code change without feature/fix
- `test`: Adding/updating tests
- `chore`: Maintenance tasks
- `security`: Security improvements

**Examples:**
```
feat(adapters): add support for new SSG framework
fix(zola): correct path handling on Windows
docs: update installation instructions
security(deps): update vulnerable dependency
```

### Pull Request Process

1. **Fork** the repository
2. **Create** a feature branch from `main`
3. **Make** your changes
4. **Test** thoroughly
5. **Commit** with conventional commit messages
6. **Push** to your fork
7. **Open** a pull request

**PR Checklist:**
- [ ] Code follows project style
- [ ] Tests pass locally
- [ ] Documentation updated if needed
- [ ] Commit messages follow convention
- [ ] No secrets or credentials committed

---

## Code Standards

### JavaScript/TypeScript

- Use Deno's built-in formatter: `deno fmt`
- Use Deno's linter: `deno lint`
- Follow existing code patterns in adapters

### Adapters

All adapters follow a standard interface:

```javascript
// Required exports
export const name = "SSGName";
export const language = "Language";
export const description = "Brief description";

// Required functions
export async function connect() { /* ... */ }
export async function disconnect() { /* ... */ }
export function isConnected() { /* ... */ }

// Tools array
export const tools = [
  {
    name: "tool_name",
    description: "What the tool does",
    inputSchema: { /* JSON Schema */ },
    execute: async (params) => { /* ... */ }
  }
];
```

### Testing

- Target: 70% code coverage minimum
- Framework: `deno test`
- Location: `tests/` directory

---

## Security Guidelines

### DO NOT

- Commit secrets, credentials, or API keys
- Use `eval()` or similar dynamic code execution
- Concatenate SQL strings (use parameterized queries)
- Disable TLS verification
- Use weak cryptography (MD5, SHA1 for security)
- Deserialize untrusted data without validation

### DO

- Use environment variables for credentials
- Validate and sanitize all user input
- Use SHA-pinned dependencies where possible
- Report security concerns privately (see SECURITY.md)
- Review dependencies before adding them

### Adapter Security

When developing adapters:

- Use `Deno.Command` for subprocess execution (provides sandboxing)
- Validate all input parameters
- Escape shell arguments properly
- Never execute arbitrary user code
- Handle errors gracefully without exposing internals

---

## Perimeter System

This project uses a perimeter-based access model:

| Perimeter | Access Level | Examples |
|-----------|--------------|----------|
| **P1** (Core) | Maintainers only | CI/CD, security config, releases |
| **P2** (Trusted) | Verified contributors | Source code, adapters, tests |
| **P3** (Community) | All contributors | Docs, examples, issues |

New contributors start at P3 and can advance through consistent, quality contributions.

---

## Need Help?

- **Questions**: Open a [Discussion](https://github.com/hyperpolymath/doit-ssg/discussions)
- **Bugs**: Open an [Issue](https://github.com/hyperpolymath/doit-ssg/issues)
- **Security**: See [SECURITY.md](SECURITY.md)

---

Thank you for contributing to doit-ssg!
