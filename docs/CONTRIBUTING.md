# Contributing to tydirium

> "The Force is strong with this one."

Thank you for your interest in contributing to tydirium! This document provides guidelines for contributing to the project.

## 🚀 Getting Started

1. Fork the repository
2. Clone your fork:
   ```bash
   git clone https://github.com/YOUR_USERNAME/tydirium.git
   cd tydirium
   ```
3. Create a new branch:
   ```bash
   git checkout -b feature/your-feature-name
   ```

## 🛠️ Development

### Prerequisites

- Bash 3.2+
- `dig` command (dnsutils/bind-utils)
- Git

### Testing Your Changes

After making changes to the `tydirium` script:

```bash
# Test basic functionality
./tydirium -h
./tydirium example.com

# Test different modes
./tydirium -q gmail.com
./tydirium -v google.com

# Test edge cases
./tydirium nonexistent-domain-12345.com
./tydirium user@example.com
```

## 📝 Code Style

- Use 4 spaces for indentation (no tabs)
- Follow existing naming conventions
- Add comments for complex logic
- Keep functions focused and small
- Maintain the Star Wars theme where appropriate 🌟

## 🐛 Reporting Issues

When reporting issues, please include:

1. Your operating system and bash version
2. The exact command you ran
3. The full output (sanitize sensitive domains if needed)
4. What you expected to happen

## 💡 Feature Requests

We welcome feature requests! Please:

1. Check existing issues first
2. Clearly describe the feature
3. Explain why it would be useful
4. Provide examples if possible

## 🔄 Pull Request Process

1. Update the README.md if needed
2. Ensure your code follows the style guidelines
3. Test your changes thoroughly
4. Update the version number in the script header if appropriate
5. Create a Pull Request with a clear description

### PR Title Format

- `feat:` New features
- `fix:` Bug fixes
- `docs:` Documentation changes
- `style:` Code style changes
- `refactor:` Code refactoring
- `test:` Test additions/changes

Example: `feat: add support for custom DNS servers`

## 🏗️ Architecture Decisions

### Why Bash?

- Universal availability on Unix-like systems
- No dependencies beyond standard tools
- Simple to audit and understand
- Easy to install and distribute

### Design Principles

1. **Simplicity**: Keep it simple and focused
2. **Reliability**: Fail gracefully with helpful errors
3. **Performance**: Quick checks by default, detailed when requested
4. **Usability**: Clear output that's actionable

## 📜 Code of Conduct

- Be respectful and inclusive
- Welcome newcomers
- Focus on constructive feedback
- Remember: we're all here to make email authentication easier!

## 🙏 Recognition

Contributors will be recognized in:
- The project README
- Release notes
- The Force will be with them, always

---

May your PRs be swift and your merges conflict-free!