# Cross-platform comparison – React Native vs Flutter

Quick reference for **Week 1** discussions: how the two approaches differ at a high level.

## At a glance

| Aspect | React Native | Flutter |
|--------|--------------|---------|
| **Language** | JavaScript / TypeScript | Dart |
| **UI building block** | React components (JSX) | Widgets (Dart) |
| **Rendering** | Uses **native views** (UIKit, Android views) | **Own rendering** (Skia); draws into a single canvas |
| **Update mechanism** | Virtual DOM → diff → update native views | Widget tree → reconcile → layout/paint (Skia) |
| **Bridge** | JS ↔ Native bridge (or JSI in new arch) | No bridge; Dart talks directly to C++ engine |
| **Look & feel** | Platform-native by default | Same on all platforms (Material/Cupertino) |
| **Performance** | Depends on bridge and native; JSI improves | Often very smooth; no bridge, direct to GPU |

## Architecture in one diagram

```
REACT NATIVE                    FLUTTER
────────────                    ───────
  JS (React)                      Dart (Widgets)
       │                               │
       │ bridge / JSI                   │ (no bridge)
       ▼                               ▼
  Native views                   Flutter engine (Skia)
  (iOS / Android)                 → pixels in window
```

## When to think “Virtual DOM”

- **React Native:** Yes – React’s virtual DOM drives what gets sent to native.
- **Flutter:** No virtual DOM – widget tree is “description”; Flutter does its own reconciliation and then **layout + paint**, not “patch native views”.

## When to think “architecture”

- **React Native:** Your UI is **mapped to native widgets**; the bridge (or JSI) is the link. Heavy use of native modules and platform APIs.
- **Flutter:** Your UI is **drawn by the engine**; the platform gives a window and input. Same app logic and rendering path on all platforms.

Use these notes together with the other special-notes files for a clear, high-level understanding before diving into Flutter code.
