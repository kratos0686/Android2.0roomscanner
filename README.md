# Room Scanner - Android 3D Room Scanning App

A modern Android application for 3D room scanning using ARCore, with offline storage, ML-powered analysis, and cloud synchronization.

## Features

### 🏠 ARCore 3D Scanning
- Real-time 3D room scanning
- Automatic plane detection (floors, walls, ceilings)
- Room dimension extraction
- Point cloud data capture
- Mesh data generation

### 🗄️ Offline Storage with Room Database
- Local SQLite database for offline-first architecture
- Store scan data and job notes
- Support for Kotlin Coroutines and RxJava
- Automatic backup configuration
- Foreign key relationships and cascading deletes

### 🤖 ML Kit & TensorFlow Lite Integration
- Object detection in room scans
- Image labeling for material identification
- Custom TFLite models for damage detection
- GPU/NNAPI acceleration support
- On-device inference for privacy

### ☁️ Firebase Integration
- **Firestore**: Cloud database sync
- **Cloud Functions**: Serverless processing (report generation, cost estimation)
- **Storage**: Upload point clouds, mesh data, and images
- **ML Model Download**: Dynamic model updates

### 📝 Job Notes & Annotations
- Add notes to specific locations in scans
- Categorize notes (damage, measurements, materials)
- Offline storage with cloud sync
- Position tracking in 3D space

### 🎨 Modern UI with Jetpack Compose
- Material Design 3
- Reactive UI updates
- Navigation between screens
- Responsive layouts

### ⚡ Reactive Programming
- RxJava 3 support for reactive streams
- Kotlin Coroutines and Flow
- Seamless integration between both paradigms

## Architecture

The app follows a clean, layered architecture:

```
UI Layer (Compose) → ViewModel → Repository → Data Sources
                                              ├─ Room DB (Local)
                                              ├─ Firebase (Cloud)
                                              ├─ ML Kit
                                              └─ ARCore
```

See [ARCHITECTURE.md](docs/ARCHITECTURE.md) for detailed architecture documentation.

## Prerequisites

