# Room Scanner - 3D Room Scanning Android App

A professional Android application for 3D room scanning with ARCore, ML-based damage detection, offline storage, and cloud synchronization.

## 🚀 Features

- **ARCore 3D Scanning**: Real-time room scanning with plane detection and measurements
- **ML Kit Analysis**: On-device AI for detecting damaged areas and estimating material types
- **Room Database**: Offline-first architecture with reactive data flow
- **Firebase Integration**: Cloud backup and synchronization for scans and notes
- **Jetpack Compose**: Modern Material Design 3 UI
- **RxJava Data Flow**: Reactive programming for seamless async operations
- **Drying Plan Generation**: AI-powered recommendations for water damage restoration

## 📱 Tech Stack

- **ARCore** - 3D spatial mapping and measurements
- **ML Kit & TensorFlow Lite** - On-device machine learning
- **Room Database** - Local data persistence with RxJava support
- **Firebase** (Firestore, Storage, Auth) - Cloud synchronization
- **Jetpack Compose** - Modern declarative UI
- **RxJava 3** - Reactive data streams
- **Kotlin Coroutines** - Async/await patterns
- **Material Design 3** - Latest design components

## 📖 Documentation

- **[ARCHITECTURE.md](ARCHITECTURE.md)** - Complete architecture overview and data flow
- **[SAMPLE_INTEGRATION.md](SAMPLE_INTEGRATION.md)** - Sample code for wiring up ARCore, Firebase, and RxJava

## 🏗️ Project Structure

```
app/src/main/java/com/roomscanner/app/
├── data/                      # Data layer (Room, Firebase, Repository)
├── domain/                    # Business logic (Use Cases)
├── ui/                        # Jetpack Compose UI screens
├── arcore/                    # ARCore integration
├── ml/                        # ML Kit integration
├── MainActivity.kt
└── RoomScannerApplication.kt
```

## 🛠️ Setup

### Prerequisites

1. Android Studio Hedgehog or newer
2. Android SDK 26+
3. ARCore-compatible device for testing
4. Firebase account (for cloud features)

### Firebase Configuration

1. Create a Firebase project at [firebase.google.com](https://firebase.google.com)
2. Add an Android app with package name: `com.roomscanner.app`
3. Download `google-services.json` and place in `app/` directory
4. Enable Firestore, Storage, and Authentication in Firebase Console

### Build

```bash
git clone https://github.com/kratos0686/Android2.0roomscanner.git
cd Android2.0roomscanner
./gradlew build
```

### Run

1. Connect an ARCore-compatible Android device
2. Open project in Android Studio
3. Sync Gradle files
4. Run the app

## 📚 Key Components

### ARCore Integration
- **File**: `app/src/main/java/com/roomscanner/app/arcore/ARCoreManager.kt`
- Features: Plane detection, point cloud collection, distance measurements

### ML Kit Analysis
- **File**: `app/src/main/java/com/roomscanner/app/ml/MLKitAnalyzer.kt`
- Features: Damage detection, material type estimation, confidence scoring

### Room Database
- **Files**: `app/src/main/java/com/roomscanner/app/data/`
- Features: Offline storage, reactive queries, type converters

### Firebase Sync
- **File**: `app/src/main/java/com/roomscanner/app/data/FirebaseSyncService.kt`
- Features: Background sync, conflict resolution, image uploads

## 💡 Usage Example

```kotlin
// Complete scan workflow with RxJava
val useCase = CreateRoomScanUseCase(repository, mlKitAnalyzer)
useCase.execute(roomName, dimensions, pointCloudData, capturedImages)
    .subscribeOn(Schedulers.io())
    .observeOn(AndroidSchedulers.mainThread())
    .subscribe(
        { scanId -> println("Scan saved: $scanId") },
        { error -> println("Error: ${error.message}") }
    )
```

## 🧪 Testing

```bash
# Unit tests
./gradlew test

# Instrumented tests
./gradlew connectedAndroidTest
```

## 📄 License

See LICENSE file for details.

## 🤝 Contributing

Pull requests are welcome! Please open an issue first to discuss proposed changes.

## 📞 Support

For issues and questions, please open a GitHub issue.
