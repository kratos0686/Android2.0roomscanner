# GitHub Copilot Instructions for Room Scanner

> **Purpose**: This file provides context and guidelines for GitHub Copilot coding agent when working on this repository. It defines the project structure, conventions, build processes, and contribution workflow.

## Quick Reference

### Essential Commands
```bash
# Build project
./gradlew build

# Run tests
./gradlew test

# Run lint
./gradlew lint

# Run all checks
./gradlew check

# Clean build
./gradlew clean build
```

### Key Files
- `app/build.gradle.kts` - App dependencies and configuration
- `app/src/main/java/com/roomscanner/app/` - Main source code
- `docs/` - Comprehensive documentation
- `README.md` - Project overview
- `LAUNCH_GUIDE.md` - Detailed setup guide

### Common Paths
- **Entities**: `app/src/main/java/com/roomscanner/app/data/entity/`
- **DAOs**: `app/src/main/java/com/roomscanner/app/data/dao/`
- **Repositories**: `app/src/main/java/com/roomscanner/app/data/repository/`
- **UI Components**: `app/src/main/java/com/roomscanner/app/ui/`
- **Tests**: `app/src/test/` and `app/src/androidTest/`

## Project Overview

Room Scanner is a modern Android application for 3D room scanning using ARCore, with offline storage, ML-powered analysis, and cloud synchronization. This is a Kotlin-based Android project using Jetpack Compose for UI and modern Android architecture patterns.

**Primary Function**: Enable users to scan rooms in 3D using their Android device camera, analyze the scan data with ML models, store scans offline, and sync to cloud storage.

## Technology Stack

### Core Technologies
- **Language**: Kotlin (JVM target 17)
- **Build System**: Gradle with Kotlin DSL
- **UI Framework**: Jetpack Compose with Material Design 3
- **Architecture**: MVVM with Repository pattern
- **Minimum Android SDK**: 26 (Android 8.0)
- **Target SDK**: 34

### Key Dependencies
- **Jetpack Compose**: Modern declarative UI toolkit
- **Room Database**: Local SQLite database with Coroutines and RxJava support
- **ARCore**: 3D scanning and augmented reality features
- **Firebase**: Cloud services (Firestore, Functions, Storage, ML Model Downloader)
- **ML Kit**: Object detection and image labeling
- **TensorFlow Lite**: Custom ML model inference with GPU acceleration
- **RxJava 3**: Reactive programming alongside Coroutines
- **Kotlin Coroutines**: Asynchronous programming with Flow

## Development Environment

### Prerequisites
- **JDK**: Java 17 or higher
- **Gradle**: 8.2 (wrapper included)
- **Android SDK**: Required for full build (API 26-34)
- **ARCore**: Required for device testing (not needed for code-only changes)

### Environment Variables
- `ANDROID_HOME` or `ANDROID_SDK_ROOT`: Path to Android SDK (optional in CI without SDK)
- `JAVA_HOME`: Path to JDK 17+ installation

### CI/CD Environment Notes
- **Build without Android SDK**: Expected to fail in CI environments without Android SDK. This is normal for documentation-only or configuration changes.
- **google-services.json**: Use `app/google-services.json.example` as template in CI. Real Firebase config needed for production builds only.
- **Emulator/Device**: Not required for code review, linting, or documentation tasks.

## Project Structure

```
app/src/main/java/com/roomscanner/app/
├── data/
│   ├── entity/          # Room database entities (ScanEntity, NoteEntity)
│   ├── dao/             # Data Access Objects (ScanDao, NoteDao)
│   ├── repository/      # Repository layer for data access
│   └── AppDatabase.kt   # Room database configuration
├── arcore/              # ARCore integration for 3D scanning
│   ├── ARCoreSessionManager.kt
│   └── ScanDataProcessor.kt
├── ml/                  # Machine Learning components
│   ├── MLKitDetector.kt
│   └── TFLiteModelRunner.kt
├── firebase/            # Firebase cloud integration
│   ├── FirestoreSync.kt
│   ├── CloudFunctionsClient.kt
│   └── StorageManager.kt
├── ui/                  # UI components and screens
│   └── theme/           # Theme configuration
└── MainActivity.kt      # Main activity entry point
```

