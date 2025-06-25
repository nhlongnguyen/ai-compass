# AI Compass Customization Guide

## Configuration Files Overview

AI Compass uses several configuration files that can be customized:

```
~/.claude/                          # Default installation
├── CLAUDE.md                       # Core behaviors & token optimization
├── RULES.md                        # Engineering standards & practices
├── PERSONAS.md                     # Specialized thinking modes  
├── MCP.md                         # Tool orchestration rules
├── commands/                      # Command system
│   ├── user-commands.md          # Power commands definition
│   ├── persona-commands.md       # Persona activation
│   └── shared/                   # Shared resources
└── collaboration-rules.md         # Universal collaboration patterns
```

## Core Configuration (CLAUDE.md)

### Confidence Thresholds
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

### Token Economy Settings
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

### Symbol System
Customize symbols and abbreviations:

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

## Engineering Standards (RULES.md)

### Severity Levels
Adjust severity thresholds for different practices:

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

## Persona System (PERSONAS.md)

### Custom Personas
Add domain-specific cognitive modes:

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

### Custom Commands
Add project-specific commands:

```yaml
# Example: Custom deployment command
/user:deploy-staging:
  Description: "Deploy to staging with full validation"
  Arguments:
    - "--validate: Full pre-deployment validation"
    - "--monitor: Enable post-deployment monitoring"
    - "--rollback: Prepare rollback procedures"
  
  Confidence_Integration:
    - "High confidence: Direct deployment with monitoring"
    - "Medium confidence: Deployment plan review required"
    - "Low confidence: Manual approval required"
  
  Workflow:
    1. "Run comprehensive test suite"
    2. "Validate staging environment"
    3. "Deploy with zero-downtime strategy"
    4. "Enable monitoring and alerting"
    5. "Verify deployment success"
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

### Custom Validation Rules
Create project-specific validation:

```bash
# Custom validation script
./tools/validate-install.sh --dir /custom/path --strict
```

### Configuration Testing
```bash
# Test custom configuration
/user:analyze --code --validate-config

# Test persona system
/persona:custom-persona
/user:test --custom-workflow
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