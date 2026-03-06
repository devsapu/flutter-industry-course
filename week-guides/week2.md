# Week 2 – Flutter UI Fundamentals

**Branch:** `week-2`

## Learning Objectives

- Widget tree and composition
- StatelessWidget vs StatefulWidget
- Layout: Row, Column, Expanded, Stack
- Reusable UI components
- Forms and validation

## Teaching Flow

1. **Whiteboard:** Widget tree; Stateless vs Stateful
2. **Live coding:** Build:
   - Login screen (email + password, basic validation)
   - Task list screen (list of tasks)
   - Task card widget (reusable)
3. Use: `Column`, `Row`, `Expanded`, `ListView`, `Form`, `TextFormField`

## Repo Structure (Week 2)

```
lib/
├── main.dart
├── screens/
│   ├── login_screen.dart
│   └── task_list_screen.dart
├── widgets/
│   └── task_card.dart
└── home_page.dart  (or navigation from main)
```

## Key Concepts

- **StatelessWidget** – no mutable state
- **StatefulWidget** – state that can change; `setState()`
- **Layout:** Row, Column, Expanded, Stack
- **Form** – `GlobalKey<FormState>`, validator callbacks

## Student Exercises

- Add a “Forgot password?” link on the login screen
- Style the task card (e.g. color by completion status)
- Add a simple form to “Create task” (title only)

## Check Out This Week

```bash
git checkout week-2
cd task_manager_app && flutter pub get && flutter run
```
