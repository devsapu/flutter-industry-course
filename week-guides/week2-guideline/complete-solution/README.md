# Student & Lecturer Management – Complete Solution (Copy-Paste)

Reference solution for the **Student & Lecturer** app. No delete, edit, or search — just registration, list, and details for both students and lecturers.

**Features:** Dashboard (counts + 4 buttons), Student List & Details, Add Student, Lecturer List & Details, Add Lecturer.

---

## Order of Implementation (Paste in This Order)

### Step 1: Create folders

- `lib/models/`
- `lib/data/`
- `lib/screens/`

### Step 2: Models

1. **`lib/models/student.dart`** – copy from `complete-solution/lib/models/student.dart` (name, id, email, course).
2. **`lib/models/lecturer.dart`** – copy from `complete-solution/lib/models/lecturer.dart` (name, id, email, department).

### Step 3: Data

1. **`lib/data/student_data.dart`** – copy from `complete-solution/lib/data/student_data.dart`.
2. **`lib/data/lecturer_data.dart`** – copy from `complete-solution/lib/data/lecturer_data.dart`.

### Step 4: Screens (in order)

1. **`lib/screens/student_dashboard_screen.dart`**
2. **`lib/screens/student_list_screen.dart`**
3. **`lib/screens/student_details_screen.dart`**
4. **`lib/screens/add_student_screen.dart`**
5. **`lib/screens/add_lecturer_screen.dart`**
6. **`lib/screens/lecturer_list_screen.dart`**
7. **`lib/screens/lecturer_details_screen.dart`**

### Step 5: main.dart

Replace your **`lib/main.dart`** with **`complete-solution/lib/main.dart`** (routes: `/`, `/students`, `/add` only; lecturer screens are opened via **Navigator.push** from the dashboard).

### Step 6: Run

```bash
flutter pub get
flutter run
```

---

## File Summary

| File | Purpose |
|------|---------|
| `lib/models/student.dart` | Student (name, id, email, course) |
| `lib/models/lecturer.dart` | Lecturer (name, id, email, department) |
| `lib/data/student_data.dart` | Shared student list + addStudent |
| `lib/data/lecturer_data.dart` | Shared lecturer list + addLecturer |
| `lib/screens/student_dashboard_screen.dart` | Dashboard: counts + Student List, Add Student, Lecturer List, Add Lecturer |
| `lib/screens/student_list_screen.dart` | List of students, tap → details |
| `lib/screens/student_details_screen.dart` | Show student name, id, email, course |
| `lib/screens/add_student_screen.dart` | Form to add student |
| `lib/screens/add_lecturer_screen.dart` | Form to add lecturer |
| `lib/screens/lecturer_list_screen.dart` | List of lecturers, tap → details |
| `lib/screens/lecturer_details_screen.dart` | Show lecturer name, id, email, department |
| `lib/main.dart` | Routes and navigation |
