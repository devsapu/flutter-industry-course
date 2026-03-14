# Add Student UI – Demo copy-paste

Use during **Phase 2** of the teaching path (after Navigator).

- **`add_student_screen.dart`** – Full screen: Scaffold, AppBar, form (name, ID, course), button that calls `Navigator.pop(context)`.

**Where to put it:** `task_manager_app/lib/screens/add_student_screen.dart` (create `lib/screens/` if needed).

**Then:** From HomePage (or your dashboard), add a button that pushes to this screen:

```dart
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => const AddStudentScreen(),
  ),
);
```

Don’t forget to import: `import 'screens/add_student_screen.dart';`
