#!/usr/bin/env bash
# Sync student-needed files from the course repo into a separate student repo folder.
# Run from the COURSE REPO ROOT: ./scripts/sync-student-repo.sh <target-dir>
# Example: ./scripts/sync-student-repo.sh ../flutter-course-student

set -e

if [ -z "$1" ]; then
  echo "Usage: $0 <target-directory>"
  echo "Example: $0 ../flutter-course-student"
  exit 1
fi

TARGET="$(cd "$1" && pwd)"
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
SOURCE="$(cd "$SCRIPT_DIR/.." && pwd)"

echo "Source (course repo): $SOURCE"
echo "Target (student repo): $TARGET"
echo ""

# Create target structure
mkdir -p "$TARGET"
mkdir -p "$TARGET/.github/workflows"
mkdir -p "$TARGET/week-guides"

# 1. task_manager_app (exclude build artifacts and generated files)
echo "Copying task_manager_app..."
rsync -a --delete \
  --exclude='build/' \
  --exclude='.dart_tool/' \
  --exclude='.packages' \
  --exclude='.flutter-plugins' \
  --exclude='.flutter-plugins-dependencies' \
  "$SOURCE/task_manager_app/" "$TARGET/task_manager_app/" 2>/dev/null || {
  # Fallback if rsync not available (e.g. some Windows)
  cp -R "$SOURCE/task_manager_app" "$TARGET/"
  rm -rf "$TARGET/task_manager_app/build" "$TARGET/task_manager_app/.dart_tool" 2>/dev/null || true
}

# 2. week-guides: week2.md
echo "Copying week-guides/week2.md..."
cp "$SOURCE/week-guides/week2.md" "$TARGET/week-guides/"

# 3. week-guides: week2-group-activity (entire folder)
echo "Copying week-guides/week2-group-activity..."
cp -R "$SOURCE/week-guides/week2-group-activity" "$TARGET/week-guides/"

# 4. week-guides: week2-guideline EXCLUDING complete-solution
echo "Copying week-guides/week2-guideline (without complete-solution)..."
mkdir -p "$TARGET/week-guides/week2-guideline"
for f in "$SOURCE/week-guides/week2-guideline"/*; do
  [ -e "$f" ] || continue
  name="$(basename "$f")"
  if [ "$name" = "complete-solution" ]; then
    echo "  Skipping complete-solution/"
    continue
  fi
  cp -R "$f" "$TARGET/week-guides/week2-guideline/"
done

# 5. .github/workflows
echo "Copying .github/workflows..."
cp "$SOURCE/.github/workflows/flutter-ci.yml" "$TARGET/.github/workflows/"

# 6. Root docs and .gitignore
echo "Copying root docs..."
for f in CONTRIBUTING.md CI_EXPLANATION.md CICD_FOR_STUDENTS.md README.md .gitignore; do
  if [ -f "$SOURCE/$f" ]; then
    cp "$SOURCE/$f" "$TARGET/"
  fi
done

echo ""
echo "Done. Student repo content is in: $TARGET"
echo "Next: cd $TARGET && git add . && git status"
