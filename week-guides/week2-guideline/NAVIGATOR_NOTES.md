# Navigator – Teaching Notes (Week 2)

Use this document to **teach navigation first**, before building the Add Student UI. Students need to understand **push** and **pop** so that the "Add Student" button behaviour (going back) makes sense.

---

## 1. Core idea: the stack

Flutter keeps screens in a **stack** (like a stack of cards):

- **Bottom** = first screen (e.g. Dashboard / Home).
- **Top** = current screen the user sees.

```
     ┌─────────────────┐
     │  Add Student    │  ← TOP (visible)
     ├─────────────────┤
     │  Dashboard      │  ← BOTTOM
     └─────────────────┘
```

- **Navigator.push** → put a **new** screen **on top** (user goes "forward").
- **Navigator.pop** → **remove** the **top** screen (user goes "back").

---

## 2. Going to a new screen (push)

To open another screen, use **`Navigator.push`** with a **`MaterialPageRoute`**:

```dart
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => const SecondScreen(),
  ),
);
```

- **`context`** – needed so Flutter knows where we are in the app.
- **`MaterialPageRoute`** – builds the new screen and gives the default slide-from-right animation.
- **`builder`** – returns the widget (screen) to show.

**Where to use this:** In the **onPressed** of a button on the **current** screen (e.g. "Add Student" on the Dashboard).

---

## 3. Going back (pop)

To close the **current** screen and show the previous one:

```dart
Navigator.pop(context);
```

- Removes the **top** screen from the stack.
- The screen below becomes visible again.

**Where to use this:** In the **onPressed** of a "Back" or "Add Student" or "Cancel" button on the **new** screen.

---

## 4. Flow summary

| Action | Code | Stack change |
|--------|------|--------------|
| User taps "Add Student" on Dashboard | `Navigator.push(context, MaterialPageRoute(...))` | [Dashboard] → [Dashboard, Add Student] |
| User taps "Add Student" (submit) or "Back" on Add Student screen | `Navigator.pop(context)` | [Dashboard, Add Student] → [Dashboard] |

---

## 5. Demo: minimal Navigator on Week 2 app (copy-paste)

Use this **before** introducing the full Student Management app. It uses the existing **week-2** project (Task Manager with `HomePage`).

### Step A: Create a second screen

Create file **`lib/second_screen.dart`** and paste:

```dart
import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('You pushed to this screen.'),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Go Back'),
            ),
          ],
        ),
      ),
    );
  }
}
```

### Step B: Add a button on HomePage that pushes

In **`lib/home_page.dart`**:

1. Add the import at the top:

```dart
import 'second_screen.dart';
```

2. Add a button inside the `Column` (e.g. after the existing `Text` widgets, before the closing `],` of `children`):

```dart
const SizedBox(height: 24),
ElevatedButton(
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SecondScreen(),
      ),
    );
  },
  child: const Text('Go to Second Screen'),
),
```

Run the app: tap "Go to Second Screen" → new screen appears (push). Tap "Go Back" → returns to HomePage (pop).

---

## 6. After this: Add Student UI

Once students understand push and pop:

- **Dashboard** will **push** to **Add Student** when they tap "Add Student".
- **Add Student** screen will have a form (name, ID, course) and a button that **pops** to go back (and later can also save the student).

The same Navigator concepts apply; the Add Student screen is just a more useful "second screen" with a form.

See **INSTRUCTOR_TEACHING_PATH.md** for the full demo order and **STUDENT_DEVELOPMENT_GUIDE.md** (Section 7) for navigation in the Student Management app.
