# Phase 1 — Local Memory Proof

## User story

A nontechnical user opens Pauli LifeOS, points the phone at something, taps or says **Remember this**, and later asks for that memory. The user can then say **Forget this** and receive evidence that it was removed.

## Included

- Explicit camera or screenshot capture.
- On-device visual description.
- On-device speech-to-text and text-to-speech.
- Encrypted local memory storage.
- Local semantic and metadata retrieval.
- User-visible retention controls.
- Verified deletion.
- Emergency stop.
- Device capability benchmark.
- Network-offline smoke test.

## Excluded

- Continuous lifelogging.
- Smart-glasses capture.
- Health interpretation.
- Google Drive synchronization.
- Autonomous Chrome operation.
- External emergency contact actions.
- Unrestricted root shell.

## Acceptance test

1. Enable airplane mode.
2. Launch the signed debug build.
3. Capture an approved object or document.
4. Confirm a local description appears.
5. Close and restart the application.
6. Ask by voice for the captured memory.
7. Confirm correct retrieval and evidence.
8. Delete the memory.
9. Repeat the query and confirm no result.
10. Inspect storage and logs for residual plaintext.
11. Activate emergency stop and confirm sensing ceases.

## Evidence bundle

- Device model, Android version, RAM, storage, ABI, and acceleration report.
- App version and commit SHA.
- Model names, hashes, quantization, and licenses.
- Screen recording of the acceptance test.
- Redacted action log.
- Network-capture summary.
- Battery, memory, latency, and thermal readings.
- Deletion verification report.
- Rollback/uninstall result.

## Pass threshold

Phase 1 passes only when all acceptance steps succeed on the target Samsung device without cloud inference and without unresolved high-severity security findings.
