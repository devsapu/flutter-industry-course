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

## Notes

### App structure: from main() to the screen

Understanding the widget tree helps you know where each piece of the UI lives. A typical default app looks like this:

```
main()
  ↓
runApp()
  ↓
MyApp (StatelessWidget)
  ↓
MaterialApp
  ↓
MyHomePage (StatefulWidget)
  ↓
Scaffold
 ├── AppBar
 ├── Body
 │    └── Center
 │          └── Column
 │               ├── Text
 │               └── Text(counter)
 └── FloatingActionButton
```

- **main()** → entry point; calls **runApp()** with the root widget.
- **MyApp** (StatelessWidget) → holds **MaterialApp** (theme, title, home).
- **MaterialApp** → sets up navigation and theme; **home** is the first screen.
- **MyHomePage** (StatefulWidget) → holds state (e.g. counter) and builds the **Scaffold**.
- **Scaffold** → the “page frame”: **appBar**, **body**, and **floatingActionButton** slot.

When you add or change UI, you are usually editing something under this Scaffold (e.g. the body or the FAB).

### Removing the debug banner in the emulator

When you run the app in debug mode, Flutter shows a **"DEBUG"** label in the top-right corner of the screen. This is useful during development but can be distracting when demonstrating the UI or recording the emulator.

To hide it, set `debugShowCheckedModeBanner: false` on your `MaterialApp`:

```dart
MaterialApp(
  title: 'Task Manager',
    debugShowCheckedModeBanner: false,// Hides the "DEBUG" label in the corner
  home: HomePage(),
)
```

The banner only appears in debug builds; release builds never show it.

### Adding a FloatingActionButton (FAB)

A **FloatingActionButton** is the circular button that floats over the content, usually in the bottom-right corner. It’s commonly used for a primary action (e.g. “Add task”).

Add the `floatingActionButton` (and optionally `floatingActionButtonLocation`) to your `Scaffold`:

```dart
Scaffold(
  appBar: AppBar(title: Text('Home')),
  body: Center(child: Text('Your content')),
  floatingActionButton: FloatingActionButton(
    onPressed: () {
      // Handle tap — e.g. navigate or show a dialog
    },
    child: Icon(Icons.add),
    tooltip: 'Add',  // Shown on long-press
  ),
  floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,  // optional; default is endFloat
)
```

Use `FloatingActionButton.small` or `.extended` for variants; wrap in `FloatingActionButton.extended` with a `label` for a FAB with text.
