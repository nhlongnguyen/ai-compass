# Memory Management with AI Compass

## Understanding Claude Code's Memory System

Claude Code uses a hierarchical memory discovery system that automatically loads configuration files. AI Compass leverages this system with both modular and monolithic approaches.

## Memory Hierarchy

### User-Level Memory (`~/.claude/CLAUDE.md`)
- **Purpose**: Personal preferences across all projects
- **Scope**: Global configuration for your development style
- **Team Sharing**: Private to your machine

### Project-Level Memory (`./CLAUDE.md`)
- **Purpose**: Team-shared project-specific rules
- **Scope**: Specific to current project/repository
- **Team Sharing**: Committed to version control for team consistency

## Architecture Comparison

### Modular Architecture (Recommended)

**Main file (`~/.claude/CLAUDE.md`):**
```markdown
# AI Compass - Claude Code Configuration

@./memory/core/philosophy.md
@./memory/core/confidence-system.md
@./memory/core/token-economy.md
@./memory/personas/personas-integration.md
@./memory/rules/engineering-standards.md
@./memory/mcp/tool-orchestration.md
@./memory/commands/power-commands.md
```

**Benefits:**
- 📦 **Memory Efficient**: ~20 line main file vs 365+ line monolithic
- 🔧 **Maintainable**: Focused, single-purpose files
- 👥 **Team Collaboration**: Easy to share specific components
- 🔄 **Updates**: Modify specific aspects without touching everything
- 📖 **Readable**: Clear separation of concerns

### Monolithic Architecture (Legacy)

**Single file (`~/.claude/CLAUDE.md`):**
```markdown
# CLAUDE.md - AI Compass Core Configuration

## Core Philosophy
[All content embedded in single file - 365+ lines]

## Confidence-Based Collaboration System
[All systems defined inline]
...
```

**When to use:**
- 🔄 **Backward Compatibility**: Existing setups that work well
- 🎯 **Simplicity**: Prefer single-file approach
- 📦 **Portability**: Easy to copy/share entire configuration

## Installation Examples

### Modular User Memory
```bash
# Install modular architecture for personal use
./install.sh --modular --user-memory

# Result: ~/.claude/CLAUDE.md with imports
```

### Project Team Memory
```bash
# Initialize project memory for team sharing
./install.sh --project-memory --modular

# Result: ./CLAUDE.md in current directory
# Commit this file to your repository
```

### Monolithic Personal Setup
```bash
# Install single-file configuration
./install.sh --monolithic --user-memory

# Result: ~/.claude/CLAUDE.md (single large file)
```

## Memory Management Workflows

### 1. Quick Memory Updates
Use Claude Code's built-in `#` shortcut:
```
# Add React-specific linting rules for this project
# → Automatically adds to appropriate memory file
```

### 2. Comprehensive Memory Editing
Use Claude Code's `/memory` command:
```
/memory
# → Opens memory editor for comprehensive changes
```

### 3. Project Initialization
Use AI Compass tools for project setup:
```bash
# Initialize React project memory
./tools/memory-init.sh --react

# Initialize API project memory  
./tools/memory-init.sh --api

# Initialize full-stack project memory
./tools/memory-init.sh --fullstack
```

### 4. Memory Validation
Validate your memory configuration:
```bash
# Validate memory imports and structure
./tools/memory-validate.sh

# Validate specific directory
./tools/memory-validate.sh --dir ./
```

## Import System Examples

### Relative Imports
```markdown
# Import from same directory
@./philosophy.md

# Import from subdirectory
@./core/confidence-system.md

# Import from parent directory
@../shared/patterns.md
```

### Absolute Imports
```markdown
# Import from home directory
@~/my-custom-rules.md

# Import from specific path
@/opt/team-config/standards.md
```

### Home Directory Imports
```markdown
# Import user-specific customizations
@~/.claude/my-personal-rules.md

# Import team-shared configurations
@~/.claude/team-shared/security-standards.md
```

## Team Collaboration Patterns

### Pattern 1: User + Project Memory
```bash
# 1. Install user-level memory for personal preferences
./install.sh --user-memory --modular

# 2. Initialize project memory for team rules
./tools/memory-init.sh --react

# 3. Commit project CLAUDE.md to repository
git add CLAUDE.md
git commit -m "Add AI Compass project memory for team"
```

