# GitHub Copilot Instructions for Room Scanner

This document provides guidelines for GitHub Copilot when working on the Android Room Scanner project.

## Project Overview

Room Scanner is a modern Android application for 3D room scanning using ARCore, with offline storage, ML-powered analysis, and cloud synchronization. The app follows a clean, layered architecture with Jetpack Compose UI.

## Architecture

The app uses a layered architecture:
- **UI Layer**: Jetpack Compose with Material Design 3
- **ViewModel Layer**: ViewModels with Kotlin Coroutines and RxJava support
- **Repository Layer**: Abstracts data sources
- **Data Sources**: Room Database (local), Firebase (cloud), ML Kit, ARCore

## Technology Stack

- **Language**: Kotlin
- **UI Framework**: Jetpack Compose
- **Local Database**: Room Database with SQLite
- **AR Framework**: ARCore for 3D scanning
- **Machine Learning**: ML Kit and TensorFlow Lite
- **Cloud Services**: Firebase (Firestore, Cloud Functions, Storage)
- **Reactive Programming**: Kotlin Coroutines/Flow and RxJava 3
- **Build System**: Gradle with Kotlin DSL

## Code Guidelines

### Kotlin Style
- Use idiomatic Kotlin patterns (data classes, sealed classes, extension functions)
- Prefer immutability and val over var
- Use meaningful variable and function names
- Follow Kotlin naming conventions (camelCase for functions/variables, PascalCase for classes)
- Use when expressions instead of if-else chains when appropriate
- Leverage Kotlin's null safety features

### Architecture Patterns
- Follow MVVM pattern: UI → ViewModel → Repository → Data Sources
- Use dependency injection principles (constructor injection preferred)
- Keep ViewModels free of Android framework dependencies
- Use Repository pattern to abstract data sources
- Separate concerns: UI logic in Composables, business logic in ViewModels, data logic in Repositories

### Jetpack Compose
- Write composables as pure functions when possible
- Use remember and rememberSaveable appropriately for state management
- Prefer hoisting state to parent composables
- Use ViewModels for complex state management
- Follow Material Design 3 guidelines
- Keep composables small and focused

### Room Database
- Use proper entity annotations (@Entity, @PrimaryKey, @ColumnInfo)
- Define clear relationships with @Relation, @Embedded
- Use DAO interfaces with suspend functions for Coroutines
- Support both Flow and RxJava return types in DAOs
- Handle database migrations properly
- Use transactions for multi-step operations

### ARCore Integration
- Handle session lifecycle properly (create, resume, pause)
- Check for ARCore availability and camera permissions
- Process frames efficiently to avoid UI blocking
- Extract dimensions and point cloud data systematically
- Handle exceptions gracefully (unsupported device, permission denied)

### Machine Learning
- Load models asynchronously to avoid blocking UI
- Use GPU/NNAPI acceleration when available
- Handle inference on background threads
- Validate model input/output dimensions
- Provide fallbacks for unsupported devices

### Firebase
- Use offline persistence for Firestore
- Handle sync conflicts appropriately
- Implement retry logic for network operations
- Use batch writes for multiple operations
- Secure Firebase rules appropriately

### Reactive Programming
- Use Coroutines and Flow as the primary reactive approach
- Provide RxJava alternatives where needed for compatibility
- Use appropriate dispatchers (IO, Main, Default)
- Handle cancellation properly in Coroutines
- Dispose of RxJava subscriptions properly

## Testing Guidelines

- Write unit tests for ViewModels and Repositories
- Use JUnit 4 or 5 for unit tests
- Use MockK or Mockito for mocking
- Write instrumentation tests for Room DAOs
- Test Composables with Compose testing library
- Aim for meaningful test coverage, not 100% coverage
- Focus on testing business logic and edge cases

## Build and Validation

### Building
```bash
./gradlew build
```

### Running Tests
```bash
# Unit tests
./gradlew test

# Instrumentation tests (requires device/emulator)
./gradlew connectedAndroidTest
```

### Code Quality
- Follow Android lint recommendations
- Address compiler warnings
- Use ktlint or similar for consistent formatting
- Ensure code compiles without errors before committing

