# MCP.md - Model Context Protocol Intelligence

## Legend
| Symbol | Meaning | | Abbrev | Meaning |
|--------|---------|---|--------|---------|
| → | leads to | | ops | operations |
| & | and/with | | UI | user interface |
| w/ | with | | impl | implementation |

## Decision Matrix & Orchestration

### Confidence-Integrated Tool Selection

```yaml
Tool_Selection_By_Confidence:
  ≥90%: Proceed with appropriate tools based on context
  70-89%: Use research tools (Context7, Sequential) to increase confidence
  <70%: Research-first protocol mandatory before implementation

Confidence_Bonus_From_Tools:
  Context7_Documentation: +10% when external library involved
  Sequential_Analysis: +15% for complex multi-step problems
  Magic_UI_Generation: +5% for component creation tasks
  Puppeteer_Validation: +10% for browser-based verification
```

### Flag Control & User Intent

```yaml
Explicit_Control:
  --c7: Force Context7 documentation lookup
  --seq: Force Sequential step-by-step analysis
  --magic: Force Magic UI generation
  --pup: Force Puppeteer browser testing
  --all-mcp: Enable all available MCP servers
  --no-mcp: Disable all MCP servers (native tools only)

Natural_Language_Triggers:
  "docs for X" → Context7(resolve-library-id: X) → get-docs
  "how to use Y in Z" → Context7(resolve-library-id: Z) → get-docs(topic: Y)
  "create component/button/form" → Magic(builder) → integrate
  "why slow/broken" → Sequential(analysis) → implement fix
  "design architecture" → Sequential(system design) → Context7(patterns)

Context_Triggers:
  Import_errors → Context7(resolve-library-id) → verify documentation
  Complex_debugging → Sequential(root cause analysis) → native implementation
  UI_requests → Magic(builder/refiner) → Puppeteer(testing)
  Performance_issues → Sequential(analysis) → optimize implementation
```

### Research-First Protocol

```yaml
Mandatory_Research_Triggers:
  External_library_detected: Context7 lookup REQUIRED before any implementation
  New_component_request: Magic search REQUIRED or identify existing pattern
  API_integration: WebSearch/Context7 REQUIRED for official documentation
  Unknown_pattern: Sequential thinking + research REQUIRED before proceeding
  Confidence < 90%: Implementation BLOCKED until research complete

Research_Success_Criteria:
  Official_documentation_found: Proceed with documented approach
  Multiple_sources_agree: High confidence in approach
  Clear_examples_available: Implementation pattern established
  Best_practices_identified: Quality standards confirmed
```

## Execution Playbooks

### Documentation Research Flow

```yaml
Library_Research:
  1. Context7(resolve-library-id) with user terminology
  2. If multiple options → present choices to user
  3. Context7(get-docs) with specific topic focus
  4. If documentation insufficient → Sequential analysis
  5. Implement using documented patterns

Example_Flow:
  User: "React forms best practices?"
  → Context7(resolve: "react")
  → Context7(get-docs: topic="forms")
  → Implement form component using documented patterns
```

### Complex Analysis Flow

```yaml
Problem_Decomposition:
  1. Sequential(problem analysis) → break down complexity
  2. Sequential guides Context7 topic selection
  3. Combine analysis + documentation → implementation plan
  4. Execute using native tools with MCP-informed approach

Example_Flow:
  User: "App performance issues"
  → Sequential(analyze performance bottlenecks)
  → Context7(get-docs: optimization patterns for identified issues)
  → Implement performance fixes using combined knowledge
```

### UI Generation Flow

```yaml
Component_Creation:
  1. Magic(builder) with user requirements + project context
  2. Magic(refiner) if initial generation needs improvement
  3. Integrate component into existing project structure
  4. Puppeteer(validation) to test component in browser
  5. Iterate based on testing results

Example_Flow:
  User: "Dashboard with charts"
  → Magic(builder: "dashboard", "charts")
  → Edit files to integrate component
  → Puppeteer(screenshot) to validate appearance
```

## Token Economics & Efficiency

### Budget Management

```yaml
Token_Budget_Tiers:
  Native_Tools: 0 tokens (always preferred for basic operations)
  Light_MCP: 100-500 tokens (simple lookups, basic generation)
  Medium_MCP: 500-2K tokens (complex analysis, detailed generation)
  Heavy_MCP: 2K-10K tokens (comprehensive research, multiple tool orchestration)

Escalation_Strategy:
  1. Native tools first for simple tasks
  2. Context7 for library/documentation questions
  3. Sequential for complex analysis requiring step-by-step reasoning
  4. Combine multiple MCPs only when synergistic value exists
```

### Cost Optimization

```yaml
Efficiency_Rules:
  Quick_tasks → Context7 only (documentation lookup)
  Architecture_decisions → Sequential primary analysis
  UI_requirements → Magic generation
  Everything_else → Native tools preferred

Abort_Conditions:
  Context_usage > 50% → Switch to native tools
  MCP_timeout/error → Graceful fallback to native implementation
  Diminishing_returns → Stop MCP usage, proceed with available information
  
UltraCompressed_Integration:
  --uc flag activates for MCP outputs
  ~70% token reduction applied to MCP responses
  Clarity preserved while reducing verbosity
  Auto-generated legend for symbols used
```

## Quality Control & Validation

### MCP Output Validation

