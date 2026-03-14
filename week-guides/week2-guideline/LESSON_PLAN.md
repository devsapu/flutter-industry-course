# Week 2 – Lesson Plan (Flutter + Navigator + Add Student UI)

This **lesson plan** gives the recommended order for the session: **Navigator first**, then **Add Student UI**. You can follow it while sharing the repo on screen — students see navigation concepts before building the form.

---

## Prerequisites

- Repo is on branch **`week-2`**; run `flutter pub get` and `flutter run`.
- You should see the Task Manager app with **HomePage** (welcome text, no Student Management yet).

---

## Phase 1: Navigator (teach first) — ~15–20 min

**Goal:** Understand **stack**, **push**, and **pop** before building any new UI.

### 1.1 Explain the stack (2–3 min)

- Use **NAVIGATOR_NOTES.md** Section 1–4 (stack diagram, push, pop).
- "Screens are like a stack of cards. Push = new screen on top. Pop = remove top, go back."

### 1.2 Minimal demo: second screen (10–12 min)

- **Notes:** **NAVIGATOR_NOTES.md** Section 5 (Demo: minimal Navigator on Week 2 app).
- **Copy-paste:** **demo-snippets/navigator-demo/**:
  1. Create **`lib/second_screen.dart`** — paste from **`demo-snippets/navigator-demo/second_screen.dart`**.
  2. Edit **`lib/home_page.dart`** — add import and button from **`demo-snippets/navigator-demo/home_page_add_button.txt`** (or from NAVIGATOR_NOTES.md).
- Run the app: tap "Go to Second Screen" (push), then "Go Back" (pop).
- Emphasise: "The same **push** and **pop** will be used for Add Student."

---

## Phase 2: Add Student UI creation flow — ~20–25 min

**Goal:** Build the Add Student screen (form UI) and wire it with **push** from the home/dashboard and **pop** from the button.

### 2.1 Screen structure (2–3 min)

- **Notes:** **STUDENT_DEVELOPMENT_GUIDE.md** Section 2 (Creating a Simple UI Screen).
- Explain: **Scaffold** → AppBar + Body. Show a simple Scaffold example.

### 2.2 Build Add Student screen (form UI) (10–12 min)

- **Notes:** **STUDENT_DEVELOPMENT_GUIDE.md** Section 5 (Creating a Form – Add Student).
- **Copy-paste:** **demo-snippets/add-student-ui/add_student_screen.dart** (or full screen from **complete-solution**).
- Build step by step if preferred:
  1. New file **`lib/screens/add_student_screen.dart`**.
  2. Scaffold with AppBar title "Add Student".
  3. Body: **Padding** → **Column** with:
     - TextField (Student Name)
     - SizedBox(16)
     - TextField (Student ID)
     - SizedBox(16)
     - TextField (Course)
     - SizedBox(24)
     - ElevatedButton "Add Student" → **onPressed: Navigator.pop(context)**.
- Emphasise: "The button **pops** so we go back — same as 'Go Back' in the Navigator demo."

### 2.3 Wire from HomePage / Dashboard (5–8 min)

- **Notes:** **STUDENT_DEVELOPMENT_GUIDE.md** Section 7 (Navigation Between Screens).
- If you have a dashboard: add a button that **Navigator.push** to **AddStudentScreen** (see **complete-solution/lib/screens/student_dashboard_screen.dart**).
- If using week-2’s HomePage only: add an "Add Student" button that pushes to **AddStudentScreen** (same pattern as "Go to Second Screen").

---

## Phase 3: Full solution (reference / copy-paste) — as needed

- **Notes:** **complete-solution/README.md** (Order of Implementation).
- **When to use:** To show the full app (Dashboard + Student List + Add Student + routes in main.dart) or if a group is stuck.
- Paste order: **models/student.dart** → **screens/student_dashboard_screen.dart** → **screens/student_list_screen.dart** → **screens/add_student_screen.dart** → **main.dart**.

---

## Quick reference: where to find what

| What you need | File or folder |
|---------------|-----------------|
| Navigator theory + minimal demo code | **NAVIGATOR_NOTES.md** |
| Navigator demo copy-paste (second screen + HomePage button) | **demo-snippets/navigator-demo/** |
| Add Student UI (form) copy-paste | **demo-snippets/add-student-ui/** or **complete-solution/lib/screens/add_student_screen.dart** |
| General Flutter structure, ListView, form, navigation | **STUDENT_DEVELOPMENT_GUIDE.md** |
| Full app paste order | **complete-solution/README.md** |
| Week 2 overview (Git, CI, Flutter) | **../week2.md** |
| Session timing (groups, PRs, CI) | **../week2-group-activity/week2-session-guide.md** |

---

## Suggested timeline (Flutter part of the session)

| Time | Activity |
|------|----------|
| 0:00 | Recap Git/CI if needed; switch to Flutter. |
| 0:05 | **Phase 1:** Navigator (stack, push, pop) + minimal demo (second_screen + HomePage button). |
| 0:22 | **Phase 2:** Add Student UI (Scaffold, form, pop); then wire from dashboard or HomePage. |
| 0:45 | **Phase 3 (optional):** Show full solution paste order or let groups continue. |
| 1:00+ | Group tasks (branch, change, PR, CI) as in **week2-session-guide.md**. |

You can shorten Phase 2 if everyone is comfortable and use the complete-solution paste order instead.
