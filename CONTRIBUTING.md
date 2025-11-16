# Contributing to Room Scanner

Thank you for your interest in contributing to the Room Scanner Android app! This document provides guidelines and instructions for contributing.

## Getting Started

1. **Fork the repository** on GitHub
2. **Clone your fork** locally:
   ```bash
   git clone https://github.com/YOUR_USERNAME/Android2.0roomscanner.git
   cd Android2.0roomscanner
   ```
3. **Set up the development environment** (see [LAUNCH_GUIDE.md](LAUNCH_GUIDE.md))

## Development Setup

### Prerequisites
- Android Studio Arctic Fox or later
- JDK 17
- Android SDK with API 26+
- Git

### Firebase Configuration
1. Create your own Firebase project
2. Download your `google-services.json`
3. Place it in `app/` directory (don't commit it!)
4. See [docs/FIREBASE_SETUP.md](docs/FIREBASE_SETUP.md) for details

### Building
```bash
./gradlew build
```

### Running Tests
```bash
./gradlew test
./gradlew connectedAndroidTest
```

## Code Style

### Kotlin Style Guide
- Follow the [official Kotlin style guide](https://kotlinlang.org/docs/coding-conventions.html)
- Use Kotlin idioms (data classes, sealed classes, extension functions)
- Prefer immutability (`val` over `var`)
- Use meaningful variable and function names

### Code Organization
```
app/src/main/java/com/roomscanner/app/
├── data/           # Data layer (Room DB, repositories)
├── arcore/         # ARCore integration
├── ml/             # Machine learning components
├── firebase/       # Firebase integration
├── ui/             # UI components and themes
└── MainActivity.kt # Main entry point
```

### Comments and Documentation
- Document public APIs with KDoc
- Explain complex algorithms with inline comments
- Keep comments concise and up-to-date

## Making Changes

### Branching Strategy
- `main` - Production-ready code
- `develop` - Development branch (not yet created)
- Feature branches: `feature/feature-name`
- Bug fixes: `fix/bug-description`

### Commit Messages
Use clear and descriptive commit messages:
```
Add object detection using ML Kit

- Integrate ML Kit for on-device object detection
- Add confidence threshold configuration
- Include unit tests for detection logic
```

### Pull Requests
1. Create a feature branch from `main`
2. Make your changes with clear commits
3. Update documentation if needed
4. Add tests for new features
5. Ensure all tests pass
6. Submit a pull request with:
   - Clear description of changes
   - Related issue numbers
   - Screenshots for UI changes

## Code Review

All contributions go through code review:
- Maintain code quality and consistency
- Follow project conventions
- Write clear, maintainable code
- Include appropriate tests
- Update documentation

## Testing

### Unit Tests
- Write tests for business logic
- Test edge cases and error conditions
- Use JUnit for testing

### Integration Tests
- Test ARCore integration on physical devices
- Test Firebase connectivity
- Test Room database operations

### UI Tests
- Use Espresso for UI testing
- Test Compose UI components
- Verify user interactions

## Areas for Contribution

### High Priority
- [ ] Enhanced ML models for damage detection
- [ ] Better 3D visualization
- [ ] Offline-first sync improvements
- [ ] Performance optimizations

### Features
- [ ] Multi-room scanning session
- [ ] AR measurement tools
- [ ] Cost estimation improvements
- [ ] Export to various formats (OBJ, PLY, etc.)

### Documentation
- [ ] Video tutorials
- [ ] API documentation
- [ ] Architecture diagrams
- [ ] More code examples

### Bug Fixes
Check the [Issues](https://github.com/kratos0686/Android2.0roomscanner/issues) page for reported bugs.

## Security

### Reporting Security Issues
Please report security vulnerabilities privately by emailing the maintainer. Do not create public issues for security problems.

### Security Best Practices
- Never commit API keys or secrets
- Use ProGuard/R8 for release builds
- Validate all user inputs
- Follow Android security guidelines

## License

By contributing, you agree that your contributions will be licensed under the MIT License.

## Questions?

If you have questions:
1. Check existing documentation in `docs/`
2. Search existing [Issues](https://github.com/kratos0686/Android2.0roomscanner/issues)
3. Create a new issue with the `question` label
4. Join discussions in pull requests

## Code of Conduct

Be respectful and constructive:
- Welcome newcomers
- Be patient with questions
- Provide constructive feedback
- Focus on the code, not the person
- Respect different viewpoints

## Recognition

Contributors will be:
- Listed in the project README
- Mentioned in release notes
- Given credit in commit history

Thank you for contributing to Room Scanner!
