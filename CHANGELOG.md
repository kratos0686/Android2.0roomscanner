# Changelog

All notable changes to the Room Scanner project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.0.0] - 2025-11-16

### Added
- Complete Android app structure with proper package organization
- ARCore integration for 3D room scanning
  - Real-time plane detection (floors, walls, ceilings)
  - Point cloud data capture
  - Room dimension extraction
  - Mesh data generation
- Room Database for offline storage
  - ScanEntity and NoteEntity with foreign key relationships
  - Support for both Kotlin Coroutines and RxJava 3
  - Repository pattern implementation
- ML Kit integration
  - Object detection in scans
  - Image labeling for material identification
- TensorFlow Lite support
  - Custom model runner for damage detection
  - GPU/NNAPI acceleration support
- Firebase integration
  - Firestore sync for cloud storage
  - Cloud Functions for serverless processing
  - Firebase Storage for large files (point clouds, meshes)
  - ML Model downloader for dynamic model updates
- Jetpack Compose UI
  - Material Design 3 theme
  - Navigation with bottom bar
  - Scan, Notes, and Settings screens
- Firebase Cloud Functions
  - Process scan data (calculate areas, volumes)
  - Generate PDF reports
  - Run ML inference
  - Batch processing
  - Cost estimation
  - Automatic cleanup of old scans
- Comprehensive documentation
  - Architecture guide
  - ARCore integration guide
  - Firebase setup guide
  - Room Database guide
  - TFLite deployment guide
  - Launch guide
  - Quick start guide
  - ML integration guide
- Launcher icons (adaptive icons for Android 8.0+)
- CONTRIBUTING.md guidelines
- MIT License

### Project Structure Finalized
- Removed placeholder files from root directory
- Organized code in proper Android project structure
- Added resource files and configurations
- Set up proper .gitignore

### Technical Details
- Minimum SDK: API 26 (Android 8.0)
- Target SDK: API 34
- Kotlin version: 1.9.10
- Gradle version: 8.2
- Jetpack Compose BOM: 2023.10.01
- Room version: 2.6.0
- Firebase BOM: 32.5.0
- ARCore version: 1.40.0

## [Unreleased]

### Planned Features
- Enhanced AR visualization
- Multi-room scanning sessions
- Export to multiple 3D formats (OBJ, PLY, STL)
- Advanced cost estimation algorithms
- Offline ML model updates
- User authentication and profiles
- Scan sharing capabilities
- Advanced measurement tools

### Known Issues
- PDF generation in Cloud Functions is placeholder (needs actual implementation)
- ML inference in Cloud Functions is placeholder (needs actual implementation)
- App icons are basic placeholders (need custom design)

---

## Version History

- **1.0.0** (2025-11-16) - Initial production-ready release
