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
ROLLBACK_STATE_FILE=""

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

# Safe installation path patterns (security whitelist)
SAFE_PATH_PATTERNS=(
    "$HOME/\.claude(/.*)?"
    "$HOME/\.cursor(/.*)?"
    "$HOME/\.continue(/.*)?"
    "$HOME/\.aider(/.*)?"
    "$HOME/\.cody(/.*)?"
    "$HOME/\.ai-compass(/.*)?"
    "/tmp/ai-compass-test(/.*)?"
)

# Validate path is within safe boundaries
validate_installation_path() {
    local path="$1"
    
    # Convert to absolute path
    if [[ ! "$path" = /* ]]; then
        local parent_dir=$(dirname "$path")
        if [[ ! -d "$parent_dir" ]]; then
            echo -e "${RED}Error: Parent directory '$parent_dir' does not exist${NC}"
            return 1
        fi
        path="$(cd "$parent_dir" && pwd)/$(basename "$path")"
    fi
    
    # Check against whitelist
    for pattern in "${SAFE_PATH_PATTERNS[@]}"; do
        if [[ "$path" =~ ^$pattern$ ]]; then
            echo "$path"
            return 0
        fi
    done
    
    echo -e "${RED}Error: Installation path '$path' is not in safe directory whitelist${NC}"
    echo -e "${YELLOW}Safe patterns:${NC}"
    printf "  %s\n" "${SAFE_PATH_PATTERNS[@]}"
    return 1
}

# Create rollback state tracking
create_rollback_state() {
    ROLLBACK_STATE_FILE="$(mktemp)"
    echo "INSTALL_DIR=$INSTALL_DIR" > "$ROLLBACK_STATE_FILE"
    echo "BACKUP_DIR=$BACKUP_DIR" >> "$ROLLBACK_STATE_FILE"
    echo "TOOL=$TOOL" >> "$ROLLBACK_STATE_FILE"
    echo "TIMESTAMP=$(date '+%Y%m%d_%H%M%S')" >> "$ROLLBACK_STATE_FILE"
}

# Cleanup rollback state on success
cleanup_rollback_state() {
    if [[ -n "$ROLLBACK_STATE_FILE" ]] && [[ -f "$ROLLBACK_STATE_FILE" ]]; then
        rm -f "$ROLLBACK_STATE_FILE"
    fi
}

# Execute rollback on failure
execute_rollback() {
    if [[ -n "$ROLLBACK_STATE_FILE" ]] && [[ -f "$ROLLBACK_STATE_FILE" ]]; then
        echo -e "${YELLOW}Executing rollback...${NC}"
        source "$ROLLBACK_STATE_FILE"
        
        if [[ -n "$BACKUP_DIR" ]] && [[ -d "$BACKUP_DIR" ]]; then
            echo "Restoring from backup: $BACKUP_DIR"
            rm -rf "$INSTALL_DIR"
            cp -r "$BACKUP_DIR"/* "$INSTALL_DIR"/
            echo -e "${GREEN}Rollback completed${NC}"
        else
            echo -e "${YELLOW}No backup available for rollback${NC}"
        fi
        
        cleanup_rollback_state
    fi
}

# Enhanced error handler
handle_error() {
    local exit_code=$?
    echo -e "${RED}Installation failed with exit code $exit_code${NC}"
    execute_rollback
    exit $exit_code
}

# Set up error handling
trap handle_error ERR


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
    echo "  --dir <directory>       Custom installation directory (default: ~/.claude)"
    echo "  --features <list>       Comma-separated features (core,commands,personas,mcp,collaboration,all)"
    echo "  --backup-dir <dir>      Custom backup directory"
    echo ""
    echo "Execution Options:"
    echo "  --force                 Skip confirmation prompts"
    echo "  --update                Update existing installation"
    echo "  --uninstall             Remove AI Compass"
    echo "  -h, --help             Show this help"
    echo ""
    echo "Examples:"
    echo "  $0                                    # Default: Claude Code to ~/.claude"
    echo "  $0 --tool cursor                     # Cursor installation"
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

# Set installation directory to tool-specific path
if [[ -z "$INSTALL_DIR" ]]; then
    INSTALL_DIR="$(get_tool_path "$TOOL")"
fi

# Validate and secure installation path
INSTALL_DIR=$(validate_installation_path "$INSTALL_DIR")
if [[ $? -ne 0 ]]; then
    exit 1
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
    
    # Enhanced safety check for rm -rf
    if [[ -z "$INSTALL_DIR" ]] || [[ "$INSTALL_DIR" == "/" ]] || [[ "$INSTALL_DIR" == "$HOME" ]]; then
        echo -e "${RED}Error: Refusing to remove critical directory '$INSTALL_DIR'${NC}"
        exit 1
    fi
    
    # Verify path is still within safe boundaries
    if ! validate_installation_path "$INSTALL_DIR" >/dev/null; then
        echo -e "${RED}Error: Refusing to remove directory outside safe boundaries${NC}"
        exit 1
    fi
    
    # Check if directory contains expected AI Compass files
    if [[ ! -f "$INSTALL_DIR/CLAUDE.md" ]] && [[ ! -d "$INSTALL_DIR/memory" ]] && [[ ! -d "$INSTALL_DIR/commands" ]]; then
        echo -e "${YELLOW}Warning: Directory doesn't appear to contain AI Compass installation${NC}"
        echo -n "Continue with removal? (y/n): "
        read -r confirm_removal
        if [[ "$confirm_removal" != "y" ]]; then
            echo "Removal cancelled."
            exit 0
        fi
    fi
    
    rm -rf "$INSTALL_DIR"
    echo -e "${GREEN}✓ AI Compass uninstalled successfully!${NC}"
    exit 0
fi

echo -e "${BLUE}AI Compass Universal Installer${NC}"
echo "==============================="
echo -e "Tool: ${YELLOW}$TOOL${NC}"
echo -e "Directory: ${YELLOW}$INSTALL_DIR${NC}"
echo -e "Features: ${YELLOW}$FEATURES${NC}"
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

# Initialize atomic installation with rollback capability
echo "Initializing secure installation process..."

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
        
        # Handle memory architecture - install memory to ~/.claude/ with absolute paths
        if [[ -d "core/$TOOL/memory" ]]; then
            echo "  Installing modular memory architecture..."
            
            # Install memory files directly to ~/.claude/ (user-level)
            echo "  Installing memory files to $INSTALL_DIR/memory/..."
            mkdir -p "$INSTALL_DIR/memory"
            cp -r "core/$TOOL/memory/"* "$INSTALL_DIR/memory/"
            
            # Generate CLAUDE.md with absolute paths to memory files
            echo "  Generating CLAUDE.md with absolute import paths..."
            generate_claude_md_with_absolute_paths
            
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
    if [[ -d "core/$TOOL/commands" ]]; then
        echo "Installing command system..."
        
        # For Claude Code, install user commands to ~/.claude/commands
        if [[ "$TOOL" == "claude-code" ]]; then
            USER_COMMANDS_DIR="$HOME/.claude/commands"
            echo "  Installing user commands to $USER_COMMANDS_DIR..."
            echo "  (Accessible via /user:command-name)"
            mkdir -p "$USER_COMMANDS_DIR"
            if ! cp -r "core/$TOOL/commands/"* "$USER_COMMANDS_DIR/" 2>/dev/null; then
                echo -e "${YELLOW}Warning: Failed to install some user commands to $USER_COMMANDS_DIR${NC}"
                echo "Check permissions and retry if needed"
            fi
            
            # Also copy to memory for reference
            mkdir -p "$INSTALL_DIR/memory/commands"
            if ! cp -r "core/$TOOL/commands/"* "$INSTALL_DIR/memory/commands/" 2>/dev/null; then
                echo -e "${YELLOW}Warning: Failed to copy commands to memory directory${NC}"
            fi
        else
            # For other tools, install to tool-specific directory
            mkdir -p "$INSTALL_DIR/commands"
            if ! cp -r "core/$TOOL/commands/"* "$INSTALL_DIR/commands/" 2>/dev/null; then
                echo -e "${YELLOW}Warning: Failed to install commands to $INSTALL_DIR/commands${NC}"
                echo "Installation may be incomplete"
            fi
        fi
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

# Create rollback state for potential failure
create_rollback_state

# Comprehensive verification function
verify_installation() {
    local verification_failed=false
    local issues=()
    
    # Check core files exist and are readable
    if [[ ! -f "$INSTALL_DIR/CLAUDE.md" ]]; then
        issues+=("Missing main CLAUDE.md configuration file")
        verification_failed=true
    elif [[ ! -r "$INSTALL_DIR/CLAUDE.md" ]]; then
        issues+=("CLAUDE.md exists but is not readable")
        verification_failed=true
    fi
    
    # Check modular memory structure
    if [[ -d "$INSTALL_DIR/memory" ]]; then
        local memory_dirs=("core" "personas" "rules")
        for dir in "${memory_dirs[@]}"; do
            if [[ ! -d "$INSTALL_DIR/memory/$dir" ]]; then
                issues+=("Missing memory module: $dir")
                verification_failed=true
            fi
        done
        
        # Validate import chain integrity
        if command -v grep >/dev/null 2>&1; then
            while IFS= read -r import_line; do
                import_file=$(echo "$import_line" | sed 's/@\.\/memory\///g')
                if [[ ! -f "$INSTALL_DIR/memory/$import_file" ]]; then
                    issues+=("Broken import: $import_file referenced but not found")
                    verification_failed=true
                fi
            done < <(grep "^@\.\/memory\/" "$INSTALL_DIR/CLAUDE.md" 2>/dev/null || true)
        fi
    fi
    
    # Verify command installation based on tool
    if [[ "$TOOL" == "claude-code" ]]; then
        local essential_commands=("analyze.md" "build.md" "troubleshoot.md")
        
        # Verify user commands
        if [[ ! -d "$HOME/.claude/commands" ]]; then
            issues+=("User commands directory not created at ~/.claude/commands")
            verification_failed=true
        else
            for cmd in "${essential_commands[@]}"; do
                if [[ ! -f "$HOME/.claude/commands/$cmd" ]]; then
                    issues+=("Missing essential user command: $cmd")
                    verification_failed=true
                fi
            done
        fi
    fi
    
    # Check file permissions
    if [[ ! -w "$INSTALL_DIR" ]]; then
        issues+=("Installation directory is not writable")
        verification_failed=true
    fi
    
    # Report results
    if [[ "$verification_failed" == true ]]; then
        echo -e "${RED}Installation verification failed:${NC}"
        printf "  - %s\n" "${issues[@]}"
        return 1
    else
        echo -e "${GREEN}✓ Installation verification passed${NC}"
        return 0
    fi
}

# Run verification
if verify_installation; then
    # Count files for summary
    main_files=$(find "$INSTALL_DIR" -maxdepth 1 -name "*.md" -type f 2>/dev/null | wc -l)
    command_files=0
    
    # Count commands based on tool and installation method
    if [[ "$TOOL" == "claude-code" ]] && [[ -d "$HOME/.claude/commands" ]]; then
        command_files=$(find "$HOME/.claude/commands" -name "*.md" -type f 2>/dev/null | wc -l)
    elif [[ -d "$INSTALL_DIR/commands" ]]; then
        command_files=$(find "$INSTALL_DIR/commands" -name "*.md" -type f 2>/dev/null | wc -l)
    fi
    
    echo -e "Main config files: ${GREEN}$main_files${NC}"
    if [[ $command_files -gt 0 ]]; then
        if [[ "$TOOL" == "claude-code" ]]; then
            echo -e "User commands: ${GREEN}$command_files${NC} (installed to ~/.claude/commands, use /user:name)"
        else
            echo -e "Command files: ${GREEN}$command_files${NC}"
        fi
    fi
else
    echo -e "${RED}Verification failed - executing rollback${NC}"
    execute_rollback
    exit 1
fi

# Clean up rollback state on successful installation
cleanup_rollback_state

# Installation success reporting
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
                echo "2. Try user commands: /user:analyze --code"
                echo "3. Switch persona: /persona:architect"
                echo "4. Commands available from ~/.claude/commands"
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