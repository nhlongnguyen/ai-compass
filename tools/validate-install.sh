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

# Utility functions for consistent output
log_error() {
    echo -e "${RED}Error: $1${NC}"
}

log_warning() {
    echo -e "${YELLOW}Warning: $1${NC}"
}

log_success() {
    echo -e "${GREEN}✓ $1${NC}"
}

log_info() {
    echo -e "${BLUE}$1${NC}"
}

# Default values
TOOL="claude-code"
INSTALL_DIR=""

# Tool-specific installation paths
get_tool_path() {
    case "$1" in
        "claude-code") echo "$HOME/.claude" ;;
        "cursor") echo "$HOME/.cursor" ;;
        "continue") echo "$HOME/.continue" ;;
        "aider") echo "$HOME/.aider" ;;
        "cody") echo "$HOME/.cody" ;;
        "universal") echo "$HOME/.ai-compass" ;;
        *) echo "" ;;
    esac
}

# Parse command line arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        --tool)
            TOOL="$2"
            shift 2
            ;;
        --dir)
            INSTALL_DIR="$2"
            shift 2
            ;;
        -h|--help)
            echo "Usage: $0 [--tool <tool>] [--dir <directory>]"
            echo "Validates AI Compass installation"
            echo ""
            echo "Options:"
            echo "  --tool <tool>        AI tool to validate (claude-code, cursor, continue, aider, cody, universal)"
            echo "  --dir <directory>    Custom installation directory"
            echo ""
            echo "Examples:"
            echo "  $0                   # Validate Claude Code installation"
            echo "  $0 --tool cursor     # Validate Cursor installation"
            echo "  $0 --dir ~/custom/   # Validate custom directory"
            exit 0
            ;;
        *)
            echo -e "${RED}Error: Unknown option $1${NC}"
            exit 1
            ;;
    esac
done

# Set default installation directory if not provided
if [[ -z "$INSTALL_DIR" ]]; then
    INSTALL_DIR="$(get_tool_path "$TOOL")"
fi

echo -e "${BLUE}AI Compass Installation Validator${NC}"
echo "=================================="
echo -e "Tool: ${YELLOW}$TOOL${NC}"
echo -e "Directory: ${YELLOW}$INSTALL_DIR${NC}"
echo ""

# Check if installation directory exists
if [[ ! -d "$INSTALL_DIR" ]]; then
    log_error "Installation directory not found: $INSTALL_DIR"
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
        memory_count=$(find "$INSTALL_DIR/memory" -name "*.md" -type f 2>/dev/null | wc -l | tr -d ' ')
        echo -e "  ${GREEN}✓${NC} Memory modules ($memory_count files)"
    else
        echo -e "  ${YELLOW}⚠${NC} Modular memory structure not found"
    fi
else
    echo -e "  ${RED}✗${NC} CLAUDE.md not found"
fi

# Check for command files
echo ""
echo "Checking command system..."

# Tool-specific command validation
if [[ "$TOOL" == "claude-code" ]]; then
    # Check user commands directory (Claude Code specific)
    USER_COMMANDS_DIR="$HOME/.claude/commands"
    if [[ -d "$USER_COMMANDS_DIR" ]]; then
        user_command_count=$(find "$USER_COMMANDS_DIR" -name "*.md" -type f 2>/dev/null | wc -l | tr -d ' ')
        if [[ $user_command_count -gt 0 ]]; then
            echo -e "  ${GREEN}✓${NC} User commands directory ($user_command_count files)"
            
            # Check for shared resources in user commands
            if [[ -d "$USER_COMMANDS_DIR/shared" ]]; then
                shared_count=$(find "$USER_COMMANDS_DIR/shared" -name "*.yml" -type f 2>/dev/null | wc -l | tr -d ' ')
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
else
    # Check tool-specific commands directory
    if [[ -d "$INSTALL_DIR/commands" ]]; then
        tool_command_count=$(find "$INSTALL_DIR/commands" -name "*.md" -type f 2>/dev/null | wc -l | tr -d ' ')
        if [[ $tool_command_count -gt 0 ]]; then
            echo -e "  ${GREEN}✓${NC} Tool commands directory ($tool_command_count files)"
        else
            echo -e "  ${YELLOW}⚠${NC} Tool commands directory exists but is empty"
        fi
    else
        echo -e "  ${YELLOW}⚠${NC} Tool commands directory not found at $INSTALL_DIR/commands"
    fi
fi

# Check memory commands reference
if [[ -d "$INSTALL_DIR/memory/commands" ]]; then
    memory_command_count=$(find "$INSTALL_DIR/memory/commands" -name "*.md" -type f 2>/dev/null | wc -l | tr -d ' ')
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

# Check commands installation based on tool
commands_installed=false
if [[ "$TOOL" == "claude-code" ]]; then
    USER_COMMANDS_DIR="$HOME/.claude/commands"
    if [[ -d "$USER_COMMANDS_DIR" ]] && [[ $(find "$USER_COMMANDS_DIR" -name "*.md" -type f 2>/dev/null | wc -l | tr -d ' ') -gt 0 ]]; then
        echo -e "${GREEN}✓ User commands properly installed to ~/.claude/commands${NC}"
        commands_installed=true
    else
        echo -e "${YELLOW}⚠ User commands not found in ~/.claude/commands${NC}"
    fi
else
    if [[ -d "$INSTALL_DIR/commands" ]] && [[ $(find "$INSTALL_DIR/commands" -name "*.md" -type f 2>/dev/null | wc -l | tr -d ' ') -gt 0 ]]; then
        echo -e "${GREEN}✓ Commands properly installed to $INSTALL_DIR/commands${NC}"
        commands_installed=true
    else
        echo -e "${YELLOW}⚠ Commands not found in $INSTALL_DIR/commands${NC}"
    fi
fi

# Overall status
echo ""
if [[ ${#missing_files[@]} -eq 0 ]] && [[ "$commands_installed" = true ]]; then
    echo -e "${GREEN}✓ AI Compass installation appears to be complete!${NC}"
    echo ""
    echo "Next steps:"
    case $TOOL in
        claude-code)
            echo "1. Open Claude Code in any project"
            echo "2. Try a command: /user:analyze --code"
            echo "3. Activate a persona: /persona:architect"
            echo "4. Available commands in ~/.claude/commands"
            ;;
        cursor)
            echo "1. Open Cursor in any project"
            echo "2. Use power commands and personas"
            echo "3. Try: /user:build --react"
            ;;
        *)
            echo "1. Open your AI tool in any project"
            echo "2. Rules are now active"
            echo "3. Check tool-specific documentation"
            ;;
    esac
else
    echo -e "${YELLOW}⚠ AI Compass installation may be incomplete${NC}"
    echo ""
    echo "Recommended actions:"
    echo "1. Re-run the installer: ./install.sh"
    echo "2. Check for error messages during installation"
    echo "3. Verify write permissions to installation directory"
    if [[ "$commands_installed" != true ]]; then
        if [[ "$TOOL" == "claude-code" ]]; then
            echo "4. Commands should be installed to ~/.claude/commands for Claude Code"
        else
            echo "4. Commands should be installed to $INSTALL_DIR/commands for $TOOL"
        fi
    fi
fi

echo ""
echo -e "For more information, see ${YELLOW}README.md${NC}"