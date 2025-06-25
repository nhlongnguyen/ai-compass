# AI Compass Customization Guide

## Configuration Files Overview

AI Compass uses several configuration files that can be customized:

```
~/.claude/                          # User-level installation
├── CLAUDE.md                       # Main config with imports
├── memory/                         # Modular memory components
│   ├── core/                      # Core philosophy & systems
│   │   ├── philosophy.md
│   │   ├── confidence-system.md
│   │   ├── token-economy.md
│   │   └── context-management.md
│   ├── personas/
│   │   └── personas-integration.md # All persona definitions
│   ├── rules/
│   │   └── engineering-standards.md # All engineering rules
│   ├── mcp/
│   │   └── tool-orchestration.md  # MCP integration rules
│   └── commands/
│       └── power-commands.md      # Command behavioral patterns
└── commands/                      # User commands (/user:command)
    ├── analyze.md
    ├── build.md
    ├── troubleshoot.md
    └── shared/                   # Shared command resources
```

## Core Configuration

### Modular Memory System
AI Compass now uses a modular import-based architecture. The main `CLAUDE.md` file imports specialized modules:

```markdown
# CLAUDE.md structure
@./memory/core/philosophy.md           # Core collaboration principles
@./memory/core/confidence-system.md    # Confidence-driven interaction
@./memory/core/token-economy.md        # Token optimization rules
@./memory/personas/personas-integration.md  # All persona definitions
@./memory/rules/engineering-standards.md   # Development standards
@./memory/mcp/tool-orchestration.md        # MCP tool integration
```

### Customizing Individual Modules
Edit specific modules in `~/.claude/memory/` to customize behavior:

#### Confidence System (`memory/core/confidence-system.md`)
Adjust confidence levels for different interaction patterns:

```yaml
# Default values
Confidence_≥90%: Independent execution
Confidence_70-89%: Collaborative validation  
Confidence_<70%: Human partnership required

# Customization example
Confidence_≥85%: Independent execution    # More conservative
Confidence_65-84%: Collaborative validation # Wider collaboration zone
Confidence_<65%: Human partnership required # Lower threshold
```

#### Token Economy (`memory/core/token-economy.md`)
Customize output verbosity and optimization:

```yaml
# Default settings
UltraCompressed_Activation: 
  - "--uc flag"
  - "context usage > 70%"
  - "natural language request"

Token_Reduction_Target: 70%

# Customization
UltraCompressed_Activation:
  - "--uc flag"
  - "context usage > 50%"    # Activate earlier
  - "natural language request"

Token_Reduction_Target: 80%    # More aggressive compression
```

#### Symbol System (`memory/core/token-economy.md`)
Customize symbols and abbreviations in the token economy module:

```yaml
# Add domain-specific symbols
Custom_Symbols:
  "⚡": "performance critical"
  "🔒": "security sensitive"  
  "🔄": "needs refactoring"
  "📊": "requires metrics"

# Add project-specific abbreviations
Custom_Abbreviations:
  "DB": "database"
  "API": "application programming interface"
  "FE": "frontend"
  "BE": "backend"
```

## Engineering Standards (`memory/rules/engineering-standards.md`)

All engineering rules and standards are consolidated in a single modular file.

### Severity Levels
Adjust severity thresholds in the engineering standards module:

```yaml
# Default severity mapping
CRITICAL [10]: Security violations, operational safety
HIGH [7-9]: Quality & architecture, security & production  
MEDIUM [4-6]: Code organization, development practices
LOW [1-3]: Documentation, code quality enhancements

# Customization example - stricter quality standards
CRITICAL [10]: Security violations, operational safety, performance
HIGH [6-9]: Quality & architecture, code standards, testing
MEDIUM [3-5]: Documentation, formatting, organization
LOW [1-2]: Minor enhancements, stylistic improvements
```

### Evidence Requirements
Customize evidence standards for your team:

