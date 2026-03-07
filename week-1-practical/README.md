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
| `05_task_manager_main.dart` | **Task Manager** – full Week 1 app with `HomePage` |
| `home_page.dart` | **HomePage** screen – copy to `lib/home_page.dart` when using 05 |

**Note:** `task_manager_app/lib/main.dart` is kept at the **initial level** (simple “Initial app” screen) for demo. There is no `lib/home_page.dart` by default—you can create it during the lesson and explain it, then paste this version if needed.

**To run the Task Manager (05):**  
1. Copy `05_task_manager_main.dart` into `task_manager_app/lib/main.dart`.  
2. Copy `home_page.dart` from this folder into `task_manager_app/lib/home_page.dart`.

Try 01–04 in any project; use 05 + home_page inside `task_manager_app` to see the Task Manager welcome screen.
