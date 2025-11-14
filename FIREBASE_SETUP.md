# Firebase Configuration Template

This file is a template for configuring Firebase in your Room Scanner app.
Follow the instructions in README.md to set up Firebase properly.

## Required Files

### Android
- File: `google-services.json`
- Location: `android/app/google-services.json`
- How to get: Download from Firebase Console > Project Settings > Your Android app

### iOS
- File: `GoogleService-Info.plist`
- Location: `ios/Runner/GoogleService-Info.plist`
- How to get: Download from Firebase Console > Project Settings > Your iOS app

## Quick Setup with FlutterFire CLI

```bash
# Install FlutterFire CLI
dart pub global activate flutterfire_cli

# Configure Firebase (this will generate firebase_options.dart)
flutterfire configure
```

This will:
1. Create a Firebase project (or select existing)
2. Register your Flutter app
3. Download configuration files
4. Generate `lib/firebase_options.dart`

## Manual Setup

If you prefer manual setup:

1. Create Firebase project at https://console.firebase.google.com/
2. Add Android app with package: `com.roomscanner.app`
3. Add iOS app with bundle ID: `com.roomscanner.app`
4. Download and place configuration files
5. Enable required services:
   - Authentication (Enable Anonymous sign-in)
   - Cloud Firestore (Create database)
   - Firebase Storage (Set up storage bucket)
   - Analytics (Optional)

## Testing Without Firebase

The app will run without Firebase configuration, but will show "Firebase Not Configured" status.
Firebase features will not be available until properly configured.