## Building and Testing

### Build Commands
```bash
# Build the project
./gradlew build

# Build debug APK
./gradlew assembleDebug

# Build release APK
./gradlew assembleRelease

# Clean build
./gradlew clean build
```

### Testing Commands
```bash
# Run unit tests
./gradlew test

# Run instrumentation tests (requires connected device/emulator)
./gradlew connectedAndroidTest

# Run lint checks
./gradlew lint

# Run all checks
./gradlew check
```

### Running the App
```bash
# Install debug build on connected device
./gradlew installDebug

# Uninstall app
./gradlew uninstallDebug
```

## Code Conventions

### Kotlin Style
- Follow official Kotlin coding conventions
- Use Kotlin idioms (data classes, sealed classes, extension functions)
- Prefer immutability (val over var)
- Use trailing commas in multiline declarations
- Keep functions small and focused

### Naming Conventions
- **Classes**: PascalCase (e.g., `ScanEntity`, `ARCoreSessionManager`)
- **Functions**: camelCase (e.g., `insertScan`, `detectObjects`)
- **Properties**: camelCase (e.g., `roomName`, `isSynced`)
- **Constants**: UPPER_SNAKE_CASE (e.g., `DATABASE_NAME`)
- **Resources**: snake_case (e.g., `activity_main`, `scan_item`)

### Architecture Patterns
- Use MVVM pattern with ViewModels for UI logic
- Repository pattern for data access abstraction
- Dependency injection where appropriate
- Separate concerns: UI layer → ViewModel → Repository → Data Sources

### Reactive Programming
- Use Kotlin Coroutines and Flow for new async code
- Support RxJava 3 for existing reactive code
- ViewModels should use `viewModelScope` for coroutines
- DAOs support both Flow and RxJava observables

### Compose UI Best Practices
- Use `remember` to avoid unnecessary recomposition
- Use `derivedStateOf` for computed state
- Hoist state to appropriate level (lowest common ancestor)
- Use `LaunchedEffect` for side effects with lifecycle awareness
- Follow Material 3 design guidelines
- Keep Composable functions small and focused
- Use preview annotations for development

### Error Handling
- Use `Result` type for operations that can fail
- Provide meaningful error messages
- Log errors with appropriate tags
- Handle network failures gracefully (offline-first)
- Show user-friendly error messages in UI
- Use try-catch for expected exceptions
- Let unexpected exceptions crash (fail fast)

### Resource Management
- Close resources properly (use `use` function)
- Cancel coroutines when no longer needed
- Unregister listeners and observers
- Release camera and AR session resources
- Close database connections appropriately

### Database (Room)
- Entities in `data/entity/` package
- DAOs in `data/dao/` package
- Use `@Entity`, `@Dao`, `@Database` annotations properly
- Support both suspend functions and RxJava observables in DAOs
- Use foreign key relationships where appropriate
- Enable auto-backup in database configuration

### Firebase Integration
- Keep Firebase operations in `firebase/` package
- Handle offline scenarios gracefully
- Sync local Room data with Firestore
- Use Cloud Functions for serverless operations
- Store large files (point clouds, meshes) in Firebase Storage

### ML/AI Features
- Place ML models in `assets/` directory
- Use ML Kit for standard vision tasks
- Use TensorFlow Lite for custom models
- Enable GPU/NNAPI acceleration when available
- Run inference on background threads

### ARCore Integration
- Check ARCore availability before use
- Handle camera permissions properly
- Manage AR session lifecycle correctly
- Process 3D data on background threads

## File Modifications

### When modifying code:
1. **Maintain minimal changes**: Only modify what's necessary
2. **Preserve existing patterns**: Follow the established code style
3. **Test thoroughly**: Run relevant tests after changes
4. **Update documentation**: If changing public APIs or architecture
5. **Handle errors**: Add proper error handling and logging

### When adding new features:
1. Follow the existing package structure
2. Add database entities in `data/entity/`
3. Add DAOs in `data/dao/` with both suspend and RxJava methods
4. Create repository methods in `data/repository/`
5. Add ViewModels for UI logic
6. Create Compose UI components in `ui/` package

