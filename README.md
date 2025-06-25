# AI Compass: Universal System Rules for AI Coding Tools

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Version](https://img.shields.io/badge/version-1.0.0-blue.svg)](https://github.com/nhlongnguyen/ai-compass)

**A comprehensive framework that transforms any AI coding tool into your specialized development partner through intelligent rule composition, evidence-based standards, and adaptive collaboration patterns.**

## 🎯 The Vision

AI coding tools are powerful, but they lack consistency, context awareness, and systematic approaches to complex development workflows. AI Compass solves this by providing:

- **Universal Compatibility**: Works with Claude Code, Cursor, Continue, Aider, and other AI coding tools
- **Intelligent Collaboration**: Confidence-based interaction patterns that know when to engage humans
- **Evidence-Based Standards**: No "better/faster" claims without measurable proof
- **Cognitive Specialization**: 9+ expert personas for different problem domains
- **Token Optimization**: 70% reduction in verbose outputs while maintaining clarity
- **Systematic Workflows**: 18+ power commands for real development tasks

## 🚀 Quick Start

### Installation

```bash
# Clone the repository
git clone https://github.com/nhlongnguyen/ai-compass.git
cd ai-compass

# Install for Claude Code with modular architecture (default)
./install.sh

# Install with different memory options
./install.sh --modular              # Import-based modular (default)
./install.sh --project-memory       # Team-shared project memory
./install.sh --user-memory          # Personal cross-project memory

# Install for other tools
./install.sh --tool cursor --modular
./install.sh --tool continue --features core
./install.sh --universal --dir ~/ai-rules/
```

### First Steps

1. **Test Basic Functionality**
   ```bash
   /user:analyze --code    # Analyze current project
   /persona:architect      # Switch to systems thinking mode
   ```

2. **Try Power Commands**
   ```bash
   /user:build --react --magic     # Build React app with AI components
   /user:troubleshoot --investigate # Debug issues systematically
   /user:improve --perf --iterate   # Optimize performance iteratively
   ```

3. **Initialize Project Memory** (for team collaboration)
   ```bash
   # Create project-specific memory for your team
   ./install.sh --project-memory
   
   # Use Claude Code's native memory commands
   /init                    # Bootstrap project memory
   /memory                  # Edit comprehensive memory
   # Quick memory addition  # Add specific rules on the fly
   ```

4. **Enable Advanced Features**
   ```bash
   /user:explain --ultracompressed  # 70% token reduction
   /user:design --api --think-hard  # Deep architectural analysis
   ```

## 🧠 Core Philosophy

### Evidence-Based Development
- **Prohibited**: Claims like "better", "faster", "secure" without proof
- **Required**: Metrics, benchmarks, test results, documentation references
- **Standard**: "Testing shows 40% improvement" vs "This is faster"

### Confidence-Driven Collaboration
- **≥90% Confidence**: Proceed independently with clear communication
- **70-89% Confidence**: Seek clarification proactively 
- **<70% Confidence**: Require human collaboration before proceeding
- **Special Cases**: High-impact decisions always involve humans regardless of confidence

### Token Economy Optimization
- **UltraCompressed Mode**: 70% reduction while preserving information
- **Smart Defaults**: Concise responses unless detail requested
- **Symbol Systems**: →|&:» replace verbose connectors
- **Structured Output**: YAML > prose, bullets > paragraphs

## 🎭 Persona System

Switch AI thinking modes instantly for specialized problem-solving:

| Persona | Core Belief | Best For | Activation |
|---------|-------------|----------|------------|
| **architect** | Systems evolve, design for change | Large-scale design, scalability planning | `/persona:architect` |
| **frontend** | UX determines product success | User interfaces, interaction design | `/persona:frontend` |
| **backend** | Reliability enables everything else | APIs, performance, data architecture | `/persona:backend` |
| **security** | Threats exist everywhere | Threat modeling, vulnerability analysis | `/persona:security` |
| **analyzer** | Every symptom has multiple causes | Debugging, root cause analysis | `/persona:analyzer` |
| **performance** | Speed is a feature | Optimization, profiling, bottlenecks | `/persona:performance` |
| **qa** | Quality cannot be tested in | Testing strategies, quality assurance | `/persona:qa` |
| **refactorer** | Code debt compounds exponentially | Code cleanup, maintainability | `/persona:refactorer` |
| **mentor** | Understanding grows through discovery | Teaching, documentation, explanations | `/persona:mentor` |

### Persona Collaboration Patterns
```bash
# Design Review Chain
/persona:architect → /persona:security → /persona:performance → /persona:qa

# Feature Development
/persona:architect → /persona:frontend → /persona:backend → /persona:qa

# Problem Solving  
/persona:analyzer → /persona:refactorer → /persona:performance
```

## ⚡ Power Commands

### Analysis & Debugging
```bash
/user:analyze --code --security --think        # Multi-dimensional analysis
/user:troubleshoot --investigate --prod        # Production issue debugging
/user:explain --depth Expert --visual          # In-depth explanations
```

### Development & Building
```bash
/user:build --react --magic --tdd              # AI-assisted React development
/user:test --e2e --coverage --watch            # Comprehensive testing
/user:dev-setup                                # Environment initialization
```

### Optimization & Maintenance
```bash
/user:improve --quality --solid --metrics      # Code quality optimization
/user:cleanup --code --deps --git --dry-run    # Project maintenance
/user:scan --security --strict                 # Security validation
```

### Operations & Workflow
```bash
/user:git --commit --plan                      # Smart Git workflows
/user:deploy --env staging --plan              # Deployment management
/user:design --api --ddd                       # Architecture design
```

### Universal Flags
```bash
--think / --think-hard / --ultrathink          # Analysis depth control
--c7 / --seq / --magic / --pup                # MCP tool control
--plan / --watch / --interactive               # Execution modes
--uc / --ultracompressed                      # Token optimization
```

## 🛠️ Advanced Features

### MCP Tool Orchestration
AI Compass intelligently orchestrates advanced tooling:

- **Context7**: Automatic documentation lookup for external libraries
- **Sequential**: Step-by-step reasoning for complex problems  
- **Magic**: AI-generated UI components matching your style
- **Puppeteer**: Real browser testing and validation

```bash
# Force specific tools
/user:build --react --magic --c7       # UI generation + docs lookup
/user:analyze --perf --seq --pup       # Performance analysis + browser testing

# Auto-detection based on context
"React forms best practices"           # → Context7 docs lookup
"Why is my app slow?"                  # → Sequential analysis
"Create a dashboard component"         # → Magic UI generation
```

### Thinking Modes
Control analysis depth for different problem complexities:

```bash
# Natural language activation
"think about this performance issue"           # Standard analysis
"think hard about this architecture"          # Deep system design
"ultrathink this security model"             # Comprehensive analysis

# Flag-based activation  
/user:design --api --think-hard               # Architecture-level depth
/user:troubleshoot --fix --ultrathink         # Critical problem solving
```

### Smart Context Management
```bash
# Session-level context preservation
Problem: [brief description]
Requirements: [key requirements] 
Decisions: [decisions with rationale]
Status: [completed/remaining/blockers]

# Project documentation organization
/docs/                    # User-facing documentation
├── api/                 # API documentation
├── architecture/        # System design docs
└── guides/             # User guides

/.claudedocs/            # AI working notes
├── reports/            # Analysis reports
├── metrics/            # Performance metrics
└── context/           # Session context
```

## 🏗️ Architecture

### Memory System (Claude Code)

AI Compass leverages Claude Code's native memory system:

#### Modular Architecture
```
~/.claude/                      # User-level memory
├── CLAUDE.md                  # Main import file (~20 lines)
└── memory/                    # Modular components
    ├── core/
    │   ├── philosophy.md
    │   ├── confidence-system.md
    │   └── token-economy.md
    ├── personas/personas-integration.md
    ├── rules/engineering-standards.md
    ├── mcp/tool-orchestration.md
    └── commands/power-commands.md

./CLAUDE.md                    # Project-level memory (team-shared)
```


### Repository Structure
```
ai-compass/
├── README.md                  # This file
├── install.sh                 # Universal installer with memory options
├── core/                     # Core framework files
│   ├── claude-code/          # Claude Code specific
│   │   ├── CLAUDE.md        # Modular import-based config
│   │   └── memory/          # Modular memory components
│   │       ├── core/        # Core philosophy & systems
│   │       ├── personas/    # Persona integration
│   │       ├── rules/       # Engineering standards
│   │       ├── mcp/         # Tool orchestration
│   │       └── commands/    # Power commands
│   ├── universal/           # Multi-tool compatibility
│   └── commands/           # Command system documentation
├── templates/              # Project templates & memory templates
│   └── project-memories/   # Project-specific memory templates
├── tools/                 # Maintenance & validation scripts
└── docs/                  # Documentation & examples
```

### Design Principles

1. **Memory-Efficient**: Modular import system optimizes memory usage
2. **Native Integration**: Leverages Claude Code's built-in memory discovery and import system
3. **Dual Hierarchy**: Separate user-level and project-level memory for team collaboration
4. **Progressive Disclosure**: Basic → Advanced → Expert feature progression  
5. **Evidence-Based**: All claims backed by measurable data
6. **Token Conscious**: Optimize for clarity while minimizing token usage
7. **Context Aware**: Adapt behavior based on project type and current state
8. **Community Driven**: Extensible personas and commands

## 🔧 Tool Compatibility

### Primary Support (Full Feature Set)
- **Claude Code**: Complete integration with all features
- **Cursor**: Power commands and persona system
- **Continue**: Basic rule integration

### Universal Support (Core Rules)
- **Aider**: Collaboration patterns and evidence-based standards
- **Cody**: Basic confidence-driven interaction
- **Any AI Tool**: Universal collaboration rules

### Installation Examples
```bash
# Claude Code with modular memory (recommended)
./install.sh --modular

# Claude Code with project-specific memory for teams
./install.sh --project-memory


# Cursor with modular architecture
./install.sh --tool cursor --modular --features commands,personas

# Universal installation for any AI tool
./install.sh --universal --dir ~/.ai-rules/

# Custom installation with backup
./install.sh --dir /opt/ai-tools/ --backup-dir ~/backups/
```

## 📊 Comparison with Other Frameworks

| Feature | AI Compass | SuperClaude | AI-Framework |
|---------|------------|-------------|--------------|
| **Multi-Tool Support** | ✅ Universal | ❌ Claude only | ✅ Universal |
| **Evidence Standards** | ✅ Enforced | ✅ Enforced | ❌ Not specified |
| **Token Optimization** | ✅ 70% reduction | ✅ 70% reduction | ❌ Standard |
| **Persona System** | ✅ 9+ personas | ✅ 9 personas | ❌ None |
| **Power Commands** | ✅ 18+ commands | ✅ 18 commands | ❌ None |
| **Confidence System** | ✅ Integrated | ❌ None | ✅ Core feature |
| **MCP Integration** | ✅ Full support | ✅ Full support | ❌ None |
| **Memory Architecture** | ✅ Modular imports | ❌ Monolithic | ❌ Single file |
| **Team Collaboration** | ✅ Project + User memory | ❌ User only | ❌ User only |
| **Installation** | ✅ Universal installer | ✅ Claude installer | ✅ Simple sync |

## 🤝 Contributing

AI Compass is community-driven. We welcome:

### New Personas
Create specialized thinking modes for your domain:
- **devops**: Infrastructure and deployment thinking
- **mobile**: Mobile-first development patterns  
- **data**: Data engineering and analytics mindset
- **ux**: User experience and design systems

### Power Commands
Add workflows that solve daily development pain points:
- `/user:migrate`: Database and code migration workflows
- `/user:monitor`: Application monitoring and alerting
- `/user:scale`: Performance and scalability optimization

### Integration Patterns
Support for additional AI coding tools:
- VS Code extensions integration
- JetBrains IDE plugins
- Terminal-based AI tools
- Custom AI assistants

## 📈 Roadmap

### v1.1 - Enhanced Integration
- VS Code extension for seamless activation
- Git hooks for automatic context preservation
- Project template marketplace

### v1.2 - Advanced Analytics  
- Usage analytics dashboard (privacy-first)
- Performance metrics tracking
- Optimization recommendations

### v1.3 - Team Collaboration
- Shared configuration management
- Team persona libraries
- Collaborative context preservation

### v2.0 - AI-Native Features
- Self-optimizing rule parameters
- Automatic persona selection based on context
- Predictive workflow suggestions

## 🛟 Support & Community

### Getting Help
- **Installation Issues**: Run `./install.sh --help` for options
- **Command Reference**: Check `docs/commands/` after installation
- **Configuration**: See `docs/configuration/` for customization
- **Troubleshooting**: Visit [Issues](https://github.com/nhlongnguyen/ai-compass/issues)

### Community Resources
- [Discussions](https://github.com/nhlongnguyen/ai-compass/discussions) - General questions and ideas
- [Wiki](https://github.com/nhlongnguyen/ai-compass/wiki) - Community knowledge base
- [Examples](https://github.com/nhlongnguyen/ai-compass-examples) - Real-world usage patterns

### Contributing Guide
See [CONTRIBUTING.md](CONTRIBUTING.md) for:
- Code of conduct and community guidelines
- Development setup and testing procedures  
- Persona creation guidelines
- Command development patterns

## 📄 License

AI Compass is released under the [MIT License](LICENSE). This means you can:
- ✅ Use commercially and personally
- ✅ Modify and distribute  
- ✅ Create derivative works
- ✅ Private use without attribution requirements

## 🎉 Acknowledgments

AI Compass builds upon excellent work from:
- **SuperClaude**: Token optimization and command system inspiration
- **AI-Framework**: Confidence-based collaboration patterns
- **Claude Code Team**: Robust foundation for AI-assisted development
- **Open Source Community**: Continuous feedback and contributions

---

**Ready to transform your AI coding experience?**

```bash
git clone https://github.com/nhlongnguyen/ai-compass.git
cd ai-compass
./install.sh
```

*AI Compass v1.0.0 - Because intelligent assistance requires intelligent rules.*

[⭐ Star on GitHub](https://github.com/nhlongnguyen/ai-compass) | [💬 Join Discussion](https://github.com/nhlongnguyen/ai-compass/discussions) | [🐛 Report Issue](https://github.com/nhlongnguyen/ai-compass/issues)