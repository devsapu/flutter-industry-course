# How the Virtual DOM works

The **Virtual DOM** is a lightweight copy of the real DOM kept in memory. Used by React (and thus React Native’s UI layer) to update the screen efficiently.

## Idea in one sentence

> Build a tree of plain JavaScript objects that *represent* the UI; when state changes, build a new tree, **diff** it with the previous one, then apply only the **minimal changes** to the real DOM (or native view).

## Flow (high-level)

```
  ┌─────────────────────────────────────────────────────────────────┐
  │                        YOUR APP (React)                          │
  │  State:  { count: 0 }  →  user clicks  →  { count: 1 }         │
  └─────────────────────────────────────────────────────────────────┘
                                    │
                                    ▼
  ┌─────────────────────────────────────────────────────────────────┐
  │ 1. RENDER: Build Virtual DOM tree (JS objects)                   │
  │    Old tree:  div → span "0"     New tree:  div → span "1"       │
  └─────────────────────────────────────────────────────────────────┘
                                    │
                                    ▼
  ┌─────────────────────────────────────────────────────────────────┐
  │ 2. DIFF: Compare old tree vs new tree                            │
  │    "Only the text inside the span changed: 0 → 1"                │
  └─────────────────────────────────────────────────────────────────┘
                                    │
                                    ▼
  ┌─────────────────────────────────────────────────────────────────┐
  │ 3. PATCH: Apply only those changes to the real DOM / native view  │
  │    Update one text node instead of rebuilding the whole screen   │
  └─────────────────────────────────────────────────────────────────┘
```

## Why it helps

- **Real DOM / native views are expensive** to create and change.
- **Virtual DOM** is cheap (plain objects in JS).
- **Diff + patch** means we only touch what actually changed → fewer layout/paint steps and often smoother UI.

## Simple tree view

```
Virtual DOM (in memory)          Real DOM / Native views
────────────────────────        ────────────────────────

     Root                             Root
      │                                │
   ┌──┴──┐                          ┌──┴──┐
   │     │                          │     │
  div   div     ── diff & patch ──  View  View
   │     │         (minimal)         │     │
  span  span                       Text  Text
   │     │                          "Hi"  "Bye"
 "Hi"  "Bye"
```

## In React Native

Same idea, but the “real” side is **native views** (UIKit/Android views), not the browser DOM. The JS layer still uses a virtual tree; the **bridge** (or new architecture with JSI) sends the minimal updates to native so it can update the real UI.

## Takeaway

Virtual DOM = **describe UI as data → diff on change → update only what changed**. That’s the core of the “graphical” flow above.