```yaml
# Default requirements
Performance_Claims: "testing confirms|metrics show|benchmarks prove"
Security_Assertions: "scans indicate|audits reveal|analysis demonstrates"

# Customization - stricter evidence
Performance_Claims: "load testing confirms|production metrics show|benchmark suite proves"
Security_Assertions: "penetration testing confirms|security audit reveals|static analysis demonstrates"
```

### Tool Integration
Customize tool selection priorities:

```yaml
# Default priority
Tool_Selection_Priority:
  1. Native tools for basic operations
  2. MCP tools for specialized tasks
  3. Batch operations for parallel processing

# Customization - MCP preference
Tool_Selection_Priority:
  1. MCP tools for enhanced capabilities
  2. Native tools for simple operations  
  3. Hybrid approaches for complex tasks
```

## Persona System (`memory/personas/personas-integration.md`)

All persona definitions and integration logic are in a single modular file.

### Custom Personas
Add domain-specific cognitive modes to the personas integration module:

```yaml
# Example: DevOps persona
devops:
  Core_Belief: "Infrastructure as code, automate everything"
  Primary_Question: "How will this scale and deploy?"
  Decision_Pattern: "Automation > manual processes"
  Risk_Tolerance: "Conservative on production, aggressive on tooling"
  Success_Metric: "Zero-downtime deployments, full automation"
  
  Confidence_Specialties:
    - "Infrastructure automation: +15%"
    - "Deployment strategies: +10%"
    - "Monitoring & alerting: +10%"
    - "Container orchestration: +10%"
  
  MCP_Tools: "Context7(infrastructure docs), Sequential(deployment planning)"
```

### Persona Confidence Adjustments
Customize confidence bonuses for your team's expertise:

```yaml
# Default bonuses
Domain_Expertise: +10% when operating within specialty
Cross_Domain: -5% when operating outside expertise
Collaboration: +5% when working with complementary personas

# Customization - team-specific adjustments
Domain_Expertise: +15% # Your team has deep specialization
Cross_Domain: -10%     # Stricter cross-domain penalties
Collaboration: +10%    # Strong collaboration culture
```

### Auto-Activation Rules
Customize when personas activate:

```yaml
# Default triggers
File_Triggers:
  "*.tsx|*.jsx" → frontend
  "*.test.*" → qa
  "*refactor*" → refactorer

# Add custom triggers
File_Triggers:
  "*.tsx|*.jsx|*.vue" → frontend
  "*.test.*|*.spec.*|*test*" → qa
  "*refactor*|*cleanup*|*improve*" → refactorer
  "Dockerfile|*.yml|*.yaml" → devops    # Custom devops trigger
  "*.sql|*migration*" → backend         # Database focus
```

## Command System

### Available Commands
AI Compass installs pre-built commands to `~/.claude/commands/`:
- `/user:analyze` - Multi-dimensional code analysis
- `/user:build` - AI-assisted development workflows  
- `/user:troubleshoot` - Systematic debugging
- `/user:improve` - Performance and quality optimization
- `/user:design` - Architecture and API design
- `/user:test` - Comprehensive testing strategies
- `/user:scan` - Security and quality validation

### Command Customization
Customize command behavior by editing files in `~/.claude/commands/`:

```yaml
# Example: Customizing the analyze command
# Edit ~/.claude/commands/analyze.md

# Add custom analysis types
Analysis_Types:
  --security: "Focus on security vulnerabilities"
  --performance: "Analyze performance bottlenecks"
  --architecture: "Review system architecture"
  --custom: "Project-specific analysis patterns"

# Customize confidence thresholds
Confidence_Adjustments:
  Security_Analysis: +10%  # Higher confidence for security
  Performance_Review: +5%  # Moderate boost for performance
  Architecture_Review: +15% # High confidence for architecture
```

### Command Aliases
Create shortcuts for frequently used commands:

```yaml
# Command aliases
Aliases:
  "/build": "/user:build --react --tdd"
  "/test": "/user:test --coverage --watch"
  "/scan": "/user:scan --security --quick"
  "/deploy": "/user:deploy --env staging --plan"
  "/fix": "/user:troubleshoot --investigate --fix"
```

