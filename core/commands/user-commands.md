# User Commands - AI Compass Power Commands

## Command Syntax
```
/user:<command> [arguments] [flags]
```

## Analysis & Debugging Commands

### `/user:analyze` - Multi-dimensional Analysis
Systematic code & system analysis with evidence-based insights.

**Arguments:**
- `--code` - Code quality & structure analysis
- `--arch` - Architecture & design pattern analysis  
- `--profile` - Performance profiling & bottlenecks
- `--security` - Security vulnerability assessment
- `--perf` - Performance analysis & optimization opportunities
- `--watch` - Continuous monitoring & analysis
- `--interactive` - Guided analysis with human interaction

**Confidence Integration:**
- ≥90%: Comprehensive analysis with actionable recommendations
- 70-89%: Analysis with clarifying questions for uncertain areas
- <70%: Collaborative analysis requiring human input

**Examples:**
```bash
/user:analyze --code --security --think        # Multi-dimensional analysis
/user:analyze --arch --interactive             # Guided architecture review
/user:analyze --perf --profile --watch         # Continuous performance monitoring
```

### `/user:troubleshoot` - Systematic Debugging
Root cause analysis & systematic problem resolution.

**Arguments:**
- `--investigate` - Systematic investigation of issues
- `--fix` - Complete bug identification & resolution
- `--five-whys` - Root cause analysis using five-whys methodology
- `--prod` - Production issue debugging (high severity)

**Confidence Integration:**
- High confidence: Direct debugging with systematic approach
- Medium confidence: Present investigation plan for validation
- Low confidence: Collaborative debugging session

**Examples:**
```bash
/user:troubleshoot --investigate --prod        # Production issue investigation
/user:troubleshoot --fix --five-whys           # Complete debugging with root cause
```

### `/user:explain` - Technical Explanations
Clear, evidence-based explanations adapted to audience.

**Arguments:**
- `--depth [ELI5|Beginner|Intermediate|Expert]` - Explanation depth
- `--visual` - Include diagrams & visual representations
- `--uc` - UltraCompressed format (~70% token reduction)

**Confidence Integration:**
- Explanation depth adjusted based on topic confidence
- Research protocols triggered for unfamiliar concepts
- Mentor persona auto-activated for complex explanations

**Examples:**
```bash
/user:explain --depth Expert --visual          # In-depth technical explanation
/user:explain --depth Beginner --uc            # Simplified, compressed explanation
```

## Development Commands

### `/user:build` - Project & Feature Development
Comprehensive development workflows with quality gates.

**Arguments:**
- `--react` - React application development
- `--api` - REST/GraphQL API development with documentation
- `--magic` - AI-assisted UI component generation
- `--init` - New project initialization
- `--feature` - Feature implementation workflow
- `--tdd` - Test-driven development approach
- `--watch` - Development with live reload

**Confidence Integration:**
- Technology selection based on project context analysis
- Research-first protocol for unfamiliar frameworks
- Quality gates enforced throughout development

**Examples:**
```bash
/user:build --react --magic --tdd              # AI-assisted React with TDD
/user:build --api --init --watch               # New API project with live development
```

### `/user:test` - Comprehensive Testing
Multi-layer testing strategies with automation.

**Arguments:**
- `--e2e` - End-to-end testing workflows
- `--integration` - Integration testing setup
- `--coverage` - Coverage analysis & reporting
- `--watch` - Continuous testing on changes
- `--interactive` - Interactive testing with real-time feedback

**Confidence Integration:**
- Test strategy adapted to codebase complexity
- QA persona auto-activation for comprehensive testing
- Coverage targets based on criticality assessment

**Examples:**
```bash
/user:test --e2e --coverage --watch            # Comprehensive continuous testing
/user:test --integration --interactive         # Interactive integration testing
```

### `/user:dev-setup` - Development Environment
Complete development environment initialization.

