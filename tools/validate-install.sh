#!/bin/bash

# AI Compass Installation Validator
# Validates that AI Compass is properly installed and configured

set -e

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Default installation directory
INSTALL_DIR="$HOME/.claude"

# Parse command line arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        --dir)
            INSTALL_DIR="$2"
            shift 2
            ;;
        -h|--help)
            echo "Usage: $0 [--dir <directory>]"
            echo "Validates AI Compass installation"
            exit 0
            ;;
        *)
            echo -e "${RED}Error: Unknown option $1${NC}"
            exit 1
            ;;
    esac
done

echo -e "${BLUE}AI Compass Installation Validator${NC}"
echo "=================================="
echo -e "Checking installation at: ${YELLOW}$INSTALL_DIR${NC}"
echo ""

# Check if installation directory exists
if [[ ! -d "$INSTALL_DIR" ]]; then
    echo -e "${RED}✗ Installation directory not found: $INSTALL_DIR${NC}"
    echo "Run ./install.sh to install AI Compass"
    exit 1
fi

# Check for core configuration files
echo "Checking core configuration files..."
declare -a core_files=("CLAUDE.md" "RULES.md" "PERSONAS.md" "MCP.md")
missing_files=()

for file in "${core_files[@]}"; do
    if [[ -f "$INSTALL_DIR/$file" ]]; then
        echo -e "  ${GREEN}✓${NC} $file"
    else
        echo -e "  ${RED}✗${NC} $file"
        missing_files+=("$file")
    fi
done

# Check for command files
echo ""
echo "Checking command system..."
if [[ -d "$INSTALL_DIR/commands" ]]; then
    command_count=$(find "$INSTALL_DIR/commands" -name "*.md" -type f 2>/dev/null | wc -l)
    if [[ $command_count -gt 0 ]]; then
        echo -e "  ${GREEN}✓${NC} Commands directory ($command_count files)"
    else
        echo -e "  ${YELLOW}⚠${NC} Commands directory exists but is empty"
    fi
else
    echo -e "  ${RED}✗${NC} Commands directory not found"
fi

# Check for shared resources
echo ""
echo "Checking shared resources..."
if [[ -d "$INSTALL_DIR/commands/shared" ]]; then
    shared_count=$(find "$INSTALL_DIR/commands/shared" -name "*.yml" -type f 2>/dev/null | wc -l)
    if [[ $shared_count -gt 0 ]]; then
        echo -e "  ${GREEN}✓${NC} Shared resources ($shared_count files)"
    else
        echo -e "  ${YELLOW}⚠${NC} Shared resources directory exists but is empty"
    fi
else
    echo -e "  ${RED}✗${NC} Shared resources directory not found"
fi

# Check file permissions
echo ""
echo "Checking file permissions..."
if [[ -r "$INSTALL_DIR" ]]; then
    echo -e "  ${GREEN}✓${NC} Installation directory is readable"
else
    echo -e "  ${RED}✗${NC} Installation directory is not readable"
fi

# Summary
echo ""
echo "Installation Summary:"
echo "===================="

if [[ ${#missing_files[@]} -eq 0 ]]; then
    echo -e "${GREEN}✓ All core configuration files present${NC}"
else
    echo -e "${RED}✗ Missing files: ${missing_files[*]}${NC}"
fi

# Overall status
echo ""
if [[ ${#missing_files[@]} -eq 0 ]]; then
    echo -e "${GREEN}✓ AI Compass installation appears to be complete!${NC}"
    echo ""
    echo "Next steps:"
    echo "1. Open Claude Code in any project"
    echo "2. Try a command: /user:analyze --code"
    echo "3. Activate a persona: /persona:architect"
else
    echo -e "${RED}✗ AI Compass installation appears to be incomplete${NC}"
    echo ""
    echo "Recommended actions:"
    echo "1. Re-run the installer: ./install.sh"
    echo "2. Check for error messages during installation"
    echo "3. Verify write permissions to installation directory"
fi

echo ""
echo -e "For more information, see ${YELLOW}README.md${NC}"