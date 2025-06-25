# Project Setup Template

## Quick Start Commands

### New React Project
```bash
/user:build --react --init --tdd
/user:dev-setup
/user:test --e2e --watch
```

### API Development
```bash
/user:design --api --ddd
/user:build --api --tdd
/user:test --integration --coverage
```

### Full-Stack Application
```bash
/persona:architect
/user:design --api --ddd
/persona:frontend
/user:build --react --magic
/persona:backend
/user:build --api --tdd
/persona:qa
/user:test --e2e --coverage
```

## Confidence-Driven Workflows

### High Confidence (≥90%)
- Direct implementation with documentation
- Automated testing and validation
- Immediate deployment to staging

### Medium Confidence (70-89%)
- Plan review before implementation
- Collaborative validation of approach
- Staged rollout with monitoring

### Low Confidence (<70%)
- Research and documentation phase
- Prototype development with feedback
- Iterative refinement before production

## Persona-Specific Workflows

### Architecture Design
```bash
/persona:architect
/user:design --api --ddd --think-hard
/user:estimate --complexity --architecture
/user:document --api --technical
```

### Security Review
```bash
/persona:security
/user:scan --security --strict
/user:analyze --security --threats
/user:document --security --compliance
```

### Performance Optimization
```bash
/persona:performance
/user:analyze --profile --bottlenecks
/user:improve --perf --threshold 90%
/user:monitor --metrics --watch
```

## Quality Gates

### Pre-Development
- Requirements clarification
- Architecture validation
- Security threat modeling
- Performance baseline establishment

### During Development
- Continuous testing
- Code quality monitoring
- Security scanning
- Performance profiling

### Pre-Deployment
- Comprehensive testing
- Security audit
- Performance validation
- Documentation review

## Common Patterns

### Error Handling
- Input validation at boundaries
- Graceful degradation strategies
- Comprehensive logging
- User-friendly error messages

### Security Implementation
- Authentication and authorization
- Input sanitization
- Secure communication
- Data protection

### Performance Optimization
- Caching strategies
- Database optimization
- Frontend optimization
- Monitoring and alerting