**Result:**
- `~/.claude/CLAUDE.md` → Personal AI preferences
- `./CLAUDE.md` → Team-shared project rules
- Claude Code automatically loads both in hierarchical order

### Pattern 2: Team-Only Project Memory
```bash
# Initialize project-specific memory only
./install.sh --project-memory

# Customize for your project
/memory
```

**Result:**
- `./CLAUDE.md` → Team-shared project rules only
- No personal user-level memory

### Pattern 3: Hybrid Import System
```markdown
# Project CLAUDE.md that imports user preferences
@~/.claude/personal-preferences.md
@./memory/project-specific/react-rules.md
@./memory/project-specific/security-standards.md
```

## Memory File Organization

### Core Memory Structure
```
memory/
├── core/
│   ├── philosophy.md          # Fundamental principles
│   ├── confidence-system.md   # Confidence-based collaboration
│   ├── token-economy.md       # Communication optimization
│   └── context-management.md  # Session & context handling
├── personas/
│   └── personas-integration.md # Cognitive specialization
├── rules/
│   ├── engineering-standards.md # Development standards
│   └── quality-gates.md       # Quality assurance
├── mcp/
│   └── tool-orchestration.md  # MCP tool integration
└── commands/
    └── power-commands.md      # Command system integration
```

### Custom Memory Organization
```
memory/
├── project-specific/
│   ├── react-standards.md
│   ├── api-conventions.md
│   └── testing-strategy.md
├── team-preferences/
│   ├── code-style.md
│   └── review-process.md
└── integrations/
    ├── github-workflows.md
    └── deployment-rules.md
```

## Troubleshooting Memory Issues

### Common Issues

#### 1. Import Not Found
```
Error: Import not found: ./missing-file.md
```
**Solution:**
- Check file path spelling
- Ensure file exists in expected location
- Use absolute paths if relative paths fail

#### 2. Circular Import
```
Error: Circular import detected
```
**Solution:**
- Review import chains for loops
- Use validation tool: `./tools/memory-validate.sh`
- Restructure imports to avoid cycles

#### 3. Memory Not Loading
```
Claude Code not using new rules
```
**Solution:**
- Check file is named `CLAUDE.md` (case-sensitive)
- Verify directory permissions
- Restart Claude Code session
- Use validation tool to check structure

### Validation Commands
```bash
# Validate entire memory system
./tools/memory-validate.sh

# Check specific directory
./tools/memory-validate.sh --dir ~/.claude

# Validate with custom max depth
./tools/memory-validate.sh --max-depth 3

# Skip import validation
./tools/memory-validate.sh --no-imports
```

## Best Practices

### 1. Memory Organization
- ✅ Use descriptive file names
- ✅ Group related rules in same file
- ✅ Keep individual files focused and concise
- ✅ Document import dependencies

### 2. Team Collaboration
- ✅ Commit project CLAUDE.md to version control
- ✅ Document team-specific customizations
- ✅ Regular memory reviews and updates
- ✅ Use consistent naming conventions

### 3. Maintenance
- ✅ Regular validation with memory tools
- ✅ Remove unused imports and files
- ✅ Keep memory files current with project evolution
- ✅ Balance between user and project memory

### 4. Performance
- ✅ Avoid deep import chains (max 5 levels)
- ✅ Use modular architecture for large configurations
- ✅ Remove duplicate or redundant rules
- ✅ Regular cleanup of obsolete memory files

## Migration from Monolithic

### Step 1: Backup Current Configuration
```bash
# Backup existing configuration
cp ~/.claude/CLAUDE.md ~/.claude/CLAUDE-backup.md
```

### Step 2: Install Modular Architecture
```bash
# Install modular version
./install.sh --modular --update

# Validates migration
./tools/memory-validate.sh
```

### Step 3: Customize and Test
```bash
# Test new configuration
/user:analyze --code

# Make adjustments if needed
/memory
```

### Step 4: Team Migration
```bash
# Initialize project memory for team
./tools/memory-init.sh --react

# Share with team
git add CLAUDE.md
git commit -m "Migrate to modular AI Compass memory"
```