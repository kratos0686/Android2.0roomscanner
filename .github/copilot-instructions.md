# GitHub Copilot Instructions for Room Scanner

## Project Overview

Room Scanner is a modern Android application for 3D room scanning using ARCore, with offline storage, ML-powered analysis, and cloud synchronization. This is a Kotlin-based Android project using Jetpack Compose for UI and modern Android architecture patterns.

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

## When Working with This Repository

1. **Start here**: Read README.md and LAUNCH_GUIDE.md
2. **Understand architecture**: Review docs/ARCHITECTURE.md
3. **Build first**: Run `./gradlew build` to ensure clean state
4. **Make minimal changes**: Only modify what's necessary for the task
5. **Test changes**: Run relevant tests after modifications
6. **Check documentation**: Update docs if changing public interfaces
7. **Review before committing**: Ensure changes follow project conventions
