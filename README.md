# Android2.0roomscanner
Advanced 3D room scanning app with professional features for Android

## Features

### 🎯 Core Scanning
- **Real-time 3D scanning** using device camera
- **Multi-room scanning** with automatic stitching
- **High-resolution point cloud** capture
- **Voice-guided instructions** for optimal scanning

### 📤 Export Formats
Export scan data to industry-standard formats:
- **OBJ** (Wavefront Object) - Universal 3D format
- **PLY** (Polygon File Format) - With color support
- **DXF** (AutoCAD) - For CAD applications
- **IFC** (Industry Foundation Classes) - For BIM workflows

### ☁️ Cloud Synchronization
- **Automatic sync** to cloud storage
- **Cross-device access** to scan history
- **Secure backup** of all scans
- **Firebase integration** for real-time sync

### 🔍 Advanced Analysis
- **Material texture analysis** using ML models
- **Surface damage detection** with AI
- **Automatic material classification** (wood, concrete, drywall, etc.)
- **Texture quality assessment**

### 💰 Cost Estimation
- **Automated cost calculation** based on materials
- **Renovation cost estimates**
- **Painting and flooring cost breakdowns**
- **Material-specific pricing**

### 🥽 AR Visualization
- **ARCore integration** for augmented reality
- **Damage overlay visualization** in real-time
- **3D measurement tools** with AR annotations
- **Point cloud visualization** in AR space

### 🎤 Voice Guidance
- **Step-by-step voice instructions** for scanning
- **Progress announcements** during scan
- **Issue warnings** for scan quality
- **Multi-language support** via Text-to-Speech

### 🏗️ CAD/BIM Integration
- **DXF export** for AutoCAD compatibility
- **IFC export** for BIM software (Revit, ArchiCAD)
- **BIM metadata generation**
- **Professional workflow integration**

### 🔧 Mitigate Integration
- **Cotality Mitigate compatibility** for water mitigation projects
- **Water damage assessment** with IICRC classification (Class 1-4)
- **Restoration project documentation** export
- **Moisture mapping** and drying log generation
- **Equipment recommendations** based on damage assessment
- **Restoration cost estimates** for insurance claims
- **Compatible with property restoration workflows**

## Prerequisites
- Android Studio (latest version recommended)
- Android SDK API 34
- JDK 8 or higher
- Gradle 8.0
- Device with ARCore support (for AR features)

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
```
app/
├── src/main/java/com/roomscanner/app/
│   ├── MainActivity.java           # Main entry point
│   ├── models/                     # Data models
│   │   ├── Point3D.java           # 3D point representation
│   │   └── RoomScan.java          # Room scan data model
│   ├── export/                     # Export functionality
│   │   ├── OBJExporter.java       # OBJ format export
│   │   └── PLYExporter.java       # PLY format export
│   ├── cloud/                      # Cloud sync
│   │   └── CloudSyncManager.java  # Firebase integration
│   ├── scanning/                   # Scanning features
│   │   └── MultiRoomScanner.java  # Multi-room support
│   ├── analysis/                   # Analysis tools
│   │   ├── MaterialAnalyzer.java  # Material detection
│   │   └── CostEstimator.java     # Cost calculation
│   ├── ar/                         # AR features
│   │   └── ARVisualizationManager.java # AR overlays
│   ├── voice/                      # Voice guidance
│   │   └── VoiceGuidanceManager.java # TTS instructions
│   ├── cad/                        # CAD/BIM integration
│   │   └── CADBIMIntegration.java # DXF/IFC export
│   ├── integrations/               # Third-party integrations
│   │   ├── MitigateIntegration.java    # Cotality Mitigate export
│   │   └── WaterDamageAssessment.java  # Damage assessment
│   └── utils/                      # Utilities
│       └── ScannerUtils.java      # Helper functions
└── src/main/res/                   # Android resources
```

## Dependencies
- **AndroidX Libraries** - AppCompat, Material Design, Room Database
- **ARCore** - Augmented reality functionality
- **Firebase** - Cloud sync (Auth, Firestore, Storage)
- **CameraX** - Advanced camera features
- **TensorFlow Lite** - Machine learning for material analysis
- **Gson** - JSON parsing

## Permissions
The app requires the following permissions:
- `CAMERA` - For capturing 3D room data
- `RECORD_AUDIO` - For voice command features
- `READ_EXTERNAL_STORAGE` - For reading scan data
- `WRITE_EXTERNAL_STORAGE` - For saving scan results
- `INTERNET` - For cloud synchronization
- `ACCESS_NETWORK_STATE` - For checking connectivity
- `ACCESS_FINE_LOCATION` / `ACCESS_COARSE_LOCATION` - For AR features

## Usage

### Basic Scanning
1. Launch the app
2. Grant required permissions
3. Tap "Start Scan" button
4. Follow voice instructions
5. Move camera slowly across walls
6. Tap "Finish" when complete

### Multi-Room Scanning
1. Complete first room scan
2. Tap "Add Another Room"
3. Scan additional rooms
4. Tap "Stitch Rooms" to combine scans

### Exporting Data
1. Open completed scan
2. Tap "Export" button
3. Select desired format(s): OBJ, PLY, DXF, IFC
4. Choose save location
5. Files will be exported with cost report

### AR Visualization
1. Open a completed scan
2. Tap "AR View" button
3. Point camera at room
4. View damage overlays and measurements in AR

### Mitigate Integration (Water Damage Restoration)
1. Complete room scan of affected area
2. Open scan and tap "Mitigate Export"
3. Select damage severity and water class
4. Generate restoration report with:
   - Water damage classification (Class 1-4)
   - Affected materials assessment
   - Equipment recommendations
   - Drying log template
   - Cost estimates for restoration
5. Export data compatible with Mitigate by Cotality
6. Share with restoration team or insurance adjuster

### Integration Features
- **IICRC Standards** - Follows water damage classification guidelines
- **Moisture Mapping** - 3D visualization of affected areas
- **Equipment Lists** - Recommendations based on damage class
- **Drying Logs** - Track restoration progress over time
- **Cost Documentation** - Insurance claim support

## License
This project is licensed under the MIT License.
