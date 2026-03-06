# Week 3 – Networking & API Integration

**Branch:** `week-3`

## Learning Objectives

- REST APIs: GET, POST, status codes
- JSON parsing and data models
- Loading and error states
- Build login API integration (or auth flow)

## Teaching Flow

1. **Whiteboard:** REST, HTTP methods, status codes (200, 401, 404, 500)
2. **Live coding:**
   - Add `http` (or `dio`) to `pubspec.yaml`
   - Create `services/api_service.dart` – base URL, GET/POST helpers
   - Create `models/task_model.dart` – fromJson / toJson
   - Fetch tasks from: `https://jsonplaceholder.typicode.com/todos`
3. Show loading indicator and error message in UI

## Repo Structure (Week 3)

```
lib/
├── main.dart
├── models/
│   └── task_model.dart
├── services/
│   └── api_service.dart
├── screens/
│   ├── login_screen.dart
│   └── task_list_screen.dart  (now uses API)
└── widgets/
    └── task_card.dart
```

## Example API

- **Todos:** `https://jsonplaceholder.typicode.com/todos`
- **Single todo:** `https://jsonplaceholder.typicode.com/todos/1`

## Student Exercises

- Fetch and display first 10 todos
- Handle “no network” or error state with retry
- Add a “Refresh” button to reload tasks

## Check Out This Week

```bash
git checkout week-3
cd task_manager_app && flutter pub get && flutter run
```
