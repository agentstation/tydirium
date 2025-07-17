#!/bin/bash

# tydirium installer
# "It's an older email, sir, but it checks out."

set -e

REPO_URL="https://raw.githubusercontent.com/agentstation/tydirium/master"
INSTALL_DIR="$HOME/.local/bin"
SCRIPT_NAME="tydirium"

# Colors
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo "🚀 Installing tydirium email authentication checker..."
echo

# Check for required dependencies
if ! command -v dig &> /dev/null; then
    echo -e "${RED}Error: 'dig' command is required but not found.${NC}"
    echo
    echo "Install it with:"
    echo "  Ubuntu/Debian: sudo apt-get install dnsutils"
    echo "  CentOS/RHEL: sudo yum install bind-utils"
    echo "  macOS: dig is included by default"
    echo "  Arch: sudo pacman -S bind"
    exit 1
fi

# Create installation directory
mkdir -p "$INSTALL_DIR"

# Download tydirium
echo "Downloading tydirium..."
if curl -sSL "$REPO_URL/$SCRIPT_NAME" -o "$INSTALL_DIR/$SCRIPT_NAME"; then
    chmod +x "$INSTALL_DIR/$SCRIPT_NAME"
    echo -e "${GREEN}✅ Downloaded successfully${NC}"
else
    echo -e "${RED}Failed to download tydirium${NC}"
    exit 1
fi

# Check if PATH includes install directory
if [[ ":$PATH:" != *":$INSTALL_DIR:"* ]]; then
    echo
    echo -e "${YELLOW}⚠️  $INSTALL_DIR is not in your PATH${NC}"
    echo
    echo "Add this line to your shell profile (~/.bashrc, ~/.zshrc, etc.):"
    echo -e "${GREEN}export PATH=\"\$HOME/.local/bin:\$PATH\"${NC}"
    echo
    echo "Then reload your shell or run:"
    echo -e "${GREEN}source ~/.bashrc${NC}"
    echo
    echo "For now, you can run tydirium with:"
    echo -e "${GREEN}$INSTALL_DIR/$SCRIPT_NAME${NC}"
else
    echo
    echo -e "${GREEN}✅ Installation complete!${NC}"
    echo
    echo "Get started with:"
    echo "  tydirium -h              # Show help"
    echo "  tydirium example.com     # Check a domain"
    echo "  tydirium -q example.com  # Quick check"
fi

echo
echo "May the Force be with your email deliverability! 🌟"