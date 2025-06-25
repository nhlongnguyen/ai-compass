# API Project Memory

*Project-specific Claude Code memory for backend API development*

## Project Context
This is a backend API project focusing on reliability, performance, security, and scalability.

## Technology Stack
- **Runtime**: Node.js / Python / Go / Rust
- **Framework**: Express / FastAPI / Gin / Axum
- **Database**: PostgreSQL / MongoDB / Redis
- **Authentication**: JWT / OAuth2 / Passport
- **Testing**: Jest / pytest / testing framework

## Development Preferences

### Code Style
- RESTful API design principles
- GraphQL for complex data queries (if applicable)
- OpenAPI/Swagger documentation
- Clean architecture with separation of concerns

### Performance Priorities
- Database query optimization
- Caching strategies (Redis, in-memory)
- Connection pooling
- Horizontal scaling considerations

### Security Standards
- Input validation and sanitization
- SQL injection prevention
- Authentication and authorization
- Rate limiting and DDoS protection
- HTTPS enforcement

## AI Assistant Behavior

### Auto-Activate Personas
- Default to `/persona:backend` for API development
- Switch to `/persona:security` for security-related tasks
- Use `/persona:performance` for optimization work
- Use `/persona:analyzer` for debugging and troubleshooting

### Preferred Commands
- `/user:build --api --tdd` for test-driven API development
- `/user:scan --security --strict` for security validation
- `/user:analyze --perf --database` for performance analysis
- `/user:test --integration --coverage` for comprehensive testing

### Evidence Standards
- Performance claims require load testing results
- Security claims require scan reports and penetration testing
- Database optimization needs query execution plans
- API reliability requires uptime and error rate metrics

## Project-Specific Rules

### API Design
- Consistent naming conventions for endpoints
- Proper HTTP status codes and error responses
- Versioning strategy for API evolution
- Comprehensive request/response validation

### Database Strategy
- Optimized schemas with proper indexing
- Transaction management for data consistency
- Connection pooling for performance
- Backup and recovery procedures

### Error Handling
- Structured error responses
- Comprehensive logging with correlation IDs
- Graceful degradation for external service failures
- Circuit breaker patterns for resilience

### File Organization
```
src/
├── controllers/        # Request handlers
├── services/          # Business logic
├── models/            # Data models
├── middleware/        # Express middleware
├── utils/             # Utility functions
├── config/            # Configuration
└── __tests__/         # Test files
```

## Security Checklist
- [ ] Input validation on all endpoints
- [ ] Authentication required for protected routes
- [ ] Authorization checks for resource access
- [ ] Rate limiting implemented
- [ ] CORS properly configured
- [ ] Security headers set
- [ ] Secrets management implemented
- [ ] SQL injection prevention
- [ ] XSS protection

## Memory Usage Notes
- Use `#` to quickly add API-specific rules
- Use `/memory` to update security requirements
- Regular security reviews and updates