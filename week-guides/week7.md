# Week 7 – Production Readiness

**Branch:** `week-7`

## Learning Objectives

- Environment configurations (dev, staging, production)
- Error handling strategies
- Logging
- Release builds and APK for Android

## Teaching Flow

1. **Whiteboard:** Why environments; what changes (API URL, logging level, analytics)
2. **Live coding:**
   - **Flavors:** e.g. `dev`, `staging`, `prod` (or env-specific main)
   - **Env:** use `flutter_dotenv` or compile-time constants for API base URL
   - **Logging:** use `logger` (or `log`) – levels, avoid logging secrets
   - **Error handling:** global error handler / zone; report or log
3. **Build:** `flutter build apk` and show the output APK location

## Repo Structure (Week 7)

- `.env.dev`, `.env.staging`, `.env.prod` (add to `.gitignore` if they contain secrets)
- `lib/core/config/` or similar for env/flavor
- Logging and error handling in `core/`

## Key Concepts

- **Flavors** – different build variants (schemes in Xcode, product flavors in Android)
- **.env** – base URL, feature flags; never commit real API keys
- **Release build** – `flutter build apk` / `flutter build appbundle`

## Student Exercises

- Run the app in “release” mode and compare performance
- Generate an APK and install on a device or emulator
- Add a simple logger and log app start and one user action

## Check Out This Week

```bash
git checkout week-7
cd task_manager_app && flutter pub get && flutter run
```

## Build for Android

```bash
flutter build apk
# APK: build/app/outputs/flutter-apk/app-release.apk
```
