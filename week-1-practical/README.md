# Week 1 – Practical code examples

Copy-paste examples for **Week 1** to try in your app. Each file is a **complete `main.dart`** you can use to see the difference between patterns.

## How to use

1. Open your Flutter project (e.g. `task_manager_app`).
2. Open `lib/main.dart`.
3. Copy **all** the code from one of the example files below into `lib/main.dart` (replace the existing content).
4. Save and run (`flutter run`) or use Hot Restart to see the result.

If your project uses a separate `home_page.dart`, these examples are self-contained and do not use it—everything is in one file for learning.

## Examples

| File | What it shows |
|------|----------------|
| `01_text_widget.dart` | Minimal app: MaterialApp + Scaffold + a single Text widget |
| `02_list_view.dart` | Scrollable list with ListView and ListTile |
| `03_theme.dart` | Theming: colorScheme, scaffoldBackgroundColor, AppBar style |
| `04_buttons.dart` | ElevatedButton, TextButton, OutlinedButton, IconButton, FAB |
| `05_task_manager_main.dart` | **Task Manager** – full Week 1 app with `HomePage` (uses `lib/home_page.dart`) |

**Note:** `task_manager_app/lib/main.dart` is kept at the **initial level** (simple “Initial app” screen) for demo. To load the Task Manager UI, copy `05_task_manager_main.dart` into `task_manager_app/lib/main.dart`; `home_page.dart` is already in the project.

Try 01–04 in any project; use 05 inside `task_manager_app` to see the Task Manager welcome screen.