```yaml
Context7_Quality_Gates:
  ✓ Relevant_documentation_found → Proceed with implementation
  ⚠ Partial_documentation → Try different search terms or Sequential backup
  ✗ No_relevant_match → Fall back to Sequential analysis + native tools

Sequential_Quality_Gates:
  ✓ Clear_analysis_with_actionable_steps → Implement based on analysis
  ⚠ Partial_analysis → Continue Sequential reasoning or request clarification
  ✗ Unclear_or_timeout → Switch to native tools + direct user questions

Magic_Quality_Gates:
  ✓ Component_matches_requirements → Integrate into project
  ⚠ Close_but_needs_refinement → Use Magic refiner with specific feedback
  ✗ Poor_quality_output → Try different terminology or fall back to manual implementation

Multi_MCP_Coordination:
  Results_enhance_each_other: Combine insights for better outcome
  Conflicting_information: Use most authoritative/recent source
  Redundant_information: Stop additional MCP calls to preserve tokens
```

## Persona Integration

### Persona-Specific MCP Preferences

```yaml
architect:
  Primary: Sequential(system design) + Context7(architecture patterns)
  Avoid: Magic (focuses on code generation rather than design)
  Pattern: Long Sequential analysis → Context7 for proven patterns

frontend:
  Primary: Magic(UI generation) + Puppeteer(browser testing) + Context7(React/Vue docs)
  Pattern: Magic component creation → Puppeteer validation → Context7 for optimization

backend:
  Primary: Context7(API documentation) + Sequential(scalability analysis)
  Avoid: Magic (UI-focused) + Puppeteer (browser-focused)
  Pattern: Context7 API research → Sequential system design

security:
  Primary: Sequential(threat analysis) + Context7(security patterns) + Puppeteer(testing)
  Pattern: Sequential threat modeling → Context7 security practices → Puppeteer validation

analyzer:
  Primary: Sequential(root cause analysis) → Context7(solutions) → All tools as needed
  Pattern: Deep Sequential investigation → Research solutions → Test with appropriate tools

performance:
  Primary: Sequential(bottleneck analysis) + Puppeteer(performance metrics) + Context7(optimization)
  Pattern: Sequential analysis → Puppeteer measurement → Context7 optimization patterns

qa:
  Primary: Puppeteer(testing) + Sequential(edge case analysis) + Context7(testing frameworks)
  Pattern: Puppeteer test creation → Sequential edge case analysis → Context7 best practices

refactorer:
  Primary: Sequential(code analysis) + Context7(refactoring patterns)
  Avoid: Magic (generates new code rather than improving existing)
  Pattern: Sequential code analysis → Context7 refactoring patterns → implement improvements

mentor:
  Primary: Context7(learning resources) + Sequential(structured explanations)
  Pattern: Context7 educational content → Sequential step-by-step explanation
```

## Command Integration

### MCP-Enhanced Commands

```yaml
Auto_MCP_Integration:
  /user:build → Magic(UI generation) if frontend components needed
  /user:analyze → Sequential for complex analysis + Context7 for research
  /user:design → Sequential(system design) + Context7(architecture patterns)
  /user:explain → Context7 if external libraries mentioned, otherwise native
  /user:improve → Sequential(analysis) → Context7(best practices)
  /user:troubleshoot → Sequential(root cause) → Context7(solutions)

Flag_Override_Examples:
  /user:build --react --magic --c7    # UI generation + documentation lookup
  /user:analyze --perf --seq --pup    # Performance analysis + browser testing
  /user:design --api --seq --no-mcp   # System design with native tools only
```

### Execution Priority

```yaml
Priority_Order:
  1. Explicit flags override everything (--c7, --no-mcp, etc.)
  2. Auto-activation based on command + context
  3. Context triggers (import errors, UI requests, etc.)
  4. Persona preferences for tool selection
  5. Default to native tools for undefined scenarios

Context_Sharing:
  Sequential_feeds_Context7: Analysis results inform documentation search topics
  Context7_informs_Magic: Documentation guides UI component generation
  Magic_tested_with_Puppeteer: Generated components validated in browser
  All_results_cached: Successful patterns remembered for future use
```

## Failure Recovery & Best Practices

### Failure Patterns & Recovery

```yaml
Context7_Failures:
  Library_not_found: Try broader search terms → Sequential analysis if still no results
  Documentation_incomplete: Supplement with Sequential reasoning → Note limitations
  API_timeout: Use cached partial results + native implementation → Document gaps

Sequential_Failures:
  Timeout_during_analysis: Use partial results + ask targeted questions → Proceed with caveats
  Token_limit_reached: Summarize current analysis + continue with native tools
  Unclear_reasoning: Switch to direct questions + avoid retry without changes

Magic_Failures:
  No_suitable_components: Try different search terms once → Manual implementation
  Poor_quality_output: Use refiner with specific feedback → Document limitations
  Integration_issues: Modify generated code manually → Learn patterns for future

Multi_MCP_Failures:
  Resource_exhaustion: Continue with single best-performing MCP
  Conflicting_results: Use most reliable/recent source → Document uncertainty
  Partial_failures: Continue with successful MCPs → Supplement with native tools
```

### Best Practices

```yaml
DO:
  - Match MCP selection to specific user needs
  - Set appropriate token budgets for task complexity
  - Validate MCP outputs before implementation
  - Cache successful patterns for reuse
  - Use Context7 for ALL external library documentation (research-first enforcement)
  - Cite MCP sources when implementing solutions

DON'T:
  - Use MCPs for tasks native tools handle well
  - Chain MCPs without validation between steps
  - Exceed 50% of available context with MCP usage
  - Retry failed MCP calls without changing parameters
  - Use MCPs when immediate action is needed (emergency fixes)

OPTIMIZE:
  - Batch similar MCP calls when possible
  - Reuse session results across related tasks
  - Start with least expensive MCP options
  - Prefer native tools for file operations
  - Document successful MCP patterns for future reference
```

---

*AI Compass v1.0.0 | Intelligent tool orchestration | Confidence-driven MCP selection | Research-first implementation*