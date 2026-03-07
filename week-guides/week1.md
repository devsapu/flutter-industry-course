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
   - `lib/home_page.dart` – create and explain during the lesson (or copy from `week-1-practical/home_page.dart`)
4. **Demo:** Hot reload and hot restart

## Repo Structure (Week 1)

```
task_manager_app/
├── lib/
│   └── main.dart          ← initial level only; no home_page.dart by default
└── ...

week-1-practical/          ← Copy-paste examples for learning
├── README.md
├── 01_text_widget.dart
├── ...
└── home_page.dart

week-1-special-notes/      ← Diagrams & architecture (Virtual DOM, RN vs Flutter)
├── README.md
├── 01-virtual-dom.md
├── 02-react-native-architecture.md
├── 03-flutter-architecture.md
└── 04-cross-platform-comparison.md
```

**Initial vs Task Manager:** `task_manager_app/lib/main.dart` is kept at **initial level** (simple “Initial app” screen). There is no `lib/home_page.dart` by default—create it while teaching and explain it, or use the copy in `week-1-practical`. For the full Task Manager screen: copy `05_task_manager_main.dart` into `lib/main.dart` and `home_page.dart` into `lib/home_page.dart`. See `week-1-practical/README.md` for details.

**Special notes:** For Virtual DOM, React Native and Flutter architecture (with diagrams), see `week-1-special-notes/README.md`.

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

### Adding a ListView

A **ListView** scrolls a list of children vertically (or horizontally with `scrollDirection`). Use it when you have multiple items to show (e.g. a list of tasks).

**Simple list with fixed children:** put a `ListView` in the body of your `Scaffold` and pass a `children` list. Do **not** mark the `Scaffold` as `const` when it contains a `ListView`—`ListView` is not a const constructor, so the parent cannot be const.

```dart
Scaffold(
  appBar: AppBar(title: Text('Tasks')),
  body: ListView(
    children: const [
      ListTile(title: Text('Task 1')),
      ListTile(title: Text('Task 2')),
      ListTile(title: Text('Task 3')),
    ],
  ),
)
```

For a **long or dynamic list**, use `ListView.builder` so only visible items are built:

```dart
ListView.builder(
  itemCount: items.length,
  itemBuilder: (context, index) => ListTile(title: Text(items[index])),
)
```

### Column

**Column** arranges its children in a vertical line. Use `mainAxisAlignment` for vertical alignment and `crossAxisAlignment` for horizontal. Often used with **Row** (horizontal) for simple layouts.

```dart
Column(
  mainAxisAlignment: MainAxisAlignment.center,
  crossAxisAlignment: CrossAxisAlignment.center,
  children: const [
    Text('First'),
    Text('Second'),
    Text('Third'),
  ],
)
```

### Widgets

Flutter UIs are built from **widgets**. Everything is a widget: layout (Column, Row, Stack), display (Text, Image, Icon), and structure (Scaffold, Container). Widgets are either **StatelessWidget** (no internal state) or **StatefulWidget** (state that can change; use `setState()` to rebuild). Compose small widgets into larger ones.

### Buttons

Common button widgets:

- **ElevatedButton** — filled button, primary actions
- **TextButton** — text-only, secondary actions
- **OutlinedButton** — border only
- **IconButton** — icon only (e.g. in AppBar)
- **FloatingActionButton** — floating circle (see note above)

All need `onPressed` (use `null` to disable) and a `child` (or `icon`/`label` for some).

```dart
ElevatedButton(
  onPressed: () { /* do something */ },
  child: const Text('Submit'),
)
```

### Layout

**Layout** widgets control size and position of their children:

- **Column** / **Row** — linear layout; use **Expanded** or **Flexible** so a child takes remaining space
- **Stack** — overlap children (first at back, last on top); use **Positioned** for placement
- **Center** — center one child
- **Padding** — add space around a child
- **Container** — box with optional decoration, padding, and constraints
- **ListView** / **GridView** — scrollable lists (see ListView note above)

Combine these to build screens; put layout widgets in the `body` of a **Scaffold**.
