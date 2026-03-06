# Week 8 – Code Review & Career Preparation

**Branch:** `week-8-final`

## Learning Objectives

- Live code review
- Common mistakes and refactoring
- Best practices for maintainable code
- Building a professional portfolio
- Final feature implementation

## Teaching Flow

1. **Code review session:** Walk through `week-8-final` (or a student’s branch); comment on structure, naming, error handling, state management
2. **Whiteboard:** Common issues – giant widgets, no separation of concerns, no loading/error states
3. **Refactoring demo:** Take one messy piece and refactor step by step
4. **Portfolio:** What to put on GitHub (README, screenshots, tech stack, how to run)
5. **Assignment:** Students implement Add Task, Edit Task, Delete Task, Search and submit via GitHub (PR or repo link)

## Final Assignment (Industry Style)

Students must implement:

- **Add Task** – form and API/service call
- **Edit Task** – load existing task, form, update call
- **Delete Task** – confirmation and delete call
- **Search** – debounced search (from Week 6)

Deliverables:

- GitHub repository with clear README
- Optional: Pull Requests for each feature (like real workflow)
- Code review in class or as feedback

## GitHub Workflow (Bonus)

- Create **Issues** for each feature (e.g. “Implement login screen”, “Add search”)
- Students open **Pull Requests** that close those issues
- Teaches branching, PR, and review process

## Check Out This Week

```bash
git checkout week-8-final
cd task_manager_app && flutter pub get && flutter run
```

## What You Take Away

- A full task manager app with Clean Architecture
- Experience with API, state management, performance, and production setup
- A portfolio-ready repo and possibly PR-based workflow
