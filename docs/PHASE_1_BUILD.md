# Phase 1 Build — Android Shell

## Purpose

Create a reproducible Expo Android scaffold that can host QVAC local inference while exposing the first nontechnical `Remember`, `Recall`, and `Forget` interface.

## Bootstrap

From the repository root on Windows PowerShell:

```powershell
npm run bootstrap:mobile
cd apps/mobile
npx expo prebuild --platform android
npx expo run:android
```

The bootstrap command intentionally stops if `apps/mobile` already exists. Inspect before replacing generated or working code.

## Current implementation

- Reproducible Expo scaffold command.
- QVAC Expo plugin configuration.
- Android minimum SDK 29 configuration required by the QVAC installation guide.
- Camera and microphone permission declarations.
- Device and network status display.
- User-interface state machine for `Remember`, `Recall`, and `Forget`.
- Explicit unverified-prototype warning.

## Not implemented

- Camera capture.
- Local VLM inference.
- Local speech recognition or speech synthesis.
- Encrypted memory persistence.
- Semantic retrieval.
- Verified deletion.
- Emergency stop.
- Network traffic verification.

## Proof required before merge to a device release branch

1. Bootstrap completes on the owner workstation.
2. Android prebuild completes without changing unrelated files.
3. Debug APK installs on the Samsung SM-A065M.
4. Device profile renders accurately.
5. The app launches with networking disabled.
6. No cloud inference claim is made.
7. Generated dependency versions and licenses are recorded.
8. Rollback is verified by uninstalling the debug build.
