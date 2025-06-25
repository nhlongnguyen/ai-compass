# React Project Memory

*Project-specific Claude Code memory for React applications*

## Project Context
This is a React application focusing on modern frontend development practices with emphasis on user experience, performance, and maintainability.

## Technology Stack
- **Frontend**: React 18+ with TypeScript
- **Build Tool**: Vite or Create React App
- **Styling**: CSS Modules / Styled Components / Tailwind CSS
- **State Management**: React Context / Redux Toolkit / Zustand
- **Testing**: Jest + React Testing Library + Cypress

## Development Preferences

### Code Style
- Functional components with hooks preferred over class components
- TypeScript for type safety
- Custom hooks for reusable logic
- Component composition over inheritance

### Performance Priorities
- Lazy loading for route-based code splitting
- Memoization for expensive computations
- Optimized bundle sizes
- Core Web Vitals optimization

### Testing Strategy
- Unit tests for business logic
- Integration tests for component interactions
- E2E tests for critical user flows
- Accessibility testing with axe-core

## AI Assistant Behavior

### Auto-Activate Personas
- Default to `/persona:frontend` for UI-related tasks
- Switch to `/persona:performance` for optimization work
- Use `/persona:qa` for testing and quality assurance

### Preferred Commands
- `/user:build --react --magic` for component generation
- `/user:test --e2e --coverage` for comprehensive testing
- `/user:analyze --perf --ux` for performance and UX analysis
- `/user:improve --quality --accessibility` for code improvements

### Evidence Standards
- Performance claims require Lighthouse scores or Core Web Vitals data
- Accessibility claims require axe-core reports
- Bundle size improvements need webpack-bundle-analyzer evidence
- UX improvements should reference user testing or analytics data

## Project-Specific Rules

### Component Architecture
- Atomic design principles (atoms, molecules, organisms)
- Consistent prop interfaces and naming conventions
- Error boundaries for robust error handling
- Suspense boundaries for loading states

### State Management
- Local state for component-specific data
- Context for shared UI state
- External state management for complex business logic
- Immutable updates for predictable state changes

### File Organization
```
src/
├── components/          # Reusable UI components
├── pages/              # Route components
├── hooks/              # Custom hooks
├── context/            # React contexts
├── utils/              # Utility functions
├── types/              # TypeScript types
└── __tests__/          # Test files
```

## Memory Usage Notes
- Use `#` to quickly add project-specific rules
- Use `/memory` to update this configuration
- Regular reviews to keep memory current with project evolution