# Android2.0roomscanner
App for 3D room scanning using Android SDK

## Prerequisites
- Android Studio (latest version recommended)
- Android SDK API 34
- JDK 8 or higher
- Gradle 8.0

## Setup Instructions

1. Clone the repository:
   ```bash
   git clone https://github.com/kratos0686/Android2.0roomscanner.git
   cd Android2.0roomscanner
   ```

2. Configure Android SDK path:
   - Copy `local.properties.example` to `local.properties`
   - Update the `sdk.dir` path to point to your Android SDK location

3. Open the project in Android Studio:
   - Open Android Studio
   - Select "Open an existing project"
   - Navigate to the project directory and click OK

4. Build the project:
   ```bash
   ./gradlew build
   ```

5. Run the app:
   - Connect an Android device or start an emulator
   - Click "Run" in Android Studio or use:
   ```bash
   ./gradlew installDebug
   ```

## Project Structure
- `app/` - Main application module
- `app/src/main/java/` - Java source files
- `app/src/main/res/` - Android resources (layouts, drawables, values)
- `app/src/main/AndroidManifest.xml` - App manifest with permissions
- `build.gradle` - Root build configuration
- `app/build.gradle` - App module build configuration

## Features
- Camera access for 3D scanning
- Storage permissions for saving scans
- Material Design UI components

## Permissions
The app requires the following permissions:
- `CAMERA` - For capturing room data
- `READ_EXTERNAL_STORAGE` - For reading scan data
- `WRITE_EXTERNAL_STORAGE` - For saving scan results

## License
This project is licensed under the MIT License.
