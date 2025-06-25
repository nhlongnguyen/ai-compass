# Getting Started with AI Compass

## Quick Installation

```bash
# Clone and install
git clone https://github.com/nhlongnguyen/ai-compass.git
cd ai-compass
./install.sh

# Verify installation
./tools/validate-install.sh
```

## First Steps

### 1. Test Basic Functionality
```bash
# Analyze your current project
/user:analyze --code

# Get help with commands
/user:load

# Try a persona
/persona:architect
```

### 2. Common Workflows

#### New React Project
```bash
# Switch to frontend mindset
/persona:frontend

# Initialize React project with AI assistance
/user:build --react --magic --tdd

# Set up development environment
/user:dev-setup

# Run tests continuously
/user:test --e2e --watch
```

#### Debugging Production Issues
```bash
# Switch to analytical mindset
/persona:analyzer

# Investigate systematically
/user:troubleshoot --investigate --prod --five-whys

# Get performance insights
/user:analyze --profile --bottlenecks

# Switch to performance expert
/persona:performance

# Optimize based on findings
/user:improve --perf --iterate
```

#### Security Review
```bash
# Switch to security mindset
/persona:security

# Comprehensive security scan
/user:scan --security --strict

# Analyze threats
/user:analyze --security --threats

# Generate security documentation
/user:document --security --compliance
```

## Understanding Confidence Levels

AI Compass adapts its behavior based on confidence levels:

### High Confidence (≥90%) - Direct Action
```
User: "Add error handling to this Express route"
AI: [Analyzes code, recognizes patterns, confidence: 92%]
"I'll add comprehensive error handling using Express best practices..."
[Implements solution directly with clear documentation]
```

### Medium Confidence (70-89%) - Collaborative
```
User: "Optimize this database query for better performance"
AI: [Reviews query, identifies issues, confidence: 78%]
"I can see several optimization opportunities. The query could benefit from:
1. Adding an index on user_id column
2. Restructuring the JOIN operation
Which approach aligns better with your data patterns and performance requirements?"
```

### Low Confidence (<70%) - Research First
```
User: "Implement OAuth2 with Okta's latest API"
AI: [Unfamiliar with latest Okta specs, confidence: 65%]
"I want to ensure I implement this correctly with Okta's current specifications. Let me research their latest OAuth2 documentation and implementation guidelines first, then return with a tailored approach that follows their best practices."
```

## Power Commands Overview

### Analysis Commands
- `/user:analyze --code --security` - Multi-dimensional analysis
- `/user:troubleshoot --investigate --prod` - Production debugging
- `/user:explain --depth Expert --visual` - In-depth explanations

### Development Commands  
- `/user:build --react --magic --tdd` - AI-assisted React development
- `/user:test --e2e --coverage --watch` - Comprehensive testing
- `/user:dev-setup` - Environment initialization

### Optimization Commands
- `/user:improve --quality --solid --metrics` - Code quality improvement
- `/user:cleanup --code --deps --git` - Project maintenance
- `/user:scan --security --strict` - Security validation

### Workflow Commands
- `/user:git --commit --plan` - Smart Git operations
- `/user:deploy --env staging --plan` - Safe deployment
- `/user:design --api --ddd` - Architecture design

## Persona System

Switch AI thinking modes instantly:

```bash
/persona:architect    # Systems design thinking
/persona:frontend     # UX-focused development  
/persona:backend      # Performance & reliability
/persona:security     # Threat modeling
/persona:analyzer     # Root cause analysis
/persona:performance  # Speed optimization
/persona:qa          # Quality assurance
/persona:refactorer  # Code health
/persona:mentor      # Teaching & explanation
```

### Persona Collaboration
```bash
# Design review chain
/persona:architect
/user:design --api --ddd

/persona:security  
/user:analyze --security --threats

/persona:performance
/user:analyze --perf --scalability

/persona:qa
/user:test --integration --coverage
```

## Advanced Features

### Thinking Modes
Control analysis depth:
```bash
# Natural language
"think about this architecture"     # Standard analysis
"think hard about this design"      # Deep system analysis  
"ultrathink this security model"    # Comprehensive analysis

# Flag-based
/user:design --api --think-hard     # Architecture-level depth
/user:troubleshoot --ultrathink     # Critical problem solving
```

### Token Optimization
Reduce output by 70% while preserving information:
```bash
/user:explain --uc                  # UltraCompressed explanation
/user:document --api --uc           # Compressed documentation
```

### MCP Tool Control
```bash
--c7      # Force documentation lookup
--seq     # Force step-by-step analysis
--magic   # Force UI generation
--pup     # Force browser testing
--no-mcp  # Use only native tools
```

## Project Organization

AI Compass organizes documentation automatically:

```
your-project/
├── docs/                    # User-facing documentation
│   ├── api/                # API documentation
│   ├── architecture/       # System design
│   └── guides/            # User guides
└── .claudedocs/           # AI working notes
    ├── reports/           # Analysis reports
    ├── metrics/          # Performance data
    └── context/          # Session context
```

## Best Practices

### Start Each Session
```bash
/user:load                  # Load project context
/user:analyze --code        # Understand current state
```

### For New Features
```bash
/persona:architect          # System design thinking
/user:design --feature      # Plan the feature
/user:estimate             # Estimate complexity
/persona:frontend          # Switch to implementation
/user:build --tdd          # Build with tests
```

### For Bug Fixes
```bash
/persona:analyzer          # Debugging mindset
/user:troubleshoot --investigate
/user:test --coverage      # Ensure fix is tested
```

### For Performance Issues
```bash
/persona:performance       # Speed-focused thinking  
/user:analyze --profile    # Find bottlenecks
/user:improve --perf       # Optimize systematically
/user:monitor --metrics    # Track improvements
```

## Common Patterns

### Evidence-Based Development
AI Compass enforces evidence-based claims:
- ❌ "This is faster" → ✅ "Benchmarks show 40% improvement"
- ❌ "This is more secure" → ✅ "Security scan confirms no vulnerabilities"
- ❌ "This is better" → ✅ "Code analysis indicates 15% complexity reduction"

### Confidence-Driven Workflows
- High confidence: Direct implementation with validation
- Medium confidence: Collaborative planning and validation
- Low confidence: Research first, then collaborative implementation

### Quality Gates
- Pre-development: Requirements clarification, threat modeling
- During development: Continuous testing, security scanning  
- Pre-deployment: Comprehensive validation, performance testing

## Getting Help

### Installation Issues
```bash
# Validate installation
./tools/validate-install.sh

# Reinstall if needed
./install.sh --force

# Custom installation
./install.sh --dir /custom/path
```

### Command Reference
```bash
/user:load                  # See all available commands
```

### Configuration
- Main config: `~/.claude/CLAUDE.md`
- Rules: `~/.claude/RULES.md`
- Personas: `~/.claude/PERSONAS.md`
- Commands: `~/.claude/commands/`

## Next Steps

1. **Explore Commands**: Try different `/user:` commands with your projects
2. **Try Personas**: Experiment with different cognitive modes
3. **Use Advanced Features**: Test thinking modes and token optimization
4. **Customize**: Modify configuration files to match your preferences
5. **Share Feedback**: Contribute to the community with your experiences