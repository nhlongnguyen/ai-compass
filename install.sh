#!/bin/bash

# AI Compass Universal Installer
# Installs AI Compass framework for multiple AI coding tools

set -e  # Exit on error

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Default values
TOOL="claude-code"
INSTALL_DIR=""
FORCE_INSTALL=false
UPDATE_MODE=false
UNINSTALL_MODE=false
FEATURES="all"
BACKUP_DIR=""
MEMORY_LEVEL="user"

# Tool-specific installation paths (function for compatibility)
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

# Tool-specific features (function for compatibility)
get_tool_features() {
    case "$1" in
        "claude-code") echo "core,commands,personas,mcp,collaboration" ;;
        "cursor") echo "core,commands,personas,collaboration" ;;
        "continue") echo "core,collaboration" ;;
        "aider") echo "collaboration" ;;
        "cody") echo "collaboration" ;;
        "universal") echo "all" ;;
        *) echo "" ;;
    esac
}

# Valid tools list
VALID_TOOLS="claude-code cursor continue aider cody universal"

# Function to show usage
show_usage() {
    echo -e "${BLUE}AI Compass Universal Installer${NC}"
    echo "============================="
    echo ""
    echo "Usage: $0 [OPTIONS]"
    echo ""
    echo "Tool Selection:"
    echo "  --tool <tool>           Target AI tool (claude-code, cursor, continue, aider, cody, universal)"
    echo "  --universal             Install universal compatibility rules"
    echo ""
    echo "Installation Options:"
    echo "  --dir <directory>       Custom installation directory"
    echo "  --features <list>       Comma-separated features (core,commands,personas,mcp,collaboration,all)"
    echo "  --backup-dir <dir>      Custom backup directory"
    echo ""
    echo "Memory Architecture:"
    echo "  --modular               Use import-based modular architecture (default)"
    echo "  --project-memory        Install project-level memory (./CLAUDE.md)"
    echo "  --user-memory           Install user-level memory (~/.claude/CLAUDE.md)"
    echo ""
    echo "Execution Options:"
    echo "  --force                 Skip confirmation prompts"
    echo "  --update                Update existing installation"
    echo "  --uninstall             Remove AI Compass"
    echo "  -h, --help             Show this help"
    echo ""
    echo "Examples:"
    echo "  $0                                    # Default: Claude Code modular user memory"
    echo "  $0 --project-memory                  # Install team-shared project memory"
    echo "  $0 --tool cursor --modular           # Cursor with modular architecture"
    echo "  $0 --universal --dir ~/ai-rules/     # Universal installation"
    echo "  $0 --update --backup-dir ~/backups/  # Update with custom backup"
    echo ""
    echo "Supported Tools and Default Features:"
    for tool in $VALID_TOOLS; do
        echo "  $tool: $(get_tool_features "$tool")"
    done
}

# Parse command line arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        --tool)
            TOOL="$2"
            shift 2
            ;;
        --universal)
            TOOL="universal"
            shift
            ;;
        --dir)
            INSTALL_DIR="$2"
            shift 2
            ;;
        --features)
            FEATURES="$2"
            shift 2
            ;;
        --backup-dir)
            BACKUP_DIR="$2"
            shift 2
            ;;
        --modular)
            # Modular is now the default and only option
            shift
            ;;
        --project-memory)
            MEMORY_LEVEL="project"
            shift
            ;;
        --user-memory)
            MEMORY_LEVEL="user"
            shift
            ;;
        --force)
            FORCE_INSTALL=true
            shift
            ;;
        --update)
            UPDATE_MODE=true
            shift
            ;;
        --uninstall)
            UNINSTALL_MODE=true
            shift
            ;;
        -h|--help)
            show_usage
            exit 0
            ;;
        *)
            echo -e "${RED}Error: Unknown option $1${NC}"
            show_usage
            exit 1
            ;;
    esac
done

# Validate tool selection
if [[ ! "$VALID_TOOLS" =~ "$TOOL" ]]; then
    echo -e "${RED}Error: Unsupported tool '$TOOL'${NC}"
    echo "Supported tools: $VALID_TOOLS"
    exit 1
fi

# Set installation directory based on memory level
if [[ -z "$INSTALL_DIR" ]]; then
    if [[ "$MEMORY_LEVEL" == "project" ]]; then
        INSTALL_DIR="$(pwd)"
    else
        INSTALL_DIR="$(get_tool_path "$TOOL")"
    fi
fi

