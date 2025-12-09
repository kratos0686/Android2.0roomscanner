Here is a comprehensive set of AI Coding Instructions built from the best practices and requirements outlined in that PR. You can save this content as .github/copilot-instructions.md or use it as a system prompt for your AI coding assistant.
Project Context & AI Instructions
Project: Android 2.0 Room Scanner
Tech Stack: Android, Java/Kotlin, Gradle
1. Quick Reference
Core Commands:
Build Project: ./gradlew build
Run Tests: ./gradlew test
Lint Check: ./gradlew lint
Full Check: ./gradlew check
Key Locations:
Source Code: app/src/main/java
Layouts: app/src/main/res/layout
Manifest: app/src/main/AndroidManifest.xml
Build Logic: build.gradle.kts or app/build.gradle
2. Development Environment
JDK Version: JDK 17 or higher is required.
Gradle Version: 8.2+
Android SDK: Ensure ANDROID_HOME is set.
CI/CD Awareness: When generating build scripts, assume a headless environment. If the ANDROID_HOME environment variable is missing in a CI context, gracefully handle the build failure or skip Android-specific tasks.
3. Code Review Standards
Before submitting code or marking a task as complete, verify the following:
Quality: Code must be modular, readable, and follow standard Android naming conventions (e.g., camelCase for variables, PascalCase for classes).
Testing: New features must include unit tests. Existing tests must pass.
Documentation: Public methods and complex logic must be documented with KDoc/Javadoc.
Performance: Avoid operations on the main thread. Use Coroutines or proper threading for heavy tasks (scanning logic).
Security: No hardcoded secrets. Validate all external inputs.
4. Issue Management & Prioritization
If multiple issues are detected, address them in this specific order:
Security Vulnerabilities (Critical)
Build Failures (Must compile)
Test Failures (Must pass verification)
Feature Requests (Enhancements)
5. Core Principles
🎯 Minimal Changes: Do not refactor unrelated code unless necessary.
🔍 Research First: Check existing implementations of room scanning libraries before writing custom raw GL code.
🧪 Test Thoroughly: Validate edge cases (e.g., camera permission denied, low light conditions).
🛡️ Safety: Always handle runtime permissions for Camera and Storage.