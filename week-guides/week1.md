# Week 1 – Mobile Development Landscape & Setup

**Branch:** `week-1`

## Learning Objectives

- Overview of cross-platform mobile development
- Compare Flutter with React Native
- Understand rendering architectures and performance
- Install Flutter SDK and set up development environment
- Create the first Flutter project

## Teaching Flow

1. **Whiteboard:** Cross-platform vs native; Flutter’s widget + rendering model
2. **Live coding:** Install Flutter (if not done), then:
   ```bash
   flutter create task_manager_app
   cd task_manager_app
   ```
3. Create:
   - `lib/main.dart` – app entry, material app
   - `lib/home_page.dart` – simple home screen
4. **Demo:** Hot reload and hot restart

## Repo Structure (Week 1)

```
task_manager_app/
├── lib/
│   ├── main.dart
│   └── home_page.dart
└── ...
```

## Student Exercises

- Run `flutter doctor` and fix any issues
- Change text on `home_page.dart` and use Hot Reload
- Add a second screen and navigate to it (optional)

## Check Out This Week

```bash
git checkout week-1
cd task_manager_app && flutter pub get && flutter run
```

## Tools Introduced

- Flutter SDK, `flutter create`, `flutter run`
- Hot reload (`r`), Hot restart (`R`)
- VS Code / Android Studio
