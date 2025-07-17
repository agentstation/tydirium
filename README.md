# tydirium

> "It's an older email, sir, but it checks out."

A comprehensive email authentication checker that validates SPF, DKIM, and DMARC records to ensure your emails pass through the shields of modern email systems.

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![GitHub Stars](https://img.shields.io/github/stars/agentstation/tydirium.svg)](https://github.com/agentstation/tydirium/stargazers)

## 🚀 Features

- **🛡️ Full Authentication Check** - SPF, DKIM, DMARC validation
- **🌍 DNS Propagation Status** - Check across 10+ global DNS providers
- **🎯 Smart Recommendations** - Personalized fixes based on your setup
- **⚡ Quick & Verbose Modes** - From rapid checks to detailed analysis
- **🏢 Provider Detection** - Auto-detects Google, Microsoft, Zoho, and more
- **📊 Propagation Tracking** - See DNS propagation percentage in real-time
- **🔍 Blacklist Checking** - Verify IP reputation across major providers

## 📦 Quick Start

```bash
# Check a domain
tydirium example.com

# Check an email address
tydirium user@example.com

# Quick mode (3 DNS servers only)
tydirium -q example.com

# Verbose mode (detailed analysis)
tydirium -v example.com
```

## 🛠️ Installation

### Via curl (Recommended)

```bash
curl -sSL https://raw.githubusercontent.com/agentstation/tydirium/master/install.sh | bash
```

### Via Homebrew (Coming Soon)

```bash
brew install agentstation/tap/tydirium
```

### Manual Installation

```bash
git clone https://github.com/agentstation/tydirium.git
cd tydirium
./install.sh
```

Or simply download and run:

```bash
curl -O https://raw.githubusercontent.com/agentstation/tydirium/master/tydirium
chmod +x tydirium
./tydirium example.com
```

### Requirements

- `dig` command (part of `dnsutils` or `bind-utils` package)
- Bash 3.2+ (macOS/Linux)

## 🔍 What It Checks

### MX Records
- ✅ Mail server configuration
- ✅ Redundancy verification
- ✅ Port 25 connectivity (verbose mode)
- ✅ Provider auto-detection

### SPF (Sender Policy Framework)
- ✅ Record syntax validation
- ✅ Policy strictness analysis
- ✅ Include chain verification
- ✅ Redirect handling

### DKIM (DomainKeys Identified Mail)
- ✅ Auto-discovery of selectors
- ✅ Key strength estimation
- ✅ DNS propagation tracking
- ✅ Multiple selector support

### DMARC (Domain-based Message Authentication)
- ✅ Policy enforcement level
- ✅ Reporting configuration
- ✅ Subdomain policy
- ✅ Percentage deployment

### Additional Checks
- ✅ Blacklist status (Spamhaus, Barracuda, SpamCop)
- ✅ BIMI record detection
- ✅ MTA-STS configuration (verbose mode)
- ✅ TLS reporting setup (verbose mode)

## 📸 Example Output

```
=== Email Authentication Check for example.com ===
Generated: Thu Jul 17 11:30:00 CDT 2025

✅ SPF: Properly configured
✅ DKIM: 1 selector(s) found
⚠️  DMARC: Present but weak (p=none)
✅ MX: Mail servers configured

=== Recommended Testing Steps ===

Your email authentication looks good! Here's how to verify:

1. Quick Test:
   → Send an email to a Gmail account
   → Click ⋮ (three dots) → 'Show original'
   → Look for these authentication results:
     • SPF: PASS
     • DKIM: PASS
     • DMARC: PASS
```

## 🎮 Usage Examples

### Basic Domain Check
```bash
tydirium gmail.com
```

### Check Your Work Email
```bash
tydirium you@company.com
```

### Quick Propagation Check
```bash
tydirium -q example.com
```

### Full Verbose Analysis
```bash
tydirium -v example.com
```

### Show Help
```bash
tydirium -h
```

## 🌟 Why "tydirium"?

Just as the shuttle Tydirium needed proper authentication codes to pass through the Death Star's shield in *Return of the Jedi*, your emails need proper SPF, DKIM, and DMARC records to pass through modern email authentication systems.

The tool ensures your emails won't be stopped by saying "It's an older email, sir, but it checks out."

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request. See [CONTRIBUTING.md](docs/CONTRIBUTING.md) for guidelines.

### Development

```bash
# Clone the repo
git clone https://github.com/agentstation/tydirium.git
cd tydirium

# Make your changes
vim tydirium

# Test your changes
./tydirium example.com
```

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- Inspired by the need for simple, comprehensive email authentication checking
- Built with love for the command line
- May the Force be with your email deliverability

## 📬 Support

- 🐛 [Report bugs](https://github.com/agentstation/tydirium/issues)
- 💡 [Request features](https://github.com/agentstation/tydirium/issues)
- 🌟 [Star the project](https://github.com/agentstation/tydirium)

---

Made with ❤️ by [AgentStation](https://agentstation.ai)