# Convert to absolute path if relative
if [[ ! "$INSTALL_DIR" = /* ]]; then
    parent_dir=$(dirname "$INSTALL_DIR")
    if [[ ! -d "$parent_dir" ]]; then
        echo -e "${RED}Error: Parent directory '$parent_dir' does not exist${NC}"
        exit 1
    fi
    INSTALL_DIR="$(cd "$parent_dir" && pwd)/$(basename "$INSTALL_DIR")"
fi

# Set features based on tool if not specified
if [[ "$FEATURES" == "all" ]]; then
    FEATURES="$(get_tool_features "$TOOL")"
fi

# Handle uninstall mode
if [[ "$UNINSTALL_MODE" = true ]]; then
    echo -e "${BLUE}AI Compass Uninstaller${NC}"
    echo "========================"
    echo -e "Tool: ${YELLOW}$TOOL${NC}"
    echo -e "Directory: ${YELLOW}$INSTALL_DIR${NC}"
    echo ""
    
    if [[ ! -d "$INSTALL_DIR" ]]; then
        echo -e "${RED}Error: AI Compass not found at $INSTALL_DIR${NC}"
        exit 1
    fi
    
    if [[ "$FORCE_INSTALL" != true ]]; then
        echo -e "${YELLOW}This will remove AI Compass from $INSTALL_DIR${NC}"
        echo -n "Are you sure you want to continue? (y/n): "
        read -r confirm_uninstall
        if [[ "$confirm_uninstall" != "y" ]]; then
            echo "Uninstall cancelled."
            exit 0
        fi
    fi
    
    echo "Removing AI Compass..."
    rm -rf "$INSTALL_DIR"
    echo -e "${GREEN}✓ AI Compass uninstalled successfully!${NC}"
    exit 0
fi

echo -e "${BLUE}AI Compass Universal Installer${NC}"
echo "==============================="
echo -e "Tool: ${YELLOW}$TOOL${NC}"
echo -e "Directory: ${YELLOW}$INSTALL_DIR${NC}"
echo -e "Features: ${YELLOW}$FEATURES${NC}"
echo -e "Architecture: ${YELLOW}modular${NC}"
echo -e "Memory Level: ${YELLOW}$MEMORY_LEVEL${NC}"
echo ""

# Check write permissions
parent_for_write=$(dirname "$INSTALL_DIR")
if [[ -d "$INSTALL_DIR" ]]; then
    if [[ ! -w "$INSTALL_DIR" ]]; then
        echo -e "${RED}Error: No write permission for $INSTALL_DIR${NC}"
        exit 1
    fi
elif [[ ! -w "$parent_for_write" ]]; then
    echo -e "${RED}Error: No write permission to create $INSTALL_DIR${NC}"
    exit 1
fi

# Confirmation prompt
if [[ "$FORCE_INSTALL" != true ]]; then
    if [[ "$UPDATE_MODE" = true ]]; then
        echo -e "${YELLOW}This will update AI Compass for $TOOL in $INSTALL_DIR${NC}"
    else
        echo -e "${YELLOW}This will install AI Compass for $TOOL in $INSTALL_DIR${NC}"
    fi
    echo -n "Continue? (y/n): "
    read -r confirm_install
    if [[ "$confirm_install" != "y" ]]; then
        echo "Installation cancelled."
        exit 0
    fi
fi
echo ""

# Validate we're in AI Compass directory
if [[ ! -f "README.md" ]] || [[ ! -d "core" ]]; then
    echo -e "${RED}Error: This script must be run from the AI Compass directory${NC}"
    echo "Missing: $([ ! -f "README.md" ] && echo "README.md ")$([ ! -d "core" ] && echo "core/")"
    exit 1
fi

# Handle existing installation
if [[ -d "$INSTALL_DIR" ]] && [[ "$(ls -A "$INSTALL_DIR" 2>/dev/null)" ]]; then
    echo -e "${YELLOW}Existing configuration found at $INSTALL_DIR${NC}"
    
    # Determine backup directory
    if [[ -z "$BACKUP_DIR" ]]; then
        BACKUP_DIR="$(dirname "$INSTALL_DIR")/ai-compass-backup.$(date +%Y%m%d_%H%M%S)"
    fi
    
    if [[ "$UPDATE_MODE" = true ]] || [[ "$FORCE_INSTALL" = true ]]; then
        backup_choice="y"
    else
        echo -n "Backup existing configuration? (y/n): "
        read -r backup_choice
    fi
    
    if [[ "$backup_choice" = "y" ]]; then
        mkdir -p "$BACKUP_DIR"
        echo "Backing up existing files to: $BACKUP_DIR"
        
        for item in "$INSTALL_DIR"/*; do
            basename_item=$(basename "$item")
            if [[ ! "$basename_item" =~ ^(backup\.|ai-compass-backup) ]]; then
                if [[ -e "$item" ]]; then
                    cp -r "$item" "$BACKUP_DIR/"
                fi
            fi
        done
        
        echo -e "${GREEN}Backup completed: $BACKUP_DIR${NC}"
    fi
fi

echo ""
if [[ "$UPDATE_MODE" = true ]]; then
    echo "Updating AI Compass..."
else
    echo "Installing AI Compass..."
fi

# Create directory structure
echo "Creating directories..."
mkdir -p "$INSTALL_DIR"

# Parse features to install
IFS=',' read -ra FEATURE_ARRAY <<< "$FEATURES"

# Install core framework files
if [[ " ${FEATURE_ARRAY[*]} " =~ " core " ]] || [[ " ${FEATURE_ARRAY[*]} " =~ " all " ]]; then
    echo "Installing core framework..."
    
    # Tool-specific core files
    if [[ -d "core/$TOOL" ]]; then
        echo "  Installing $TOOL-specific configurations..."
        
        # Handle memory architecture choice
        # Use modular memory architecture
        if [[ -d "core/$TOOL/memory" ]]; then
            echo "  Using modular memory architecture..."
            # Copy modular CLAUDE.md and memory directory
            cp "core/$TOOL/CLAUDE.md" "$INSTALL_DIR/"
            mkdir -p "$INSTALL_DIR/memory"
            cp -r "core/$TOOL/memory/"* "$INSTALL_DIR/memory/"
            
            # Copy other non-CLAUDE files
            for file in core/$TOOL/*.md; do
                if [[ -f "$file" ]]; then
                    filename=$(basename "$file")
                    if [[ "$filename" != "CLAUDE.md" ]]; then
                        if [[ "$UPDATE_MODE" = true ]] && [[ -f "$INSTALL_DIR/$filename" ]]; then
                            if ! cmp -s "$file" "$INSTALL_DIR/$filename"; then
                                echo "    Preserving customized $filename (new: $filename.new)"
                                cp "$file" "$INSTALL_DIR/$filename.new"
                            else
                                cp "$file" "$INSTALL_DIR/"
                            fi
                        else
                            cp "$file" "$INSTALL_DIR/"
                        fi
                    fi
                fi
            done
        fi
    fi
    
    # Universal core files if no tool-specific or if universal tool
    if [[ ! -d "core/$TOOL" ]] || [[ "$TOOL" == "universal" ]]; then
        echo "  Installing universal core files..."
        if [[ -f "core/universal/collaboration-rules.md" ]]; then
            cp "core/universal/collaboration-rules.md" "$INSTALL_DIR/"
        fi
    fi
fi

# Install commands
if [[ " ${FEATURE_ARRAY[*]} " =~ " commands " ]] || [[ " ${FEATURE_ARRAY[*]} " =~ " all " ]]; then
    if [[ -d "core/commands" ]]; then
        echo "Installing command system..."
        mkdir -p "$INSTALL_DIR/commands"
        cp -r core/commands/* "$INSTALL_DIR/commands/" 2>/dev/null || true
    fi
fi

# Install templates and tools
if [[ " ${FEATURE_ARRAY[*]} " =~ " all " ]]; then
    if [[ -d "templates" ]] && [[ "$(ls -A templates 2>/dev/null)" ]]; then
        echo "Installing templates..."
        mkdir -p "$INSTALL_DIR/templates"
        cp -r templates/* "$INSTALL_DIR/templates/"
    fi
    
    if [[ -d "tools" ]] && [[ "$(ls -A tools 2>/dev/null)" ]]; then
        echo "Installing maintenance tools..."
        mkdir -p "$INSTALL_DIR/tools"
        cp -r tools/* "$INSTALL_DIR/tools/"
    fi
fi

# Verify installation
echo ""
echo "Verifying installation..."

# Count installed files
main_files=$(find "$INSTALL_DIR" -maxdepth 1 -name "*.md" -type f 2>/dev/null | wc -l)
command_files=0
if [[ -d "$INSTALL_DIR/commands" ]]; then
    command_files=$(find "$INSTALL_DIR/commands" -name "*.md" -type f 2>/dev/null | wc -l)
fi

echo -e "Main config files: ${GREEN}$main_files${NC}"
if [[ $command_files -gt 0 ]]; then
    echo -e "Command files: ${GREEN}$command_files${NC}"
fi

# Check installation success
if [[ $main_files -gt 0 ]]; then
    echo ""
    if [[ "$UPDATE_MODE" = true ]]; then
        echo -e "${GREEN}✓ AI Compass updated successfully for $TOOL!${NC}"
        
        # Check for .new files
        new_files=$(find "$INSTALL_DIR" -name "*.new" 2>/dev/null)
        if [[ -n "$new_files" ]]; then
            echo ""
            echo -e "${YELLOW}Updates available for customized files:${NC}"
            echo "$new_files" | while read -r file; do
                echo "  - $file"
            done
            echo ""
            echo "Review: diff <file> <file>.new"
            echo "Apply: mv <file>.new <file>"
        fi
    else
        echo -e "${GREEN}✓ AI Compass installed successfully for $TOOL!${NC}"
        echo ""
        echo "Next steps:"
        case $TOOL in
            claude-code)
                echo "1. Open any project with Claude Code"
                echo "2. Try: /user:analyze --code"
                echo "3. Switch persona: /persona:architect"
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
    fi
    
    if [[ -n "$BACKUP_DIR" ]] && [[ -d "$BACKUP_DIR" ]]; then
        echo ""
        echo -e "${YELLOW}Previous configuration backed up to:${NC}"
        echo "$BACKUP_DIR"
    fi
    
    echo ""
    echo "Documentation: $INSTALL_DIR/README.md or docs/"
    echo "Configuration: Check $INSTALL_DIR for customization"
else
    echo ""
    echo -e "${RED}✗ Installation may be incomplete${NC}"
    echo ""
    echo "Troubleshooting:"
    echo "1. Check error messages above"
    echo "2. Verify write permissions for $INSTALL_DIR"
    echo "3. Ensure you're in the AI Compass directory"
    echo "4. Try: $0 --force"
    exit 1
fi