- Android Studio Arctic Fox or later
- Android device with ARCore support ([check compatibility](https://developers.google.com/ar/devices))
- Android 7.0 (API level 24) or higher
- Camera permissions
- Google account for Firebase setup

## Setup Instructions

### 1. Clone the Repository

```bash
git clone https://github.com/kratos0686/Android2.0roomscanner.git
cd Android2.0roomscanner
```

### 2. Firebase Setup

1. Create a Firebase project in [Firebase Console](https://console.firebase.google.com/)
2. Add an Android app with package name `com.roomscanner.app`
3. Download `google-services.json` and place it in `app/` directory
4. Enable Firestore, Storage, and Cloud Functions

See [FIREBASE_SETUP.md](docs/FIREBASE_SETUP.md) for detailed Firebase configuration.

### 3. Build the Project

```bash
./gradlew build
```

### 4. Run on Device

1. Enable Developer Options on your Android device
2. Enable USB Debugging
3. Connect device via USB
4. Run from Android Studio or:

```bash
./gradlew installDebug
```

## Project Structure

```
app/
├── src/main/java/com/roomscanner/app/
│   ├── data/
│   │   ├── entity/          # Room entities (ScanEntity, NoteEntity)
│   │   ├── dao/             # Data Access Objects
│   │   ├── repository/      # Repository layer
│   │   └── AppDatabase.kt   # Room database
│   ├── arcore/              # ARCore integration
│   │   ├── ARCoreSessionManager.kt
│   │   └── ScanDataProcessor.kt
│   ├── ml/                  # Machine Learning
│   │   ├── MLKitDetector.kt
│   │   └── TFLiteModelRunner.kt
│   ├── firebase/            # Firebase integration
│   │   ├── FirestoreSync.kt
│   │   ├── CloudFunctionsClient.kt
│   │   └── StorageManager.kt
│   ├── ui/                  # UI components
│   │   └── theme/
│   └── MainActivity.kt      # Main activity
├── src/main/res/
│   ├── values/
│   ├── xml/
│   └── ...
└── build.gradle.kts

docs/                        # Documentation
├── ARCHITECTURE.md          # Architecture overview
├── ROOM_DATABASE.md         # Room DB integration guide
├── FIREBASE_SETUP.md        # Firebase setup guide
├── ARCORE_INTEGRATION.md    # ARCore integration guide
└── TFLITE_DEPLOYMENT.md     # TFLite model deployment guide
```

## Key Components

### Room Database

Offline-first storage for scan data:

```kotlin
@Entity(tableName = "scans")
data class ScanEntity(
    @PrimaryKey(autoGenerate = true)
    val id: Long = 0,
    val roomName: String,
    val length: Float,
    val width: Float,
    val height: Float,
    val pointCloudPath: String?,
    val isSynced: Boolean = false
)
```

See [ROOM_DATABASE.md](docs/ROOM_DATABASE.md) for detailed usage.

### ARCore Integration

3D scanning with ARCore:

```kotlin
val sessionManager = ARCoreSessionManager(context)
val session = sessionManager.createSession()

val frame = session.update()
val dimensions = dataProcessor.extractRoomDimensions(frame)
```

See [ARCORE_INTEGRATION.md](docs/ARCORE_INTEGRATION.md) for detailed integration.

### ML Kit

Object detection and image labeling:

```kotlin
val mlKit = MLKitDetector(context)
val objects = mlKit.detectObjects(bitmap)
val labels = mlKit.labelImage(bitmap)
```

### TensorFlow Lite

Custom model inference:

```kotlin
val modelRunner = TFLiteModelRunner(context)
modelRunner.loadModel("damage_detector.tflite")
val damage = modelRunner.detectDamage(bitmap)
```

See [TFLITE_DEPLOYMENT.md](docs/TFLITE_DEPLOYMENT.md) for model deployment.

### Firebase Sync

Cloud synchronization:

```kotlin
val firestoreSync = FirestoreSync()
val firebaseId = firestoreSync.uploadScan(scan)

val cloudFunctions = CloudFunctionsClient()
val report = cloudFunctions.generatePDFReport(scanId)
```

See [FIREBASE_SETUP.md](docs/FIREBASE_SETUP.md) for setup and usage.

## Usage Examples

### Creating a Scan

```kotlin
viewModelScope.launch {
    val scan = ScanEntity(
        roomName = "Living Room",
        length = 5.0f,
        width = 4.0f,
        height = 2.5f
    )
    val scanId = repository.insertScan(scan)
}
```

### Adding Notes

```kotlin
viewModelScope.launch {
    val note = NoteEntity(
        scanId = scanId,
        title = "Damage Found",
        content = "Water damage on north wall",
        category = "damage"
    )
    repository.insertNote(note)
}
```

### Observing Data with Flow

```kotlin
repository.getAllScans()
    .collect { scans ->
        // Update UI with scans
    }
```

### Observing Data with RxJava

```kotlin
repository.getAllScansRx()
    .subscribeOn(Schedulers.io())
    .observeOn(AndroidSchedulers.mainThread())
    .subscribe { scans ->
        // Update UI with scans
    }
```

## Documentation

Comprehensive guides are available in the `docs/` directory:

- **[Architecture Overview](docs/ARCHITECTURE.md)** - System design and component responsibilities
- **[Room Database Integration](docs/ROOM_DATABASE.md)** - Local storage guide
- **[Firebase Setup](docs/FIREBASE_SETUP.md)** - Cloud services configuration
- **[ARCore Integration](docs/ARCORE_INTEGRATION.md)** - 3D scanning implementation
- **[TFLite Deployment](docs/TFLITE_DEPLOYMENT.md)** - ML model deployment and optimization

## Dependencies

Key dependencies used in this project:

- **Jetpack Compose** - Modern UI toolkit
- **Room** - Local database
- **ARCore** - 3D scanning
- **ML Kit** - Object detection and labeling
- **TensorFlow Lite** - Custom ML models
- **Firebase** - Cloud services (Firestore, Functions, Storage)
- **RxJava 3** - Reactive programming
- **Kotlin Coroutines** - Asynchronous programming

See [build.gradle.kts](app/build.gradle.kts) for complete dependency list.

## Testing

Run tests:

```bash
# Unit tests
./gradlew test

# Instrumentation tests
./gradlew connectedAndroidTest
```

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License.

## Resources

- [ARCore Developer Guide](https://developers.google.com/ar/develop)
- [Room Database Documentation](https://developer.android.com/training/data-storage/room)
- [Firebase Documentation](https://firebase.google.com/docs)
- [ML Kit Documentation](https://developers.google.com/ml-kit)
- [TensorFlow Lite Guide](https://www.tensorflow.org/lite)
- [Jetpack Compose](https://developer.android.com/jetpack/compose)

## Support

For issues, questions, or contributions, please open an issue on GitHub.

## Acknowledgments

- Google ARCore team for 3D scanning capabilities
- Firebase team for cloud services
- TensorFlow team for ML frameworks
- Android Jetpack team for modern development tools
