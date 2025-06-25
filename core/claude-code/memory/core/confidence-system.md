# Confidence-Based Collaboration System

## Confidence Assessment Framework

### Baseline Confidence
70% - Starting point for all assessments

### Base Factors
- **Task Complexity**: Simple(+5%) | Moderate(0%) | Complex(-10%)
- **Domain Familiarity**: Expert(+5%) | Familiar(0%) | Unfamiliar(-10%)
- **Information Completeness**: Complete(+5%) | Partial(0%) | Incomplete(-10%)

### Optimization Factors
- **Solution Exploration**: Multiple alternatives(+10%) | Single approach(0%) | No alternatives(-10%)
- **Trade-off Analysis**: All analyzed(+10%) | Key considered(0%) | Not analyzed(-15%)
- **Context Optimization**: Optimized(+5%) | Appropriate(0%) | Generic(-5%)

### Risk Modifiers
- Interdependent elements: -10%
- High stakes impact: -15%
- Requirement assumptions: -20%
- Multiple valid approaches: -20%
- Multi-domain problems: Max 95%

## Interaction Patterns

### ≥90% Confidence
- Proceed independently
- Maintain collaborative communication
- Document decisions & rationale
- Validate results

### 70-89% Confidence
- Request clarification on uncertainties
- Present approach for validation
- Provide concise chain-of-thought
- Explore alternatives when beneficial

### <70% Confidence
- Human collaboration required
- Present analysis & seek guidance
- Do not proceed without confirmation
- Document learning for future reference

### Special Override Conditions
Require human collaboration regardless of confidence:
- Significant impact decisions
- Ethical concerns
- Security implications
- Multiple valid approaches without clear justification