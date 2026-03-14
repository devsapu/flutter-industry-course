#!/usr/bin/env bash
# One-shot: create the student repo inside ICET (sibling to course_repo), sync files,
# init git, commit, and optionally add remote and push.
#
# Run from COURSE REPO ROOT (e.g. /Users/.../ICET/course_repo):
#   ./scripts/create-student-repo.sh
#   ./scripts/create-student-repo.sh https://github.com/YOUR_ORG/flutter-course-student.git
#
# Result: ICET/flutter-course-student/ is created and filled. If ICET is a git repo,
# flutter-course-student/ is added to ICET/.gitignore so the two repos don't conflict.

set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
SOURCE="$(cd "$SCRIPT_DIR/.." && pwd)"
TARGET="${SOURCE}/../flutter-course-student"
PARENT="$(cd "$SOURCE/.." && pwd)"

echo "Course repo (source): $SOURCE"
echo "Student repo (target): $TARGET"
echo ""

mkdir -p "$TARGET"

# 1. Sync files (reuse existing script)
"$SCRIPT_DIR/sync-student-repo.sh" "$TARGET"

# 2. If parent (ICET) is a git repo, ignore the student folder so it doesn't track it
if [ -d "$PARENT/.git" ]; then
  GITIGNORE="$PARENT/.gitignore"
  if [ -f "$GITIGNORE" ]; then
    if grep -q '^flutter-course-student/$' "$GITIGNORE" 2>/dev/null; then
      echo "ICET/.gitignore already ignores flutter-course-student/"
    else
      echo "" >> "$GITIGNORE"
      echo "# Student repo (separate git repo)" >> "$GITIGNORE"
      echo "flutter-course-student/" >> "$GITIGNORE"
      echo "Added flutter-course-student/ to $GITIGNORE"
    fi
  else
    echo "flutter-course-student/" >> "$GITIGNORE"
    echo "Created $GITIGNORE and added flutter-course-student/"
  fi
  echo ""
fi

# 3. Init git in student folder, commit
cd "$TARGET"
if [ -d .git ]; then
  echo "Student folder already has .git; reusing. Adding and committing..."
  git add .
  git status
  git commit -m "Sync: update student materials" || true
else
  git init
  git add .
  git commit -m "Initial student repo (Week 2 materials)"
  git branch -M main
  echo "Git repo initialized and first commit done."
fi

# 4. Optional: add remote and push
if [ -n "$1" ]; then
  if git remote get-url origin 2>/dev/null; then
    echo "Remote 'origin' already set. To change: git remote set-url origin <URL>"
  else
    git remote add origin "$1"
    echo "Pushing to $1 ..."
    git push -u origin main
    echo "Done. Students can: git clone $1"
  fi
else
  echo ""
  echo "To push to GitHub:"
  echo "  1. Create a new repo on GitHub (e.g. flutter-course-student)."
  echo "  2. Run:"
  echo "     cd $TARGET"
  echo "     git remote add origin https://github.com/YOUR_ORG/flutter-course-student.git"
  echo "     git push -u origin main"
fi
