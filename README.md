# Android AR Room Scanner

An Android application for 3D room scanning using ARCore and Machine Learning.

## Overview

This AR Room Scanner application uses Google's ARCore to scan and map indoor spaces in 3D. It leverages TensorFlow Lite for on-device machine learning to process and analyze the scanned environment.

## Features

- **ARCore Integration**: Real-time AR tracking and environment understanding
- **Point Cloud Capture**: Captures 3D point cloud data from the environment
- **ML Model Support**: TensorFlow Lite model integration for enhanced scene understanding
- **Modern UI**: Built with Jetpack Compose for a reactive, modern Android UI
- **Camera Permissions**: Automatic camera permission handling
- **ARCore Compatibility Check**: Validates device support before running

## Project Structure

```
ARRoomScannerApp/
├── app/
│   ├── build.gradle                    # App-level build configuration
│   ├── proguard-rules.pro             # ProGuard rules for code obfuscation
│   └── src/
│       └── main/
│           ├── AndroidManifest.xml     # App manifest with AR permissions
│           ├── java/com/example/arroomscanner/
│           │   ├── MainActivity.kt      # Main entry point with permission handling
│           │   ├── ScannerViewModel.kt  # ViewModel for AR session management
│           │   └── ScannerScreen.kt     # Compose UI for AR scanning interface
│           ├── res/
│           │   ├── layout/             # Layout resources
│           │   ├── values/             # String, color, and theme resources
│           │   ├── drawable/           # Drawable resources
│           │   └── mipmap-*/           # App launcher icons
│           ├── assets/                 # Application assets
│           └── ml/                     # TensorFlow Lite ML models (*.tflite)
├── build.gradle                        # Project-level build configuration
├── settings.gradle                     # Project settings
└── gradlew                            # Gradle wrapper script
```

## Requirements

- **Android Studio**: Arctic Fox (2020.3.1) or newer
- **Minimum SDK**: API 24 (Android 7.0 Nougat)
- **Target SDK**: API 34 (Android 14)
- **ARCore**: Device must support ARCore
- **Camera**: Device must have a camera

## Setup Instructions

1. **Clone the repository**:
   ```bash
   git clone https://github.com/kratos0686/Android2.0roomscanner.git
   cd Android2.0roomscanner
   ```

2. **Open in Android Studio**:
   - Open Android Studio
   - Select "Open an Existing Project"
   - Navigate to the cloned repository

3. **Sync Gradle**:
   - Android Studio will automatically start syncing Gradle
   - Wait for the sync to complete

4. **Add ML Models** (Optional):
   - Place your TensorFlow Lite models (`.tflite` files) in `app/src/main/ml/`
   - Android Studio will automatically generate Kotlin bindings for the models
   - Update `ScannerViewModel.kt` to load and use your specific models

5. **Run the App**:
   - Connect an ARCore-compatible Android device
   - Click the "Run" button in Android Studio
   - Grant camera permissions when prompted

## Key Dependencies

- **ARCore**: `com.google.ar:core:1.40.0` - Google's AR platform
- **TensorFlow Lite**: `org.tensorflow:tensorflow-lite:2.13.0` - On-device ML inference
- **Jetpack Compose**: Modern declarative UI framework
- **CameraX**: Camera access and control
- **AndroidX Core**: Core Android libraries

## Usage

1. Launch the app on an ARCore-compatible device
2. Grant camera permissions when prompted
3. Point the camera at the room you want to scan
4. Tap "Start Scan" to begin capturing the environment
5. Move the device slowly to capture different angles
6. The app will collect point cloud data and process it with ML models
7. Tap "Stop Scan" when finished

## Adding ML Models

To add custom TensorFlow Lite models:

1. Place your `.tflite` model file in `app/src/main/ml/`
2. Android Studio will generate a model class automatically
3. In `ScannerViewModel.kt`, modify the `loadMLModel()` function:
   ```kotlin
   private fun loadMLModel() {
       viewModelScope.launch {
           try {
               val model = YourModel.newInstance(context)
               _mlModelLoaded.value = true
           } catch (e: Exception) {
               _scanningState.value = ScanningState.Error("Failed to load ML model: ${e.message}")
           }
       }
   }
   ```

## Architecture

The app follows the MVVM (Model-View-ViewModel) architecture pattern:

- **MainActivity**: Entry point, handles permissions and initializes the UI
- **ScannerViewModel**: Manages AR session state, point cloud data, and ML model inference
- **ScannerScreen**: Compose UI that observes ViewModel state and provides user controls

## Permissions

The app requires the following permissions:
- `android.permission.CAMERA` - Required for AR tracking

## ARCore Features Used

- **Motion Tracking**: Track device position and orientation
- **Environmental Understanding**: Detect horizontal and vertical surfaces
- **Depth API**: Automatic depth mode for enhanced scene understanding
- **Point Cloud**: Capture 3D point data from the environment

## Contributing

Contributions are welcome! Please feel free to submit pull requests or open issues for bugs and feature requests.

## License

This project is open source and available under the MIT License.

## Troubleshooting

### ARCore Not Supported
- Ensure your device is on the [ARCore supported devices list](https://developers.google.com/ar/devices)
- Update Google Play Services for AR

### Camera Permission Denied
- Go to Settings > Apps > AR Room Scanner > Permissions
- Enable Camera permission

### Build Errors
- Ensure you have the latest Android Studio version
- Sync Gradle files: File > Sync Project with Gradle Files
- Clean and rebuild: Build > Clean Project, then Build > Rebuild Project

## Contact

For questions or support, please open an issue on GitHub.

