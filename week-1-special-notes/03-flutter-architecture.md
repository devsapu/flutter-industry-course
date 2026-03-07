# Flutter – High-level architecture

Flutter does **not** use the native platform’s UI widgets. It draws pixels using its own engine and uses the platform mainly for a window, input, and services.

## Layered view

```
┌─────────────────────────────────────────────────────────────────┐
│  YOUR CODE (Dart)                                               │
│  • Widgets (StatelessWidget, StatefulWidget)                     │
│  • State, business logic                                        │
│  • Material / Cupertino widgets                                 │
└─────────────────────────────────────────────────────────────────┘
                              │
                              ▼
┌─────────────────────────────────────────────────────────────────┐
│  FLUTTER FRAMEWORK (Dart)                                       │
│  • Widget tree → Element tree → RenderObject tree              │
│  • Layout & paint (constraints, layout, paint)                  │
│  • No bridge: same process, same language                       │
└─────────────────────────────────────────────────────────────────┘
                              │
                              ▼
┌─────────────────────────────────────────────────────────────────┐
│  FLUTTER ENGINE (C/C++)                                         │
│  • Skia: 2D graphics (shapes, text, images)                     │
│  • Dart runtime, text layout, GPU                               │
└─────────────────────────────────────────────────────────────────┘
                              │
                              ▼
┌─────────────────────────────────────────────────────────────────┐
│  PLATFORM                                                        │
│  • Embedder: window, input, lifecycle (iOS/Android/Web/Desktop) │
│  • Flutter “draws” into this window; no UIKit/Android views      │
└─────────────────────────────────────────────────────────────────┘
```

## No virtual DOM

Flutter does **not** use a virtual DOM. It keeps:

- **Widget tree** – immutable description (what to show).
- **Element tree** – mutable “mount points” (identity, state).
- **RenderObject tree** – layout and paint (size, position, draw).

When you call `setState()`, Flutter **reconciles** the widget tree (like diffing), but the “output” is **layout + paint** instructions to Skia, not updates to native views.

## Data flow (simplified)

```
  Widget tree (immutable)     Element tree (stable)    RenderObject (layout/paint)
  ─────────────────────      ─────────────────────    ──────────────────────────
       MaterialApp                 Element                    ...
            │                          │                          │
       Scaffold                   Element                    RenderView
            │                          │                          │
    AppBar  Body  FAB            ...   ...                   RenderParagraph
```

1. **Build:** You return widgets; Flutter creates/updates Elements and RenderObjects.
2. **Layout:** Parent asks child for size; constraints go down, sizes go up.
3. **Paint:** RenderObjects record draw commands (Skia).
4. **Composite:** Engine draws to the screen (GPU).

## Why it’s different from React Native

| | React Native | Flutter |
|---|--------------|--------|
| **UI** | Native views (UIKit/Android) | Own rendering (Skia) |
| **Language** | JS ↔ Native (bridge/JSI) | Dart only to engine |
| **Look** | Platform look by default | Same look everywhere (or Material/Cupertino) |
| **Updates** | Virtual DOM → diff → native updates | Widget diff → layout/paint → Skia |

Flutter’s “graphical” pipeline is: **Widgets → Elements → RenderObjects → Skia → pixels**.
