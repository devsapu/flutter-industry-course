# Week 5 – Clean Architecture

**Branch:** `week-5`

## Learning Objectives

- Layered architecture: Presentation, Domain, Data
- Architectural patterns (e.g. feature-first, layer boundaries)
- Organize a scalable Flutter project
- Implement one feature using this structure

## Teaching Flow

1. **Whiteboard:** Clean Architecture – Domain at center, Data and Presentation on the outside; dependency rule (dependencies point inward)
2. **Live coding:** Refactor the app into:
   - **Presentation:** screens, widgets, providers (or controllers)
   - **Domain:** entities, repository interfaces, use cases
   - **Data:** models, datasources (remote/local), repository implementations
3. Implement one full feature (e.g. “get tasks”) through all layers

## Repo Structure (Week 5 – Industry Level)

```
lib/
├── core/
│   ├── constants/
│   ├── errors/
│   ├── network/
│   └── utils/
├── features/
│   └── auth/           (or tasks/)
│       ├── data/
│       │   ├── models/
│       │   ├── datasources/
│       │   └── repositories/
│       ├── domain/
│       │   ├── entities/
│       │   ├── repositories/
│       │   └── usecases/
│       └── presentation/
│           ├── screens/
│           ├── widgets/
│           └── providers/
└── main.dart
```

## Key Concepts

- **Domain:** Entities (plain classes), Repository *interfaces*
- **Data:** Models (JSON), DataSources (API), Repository *implementations*
- **Presentation:** UI only; calls use cases or repository via dependency injection

## Student Exercises

- Add a second feature (e.g. “auth” or “task detail”) using the same layers
- Ensure Domain has no Flutter or `http` imports

## Check Out This Week

```bash
git checkout week-5
cd task_manager_app && flutter pub get && flutter run
```

## Notes

_(Add teaching notes, tips, and code snippets here.)_
