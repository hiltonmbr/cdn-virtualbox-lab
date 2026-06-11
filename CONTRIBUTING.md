# Contributing to cdn-virtualbox-lab

## 🐘 How to Contribute

We welcome contributions — whether it's fixing a typo, improving a lab, adding new content, or enhancing the automation scripts.

## 📋 Getting Started

1. Fork the repository and clone your fork.
2. Follow the [Quick Start](README.md#-quick-start-5-minutes) instructions in the README.
3. Create a branch for your changes: `git checkout -b my-change`.

## 📝 Documentation Guidelines

- Use clear, accessible language in English.
- Keep code examples self-contained and testable.
- Place new labs in the `labs/` folder with a descriptive English name.
- Place new documentation in the `docs/` folder.

## 💬 Commit Messages

We use [Conventional Commits](https://www.conventionalcommits.org/):

```
type(scope): short description in lowercase
```

Common types:

| Type       | Usage                                               |
|------------|-----------------------------------------------------|
| `feat`     | A new lab, documentation page, or feature           |
| `fix`      | A bug fix                                           |
| `docs`     | Documentation only changes (README, docs/, etc.)    |
| `chore`    | Tooling, dependencies, gitignore, config, Makefile  |
| `refactor` | Code change that neither fixes nor adds a feature   |

Scope examples: `labs`, `docs`, `makefile`, `gitignore`, `scripts`.

Examples:
```
feat(labs): add lab 06 — multi-machine Vagrant cluster
fix(docs): correct Host-Only network IP range
docs(readme): update prerequisites for Apple Silicon
chore(makefile): add lint target
```

## 🔄 Pull Request Process

1. Ensure the docs render correctly.
2. Commit with a semantic message and push to your fork.
3. Open a PR against the `main` branch.
4. In the PR description, briefly explain what was changed and why.

## 🐛 Reporting Issues

- Use the [GitHub Issues](https://github.com/hiltonmbr/cdn-virtualbox-lab/issues) tab.
- Mention which lab or documentation page the issue relates to.

## 📄 License

By contributing, you agree that your contributions will be licensed under the [MIT License](LICENSE).
