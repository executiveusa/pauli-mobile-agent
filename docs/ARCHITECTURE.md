# Architecture

## System boundary

```text
Glasses / Camera / Microphone
          |
          v
Android Capture Governor
          |
          v
Agent Core ---- Policy Engine ---- Approval UI
    |              |                    |
    v              v                    v
QVAC Adapter   Action Verifier      Audit Journal
    |
    +-- Local LLM / VLM / STT / TTS / Embeddings
    |
    +-- Optional approved peer inference

Memory Vault <---- Local Retrieval ----> User

Android Bridges:
Accessibility | MediaProjection | Storage Access Framework | Health Connect | Optional Root Broker
```

## Architectural rules

1. Structured Android accessibility data is preferred over vision-based coordinate guessing.
2. Vision is used only when the UI hierarchy or direct file API is insufficient.
3. Root commands are allowlisted, logged, reversible where possible, and unavailable in Standard Mode.
4. QVAC is wrapped behind an inference interface so it can be upgraded or replaced.
5. Raw captures and structured memories have separate retention policies.
6. Health, glasses, browser, files, and emergency behavior are isolated skills.
7. Every consequential action records intent, approval, before-state, result, and verification.
8. The system must function without a central account for its core memory loop.

## Initial modules

- `apps/android`: nontechnical Android interface and onboarding.
- `packages/agent-core`: intent, planning, skill routing, and stopping rules.
- `packages/qvac-adapter`: local inference boundary.
- `packages/memory-vault`: encryption, retention, retrieval, export, and deletion.
- `packages/policy-engine`: permissions and approval requirements.
- `packages/action-verifier`: expected-versus-observed state checks.
- `packages/device-profiler`: RAM, storage, ABI, Vulkan, battery, and thermal capability.
- `skills/remember`: capture and structured memory creation.
- `skills/recall`: local retrieval and evidence display.
- `skills/forget`: verified deletion.

## Deferred adapters

The following remain interfaces only until Phase 1 passes:

- smart-glasses runtime adapter;
- Health Connect and wellness engine;
- Chrome automation;
- Google Drive automation;
- emergency contact workflows;
- unrestricted root operations.
