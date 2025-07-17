# Changelog

All notable changes to tydirium will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [1.4.0] - 2025-07-17
### Added
- Version flag support (`-V` or `--version`)
- Shell completion scripts for bash, zsh, and fish
- Man page for Unix systems
- Example scripts and documentation
- Post-install checks for dig availability in Homebrew formula
- Enhanced test coverage in Homebrew formula

### Changed
- Homebrew formula now uses `uses_from_macos "bind"` instead of optional dependency
- Improved caveats with color formatting and troubleshooting tips
- Formula shows upgrade-specific messages when updating

### Fixed
- Homebrew formula now properly installs all documentation and completions

## [1.3.0] - 2025-07-17
### Added
- DNS server connectivity check before propagation check
- Clear distinction between unreachable servers (❌), not propagated (⚠️), and found (✅)
- Support for DNS provider domain names instead of hardcoded IPs

### Changed
- DNS servers now use domain names where available (Cloudflare, Google, Quad9, etc.)
- Improved error messages to distinguish between server issues and propagation delays
- More reliable DNS checks using domain names that survive IP changes

### Fixed
- False negatives when DNS servers are down vs records not propagated

## [1.2.2] - 2025-07-17
### Fixed
- Updated Alternate DNS server from deprecated 76.76.19.19 to working 76.76.2.11

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

[Unreleased]: https://github.com/agentstation/tydirium/compare/v1.4.0...HEAD
[1.4.0]: https://github.com/agentstation/tydirium/compare/v1.3.0...v1.4.0
[1.3.0]: https://github.com/agentstation/tydirium/compare/v1.2.2...v1.3.0
[1.2.2]: https://github.com/agentstation/tydirium/compare/v1.2.1...v1.2.2
[1.2.1]: https://github.com/agentstation/tydirium/compare/v1.2.0...v1.2.1
[1.2.0]: https://github.com/agentstation/tydirium/compare/v1.1.0...v1.2.0
[1.1.0]: https://github.com/agentstation/tydirium/compare/v1.0.1...v1.1.0
[1.0.1]: https://github.com/agentstation/tydirium/compare/v1.0.0...v1.0.1
[1.0.0]: https://github.com/agentstation/tydirium/releases/tag/v1.0.0