## File Organization

- Place entities in `app/src/main/java/com/roomscanner/app/data/entity/`
- Place DAOs in `app/src/main/java/com/roomscanner/app/data/dao/`
- Place repositories in `app/src/main/java/com/roomscanner/app/data/repository/`
- Place UI composables in `app/src/main/java/com/roomscanner/app/ui/`
- Place ViewModels at feature level
- Place ARCore code in `app/src/main/java/com/roomscanner/app/arcore/`
- Place ML code in `app/src/main/java/com/roomscanner/app/ml/`
- Place Firebase code in `app/src/main/java/com/roomscanner/app/firebase/`

## Dependencies

### Adding Dependencies
- Check compatibility with existing dependencies
- Use version catalogs when available
- Prefer AndroidX libraries over legacy support libraries
- Keep dependencies up to date but test thoroughly
- Add dependencies to `app/build.gradle.kts`

### Key Dependencies
- `androidx.room:room-runtime` and `room-ktx` - Database
- `com.google.ar:core` - ARCore
- `com.google.mlkit:*` - ML Kit
- `org.tensorflow:tensorflow-lite` - TensorFlow Lite
- `com.google.firebase:firebase-*` - Firebase services
- `io.reactivex.rxjava3:rxjava` - RxJava
- `androidx.compose.*` - Jetpack Compose
- `androidx.lifecycle:lifecycle-viewmodel-compose` - ViewModel integration

## Common Tasks

### Adding a New Entity
1. Create entity class in `data/entity/` with @Entity annotation
2. Add DAO interface in `data/dao/` with CRUD operations
3. Update AppDatabase to include the new entity and DAO
4. Create database migration if needed
5. Add repository methods to access the data
6. Update ViewModel to use repository methods

### Adding a New Screen
1. Create Composable function in appropriate package under `ui/`
2. Create ViewModel if complex state management needed
3. Add navigation route if using Navigation Compose
4. Connect to data layer through ViewModel and Repository
5. Follow Material Design 3 patterns

### Integrating a New ML Model
1. Add model file (.tflite) to `assets/` directory
2. Create model wrapper class in `ml/` package
3. Load model asynchronously in initialization
4. Process inputs/outputs according to model specification
5. Handle errors gracefully (model loading failures, inference errors)

## Security Considerations

- Never commit API keys, secrets, or `google-services.json` to repository
- Use environment variables or secure storage for sensitive data
- Validate user inputs before processing
- Use HTTPS for all network requests
- Follow Firebase Security Rules best practices
- Request minimum necessary permissions

## Documentation

- Update README.md when adding major features
- Add inline comments for complex logic only
- Use KDoc comments for public APIs
- Update relevant documentation in `docs/` directory
- Keep documentation concise and up-to-date

## Performance

- Avoid blocking the main thread
- Use background threads for database operations
- Optimize ARCore frame processing
- Minimize recomposition in Compose UI
- Use ProGuard/R8 for release builds
- Profile performance for critical paths

## Contribution Workflow

1. Make minimal, focused changes
2. Follow existing code patterns and style
3. Test changes locally before committing
4. Ensure the app builds successfully
5. Run existing tests and verify they pass
6. Update documentation if needed
7. Write clear commit messages

## Known Limitations

- Requires ARCore-compatible Android device for 3D scanning features
- ML features require Android 7.0+ (API level 24)
- Firebase features require internet connectivity for initial sync
- Some ML models require significant storage and memory

## Helpful Resources

- [ARCore Developer Guide](https://developers.google.com/ar/develop)
- [Room Database Documentation](https://developer.android.com/training/data-storage/room)
- [Jetpack Compose Documentation](https://developer.android.com/jetpack/compose)
- [Firebase Documentation](https://firebase.google.com/docs)
- [ML Kit Documentation](https://developers.google.com/ml-kit)
- [TensorFlow Lite Guide](https://www.tensorflow.org/lite)
- [Kotlin Coroutines Guide](https://kotlinlang.org/docs/coroutines-guide.html)
