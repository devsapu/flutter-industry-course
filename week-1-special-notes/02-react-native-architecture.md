# React Native – High-level architecture

React Native runs your JavaScript (React) and talks to **native UI** (iOS/Android) via a bridge or, in the new architecture, via JSI (JavaScript Interface).

## Layered view

```
┌─────────────────────────────────────────────────────────────────┐
│  YOUR CODE                                                       │
│  • React components (JSX)                                        │
│  • State (useState, Redux, etc.)                                 │
│  • Business logic in JavaScript / TypeScript                     │
└─────────────────────────────────────────────────────────────────┘
                              │
                              ▼
┌─────────────────────────────────────────────────────────────────┐
│  REACT NATIVE LAYER                                              │
│  • Virtual DOM–style reconciliation (React)                     │
│  • React Native components: <View>, <Text>, <ScrollView>         │
│  • Maps to native view types                                     │
└─────────────────────────────────────────────────────────────────┘
                              │
              ┌───────────────┴───────────────┐
              │  BRIDGE (or JSI in new arch)   │
              │  Serialized messages JS ↔ Native                   │
              └───────────────┬───────────────┘
                              │
         ┌────────────────────┼────────────────────┐
         ▼                    ▼                    ▼
┌─────────────────┐  ┌─────────────────┐  ┌─────────────────┐
│  NATIVE (iOS)   │  │ NATIVE (Android) │  │  Native modules │
│  • UIKit views  │  │ • Android views  │  │  (e.g. camera)  │
│  • Native UI    │  │ • Native UI      │  │                 │
└─────────────────┘  └─────────────────┘  └─────────────────┘
```

## Key points

| Layer | Role |
|-------|------|
| **JS/React** | You write UI as components; React does virtual DOM diff. |
| **RN runtime** | Runs your JS bundle; turns React tree into “native instructions”. |
| **Bridge / JSI** | Lets JS call native and native call JS (events, layout, etc.). |
| **Native** | Real buttons, lists, text; platform-specific look and feel. |

## Data flow (simplified)

1. **Render:** React builds a tree of RN components (`View`, `Text`, …).
2. **Bridge:** That tree is serialized and sent to the native side.
3. **Native:** Native creates or updates real views (UIKit / Android).
4. **Events:** Touch/scroll run on native → sent back over bridge → JS handlers run.

## New architecture (JSI, Fabric, TurboModules)

- **JSI** = direct C++ reference between JS and native (no serialization for many calls).
- **Fabric** = new renderer; native can drive layout and reduce bridge traffic.
- **TurboModules** = lazy-loaded native modules.

Conceptually the “high-level” picture above still holds: **JS (React) ↔ bridge/JSI ↔ native views**.
