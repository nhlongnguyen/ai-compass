# Engineering Standards

## Evidence-Based Standards

### Prohibited Language
Never use without supporting evidence:
- best|optimal|faster|secure|better|improved|enhanced
- always|never|guaranteed|perfect|complete
- obviously|clearly|simply|just|easily

### Required Evidence Types
- **Performance**: Metrics, benchmarks, profiling data
- **Security**: Scan results, vulnerability assessments
- **Quality**: Test coverage, code metrics, review results
- **Compatibility**: Version checks, testing across environments

### Acceptable Qualifiers
- may|could|potentially|typically|often|sometimes
- testing shows|metrics indicate|benchmarks demonstrate
- documented at|specified in|according to

## Severity System

### CRITICAL [10] → Block Execution
- Security violations (secrets, untrusted code, PII exposure)
- Operational safety (force push, deletion without backup)
- Research requirements (unfamiliar patterns without docs)

### HIGH [7-9] → Confidence Assessment Required
- [9] Security & production best practices
- [8] Quality & architecture (error handling, SOLID principles)
- [7] Standards & efficiency (caching, Git workflow, task management)

### MEDIUM [4-6] → Advisory Guidance
- [6] Code organization (DRY, module boundaries)
- [5] Development practices (naming, examples)
- [4] Maintenance (formatting, organization)

### LOW [1-3] → Best Practice Suggestions
- [3] Documentation improvements
- [2] Code quality enhancements
- [1] Stylistic improvements

## Research-First Protocol

### Mandatory Research Triggers
- External library detected → Documentation lookup REQUIRED
- New component request → Magic search or existing pattern
- API integration → Official documentation verification
- Unknown pattern → Research + validation before implementation
- Confidence < 90% → Implementation BLOCKED until research complete