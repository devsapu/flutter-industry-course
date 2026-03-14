# Option 2: Separate Student Repo – Step-by-Step Guide

This guide walks you through creating and maintaining a **student-only** repository that contains only what students need (no solution branch, no internal docs).

**Files used:** This guide (`docs/STUDENT_REPO_SETUP.md`) and the sync script (`scripts/sync-student-repo.sh`). Run the script from the **course repo root** (the folder that contains `task_manager_app`, `week-guides`, `scripts`).

---

## Important: avoid nested Git repos

If your **course repo** lives inside another Git repo (e.g. `ICET/course_repo`), then putting the student folder at `../flutter-course-student` would place it **inside that same parent repo** (`ICET/flutter-course-student`). That can cause:

- The parent repo seeing the student folder as untracked/modified
- Confusion when running `git status` in the parent
- The parent accidentally tracking the student repo’s files

**Do one of the following:**

1. **Recommended:** Put the student repo **outside** the parent repo. For example, if your layout is `ICET/course_repo`, create the student folder somewhere else:
   ```bash
   # Example: same level as ICET (not inside it)
   ./scripts/sync-student-repo.sh ../../flutter-course-student

   # Or use an absolute path
   ./scripts/sync-student-repo.sh ~/Documents/flutter-course-student
   ```
   Then run `git init` and the rest of the steps inside that folder. No nesting.

2. **If you keep it inside the parent repo:** Add the student folder to the **parent** repo’s `.gitignore` (e.g. in `ICET/.gitignore` add `flutter-course-student/`). Then the parent repo will ignore it and the two repos won’t interfere.

---

## What students will get

- **task_manager_app/** – Flutter app to run and edit  
- **week-guides/week2.md** – Week 2 plan  
- **week-guides/week2-guideline/** – Student Development Guide, GROUP_TASKS, CI pointer (**no** complete-solution folder)  
- **week-guides/week2-group-activity/** – Session guide and 8 group task files  
- **.github/workflows/flutter-ci.yml** – CI runs when they push  
- **CONTRIBUTING.md**, **CI_EXPLANATION.md**, **CICD_FOR_STUDENTS.md**  
- **README.md** – Project overview (you can use the existing one or a shorter student-facing version)  
- **.gitignore**

Students will **not** see: `week2-solution` branch, `complete-solution` folder, or any other internal branches/files.

---

## Part 1: One-time setup (create the student repo)

### Step 1: Create the new repo on GitHub

1. Go to GitHub and click **New repository**.  
2. Name it (e.g. **flutter-course-student** or **icet-week2-student**).  
3. Choose **Public** (or Private if you prefer).  
4. **Do not** add a README, .gitignore, or license (we’ll push content from your machine).  
5. Click **Create repository**.  
6. Copy the repo URL (e.g. `https://github.com/your-org/flutter-course-student.git`).

### Step 2: Run the sync script (first time)

From your **course repo** root (the one that contains `task_manager_app`, `week-guides`, etc.):

```bash
# Pick a target folder OUTSIDE any other git repo (see "Important: avoid nested Git repos" above).
# Example: sibling of the parent of course_repo (e.g. ICET/course_repo -> use ../../flutter-course-student)
# Or use an absolute path: ~/Documents/flutter-course-student

mkdir -p ../../flutter-course-student
chmod +x scripts/sync-student-repo.sh
./scripts/sync-student-repo.sh ../../flutter-course-student
```

If your course repo is **not** inside another repo, `../flutter-course-student` is fine. This copies all student-needed files into the target folder.

### Step 3: Turn the copied folder into a Git repo and push

```bash
cd ../../flutter-course-student   # or whatever path you used in Step 2

git init
git add .
git commit -m "Initial student repo (Week 2 materials)"
git branch -M main
git remote add origin https://github.com/YOUR_ORG/flutter-course-student.git
git push -u origin main
```

Replace `YOUR_ORG/flutter-course-student` with your actual GitHub repo URL.

### Step 4: Share with students

Give students:

- **Clone:** `git clone https://github.com/YOUR_ORG/flutter-course-student.git`  
- **Run app:** `cd flutter-course-student/task_manager_app && flutter pub get && flutter run`  
- Tell them to use **main** (or whatever branch you use) and to open PRs against that branch.

---

## Part 2: When you update the course repo (sync again)

Whenever you change the course repo (e.g. update week-guides, CONTRIBUTING, or task_manager_app) and want students to see the updates:

1. From the **course repo** root, run (use the same target path you used in Part 1):
   ```bash
   ./scripts/sync-student-repo.sh ../../flutter-course-student
   ```

2. Go to the student repo folder, commit and push:
   ```bash
   cd ../../flutter-course-student
   git add .
   git status   # check what changed
   git commit -m "Sync: update guidelines / app / docs"
   git push origin main
   ```

Students then `git pull` to get the latest.

---

## What the script does

- Copies **task_manager_app** (excluding `build/`, `.dart_tool/`, and other generated files).  
- Copies **week-guides/week2.md**, **week-guides/week2-group-activity/**, and **week-guides/week2-guideline/** but **excludes** **week-guides/week2-guideline/complete-solution/**.  
- Copies **.github/workflows/flutter-ci.yml**, **CONTRIBUTING.md**, **CI_EXPLANATION.md**, **CICD_FOR_STUDENTS.md**, **README.md**, **.gitignore**.  
- Does **not** copy: `.git`, `week2-solution` content, `complete-solution`, or other internal-only files.

---

## Optional: Student-facing README

If you want a shorter README just for students, after the first sync:

1. Edit `../flutter-course-student/README.md` to say something like: “Flutter course – student materials. Clone, then run `task_manager_app` (see README in that folder). Use week-guides for instructions.”  
2. Commit and push from the student repo folder.

You can also create that file in the course repo in a folder that the script copies (e.g. a dedicated `README_STUDENT.md` that the script copies as `README.md` into the student repo). That way each sync overwrites the student README from your course repo.

---

## Summary

| Step | Where | Action |
|------|--------|--------|
| 1 | GitHub | Create new repo (e.g. flutter-course-student) |
| 2 | Course repo | Run `./scripts/sync-student-repo.sh ../flutter-course-student` |
| 3 | Student folder | `git init`, `add`, `commit`, `remote add`, `push` |
| 4 | — | Share clone URL with students |
| Later | Course repo | Run script again; then in student folder: `add`, `commit`, `push` |

If anything in the script paths or names doesn’t match your repo (e.g. different branch name or folder names), edit **scripts/sync-student-repo.sh** and adjust the paths and exclusions.
