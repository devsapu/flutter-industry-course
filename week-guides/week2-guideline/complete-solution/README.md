# Student Management App – Complete Solution (Copy-Paste)

This folder contains a **reference solution** for the Student Management System App. Use it to copy-paste into your Flutter project if you get stuck, or to compare with your own code.

---

## Order of Implementation (Paste in This Order)

Follow these steps so that imports and navigation work correctly.

### Step 1: Create folders (if they don’t exist)

Inside your project’s `lib/` folder, create:

- `lib/models/`
- `lib/screens/`

---

### Step 2: Paste the model (no dependencies on screens)

1. Create file: **`lib/models/student.dart`**
2. Copy the full contents from **`complete-solution/lib/models/student.dart`** into it.

---

### Step 3: Paste the screens (one by one)

Paste each file into your project in this order:

1. **`lib/screens/student_dashboard_screen.dart`**  
   Copy from **`complete-solution/lib/screens/student_dashboard_screen.dart`**.

2. **`lib/screens/student_list_screen.dart`**  
   Copy from **`complete-solution/lib/screens/student_list_screen.dart`**.

3. **`lib/screens/add_student_screen.dart`**  
   Copy from **`complete-solution/lib/screens/add_student_screen.dart`**.

---

### Step 4: Paste the orchestration file (main.dart)

1. Open your **`lib/main.dart`**.
2. Replace its contents with the full contents of **`complete-solution/lib/main.dart`**.

This file wires up:

- `MaterialApp` with theme
- **Routes** (dashboard, student list, add student)
- **Initial route** (dashboard)

After pasting, your app should run with navigation: Dashboard → Student List, Dashboard → Add Student, and back.

---

### Step 5: Run the app

```bash
flutter pub get
flutter run
```

---

## File Summary

| Order | File | Purpose |
|-------|------|--------|
| 1 | `lib/models/student.dart` | Data model for a student |
| 2 | `lib/screens/student_dashboard_screen.dart` | Home / dashboard with “Add Student” and “Student List” |
| 3 | `lib/screens/student_list_screen.dart` | List of students (ListView) |
| 4 | `lib/screens/add_student_screen.dart` | Form to add a student |
| 5 | `lib/main.dart` | Orchestration: routes and navigation |

---

## If You Prefer to Build It Yourself

Use **STUDENT_DEVELOPMENT_GUIDE.md** in the parent folder for step-by-step guidelines without copying the full solution.
