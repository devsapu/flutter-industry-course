# Week 2 – Git, GitHub, CI & Flutter basics

**Branch:** `week-2`

## Learning Objectives

- **Git workflow** – branching, commits, pull requests
- **GitHub repositories** – cloning, collaboration
- **GitHub Actions (CI)** – automated checks on push/PR
- **Basic Flutter development** – run the app and understand structure
- **Writing simple tests** – widget tests with `testWidgets`, `find`, `expect`
- **Professional repository structure** – `.github/workflows` and documentation

## Teaching Flow

1. **Git & GitHub:** Clone repo, create a feature branch, make a small change, commit, push, open a PR.
2. **CI demo:** Show the GitHub **Actions** tab and how CI runs on the PR.
3. **Repo tour:** `README.md`, `CONTRIBUTING.md`, `CI_EXPLANATION.md`, `.github/workflows/flutter-ci.yml`.
4. **Flutter basics:** Run the app; explain `pubspec.yaml`, `lib/main.dart`, and `home_page.dart`.
5. **Navigator (teach first):** Use **week2-guideline/NAVIGATOR_NOTES.md** and **demo-snippets/navigator-demo/** to explain push/pop and do a minimal second-screen demo.
6. **Add Student UI:** Build the form screen (Scaffold, TextFields, button with `Navigator.pop`); use **demo-snippets/add-student-ui/** or **STUDENT_DEVELOPMENT_GUIDE.md**.
7. **Testing basics:** Open `test/widget_test.dart`; explain `pumpWidget`, `find`, `expect`; run `flutter test`.

## Repo Structure (Week 2)

```
.github/workflows/
  flutter-ci.yml
task_manager_app/
  lib/
  test/
README.md
CONTRIBUTING.md
CI_EXPLANATION.md
```

## Student Exercises

- Create a branch, change a text in the app, open a PR, and confirm CI runs and passes.
- Add one more `expect(...)` assertion to `test/widget_test.dart` and run `flutter test`.
- Read `CI_EXPLANATION.md` and summarize CI in 3–5 sentences.

## Check Out This Week

```bash
git checkout week-2
cd task_manager_app
flutter pub get
flutter run
flutter test
```

---

## 1.5‑hour session (8 groups)

For the hands-on part of the session, use the **week2-group-activity** folder:

- **Instructor:** **week2-group-activity/week2-session-guide.md** – timing, group–task mapping, tips.
- **Groups 1–8:** **week2-group-activity/week2-group-1.md** … **week2-group-8.md** – one task per group (branch, change, commit, push, PR, CI).

---

## Student guidelines and reference solution

In **week2-guideline** you will find:

- **week2-guideline/LESSON_PLAN.md** – **Lesson plan** for the session: Navigator first, then Add Student UI. Timings and pointers to all notes and demo files (good to follow when sharing the repo on screen).
- **week2-guideline/NAVIGATOR_NOTES.md** – Navigator concepts (stack, push, pop) and a minimal copy-paste demo (second screen + button on HomePage). Use **before** Add Student UI.
- **week2-guideline/demo-snippets/** – Copy-paste files for live demo:
  - **navigator-demo/** – `second_screen.dart` and snippet to add a "Go to Second Screen" button on HomePage.
  - **add-student-ui/** – Full `add_student_screen.dart` (form + button that pops).
- **week2-guideline/STUDENT_DEVELOPMENT_GUIDE.md** – Project structure, screens, ListView, model, form, navigation, Git workflow, and what to do if stuck.
- **week2-guideline/GROUP_TASKS.md** – Pointer to group activity task files.
- **week2-guideline/CI_EXPLANATION.md** – Short CI pointer (full docs in repo root).
- **week2-guideline/complete-solution/** – Reference solution (Student Management App) with copy-paste instructions and files. **This folder is on the `week2-solution` branch only.** See **complete-solution/README.md** for paste order.
