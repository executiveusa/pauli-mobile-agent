# Initial Threat Model

## Protected assets

- Personal memories, images, audio, transcripts, locations, files, and health context.
- Device-control privileges and accessibility permissions.
- Root broker authorization.
- Encryption keys, model files, configuration, and audit evidence.
- User identity, emergency contacts, and exports.

## Primary threats

1. Stolen or unlocked device exposes the memory vault.
2. Malicious app abuses accessibility, screen capture, notifications, or shared storage.
3. Prompt or document content causes unintended device actions.
4. Root broker executes arbitrary commands or leaks secrets.
5. Sensitive content leaves the device through telemetry, model downloads, backups, or peer inference.
6. Bystanders are recorded without clear consent.
7. Deletion removes indexes but leaves raw media, caches, thumbnails, logs, or backups.
8. Health or emergency output is inaccurate or presented as medical certainty.
9. Supply-chain compromise affects APKs, native libraries, models, or updates.
10. Lost connectivity, crashes, or retries duplicate consequential actions.

## Required controls

- Android Keystore-backed encryption and authenticated access.
- No plaintext sensitive logs.
- Network denied by default for the core offline test.
- Signed model manifest with hashes and license metadata.
- Separate Standard and Advanced privilege modes.
- Root allowlist with argument validation; no generic shell interface.
- Action policy requiring confirmation for external effects.
- Visible capture state and physical/OS-level stop control.
- Raw-media and structured-memory deletion verification.
- Exportable audit records and owner-controlled backups.
- Independent security review before customer deployment.

## Non-goals for Phase 1

Phase 1 does not claim resistance to a fully compromised rooted operating system. The goal is to reduce ordinary application, data-retention, privilege, and user-interface risks while documenting residual risk honestly.
