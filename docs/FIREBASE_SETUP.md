# Firebase Setup Guide

This guide will help you configure Firebase for the Room Scanner app to enable cloud synchronization, authentication, and storage features.

## Prerequisites

- Google account
- Android Studio installed
- Room Scanner project cloned and opened in Android Studio

## Step 1: Create Firebase Project

1. Go to [Firebase Console](https://console.firebase.google.com)
2. Click **"Add project"** or **"Create a project"**
3. Enter project name: `room-scanner-app` (or your preferred name)
4. Click **Continue**
5. (Optional) Enable Google Analytics if desired
6. Click **Create project**
7. Wait for project creation to complete

## Step 2: Add Android App to Firebase Project

1. In Firebase Console, click the **Android icon** to add an Android app
2. Enter the following details:
   - **Android package name**: `com.roomscanner.app`
   - **App nickname** (optional): `Room Scanner`
   - **Debug signing certificate SHA-1** (optional, but recommended for Auth)
3. Click **Register app**

### Getting SHA-1 Certificate (Optional but Recommended)

For authentication features, you'll need your SHA-1 certificate:

```bash
# On Windows (Command Prompt or PowerShell)
cd C:\Users\YOUR_USERNAME\.android
keytool -list -v -keystore debug.keystore -alias androiddebugkey -storepass android -keypass android

# On macOS/Linux (Terminal)
keytool -list -v -keystore ~/.android/debug.keystore -alias androiddebugkey -storepass android -keypass android
```

Copy the SHA-1 value and paste it in Firebase Console.

## Step 3: Download google-services.json

1. After registering the app, click **"Download google-services.json"**
2. Move the downloaded file to your project's `app/` directory:
   ```
   Android2.0roomscanner/
   └── app/
       └── google-services.json  ← Place file here
   ```
3. Click **Next** in Firebase Console

## Step 4: Enable Firebase Services

### 4.1 Enable Authentication

1. In Firebase Console, go to **Build** → **Authentication**
2. Click **Get started**
3. Enable sign-in methods:
   - **Email/Password**: Toggle ON
   - **Google**: Toggle ON (recommended)
4. Click **Save**

### 4.2 Enable Cloud Firestore

1. Go to **Build** → **Firestore Database**
2. Click **Create database**
3. Select **Start in test mode** (for development)
   ```
   rules_version = '2';
   service cloud.firestore {
     match /databases/{database}/documents {
       match /{document=**} {
         allow read, write: if request.time < timestamp.date(2025, 12, 31);
       }
     }
   }
   ```
4. Choose a Cloud Firestore location (e.g., `us-central1`)
5. Click **Enable**

### 4.3 Enable Cloud Storage

1. Go to **Build** → **Storage**
2. Click **Get started**
3. Select **Start in test mode**
   ```
   rules_version = '2';
   service firebase.storage {
     match /b/{bucket}/o {
       match /{allPaths=**} {
         allow read, write: if request.time < timestamp.date(2025, 12, 31);
       }
     }
   }
   ```
4. Choose a Cloud Storage location (same as Firestore)
5. Click **Done**

## Step 5: Update Security Rules (Production)

### Firestore Security Rules (Production)

Replace test mode rules with production-ready rules:

```javascript
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    // Users can read/write their own data
    match /users/{userId} {
      allow read, write: if request.auth != null && request.auth.uid == userId;
    }
    
    // Room scans - users can only access their own scans
    match /scans/{scanId} {
      allow read, write: if request.auth != null && resource.data.userId == request.auth.uid;
    }
    
    // Mitigate exports
    match /mitigate_exports/{exportId} {
      allow read, write: if request.auth != null && resource.data.userId == request.auth.uid;
    }
  }
}
```

### Storage Security Rules (Production)

```javascript
rules_version = '2';
service firebase.storage {
  match /b/{bucket}/o {
    // User uploads - organized by userId
    match /scans/{userId}/{allPaths=**} {
      allow read, write: if request.auth != null && request.auth.uid == userId;
    }
    
    // Public scan thumbnails
    match /thumbnails/{allPaths=**} {
      allow read: if true;
      allow write: if request.auth != null;
    }
  }
}
```

## Step 6: Configure App Dependencies

The app already includes Firebase dependencies in `app/build.gradle`:

```gradle
dependencies {
    // Firebase
    implementation platform('com.google.firebase:firebase-bom:32.7.0')
    implementation 'com.google.firebase:firebase-auth'
    implementation 'com.google.firebase:firebase-firestore'
    implementation 'com.google.firebase:firebase-storage'
    implementation 'com.google.firebase:firebase-analytics'
}
```

## Step 7: Initialize Firebase in Your App

Firebase is automatically initialized when you add `google-services.json`. To manually initialize or configure:

```java
// In MainActivity or Application class
import com.google.firebase.FirebaseApp;
import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.firestore.FirebaseFirestore;
import com.google.firebase.storage.FirebaseStorage;

public class MainActivity extends AppCompatActivity {
    private FirebaseAuth mAuth;
    private FirebaseFirestore db;
    private FirebaseStorage storage;
    
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        
        // Initialize Firebase (happens automatically)
        FirebaseApp.initializeApp(this);
        
        // Get Firebase instances
        mAuth = FirebaseAuth.getInstance();
        db = FirebaseFirestore.getInstance();
        storage = FirebaseStorage.getInstance();
    }
}
```

## Step 8: Test Firebase Connection

### Test Authentication

```java
// Sign in anonymously for testing
mAuth.signInAnonymously()
    .addOnCompleteListener(this, task -> {
        if (task.isSuccessful()) {
            FirebaseUser user = mAuth.getCurrentUser();
            Log.d("Firebase", "User ID: " + user.getUid());
            Toast.makeText(this, "Firebase connected!", Toast.LENGTH_SHORT).show();
        } else {
            Log.e("Firebase", "Auth failed", task.getException());
            Toast.makeText(this, "Firebase connection failed", Toast.LENGTH_SHORT).show();
        }
    });
```

### Test Firestore

```java
// Write test document
Map<String, Object> testData = new HashMap<>();
testData.put("test", "Hello Firebase");
testData.put("timestamp", System.currentTimeMillis());

db.collection("test")
    .add(testData)
    .addOnSuccessListener(documentReference -> {
        Log.d("Firestore", "Document added: " + documentReference.getId());
    })
    .addOnFailureListener(e -> {
        Log.e("Firestore", "Error adding document", e);
    });
```

## Step 9: Verify Installation

1. Build and run the app on a device or emulator
2. Check Logcat for Firebase initialization messages
3. Go to Firebase Console → **Authentication** → **Users** tab
4. You should see users appear when they sign in
5. Go to **Firestore Database** to see data being written

## Troubleshooting

### google-services.json not found

**Error**: `File google-services.json is missing`

**Solution**: 
- Ensure `google-services.json` is in the `app/` directory (not `app/src/`)
- Clean and rebuild the project: **Build** → **Clean Project** → **Rebuild Project**

### Package name mismatch

**Error**: `The package name 'com.xxx' does not match the expected package name`

**Solution**:
- Verify package name in `AndroidManifest.xml` matches Firebase Console
- Re-download `google-services.json` with correct package name

### Build fails with Firebase errors

**Solution**:
- Ensure Google Services plugin is applied in `app/build.gradle`:
  ```gradle
  apply plugin: 'com.google.gms.google-services'
  ```
- Update Android Studio and Gradle plugin to latest versions

### Authentication not working

**Solution**:
- Add SHA-1 certificate to Firebase Console
- Enable desired sign-in methods in Firebase Authentication
- Check device has internet connection

## Usage in CloudSyncManager

The app includes `CloudSyncManager.java` for cloud operations:

```java
CloudSyncManager syncManager = new CloudSyncManager(this);

// Upload scan
syncManager.uploadScan(roomScan, new CloudSyncManager.UploadCallback() {
    @Override
    public void onSuccess(String scanId) {
        Log.d("CloudSync", "Scan uploaded: " + scanId);
    }
    
    @Override
    public void onFailure(Exception e) {
        Log.e("CloudSync", "Upload failed", e);
    }
});

// Download scans
syncManager.downloadScans(new CloudSyncManager.DownloadCallback() {
    @Override
    public void onSuccess(List<RoomScan> scans) {
        Log.d("CloudSync", "Downloaded " + scans.size() + " scans");
    }
    
    @Override
    public void onFailure(Exception e) {
        Log.e("CloudSync", "Download failed", e);
    }
});
```

## Security Best Practices

1. **Never commit google-services.json to public repositories** (already in `.gitignore`)
2. Update security rules from test mode to production rules
3. Enable App Check for additional security
4. Use Firebase Security Rules to restrict access
5. Implement proper user authentication
6. Enable Firebase Analytics to monitor usage
7. Set up budget alerts in Firebase Console

## Additional Resources

- [Firebase Documentation](https://firebase.google.com/docs)
- [Firebase Android Setup](https://firebase.google.com/docs/android/setup)
- [Cloud Firestore Get Started](https://firebase.google.com/docs/firestore/quickstart)
- [Firebase Authentication](https://firebase.google.com/docs/auth/android/start)
- [Firebase Storage](https://firebase.google.com/docs/storage/android/start)

## Support

For issues or questions:
1. Check [Firebase Status Dashboard](https://status.firebase.google.com/)
2. Visit [StackOverflow Firebase Tag](https://stackoverflow.com/questions/tagged/firebase)
3. Review [Firebase Support](https://firebase.google.com/support)
