# GitHub Copilot Instructions for Room Scanner

> **Purpose**: This file provides context and guidelines for GitHub Copilot coding agent when working on this repository. It defines the project structure, conventions, build processes, and contribution workflow.
>
> **Reference**: These instructions follow [GitHub Copilot coding agent best practices](https://docs.github.com/en/copilot/tutorials/coding-agent/get-the-best-results).

---

**📱 Room Scanner** is a Kotlin-based Android application for 3D room scanning using ARCore, Jetpack Compose UI, Room database, and Firebase cloud services. Follow MVVM architecture, Material Design 3, and write tests for all new code.

**Quick Start**: `./gradlew build test lint` • **Source**: `app/src/main/java/com/roomscanner/app/` • **Min SDK**: 26

---

## Table of Contents

- [Quick Reference](#quick-reference)
- [How to Use Copilot Coding Agent](#how-to-use-copilot-coding-agent)
- [Project Overview](#project-overview)
- [Technology Stack](#technology-stack)
- [Project Structure](#project-structure)
- [Building and Testing](#building-and-testing)
- [Code Conventions](#code-conventions)
- [File Modifications](#file-modifications)
- [Important Configuration Files](#important-configuration-files)
- [Dependencies Management](#dependencies-management)
- [Common Tasks](#common-tasks)
- [Documentation](#documentation)
- [Security Considerations](#security-considerations)
- [Debugging Tips](#debugging-tips)
- [Performance Best Practices](#performance-best-practices)
- [Common Build Issues and Solutions](#common-build-issues-and-solutions)
- [Contribution Workflow for Copilot](#contribution-workflow-for-copilot)
- [Testing Requirements](#testing-requirements)
- [Commit Message Format](#commit-message-format)

## Quick Reference

### Essential Commands
```bash
# Build and test
./gradlew build                    # Full build
./gradlew test                     # Run unit tests
./gradlew lint                     # Code quality checks
./gradlew check                    # All checks (test + lint)

# Install and run
./gradlew installDebug             # Install on device
./gradlew assembleDebug            # Build APK

# Clean build
./gradlew clean build              # Fresh build
```

### Key Paths
- **Source code**: `app/src/main/java/com/roomscanner/app/`
- **Tests**: `app/src/test/` (unit) and `app/src/androidTest/` (instrumentation)
- **Resources**: `app/src/main/res/`
- **Documentation**: `docs/` directory
- **Firebase config**: `app/google-services.json` (use `.example` template)

### Package Structure
- `data/entity/` - Room database entities
- `data/dao/` - Data Access Objects
- `data/repository/` - Repository layer
- `arcore/` - AR scanning features
- `ml/` - Machine learning models
- `firebase/` - Cloud integration
- `ui/` - Compose UI components

## How to Use Copilot Coding Agent

### Assigning Issues to @copilot

GitHub Copilot coding agent can help with various development tasks in this repository. To use it:

1. **Assign an issue to @copilot** on GitHub
2. The agent will create a pull request with the proposed changes
3. Review the PR and provide feedback by mentioning @copilot in comments
4. The agent will iterate based on your feedback
5. Approve and merge once satisfied

### Appropriate Tasks for Copilot

Copilot coding agent works best on **low-to-medium complexity tasks**:

✅ **Good Tasks:**
- Bug fixes with clear reproduction steps
- Adding new features to existing components
- Writing or updating tests
- Refactoring specific code sections
- Documentation updates and improvements
- Adding new database entities or DAOs
- Implementing new UI screens with Compose
- Integrating new Firebase features
- Adding new ML models or detectors

❌ **Avoid Using Copilot For:**
- Large-scale architecture changes
- Complex ARCore low-level modifications
- Critical security implementations
- Deep domain-specific business logic
- Cross-repository refactoring
- Tasks requiring extensive manual testing on physical devices
- Breaking changes to public APIs without careful review

### Writing Good Issue Descriptions

For best results when assigning issues to Copilot:

- **Be specific**: Clearly describe what needs to be done
- **Provide context**: Link to relevant code, documentation, or issues
- **Set expectations**: Specify acceptance criteria and testing requirements
- **Include examples**: Show expected input/output or behavior
- **Mention constraints**: Note any specific requirements or limitations

### Iterating with Copilot

After Copilot creates a PR:

- **Review carefully**: All changes should be reviewed before merging
- **Provide feedback**: Comment on specific lines or mention @copilot for broader feedback
- **Request changes**: Ask for specific modifications by mentioning @copilot
- **Approve when ready**: Ensure all CI checks pass before merging

### Custom Agents (Optional)

This repository can optionally use custom Copilot agents for specialized tasks. Custom agents would be defined in `.github/agents/` directory with specific prompts and tool access. Currently, no custom agents are configured, but they can be added for:

- Specialized testing workflows
- Documentation generation
- Code review automation
- Domain-specific code generation

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
- Prefer immutability (`val` over `var`)
- Use trailing commas in multiline declarations
- Keep functions small and focused (max ~30 lines)

**Example:**
```kotlin
// ✅ Good: Immutable data class with trailing comma
data class ScanEntity(
    val id: Long,
    val roomName: String,
    val timestamp: Long,
    val isSynced: Boolean,
)

// ❌ Avoid: Mutable properties
data class ScanEntity(
    var id: Long,
    var roomName: String,
)
```

### Naming Conventions
- **Classes**: PascalCase (e.g., `ScanEntity`, `ARCoreSessionManager`)
- **Functions**: camelCase (e.g., `insertScan`, `detectObjects`)
- **Properties**: camelCase (e.g., `roomName`, `isSynced`)
- **Constants**: UPPER_SNAKE_CASE (e.g., `DATABASE_NAME`, `MAX_RETRIES`)
- **Resources**: snake_case (e.g., `activity_main`, `scan_item`)

**Example:**
```kotlin
// ✅ Good naming
class ScanRepository {
    companion object {
        private const val DATABASE_NAME = "room_scanner.db"
    }
    
    suspend fun insertScan(entity: ScanEntity): Long = TODO()
    fun getAllScans(): Flow<List<ScanEntity>> = TODO()
}
```

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

**Example:**
```kotlin
// ✅ Good: State hoisting and remember
@Composable
fun ScanListScreen(
    viewModel: ScanViewModel = hiltViewModel()
) {
    val scans by viewModel.scans.collectAsState()
    val uiState by viewModel.uiState.collectAsState()
    
    ScanListContent(
        scans = scans,
        uiState = uiState,
        onScanClick = viewModel::onScanSelected,
    )
}

@Composable
private fun ScanListContent(
    scans: List<Scan>,
    uiState: UiState,
    onScanClick: (Long) -> Unit,
) {
    LazyColumn {
        items(scans) { scan ->
            ScanItem(
                scan = scan,
                onClick = { onScanClick(scan.id) }
            )
        }
    }
}

// ✅ Good: Use Preview annotations
@Preview(showBackground = true)
@Composable
private fun ScanItemPreview() {
    RoomScannerTheme {
        ScanItem(
            scan = Scan(id = 1, name = "Living Room", timestamp = 0L),
            onClick = {}
        )
    }
}
```

### Error Handling
- Use `Result` type for operations that can fail
- Provide meaningful error messages
- Log errors with appropriate tags
- Handle network failures gracefully (offline-first)
- Show user-friendly error messages in UI
- Use try-catch for expected exceptions
- Let unexpected exceptions crash (fail fast)

**Example:**
```kotlin
// ✅ Good: Using Result type
suspend fun syncScanToCloud(scanId: Long): Result<Unit> {
    return try {
        val scan = scanDao.getScanById(scanId)
        firestoreSync.uploadScan(scan)
        Result.success(Unit)
    } catch (e: NetworkException) {
        Log.e(TAG, "Network error syncing scan $scanId", e)
        Result.failure(e)
    }
}

// ✅ Good: ViewModel handling Result
viewModelScope.launch {
    repository.syncScanToCloud(scanId).fold(
        onSuccess = { _ -> _uiState.value = UiState.Success },
        onFailure = { error -> 
            Log.e(TAG, "Sync failed", error)
            _uiState.value = UiState.Error("Sync failed. Try again later.")
        }
    )
}
```

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

**Example:**
```kotlin
// ✅ Good: Entity with proper annotations
@Entity(tableName = "scans")
data class ScanEntity(
    @PrimaryKey(autoGenerate = true) val id: Long = 0,
    @ColumnInfo(name = "room_name") val roomName: String,
    @ColumnInfo(name = "created_at") val createdAt: Long,
    @ColumnInfo(name = "is_synced") val isSynced: Boolean = false,
)

// ✅ Good: DAO with both suspend and Flow support
@Dao
interface ScanDao {
    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertScan(scan: ScanEntity): Long
    
    @Query("SELECT * FROM scans WHERE id = :id")
    suspend fun getScanById(id: Long): ScanEntity?
    
    @Query("SELECT * FROM scans ORDER BY created_at DESC")
    fun getAllScans(): Flow<List<ScanEntity>>
}
```

> ⚠️ **Important**: Always increment database version and provide migration when modifying entities or adding new tables.

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

**Example:**
```kotlin
// 1. Create entity
@Entity(tableName = "notes")
data class NoteEntity(
    @PrimaryKey(autoGenerate = true) val id: Long = 0,
    val scanId: Long,
    val content: String,
    val createdAt: Long,
)

// 2. Create DAO
@Dao
interface NoteDao {
    @Insert
    suspend fun insertNote(note: NoteEntity): Long
    
    @Query("SELECT * FROM notes WHERE scanId = :scanId")
    fun getNotesForScan(scanId: Long): Flow<List<NoteEntity>>
}

// 3. Update AppDatabase
@Database(
    entities = [ScanEntity::class, NoteEntity::class],
    version = 2  // Increment version!
)
abstract class AppDatabase : RoomDatabase() {
    abstract fun scanDao(): ScanDao
    abstract fun noteDao(): NoteDao
}

// 4. Add migration
val MIGRATION_1_2 = object : Migration(1, 2) {
    override fun migrate(database: SupportSQLiteDatabase) {
        database.execSQL("""
            CREATE TABLE IF NOT EXISTS notes (
                id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
                scanId INTEGER NOT NULL,
                content TEXT NOT NULL,
                createdAt INTEGER NOT NULL
            )
        """)
    }
}
```

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

> 🔒 **Critical**: Never commit sensitive data to the repository. Always review changes before committing.

- Never commit `google-services.json` with production keys
- Use `.gitignore` to exclude sensitive files
- Validate user input before database operations
- Sanitize data before Firebase uploads
- Use ProGuard/R8 for release builds
- Check permissions at runtime for camera and storage

**Security Checklist:**
- [ ] No API keys or secrets in code
- [ ] Production `google-services.json` not committed
- [ ] User input validated and sanitized
- [ ] Permissions checked at runtime
- [ ] ProGuard rules configured for release
- [ ] Firebase security rules properly configured

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

**Example Unit Test:**
```kotlin
@Test
fun insertScan_validData_returnsId() = runTest {
    // Arrange
    val scan = ScanEntity(
        roomName = "Living Room",
        createdAt = System.currentTimeMillis(),
        isSynced = false
    )
    
    // Act
    val id = scanDao.insertScan(scan)
    
    // Assert
    assertThat(id).isGreaterThan(0)
    val retrieved = scanDao.getScanById(id)
    assertThat(retrieved?.roomName).isEqualTo("Living Room")
}

@Test
fun syncScan_networkError_returnsFailure() = runTest {
    // Arrange
    val repository = ScanRepository(scanDao, mockFirestore)
    coEvery { mockFirestore.uploadScan(any()) } throws NetworkException()
    
    // Act
    val result = repository.syncScanToCloud(scanId = 1)
    
    // Assert
    assertThat(result.isFailure).isTrue()
}
```

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
- `perf`: Performance improvements
- `ci`: CI/CD changes

**Examples:**
```bash
# Feature addition
feat(database): add support for scan metadata
feat(ui): implement scan detail screen with Compose

# Bug fix
fix(arcore): resolve camera permission crash on Android 13
fix(firebase): handle offline mode for Firestore sync

# Documentation
docs(readme): update Firebase setup instructions
docs(architecture): add sequence diagram for scan flow

# Testing
test(scan-dao): add tests for delete operations
test(ml): add unit tests for object detection

# Refactoring
refactor(repository): simplify scan sync logic
refactor(ui): extract common Composable functions

# Multiple changes (use body)
feat(scan): add support for room annotations

- Add NoteEntity and NoteDao for annotations
- Implement note creation in scan detail screen
- Add Firebase sync for notes

Closes #123
```

> 💡 **Tip**: Use `git commit -v` to see the diff while writing commit message for context.

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

## Copilot Security and Sandboxing

### Sandboxed Environment

GitHub Copilot coding agent operates in a sandboxed environment with the following characteristics:

- **Branch Isolation**: All changes are made to a dedicated branch (e.g., `copilot/*`)
- **No Direct Merge**: Cannot merge to main branch; requires human approval
- **Pull Request Workflow**: All changes go through PR review process
- **CI/CD Integration**: Automated checks run on PRs before merge
- **Limited Permissions**: Restricted access to sensitive operations

### Security Best Practices

When working with Copilot on this repository:

1. **Never commit secrets**: Check `.gitignore` includes sensitive files
   - `app/google-services.json` with production credentials
   - Local configuration files
   - API keys or tokens

2. **Review Firebase changes**: Ensure proper security rules and validation
   - Firestore security rules
   - Storage access controls
   - Cloud Functions authentication

3. **Validate dependencies**: Check for vulnerabilities before adding new packages
   - Use GitHub's dependency scanning
   - Review package reputation and maintenance
   - Test thoroughly after updates

4. **Protect user data**: Follow privacy best practices
   - Validate input before database operations
   - Sanitize data before cloud uploads
   - Handle PII appropriately

5. **Test security changes**: Always test authentication and authorization
   - Camera permissions handling
   - Storage permissions
   - Firebase authentication flows

## When Working with This Repository

### Quick Start Checklist

When starting a new task, follow this workflow:

1. ✅ **Start here**: Read README.md and LAUNCH_GUIDE.md
2. ✅ **Understand architecture**: Review docs/ARCHITECTURE.md
3. ✅ **Verify build**: Run `./gradlew build` to ensure clean state
4. ✅ **Run tests**: Execute `./gradlew test` to check baseline
5. ✅ **Plan changes**: Identify minimal changes needed
6. ✅ **Make changes**: Follow existing patterns and conventions
7. ✅ **Test locally**: Run relevant tests after modifications
8. ✅ **Check quality**: Run `./gradlew lint` before committing
9. ✅ **Update docs**: If changing public interfaces
10. ✅ **Review**: Self-review before submitting PR

### First-Time Setup
```bash
# Clone and navigate
git clone https://github.com/kratos0686/Android2.0roomscanner.git
cd Android2.0roomscanner

# Setup Firebase (use example file)
cp app/google-services.json.example app/google-services.json

# Verify build works
./gradlew build

# Run tests
./gradlew test
```

### Common Development Workflow
```bash
# Create feature branch
git checkout -b feature/my-feature

# Make changes, then verify
./gradlew build test lint

# Commit with conventional format
git commit -m "feat(scope): description"

# Push and create PR
git push origin feature/my-feature
```

> 💡 **Pro Tip**: Keep changes small and focused. One issue = one PR with minimal, surgical changes.
