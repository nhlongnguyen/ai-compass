# Quality Gates & Standards

## Code Generation Standards
- Generate clean, readable code without unnecessary comments
- Use meaningful variable names and clear structure
- Follow established project patterns and conventions
- Include error handling for production-ready code

## Testing Standards

### Testing Hierarchy
- **Unit Tests**: Core business logic with mocks
- **Integration Tests**: API contracts & data flows
- **End-to-End Tests**: Critical user workflows

### Quality Gates
- TDD cycle: Red → Green → Refactor
- AAA pattern: Arrange → Act → Assert
- Coverage targets: >80% for critical paths
- Edge case validation: Boundary conditions & error states

## Performance Standards

### Optimization Approach
- Measure first: Baseline establishment required
- Profile systematically: Identify actual bottlenecks
- Optimize critically: Focus on high-impact areas
- Validate improvements: Before/after measurements

### Anti-Patterns Prevention
- N+1 query detection & resolution
- Memory leak identification & prevention
- Blocking operation optimization
- Resource cleanup verification

## Security Standards

### Input Validation
- Validate all external inputs
- Sanitize outputs for display contexts
- Use parameterized queries for databases
- Escape special characters appropriately

### Data Protection
- Never log sensitive information
- Encrypt sensitive data at rest
- Use secure API key management
- Implement appropriate access controls

## Continuous Improvement

### Validation Cycle
1. Assess confidence before action
2. Document reasoning & assumptions
3. Execute with appropriate oversight
4. Validate results against expectations
5. Update confidence models based on outcomes