**Features:**
- Tool & dependency configuration
- Development workflow setup
- Quality gates & automation
- Project structure initialization

**Confidence Integration:**
- Environment setup based on project type detection
- Best practices applied with evidence-based rationale
- Persona-specific optimizations (frontend, backend, etc.)

## Improvement & Maintenance Commands

### `/user:improve` - Code & Performance Optimization
Systematic improvement with measurable outcomes.

**Arguments:**
- `--quality` - Code structure & maintainability
  - `--solid` - SOLID principles application
  - `--refactor` - Clean code refactoring
  - `--metrics` - Quality metrics analysis
- `--perf` - Performance optimization
- `--iterate` - Iterative improvement (85% threshold)
- `--watch` - Continuous improvement monitoring

**Confidence Integration:**
- Improvement strategies based on confidence in current state
- Evidence-based optimization with before/after metrics
- Risk assessment for refactoring operations

**Examples:**
```bash
/user:improve --quality --solid --metrics      # Code quality with metrics
/user:improve --perf --iterate                 # Iterative performance optimization
```

### `/user:cleanup` - Project Maintenance
Comprehensive project cleanup & maintenance.

**Arguments:**
- `--code` - Remove dead code, debug statements, comments
- `--files` - Clean build artifacts & temporary files
- `--deps` - Remove unused dependencies
- `--git` - Clean branches & commit history
- `--cfg` - Clean configuration files
- `--all` - Comprehensive cleanup
- `--dry-run` - Preview changes without execution

**Confidence Integration:**
- Risk assessment for cleanup operations
- Backup recommendations for significant changes
- Validation steps for critical cleanups

**Examples:**
```bash
/user:cleanup --code --deps --dry-run          # Preview code & dependency cleanup
/user:cleanup --all --git                      # Comprehensive project cleanup
```

### `/user:scan` - Security & Quality Validation
Proactive security & quality scanning.

**Arguments:**
- `--validate` - Pre-execution safety validation
- `--security` - Comprehensive security analysis
- `--quick` - Fast critical issue detection
- `--strict` - Zero-tolerance quality mode

**Confidence Integration:**
- Security persona auto-activation for security scans
- Risk-based scanning depth adjustment
- Immediate blocking for critical security issues

**Examples:**
```bash
/user:scan --security --strict                 # Comprehensive security audit
/user:scan --validate --quick                  # Fast pre-execution validation
```

## Operations Commands

### `/user:deploy` - Application Deployment
Safe, validated deployment workflows.

**Arguments:**
- `--env [dev|staging|prod]` - Target environment
- `--rollback` - Deployment rollback procedures
- `--plan` - Deployment plan preview

**Confidence Integration:**
- Environment-specific validation requirements
- Risk assessment based on deployment target
- Rollback planning for production deployments

**Examples:**
```bash
/user:deploy --env staging --plan              # Staging deployment with plan preview
/user:deploy --env prod --rollback             # Production deployment with rollback ready
```

### `/user:git` - Git Workflow Management
Intelligent Git operations with safety checks.

**Arguments:**
- `--status` - Repository status analysis
- `--commit` - Smart commit with message generation
- `--branch` - Branch management & strategy
- `--sync` - Fetch/pull/push operations
- `--merge` - Branch merging workflows
- `--stash` - Temporary change management
- `--history` - Commit history analysis
- `--checkpoint` - Create development checkpoint
- `--rollback` - Revert to checkpoint

**Confidence Integration:**
- Commit message generation based on change analysis
- Risk assessment for merge operations
- Checkpoint creation for risky operations

**Examples:**
```bash
/user:git --commit --plan                      # Smart commit with preview
/user:git --checkpoint --rollback              # Checkpoint creation & rollback
```

### `/user:migrate` - Database & Code Migration
Safe migration workflows with rollback capabilities.

**Features:**
- Schema change management
- Data migration workflows
- Code migration patterns
- Rollback procedure preparation