## MCP Integration (MCP.md)

### Tool Selection Rules
Customize when different MCP servers activate:

```yaml
# Default triggers
Context7_Triggers:
  - "external library mentioned"
  - "documentation request"

# Customization - more aggressive documentation lookup
Context7_Triggers:
  - "external library mentioned"
  - "documentation request"
  - "framework question"
  - "API integration"
  - "any unfamiliar technology"    # More comprehensive
```

### Token Budget Management
Adjust MCP token usage limits:

```yaml
# Default budgets
Light_MCP: 100-500 tokens
Medium_MCP: 500-2K tokens  
Heavy_MCP: 2K-10K tokens

# Customization - higher limits for complex projects
Light_MCP: 200-750 tokens
Medium_MCP: 750-3K tokens
Heavy_MCP: 3K-15K tokens
```

## Team-Specific Customizations

### Frontend Team Configuration
```yaml
# Emphasize UI/UX considerations
Default_Persona: frontend
Auto_Activate_Magic: true
Token_Optimization: aggressive
Evidence_Requirements: "user testing shows|accessibility audit confirms"

Command_Shortcuts:
  "/component": "/user:build --react --magic"
  "/test-ui": "/user:test --e2e --pup"
  "/optimize": "/user:improve --perf --ux"
```

### Backend Team Configuration
```yaml
# Focus on performance and reliability
Default_Persona: backend
Auto_Performance_Analysis: true
Security_Scanning: mandatory
Evidence_Requirements: "load testing confirms|monitoring shows"

Command_Shortcuts:
  "/api": "/user:build --api --tdd"
  "/perf": "/user:analyze --profile --database"
  "/secure": "/user:scan --security --strict"
```

### Security Team Configuration
```yaml
# Maximum security focus
Default_Persona: security
Confidence_Threshold: 95  # Higher bar for security decisions
Auto_Threat_Modeling: true
Evidence_Requirements: "penetration testing|security audit|compliance scan"

Command_Shortcuts:
  "/audit": "/user:scan --security --comprehensive"
  "/threat": "/user:analyze --security --threats"
  "/comply": "/user:document --security --compliance"
```

## Environment Customization

### Development Environment
```yaml
# Relaxed standards for experimentation
Confidence_Thresholds:
  Independent: 80%
  Collaborative: 60%
  Partnership: <60%

Quality_Gates: standard
Token_Optimization: moderate
```

### Production Environment  
```yaml
# Strict standards for production
Confidence_Thresholds:
  Independent: 95%
  Collaborative: 85%
  Partnership: <85%

Quality_Gates: strict
Evidence_Requirements: comprehensive
Security_Scanning: mandatory
```

## Installation Customization

### Multi-Tool Setup
```bash
# Claude Code (full features)
./install.sh --tool claude-code

# Cursor (commands + personas)
./install.sh --tool cursor --features commands,personas

# Universal (collaboration only)
./install.sh --universal --dir ~/.ai-rules/
```

### Custom Directory Structure
```bash
# Team-specific installation
./install.sh --dir /team/ai-config/ --backup-dir /team/backups/

# Project-specific installation  
./install.sh --dir ./project-ai/ --features core,commands
```

## Validation & Testing

### Installation Validation
Validate your customized installation:

```bash
# Validate default installation
./tools/validate-install.sh

# Validate custom tool installation
./tools/validate-install.sh --tool cursor

# Validate custom directory
./tools/validate-install.sh --dir /custom/path
```

### Configuration Testing
```bash
# Test custom configuration
/user:analyze --code

# Test persona system
/persona:architect
/user:test --coverage
```

## Best Practices

### Configuration Management
- Version control your configuration files
- Use environment-specific configurations
- Document team-specific customizations
- Regular configuration reviews and updates

### Team Adoption
- Start with default configuration
- Gradually customize based on team needs
- Document changes and rationale
- Share successful patterns across teams

### Maintenance
- Regularly update configurations
- Monitor effectiveness of customizations
- Adjust confidence thresholds based on outcomes
- Keep evidence requirements aligned with team practices