#!/bin/bash

# AI Compass Memory Initialization Tool
# Initializes project-specific memory for team collaboration

set -e

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Default values
PROJECT_TYPE=""
FORCE_INIT=false
TEMPLATE_DIR="templates/project-memories"

# Function to show usage
show_usage() {
    echo -e "${BLUE}AI Compass Memory Initialization${NC}"
    echo "================================"
    echo ""
    echo "Usage: $0 [OPTIONS]"
    echo ""
    echo "Project Types:"
    echo "  --react                 Initialize React project memory"
    echo "  --api                   Initialize API project memory"
    echo "  --fullstack             Initialize full-stack project memory"
    echo "  --custom <template>     Use custom template file"
    echo ""
    echo "Options:"
    echo "  --force                 Overwrite existing CLAUDE.md"
    echo "  -h, --help             Show this help"
    echo ""
    echo "Examples:"
    echo "  $0 --react              # Initialize React project memory"
    echo "  $0 --api --force        # Force initialize API project memory"
    echo "  $0 --fullstack          # Initialize full-stack project memory"
}

# Parse command line arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        --react)
            PROJECT_TYPE="react"
            shift
            ;;
        --api)
            PROJECT_TYPE="api"
            shift
            ;;
        --fullstack)
            PROJECT_TYPE="fullstack"
            shift
            ;;
        --custom)
            PROJECT_TYPE="custom"
            CUSTOM_TEMPLATE="$2"
            shift 2
            ;;
        --force)
            FORCE_INIT=true
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

# Validate project type
if [[ -z "$PROJECT_TYPE" ]]; then
    echo -e "${RED}Error: Project type is required${NC}"
    show_usage
    exit 1
fi

echo -e "${BLUE}AI Compass Memory Initialization${NC}"
echo "================================"
echo -e "Project Type: ${YELLOW}$PROJECT_TYPE${NC}"
echo -e "Current Directory: ${YELLOW}$(pwd)${NC}"
echo ""

# Check if CLAUDE.md already exists
if [[ -f "./CLAUDE.md" ]] && [[ "$FORCE_INIT" != true ]]; then
    echo -e "${YELLOW}Warning: CLAUDE.md already exists in current directory${NC}"
    echo -n "Overwrite existing file? (y/n): "
    read -r overwrite_choice
    if [[ "$overwrite_choice" != "y" ]]; then
        echo "Initialization cancelled."
        exit 0
    fi
fi

# Determine template file
case "$PROJECT_TYPE" in
    "react")
        TEMPLATE_FILE="$TEMPLATE_DIR/react-project.md"
        ;;
    "api")
        TEMPLATE_FILE="$TEMPLATE_DIR/api-project.md"
        ;;
    "fullstack")
        TEMPLATE_FILE="$TEMPLATE_DIR/fullstack-project.md"
        ;;
    "custom")
        TEMPLATE_FILE="$CUSTOM_TEMPLATE"
        ;;
    *)
        echo -e "${RED}Error: Unknown project type '$PROJECT_TYPE'${NC}"
        exit 1
        ;;
esac

# Check if template file exists
if [[ ! -f "$TEMPLATE_FILE" ]]; then
    echo -e "${RED}Error: Template file not found: $TEMPLATE_FILE${NC}"
    exit 1
fi

# Copy template to current directory
echo "Initializing project memory..."
cp "$TEMPLATE_FILE" "./CLAUDE.md"

echo -e "${GREEN}✓ Project memory initialized successfully!${NC}"
echo ""
echo "Next steps:"
echo "1. Review and customize ./CLAUDE.md for your project"
echo "2. Commit CLAUDE.md to your repository for team sharing"
echo "3. Use Claude Code's native memory commands:"
echo "   - Use '#' for quick memory additions"
echo "   - Use '/memory' for comprehensive memory editing"
echo "   - Use '/init' to bootstrap additional memories"
echo ""
echo "Project team members can now benefit from shared AI collaboration rules!"