### When fixing bugs:
1. Identify the root cause first
2. Add tests to prevent regression if possible
3. Make surgical fixes without refactoring unrelated code
4. Verify the fix doesn't break existing functionality

## Important Configuration Files

- **app/build.gradle.kts**: App-level dependencies and configuration
- **build.gradle.kts**: Project-level Gradle configuration
- **gradle.properties**: Gradle properties and JVM settings
- **app/google-services.json**: Firebase configuration (not in git, use example)
- **app/proguard-rules.pro**: ProGuard rules for release builds

## Dependencies Management

- Check for security vulnerabilities before adding dependencies
- Prefer AndroidX libraries over support libraries
- Keep Firebase BOM version updated
- Use version catalogs or constants for version management
- Test dependency updates thoroughly

## Common Tasks

### Adding a new Room entity:
1. Create entity class in `data/entity/`
2. Add DAO interface in `data/dao/`
3. Update AppDatabase to include the new DAO
4. Increment database version and add migration
5. Add repository methods for data access

### Integrating a new ML model:
1. Place `.tflite` model in `app/src/main/assets/`
2. Enable `mlModelBinding = true` in build.gradle.kts
3. Create model runner class in `ml/` package
4. Handle model loading and inference on background threads
5. Add error handling for model loading failures

### Adding Firebase Cloud Function:
1. Define function in `firebase/functions/` directory
2. Deploy using Firebase CLI
3. Create client in `firebase/CloudFunctionsClient.kt`
4. Handle network errors and timeouts
5. Test with Firebase emulator first

## Documentation

- Main README: Project overview and quick start
- LAUNCH_GUIDE.md: Detailed launch instructions
- docs/ARCHITECTURE.md: Architecture and design decisions
- docs/ROOM_DATABASE.md: Database schema and usage
- docs/FIREBASE_SETUP.md: Firebase configuration
- docs/ARCORE_INTEGRATION.md: ARCore implementation details
- docs/TFLITE_DEPLOYMENT.md: ML model deployment guide

## Firebase Setup Requirements

Before building:
1. Create Firebase project at console.firebase.google.com
2. Add Android app with package `com.roomscanner.app`
3. Download `google-services.json` to `app/` directory
4. Enable Firestore, Storage, and Cloud Functions
5. Configure authentication if needed

## ARCore Device Requirements

