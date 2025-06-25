#!/bin/bash

# AI Compass Memory Validation Tool
# Validates memory import chains and architecture

set -e

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Default values
MEMORY_DIR="$HOME/.claude"
CHECK_IMPORTS=true
CHECK_DEPTH=true
MAX_DEPTH=5

# Function to show usage
show_usage() {
    echo -e "${BLUE}AI Compass Memory Validator${NC}"
    echo "==========================="
    echo ""
    echo "Usage: $0 [OPTIONS]"
    echo ""
    echo "Options:"
    echo "  --dir <directory>       Memory directory to validate (default: ~/.claude)"
    echo "  --no-imports            Skip import chain validation"
    echo "  --no-depth              Skip import depth checking"
    echo "  --max-depth <number>    Maximum import depth (default: 5)"
    echo "  -h, --help             Show this help"
    echo ""
    echo "Examples:"
    echo "  $0                      # Validate default memory directory"
    echo "  $0 --dir ./             # Validate current directory"
    echo "  $0 --max-depth 3        # Validate with max depth of 3"
}

# Parse command line arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        --dir)
            MEMORY_DIR="$2"
            shift 2
            ;;
        --no-imports)
            CHECK_IMPORTS=false
            shift
            ;;
        --no-depth)
            CHECK_DEPTH=false
            shift
            ;;
        --max-depth)
            MAX_DEPTH="$2"
            shift 2
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

echo -e "${BLUE}AI Compass Memory Validator${NC}"
echo "==========================="
echo -e "Memory Directory: ${YELLOW}$MEMORY_DIR${NC}"
echo -e "Max Import Depth: ${YELLOW}$MAX_DEPTH${NC}"
echo ""

# Check if memory directory exists
if [[ ! -d "$MEMORY_DIR" ]]; then
    echo -e "${RED}✗ Memory directory not found: $MEMORY_DIR${NC}"
    exit 1
fi

# Check for main CLAUDE.md file
if [[ ! -f "$MEMORY_DIR/CLAUDE.md" ]]; then
    echo -e "${RED}✗ Main CLAUDE.md file not found${NC}"
    exit 1
else
    echo -e "${GREEN}✓ Main CLAUDE.md file found${NC}"
fi

# Function to extract imports from a file
extract_imports() {
    local file="$1"
    if [[ -f "$file" ]]; then
        grep "^@" "$file" 2>/dev/null | sed 's/^@//' || true
    fi
}

# Function to resolve import path
resolve_import_path() {
    local import_path="$1"
    local base_dir="$2"
    
    # Handle relative paths
    if [[ "$import_path" =~ ^\.\/ ]]; then
        echo "$base_dir/${import_path#./}"
    elif [[ "$import_path" =~ ^~/ ]]; then
        echo "${import_path/#~/$HOME}"
    elif [[ "$import_path" =~ ^/ ]]; then
        echo "$import_path"
    else
        echo "$base_dir/$import_path"
    fi
}

# Function to validate import chain recursively
validate_imports() {
    local file="$1"
    local depth="$2"
    local visited="$3"
    
    # Check maximum depth
    if [[ $depth -gt $MAX_DEPTH ]]; then
        echo -e "${RED}✗ Import depth exceeds maximum ($MAX_DEPTH): $file${NC}"
        return 1
    fi
    
    # Check for circular imports
    if [[ "$visited" == *"|$file|"* ]]; then
        echo -e "${RED}✗ Circular import detected: $file${NC}"
        return 1
    fi
    
    # Add current file to visited list
    visited="$visited|$file|"
    
    # Extract imports from current file
    local imports
    imports=$(extract_imports "$file")
    
    if [[ -n "$imports" ]]; then
        while IFS= read -r import_path; do
            if [[ -n "$import_path" ]]; then
                local resolved_path
                resolved_path=$(resolve_import_path "$import_path" "$(dirname "$file")")
                
                # Check if imported file exists
                if [[ ! -f "$resolved_path" ]]; then
                    echo -e "${RED}✗ Import not found: $import_path (resolved: $resolved_path)${NC}"
                    return 1
                else
                    echo -e "${GREEN}✓ Import found: $import_path${NC}"
                    
                    # Recursively validate imports
                    if ! validate_imports "$resolved_path" $((depth + 1)) "$visited"; then
                        return 1
                    fi
                fi
            fi
        done <<< "$imports"
    fi
    
    return 0
}

# Validate import chains
if [[ "$CHECK_IMPORTS" = true ]]; then
    echo "Validating import chains..."
    
    if validate_imports "$MEMORY_DIR/CLAUDE.md" 0 ""; then
        echo -e "${GREEN}✓ All imports valid${NC}"
    else
        echo -e "${RED}✗ Import validation failed${NC}"
        exit 1
    fi
    echo ""
fi

# Check memory directory structure
echo "Checking memory structure..."

# Expected directories for modular architecture
if [[ -d "$MEMORY_DIR/memory" ]]; then
    echo -e "${GREEN}✓ Modular memory directory found${NC}"
    
    # Check core memory files
    expected_dirs=("core" "personas" "rules" "mcp" "commands")
    for dir in "${expected_dirs[@]}"; do
        if [[ -d "$MEMORY_DIR/memory/$dir" ]]; then
            echo -e "${GREEN}✓ Memory directory: $dir${NC}"
        else
            echo -e "${YELLOW}⚠ Optional memory directory missing: $dir${NC}"
        fi
    done
else
    echo -e "${YELLOW}⚠ Modular memory directory not found (using monolithic architecture)${NC}"
fi

# Check file sizes and complexity
echo ""
echo "Checking memory file metrics..."

main_file_size=$(wc -l < "$MEMORY_DIR/CLAUDE.md" 2>/dev/null || echo "0")
echo -e "Main CLAUDE.md size: ${YELLOW}$main_file_size lines${NC}"

if [[ $main_file_size -gt 100 ]]; then
    echo -e "${YELLOW}⚠ Large main file detected. Consider modular architecture for better maintainability${NC}"
fi

# Count total imports
total_imports=$(grep -r "^@" "$MEMORY_DIR" 2>/dev/null | wc -l || echo "0")
echo -e "Total imports: ${YELLOW}$total_imports${NC}"

# Validate no common issues
echo ""
echo "Checking for common issues..."

# Check for duplicate imports
duplicate_imports=$(grep -r "^@" "$MEMORY_DIR" 2>/dev/null | cut -d: -f2 | sort | uniq -d || true)
if [[ -n "$duplicate_imports" ]]; then
    echo -e "${YELLOW}⚠ Duplicate imports found:${NC}"
    echo "$duplicate_imports"
else
    echo -e "${GREEN}✓ No duplicate imports${NC}"
fi

# Check for broken relative paths
broken_paths=$(grep -r "^@\.\." "$MEMORY_DIR" 2>/dev/null || true)
if [[ -n "$broken_paths" ]]; then
    echo -e "${YELLOW}⚠ Potentially problematic relative paths found:${NC}"
    echo "$broken_paths"
else
    echo -e "${GREEN}✓ No problematic relative paths${NC}"
fi

echo ""
echo -e "${GREEN}✓ Memory validation completed successfully!${NC}"
echo ""
echo "Summary:"
echo "- Main file: $main_file_size lines"
echo "- Total imports: $total_imports"
echo "- Architecture: $([ -d "$MEMORY_DIR/memory" ] && echo "Modular" || echo "Monolithic")"