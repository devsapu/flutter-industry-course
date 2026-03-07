# Week 4 – State Management

**Branch:** `week-4`

## Learning Objectives

- What is “application state”
- Limits of only using `setState`
- Scalable state management (Provider or Riverpod)
- Managing async data (loading, error, success)
- State-driven UI updates

## Teaching Flow

1. **Whiteboard:** Where state lives; why global/shared state is needed
2. **Live coding:**
   - Add `provider` (or `flutter_riverpod`) to `pubspec.yaml`
   - Create `TaskProvider` – fetch tasks, expose loading/error/data
   - Connect task list screen to provider
3. **Debugging demo:** “Why is this widget rebuilding?” – use DevTools or print

## Repo Structure (Week 4)

```
lib/
├── main.dart              (ProviderScope / MultiProvider)
├── models/
│   └── task_model.dart
├── services/
│   └── api_service.dart
├── providers/
│   └── task_provider.dart
├── screens/
│   ├── login_screen.dart
│   └── task_list_screen.dart
└── widgets/
    └── task_card.dart
```

## Key Concepts

- **Provider:** `ChangeNotifier`, `Consumer`, `Provider.of`
- **Riverpod:** `Provider`, `ConsumerWidget`, `ref.watch`
- **Async states:** loading → data / error

## Student Exercises

- Add a “Refresh” action that calls the provider
- Show a snackbar on error from the provider
- Toggle “completed” for a task and reflect in UI (local state first)

## Check Out This Week

```bash
git checkout week-4
cd task_manager_app && flutter pub get && flutter run
```

## Notes

_(Add teaching notes, tips, and code snippets here.)_
