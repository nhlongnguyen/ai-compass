# Full-Stack Project Memory

*Project-specific Claude Code memory for full-stack applications*

## Project Context
This is a full-stack application combining modern frontend and backend technologies with emphasis on end-to-end user experience and system reliability.

## Technology Stack
- **Frontend**: React/Vue/Angular with TypeScript
- **Backend**: Node.js/Python/Go API
- **Database**: PostgreSQL/MongoDB with Redis caching
- **Infrastructure**: Docker, CI/CD, Cloud deployment
- **Real-time**: WebSockets/Server-Sent Events (if applicable)

## Development Preferences

### Architecture Patterns
- Domain-driven design for complex business logic
- Event-driven architecture for loose coupling
- Microservices or modular monolith approach
- API-first development with contract testing

### Integration Strategies
- RESTful APIs with GraphQL where beneficial
- Real-time updates through WebSockets
- Offline-first capabilities with service workers
- Progressive Web App (PWA) features

## AI Assistant Behavior

### Auto-Activate Personas
- Use `/persona:architect` for system design decisions
- Switch between `/persona:frontend` and `/persona:backend` contextually
- Activate `/persona:security` for authentication and authorization
- Use `/persona:performance` for optimization across the stack

### Preferred Commands
- `/user:design --api --ddd` for system architecture
- `/user:build --react --api --integration` for full-stack development
- `/user:test --e2e --integration --coverage` for comprehensive testing
- `/user:deploy --staging --plan` for deployment workflows

### Evidence Standards
- Performance claims require full-stack metrics (frontend + backend)
- Security assertions need end-to-end security testing
- User experience improvements require A/B testing or user feedback
- System reliability needs uptime and error tracking data

## Project-Specific Rules

### Full-Stack Integration
- Consistent data models between frontend and backend
- Type sharing between client and server (TypeScript)
- Error handling that provides meaningful user feedback
- Loading states and optimistic updates for better UX

### Development Workflow
- Feature flags for gradual rollouts
- Database migrations with rollback strategies
- End-to-end testing in CI/CD pipeline
- Monitoring and alerting across all layers

### File Organization
```
project/
├── frontend/
│   ├── src/
│   ├── public/
│   └── package.json
├── backend/
│   ├── src/
│   ├── config/
│   └── package.json
├── shared/              # Shared types and utilities
├── docker-compose.yml   # Local development
├── .github/workflows/   # CI/CD pipelines
└── docs/               # Architecture and API docs
```

## Quality Gates

### Frontend Standards
- Core Web Vitals within acceptable ranges
- Accessibility audit passing
- Bundle size optimization
- Cross-browser compatibility

### Backend Standards
- API response times < 200ms (P95)
- Database query optimization
- Security vulnerability scans passing
- Load testing for expected traffic

### Integration Standards
- End-to-end tests covering critical paths
- API contract tests for frontend-backend integration
- Performance testing under realistic load
- Security testing for authentication flows

## Development Environment

### Local Setup
- Docker Compose for consistent development environment
- Hot reloading for both frontend and backend
- Database seeding for consistent test data
- Shared configuration management

### Testing Strategy
- Unit tests for business logic (both frontend and backend)
- Integration tests for API endpoints
- Component tests for UI interactions
- End-to-end tests for complete user workflows

## Deployment Strategy

### Staging Environment
- Mirror production configuration
- Integration testing with real external services
- Performance testing under load
- Security scanning and penetration testing

### Production Deployment
- Blue-green or canary deployment strategy
- Database migration safety checks
- Rollback procedures documented and tested
- Monitoring and alerting configured

## Memory Usage Notes
- Use `#` to add project-specific integration rules
- Use `/memory` to update full-stack configuration
- Regular architecture reviews to maintain coherence