- Device must support ARCore (see https://developers.google.com/ar/devices)
- Android 7.0 (API 24) or higher
- Camera permissions required
- ARCore APK installed from Play Store

## Security Considerations

- Never commit `google-services.json` with production keys
- Use `.gitignore` to exclude sensitive files
- Validate user input before database operations
- Sanitize data before Firebase uploads
- Use ProGuard/R8 for release builds
- Check permissions at runtime for camera and storage

## Debugging Tips

- Use Logcat for Android logging
- Firebase emulators for testing cloud functions locally
- ARCore recording/playback for debugging AR features
- Room database inspector in Android Studio
- Network inspector for Firebase calls

## Performance Best Practices

- Use lazy initialization for heavy objects
- Run database operations on IO dispatcher
- Use WorkManager for background sync tasks
- Optimize Compose recomposition with remember and derivedStateOf
- Profile with Android Profiler before optimizing
- Use R8 code shrinking for release builds

## Common Build Issues and Solutions

### Android SDK Not Found
**Issue**: Build fails with "SDK location not found"
**Solution**: This is expected in CI/CD environments without Android SDK. For local development, ensure Android SDK is installed via Android Studio.

### Google Services Plugin Errors
**Issue**: `google-services.json` related errors
**Solution**: Use the example file `app/google-services.json.example` as a template. For production builds, replace with actual Firebase configuration.

### Gradle Sync Failures
**Issue**: Dependencies fail to download or sync
**Solution**: 
```bash
./gradlew clean
./gradlew build --refresh-dependencies
```

### KSP/Kapt Errors
**Issue**: Annotation processing fails for Room database
**Solution**: Ensure KSP version matches Kotlin version in `build.gradle.kts`

### Memory Issues During Build
**Issue**: Gradle daemon runs out of memory
**Solution**: Check `gradle.properties` for memory settings:
```properties
org.gradle.jvmargs=-Xmx2048m -XX:MaxMetaspaceSize=512m
```

## Contribution Workflow for Copilot

When assigned an issue or task, follow this workflow:

1. **Understand the Context**
   - Read README.md and LAUNCH_GUIDE.md for project overview
   - Review docs/ARCHITECTURE.md to understand system design
   - Check related documentation in `docs/` directory
   - Examine existing code in the affected areas

2. **Verify Current State**
   - Run `./gradlew build` to ensure the project builds
   - Run `./gradlew test` to check all tests pass
   - Run `./gradlew lint` to check code quality
   - Note any pre-existing failures (not your responsibility to fix)

3. **Implement Changes**
   - Make minimal, surgical changes only
   - Follow existing code patterns and conventions
   - Add appropriate error handling and logging
   - Update relevant documentation if needed
   - Add or update tests for new functionality

4. **Test Your Changes**
   - Run `./gradlew build` to verify compilation
   - Run `./gradlew test` to verify tests pass
   - Run `./gradlew lint` to check code style
   - Run `./gradlew check` for comprehensive checks
   - Test manually if UI changes are involved

5. **Commit and Document**
   - Use clear, descriptive commit messages
   - Follow Conventional Commits format (e.g., "feat:", "fix:", "docs:")
   - Update PR description with changes made
   - Link to related issues or documentation

6. **Review Checklist**
   - Code follows Kotlin conventions
   - No security vulnerabilities introduced
   - Tests added/updated and passing
   - Documentation updated if needed
   - No unrelated changes included
   - No sensitive data or secrets committed

## Code Review and Quality Standards

### Self-Review Before Submission
Before completing your work, perform a thorough self-review:

1. **Code Quality**
   - Is the code readable and well-organized?
   - Are variable and function names clear and descriptive?
   - Is there appropriate error handling?
   - Are edge cases handled?

2. **Testing**
   - Do all relevant tests pass?
   - Have you added tests for new functionality?
   - Are test names descriptive and follow conventions?

3. **Documentation**
   - Is the code self-documenting or properly commented?
   - Have you updated relevant documentation files?
   - Is the PR description clear and complete?

4. **Performance**
   - Are there any obvious performance issues?
   - Are database operations optimized?
   - Are resources properly managed (closed/released)?

5. **Security**
   - No hardcoded secrets or API keys?
   - User input properly validated?
   - No SQL injection vulnerabilities?
   - Firebase security rules considered?

### Pull Request Description Template

When creating a PR, include:
```markdown
## Description
[Brief description of changes]

## Issue
Closes #[issue number]

## Type of Change
- [ ] Bug fix
- [ ] New feature
- [ ] Documentation update
- [ ] Refactoring
- [ ] Performance improvement

## Testing
- [ ] Unit tests pass
- [ ] Lint checks pass
- [ ] Manual testing completed (if applicable)

## Screenshots (if UI changes)
[Add screenshots here]

## Additional Notes
[Any additional context or notes]
```

## What to Modify and What to Avoid

### Safe to Modify:
- Source files in `app/src/main/java/com/roomscanner/app/`
- Test files in `app/src/test/` and `app/src/androidTest/`
- Resource files in `app/src/main/res/` (layouts, strings, etc.)
- Documentation files in `docs/` directory
- Build configuration files if adding dependencies
- README.md and LAUNCH_GUIDE.md for documentation updates

### Avoid Modifying Unless Necessary:
- `.github/workflows/` - CI/CD configuration (unless fixing CI issues)
- `gradle/wrapper/` - Gradle wrapper files
- `.gitignore` - Git ignore rules (unless adding new patterns)
- `app/google-services.json` - Firebase configuration (sensitive)
- Root-level configuration files without good reason

### Never Modify:
- `.git/` directory
- `build/` directories (generated files)
- `.gradle/` directory (Gradle cache)
- Any secrets or API keys

## Testing Requirements

- **Unit Tests**: Required for new business logic, data operations, and utilities
- **Coverage Target**: Aim for >80% code coverage on new code
- **Test Location**: 
  - Unit tests in `app/src/test/`
  - Instrumentation tests in `app/src/androidTest/`
- **Test Naming**: Use descriptive names like `insertScan_validData_returnsId()`
- **Test Structure**: Follow Arrange-Act-Assert pattern
- **Mock External Dependencies**: Use MockK or similar for Firebase, ARCore, etc.

## Commit Message Format

Follow Conventional Commits specification:

```
<type>(<scope>): <description>

[optional body]

[optional footer]
```

**Types:**
- `feat`: New feature
- `fix`: Bug fix
- `docs`: Documentation changes
- `style`: Code style changes (formatting, etc.)
- `refactor`: Code refactoring
- `test`: Adding or updating tests
- `chore`: Maintenance tasks

**Examples:**
- `feat(database): add support for scan metadata`
- `fix(arcore): resolve camera permission crash`
- `docs(readme): update Firebase setup instructions`
- `test(scan-dao): add tests for delete operations`

## Expected Behavior for Issues

When assigned an issue:

1. **Acknowledge**: Understand the problem statement clearly
2. **Scope**: Work only on the specific issue assigned
3. **Research**: Check existing code and documentation first
4. **Plan**: Outline your approach before coding
5. **Implement**: Make targeted, minimal changes
6. **Test**: Verify your changes work as expected
7. **Document**: Update relevant documentation
8. **Review**: Self-review before submitting PR

Do not:
- Fix unrelated issues or bugs
- Refactor code not related to the task
- Change coding style of existing unmodified code
- Add unnecessary dependencies or features
- Modify failing tests that aren't related to your changes

### Issue Prioritization

When multiple issues or requirements exist, prioritize in this order:
1. **Security vulnerabilities** - Fix immediately
2. **Build-breaking issues** - Restore build functionality
3. **Test failures** - Related to your changes only
4. **Feature implementation** - As specified in the issue
5. **Code style/refactoring** - Only if directly related to the task
6. **Documentation updates** - When APIs or behavior changes

### Handling Build Failures

If the build fails when you start:
1. **Check if it's expected**: Android builds require Android SDK. In CI environments without SDK, this is normal for doc-only tasks.
2. **Review error messages**: Determine if failure is related to your task.
3. **Document pre-existing issues**: Note any unrelated failures in your PR description.
4. **Focus on your scope**: Don't fix unrelated build issues unless they block your work.

## When Working with This Repository

1. **Start here**: Read README.md and LAUNCH_GUIDE.md
2. **Understand architecture**: Review docs/ARCHITECTURE.md
3. **Build first**: Run `./gradlew build` to ensure clean state
4. **Make minimal changes**: Only modify what's necessary for the task
5. **Test changes**: Run relevant tests after modifications
6. **Check documentation**: Update docs if changing public interfaces
7. **Review before committing**: Ensure changes follow project conventions

---

## Summary: Key Principles

When working on this repository, always remember:

🎯 **Minimal Changes**: Make the smallest possible changes to achieve the goal
🔍 **Research First**: Understand existing code patterns before modifying
🧪 **Test Thoroughly**: Run tests frequently during development
📚 **Document Changes**: Update documentation for API or behavior changes
🔒 **Security First**: Never commit secrets, always validate input
🎨 **Follow Conventions**: Match existing code style and patterns
✅ **Self-Review**: Check your work before submission
🚫 **Avoid Scope Creep**: Stay focused on the assigned issue

### Need Help?
- **Architecture**: See `docs/ARCHITECTURE.md`
- **Database**: See `docs/ROOM_DATABASE.md`
- **Firebase**: See `docs/FIREBASE_SETUP.md`
- **ARCore**: See `docs/ARCORE_INTEGRATION.md`
- **ML/TFLite**: See `docs/TFLITE_DEPLOYMENT.md`
- **Setup**: See `LAUNCH_GUIDE.md`
- **Contributing**: See `CONTRIBUTING.md`

### Quick Checks Before Submitting
```bash
# Run all checks
./gradlew check

# Verify no secrets committed
git diff | grep -i "api.key\|password\|secret\|token"

# Check commit message format
git log --oneline -1
```

**Remember**: Quality over speed. Take time to understand the codebase and make thoughtful, well-tested changes.