**Confidence Integration:**
- Migration risk assessment
- Rollback procedure validation
- Data integrity verification

## Design & Documentation Commands

### `/user:design` - Software Architecture
Comprehensive design & planning workflows.

**Arguments:**
- `--api` - REST/GraphQL API design
- `--ddd` - Domain-driven design approach
- `--prd` - Product requirements documentation

**Confidence Integration:**
- Architect persona auto-activation
- Design pattern validation against requirements
- Scalability & maintainability assessment

**Examples:**
```bash
/user:design --api --ddd                       # API design with domain-driven approach
/user:design --prd --interactive               # Interactive requirements gathering
```

### `/user:document` - Documentation Generation
Comprehensive, audience-appropriate documentation.

**Arguments:**
- `--api` - API documentation generation
- `--user` - User guide creation
- `--uc` - UltraCompressed documentation

**Confidence Integration:**
- Documentation depth based on topic complexity
- Audience-appropriate content generation
- Evidence-based documentation with examples

**Examples:**
```bash
/user:document --api --interactive             # Interactive API documentation
/user:document --user --uc                     # Compressed user documentation
```

### `/user:estimate` - Project Estimation
Evidence-based time & complexity estimation.

**Features:**
- Task complexity analysis
- Development time estimation
- Resource requirement assessment
- Risk factor identification

**Confidence Integration:**
- Estimation confidence levels provided
- Range estimates for uncertain components
- Regular re-estimation triggers

## Workflow Commands

### `/user:spawn` - Specialized Agent Creation
Create specialized agents for parallel execution.

**Arguments:**
- `--task "<description>"` - Define specific task
- Parallel execution capabilities
- Specialized expertise activation

**Features:**
- Frontend/Backend/DevOps/Data specialization
- Independent task execution
- Result aggregation & coordination

### `/user:load` - Project Context Loading
Intelligent project context initialization.

**Features:**
- Project configuration loading
- Context establishment & validation
- Dependency analysis & setup
- Development environment preparation

## Universal Flags

### Thinking Modes
Apply to any command for enhanced analysis depth:

- `--think` - Multi-component analysis (standard)
- `--think-hard` - Complex system analysis (architecture-level)
- `--ultrathink` - Critical/complete redesign (comprehensive)

### MCP Server Controls
Control external tool integration:

- `--c7` - Force Context7 documentation lookup
- `--seq` - Force Sequential step-by-step analysis
- `--magic` - Force Magic UI component generation
- `--pup` - Force Puppeteer browser testing
- `--all-mcp` - Enable all available MCP servers
- `--no-mcp` - Disable all MCP servers (native only)

### Planning & Documentation
Execution and output control:

- `--plan` - Show execution plan before implementation
- `--watch` - Continuous monitoring during execution
- `--interactive` - Step-by-step guidance with user input
- `--uc` / `--ultracompressed` - 70% token reduction output

## Usage Patterns & Best Practices

### Command Chaining
```bash
# Design → Build → Test → Deploy workflow
/user:design --api --ddd
/user:build --api --tdd
/user:test --integration --coverage
/user:deploy --env staging --plan
```

### Confidence-Driven Workflows
```bash
# High confidence: Direct execution
/user:build --react --magic

# Medium confidence: Plan first
/user:improve --perf --plan

# Low confidence: Interactive mode
/user:troubleshoot --investigate --interactive
```

### Persona Integration
```bash
# Commands auto-activate appropriate personas
/user:analyze --security      # → security persona
/user:build --react          # → frontend persona  
/user:design --api           # → architect persona
```

### Output Optimization
```bash
# Standard output
/user:explain --depth Expert

# Compressed output (70% token reduction)
/user:explain --depth Expert --uc

# Visual enhancement
/user:explain --depth Expert --visual
```

---

*AI Compass v1.0.0 | 18+ power commands | Confidence-integrated execution | Evidence-based development*