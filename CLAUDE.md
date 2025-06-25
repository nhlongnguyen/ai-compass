# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

AI Compass is a universal configuration framework that transforms Claude Code and other AI tools into specialized development partners. It provides:

- **Modular memory architecture** using import-based configuration
- **9 specialized personas** for domain-specific problem-solving
- **18+ power commands** for real development workflows
- **Evidence-based standards** with confidence-driven collaboration
- **Token optimization** achieving ~70% reduction while preserving clarity

## Core Development Commands

### Installation & Setup
```bash
# Default installation (Claude Code to ~/.claude/)
./install.sh

# Different tools and options
./install.sh --tool cursor
./install.sh --universal --dir ~/.ai-rules/
```

### Validation & Maintenance
```bash
# Validate memory structure and imports
./tools/memory-validate.sh

# Validate installation completeness (including commands)
./tools/validate-install.sh

# Initialize project memory
./tools/memory-init.sh
```

### Testing Commands
```bash
# Test installation with backup
./install.sh --force --backup-dir ~/test-backups/
./tools/memory-validate.sh --max-depth 3
```

## Architecture

### User-Level Memory System
The project uses Claude Code's native import capability to create maintainable, modular configurations:

```
~/.claude/                  # User-level installation
├── CLAUDE.md              # Main config
├── memory/               # Modular components
│   ├── core/            # Philosophy, confidence, token economy
│   ├── personas/        # Specialized thinking modes
│   ├── rules/           # Engineering standards
│   ├── mcp/            # Tool orchestration
│   └── commands/       # Power commands
└── commands/             # User commands (/user:command)
    ├── analyze.md
    ├── build.md
    └── ...
```

### Multi-Tool Compatibility
Universal installer supports different AI tools with appropriate feature subsets:
- **Claude Code**: Full feature set with MCP integration
- **Cursor**: Commands and personas
- **Continue**: Basic collaboration rules
- **Universal**: Core collaboration patterns

### Installation Architecture
- **User-level only** (`~/.claude/`): Personal configuration
- **Portable**: Configuration travels with user across projects
- **Modular**: Memory files organized by domain for maintainability

## Power Commands

AI Compass installs 18+ slash commands to `~/.claude/commands` for immediate use:

### Core Commands
- `/user:analyze` - Multi-dimensional code analysis
- `/user:build` - AI-assisted development workflows  
- `/user:troubleshoot` - Systematic debugging
- `/user:improve` - Performance and quality optimization
- `/user:design` - Architecture and API design
- `/user:test` - Comprehensive testing strategies
- `/user:scan` - Security and quality validation

### Command Features
- **Universal flags**: `--think`, `--magic`, `--c7`, `--uc` for enhanced functionality
- **MCP integration**: Automatic tool orchestration based on context
- **Persona activation**: Commands auto-activate appropriate cognitive modes

## Key Development Patterns

### Evidence-Based Configuration
All claims require supporting evidence:
- Performance: metrics, benchmarks, test results
- Security: scan results, audit reports
- Quality: coverage reports, code metrics
- No subjective terms like "better" or "faster" without proof

### Confidence-Driven Collaboration
- **≥90%**: Independent execution with validation
- **70-89%**: Collaborative validation required
- **<70%**: Human partnership required
- Confidence assessment based on complexity, familiarity, and risk

### Import Chain Validation
The memory system validates:
- Circular import prevention
- Maximum depth limits (default: 5)
- File existence verification
- Path resolution (relative/absolute)

## File Organization

### Core Framework (`/core/`)
Tool-specific configurations with shared universal patterns

### Templates (`/templates/`)
Project templates for rapid setup:
- Configuration examples for different project types
- Reusable patterns and workflows
- Customization guides

### Tools (`/tools/`)
Maintenance and validation scripts for memory management

### Documentation (`/docs/`)
Examples, configuration guides, and customization patterns

## Development Guidelines

- **Modular First**: Use import-based architecture for maintainability
- **Evidence Required**: All optimization claims need supporting data
- **Token Conscious**: Optimize for clarity while minimizing token usage
- **Universal Design**: Consider multi-tool compatibility in changes
- **Validation Always**: Run memory validation after structural changes

## Memory Management

Use Claude Code's native memory and command systems:
- `/init` - Bootstrap project-specific memory
- `/memory` - Edit comprehensive memory configuration
- `#` - Quick memory additions during development
- `/user:*` - Power commands for development workflows (installed to ~/.claude/commands)