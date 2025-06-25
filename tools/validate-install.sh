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
if [[ -f "$INSTALL_DIR/CLAUDE.md" ]]; then
    echo -e "  ${GREEN}✓${NC} CLAUDE.md (main configuration)"
    
    # Check for modular memory structure
    if [[ -d "$INSTALL_DIR/memory" ]]; then
        echo -e "  ${GREEN}✓${NC} Modular memory structure"
        memory_count=$(find "$INSTALL_DIR/memory" -name "*.md" -type f 2>/dev/null | wc -l)
        echo -e "  ${GREEN}✓${NC} Memory modules ($memory_count files)"
    else
        echo -e "  ${YELLOW}⚠${NC} Modular memory structure not found"
    fi
else
    echo -e "  ${RED}✗${NC} CLAUDE.md not found"
    missing_files+=("CLAUDE.md")
fi

# Check for command files
echo ""
echo "Checking command system..."

# Check user commands directory (Claude Code specific)
USER_COMMANDS_DIR="$HOME/.claude/commands"
if [[ -d "$USER_COMMANDS_DIR" ]]; then
    user_command_count=$(find "$USER_COMMANDS_DIR" -name "*.md" -type f 2>/dev/null | wc -l)
    if [[ $user_command_count -gt 0 ]]; then
        echo -e "  ${GREEN}✓${NC} User commands directory ($user_command_count files)"
        
        # Check for shared resources in user commands
        if [[ -d "$USER_COMMANDS_DIR/shared" ]]; then
            shared_count=$(find "$USER_COMMANDS_DIR/shared" -name "*.yml" -type f 2>/dev/null | wc -l)
            echo -e "  ${GREEN}✓${NC} Shared command resources ($shared_count files)"
        else
            echo -e "  ${YELLOW}⚠${NC} Shared command resources not found"
        fi
    else
        echo -e "  ${YELLOW}⚠${NC} User commands directory exists but is empty"
    fi
else
    echo -e "  ${YELLOW}⚠${NC} User commands directory not found at ~/.claude/commands"
fi

# Check memory commands reference
if [[ -d "$INSTALL_DIR/memory/commands" ]]; then
    memory_command_count=$(find "$INSTALL_DIR/memory/commands" -name "*.md" -type f 2>/dev/null | wc -l)
    if [[ $memory_command_count -gt 0 ]]; then
        echo -e "  ${GREEN}✓${NC} Memory commands reference ($memory_command_count files)"
    fi
else
    echo -e "  ${YELLOW}⚠${NC} Memory commands reference not found"
fi

# Skip separate shared resources check since it's now included in commands check

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

# Check if core files exist
missing_files=()
if [[ ! -f "$INSTALL_DIR/CLAUDE.md" ]]; then
    missing_files+=("CLAUDE.md")
fi

if [[ ${#missing_files[@]} -eq 0 ]]; then
    echo -e "${GREEN}✓ Core configuration present${NC}"
else
    echo -e "${RED}✗ Missing files: ${missing_files[*]}${NC}"
fi

# Check commands installation
commands_installed=false
if [[ -d "$USER_COMMANDS_DIR" ]] && [[ $(find "$USER_COMMANDS_DIR" -name "*.md" -type f 2>/dev/null | wc -l) -gt 0 ]]; then
    echo -e "${GREEN}✓ Commands properly installed to ~/.claude/commands${NC}"
    commands_installed=true
else
    echo -e "${YELLOW}⚠ Commands not found in ~/.claude/commands${NC}"
fi

# Overall status
echo ""
if [[ ${#missing_files[@]} -eq 0 ]] && [[ "$commands_installed" = true ]]; then
    echo -e "${GREEN}✓ AI Compass installation appears to be complete!${NC}"
    echo ""
    echo "Next steps:"
    echo "1. Open Claude Code in any project"
    echo "2. Try a command: /user:analyze --code"
    echo "3. Activate a persona: /persona:architect"
    echo "4. Available commands in ~/.claude/commands"
else
    echo -e "${YELLOW}⚠ AI Compass installation may be incomplete${NC}"
    echo ""
    echo "Recommended actions:"
    echo "1. Re-run the installer: ./install.sh"
    echo "2. Check for error messages during installation"
    echo "3. Verify write permissions to installation directory"
    if [[ "$commands_installed" != true ]]; then
        echo "4. Commands should be installed to ~/.claude/commands for Claude Code"
    fi
fi

echo ""
echo -e "For more information, see ${YELLOW}README.md${NC}"