# Room Scanner - Flutter 3D Room Scanner with Firebase

A Flutter application for scanning and creating 3D models of rooms, with Firebase backend integration.

## Features

- 📱 Cross-platform support (Android & iOS)
- 📷 Camera-based 3D room scanning
- ☁️ Firebase integration for data storage
- 🔐 Firebase Authentication
- 💾 Cloud Firestore for scan metadata
- 📦 Firebase Storage for scan files
- 🎨 Material Design 3 UI

## Prerequisites

- Flutter SDK (3.0.0 or higher)
- Dart SDK (3.0.0 or higher)
- Android Studio / Xcode (for mobile development)
- Firebase project

## Firebase Setup

### 1. Create a Firebase Project

1. Go to [Firebase Console](https://console.firebase.google.com/)
2. Create a new project or use an existing one
3. Enable the following services:
   - Authentication (Anonymous sign-in)
   - Cloud Firestore
   - Firebase Storage
   - Analytics (optional)

### 2. Android Configuration

1. In Firebase Console, add an Android app
2. Register your app with package name: `com.roomscanner.app`
3. Download `google-services.json`
4. Place it in `android/app/` directory

### 3. iOS Configuration

1. In Firebase Console, add an iOS app
2. Register your app with bundle ID: `com.roomscanner.app`
3. Download `GoogleService-Info.plist`
4. Place it in `ios/Runner/` directory

### 4. Generate Firebase Options (Optional)

You can use FlutterFire CLI to generate Firebase configuration:

```bash
# Install FlutterFire CLI
dart pub global activate flutterfire_cli

# Configure Firebase
flutterfire configure
```

## Installation

1. Clone the repository:
```bash
git clone https://github.com/kratos0686/Android2.0roomscanner.git
cd Android2.0roomscanner
```

2. Install dependencies:
```bash
flutter pub get
```

3. Run the app:
```bash
# For Android
flutter run

# For iOS
flutter run -d ios

# For web
flutter run -d chrome
```

## Project Structure

```
lib/
├── main.dart                 # App entry point with Firebase initialization
├── screens/
│   └── home_screen.dart      # Main home screen
├── widgets/
│   ├── scan_button.dart      # Scan button widget
│   └── scan_screen.dart      # Camera scan screen
├── services/
│   └── firebase_service.dart # Firebase service layer
└── models/                   # Data models (to be added)
```

## Dependencies

### Core Dependencies
- `firebase_core`: Firebase SDK initialization
- `firebase_auth`: User authentication
- `firebase_storage`: File storage
- `cloud_firestore`: NoSQL database
- `firebase_analytics`: Analytics tracking

### UI & Utilities
- `provider`: State management
- `camera`: Camera access for scanning

### AR/3D Scanning
- `arcore_flutter_plugin`: Android ARCore support
- `arkit_plugin`: iOS ARKit support

## Camera Permissions

### Android
Camera permissions are already configured in `android/app/src/main/AndroidManifest.xml`

### iOS
Camera usage description is configured in `ios/Runner/Info.plist`

## Building for Production

### Android
```bash
flutter build apk --release
# or for app bundle
flutter build appbundle --release
```

### iOS
```bash
flutter build ios --release
```

## Troubleshooting

### Firebase Connection Issues
- Ensure `google-services.json` (Android) or `GoogleService-Info.plist` (iOS) is properly placed
- Check that Firebase services are enabled in Firebase Console
- Verify your app's package/bundle ID matches Firebase configuration

### Camera Not Working
- Check camera permissions are granted
- Ensure device has a camera
- Test on a physical device (camera may not work in emulators)

### Build Errors
```bash
# Clean build
flutter clean
flutter pub get

# For Android
cd android && ./gradlew clean

# For iOS
cd ios && pod install
```

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License.

## Support

For issues and questions, please create an issue in the GitHub repository.

## TODO

- [ ] Implement 3D point cloud generation
- [ ] Add AR measurement tools
- [ ] Implement scan history view
- [ ] Add export functionality (OBJ, STL formats)
- [ ] Implement real-time collaboration
- [ ] Add AI-powered room recognition
