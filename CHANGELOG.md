# Changelog

All notable changes to tydirium will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [1.2.1] - 2025-07-17
### Changed
- Made Homebrew the primary recommended installation method in README
- Simplified Homebrew installation instructions

### Fixed
- Fixed automated Homebrew formula updates in release workflow

## [1.2.0] - 2025-07-17
### Added
- Homebrew support via `agentstation/tap`
- GitHub Actions release workflow for automated releases
- Privacy-focused DNS servers (AdGuard, DNS.WATCH)

## [1.1.0] - 2025-07-17
### Added
- Proton Mail detection and specific tips
- Mailgun detection and configuration guidance
- Proofpoint detection
- Mimecast detection
- Exchange Online Protection detection
- Proton Mail DKIM selectors (protonmail, protonmail2, protonmail3)
- More generic and provider-specific DKIM selectors

### Changed
- Enhanced provider detection logic
- Improved DKIM selector discovery

## [1.0.1] - 2025-07-17
### Fixed
- Fixed shellcheck warning SC2155 (declare and assign separately)
- Fixed grep error with `-all` pattern by using `--` flag
- Fixed sed compatibility for SPF include parsing
- Improved error handling for DNS queries

## [1.0.0] - 2025-07-17
### Added
- Initial release
- SPF, DKIM, and DMARC validation
- DNS propagation tracking across 10+ providers
- Smart recommendations based on configuration
- Provider auto-detection (Google, Microsoft, Zoho, FastMail)
- Quick mode (-q) and verbose mode (-v)
- Blacklist checking
- Star Wars themed documentation

### Features
- Comprehensive email authentication checking
- Real-time DNS propagation percentage
- Provider-specific tips and recommendations
- Support for both domain and email address input

---

"It's an older email, sir, but it checks out."

[Unreleased]: https://github.com/agentstation/tydirium/compare/v1.2.1...HEAD
[1.2.1]: https://github.com/agentstation/tydirium/compare/v1.2.0...v1.2.1
[1.2.0]: https://github.com/agentstation/tydirium/compare/v1.1.0...v1.2.0
[1.1.0]: https://github.com/agentstation/tydirium/compare/v1.0.1...v1.1.0
[1.0.1]: https://github.com/agentstation/tydirium/compare/v1.0.0...v1.0.1
[1.0.0]: https://github.com/agentstation/tydirium/releases/tag/v1.0.0