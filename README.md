# Pauli Mobile Agent

**Product name:** Pauli LifeOS  
**Status:** Bounded prototype — not production-ready  
**Mode:** Greenfield  

Pauli LifeOS is a privacy-first Android intelligence system for local voice, visual assistance, personal memory, file control, smart-glasses integration, wellness context, and carefully governed device actions.

## Prototype outcome

Prove one complete local memory loop on a supported Android phone:

> **See → Remember → Recall → Forget**

The first prototype must capture user-approved visual context, describe it locally, store an encrypted structured memory, retrieve it by voice, and verifiably delete it without using cloud inference.

## Product boundaries

- Local-first and owner-controlled.
- QVAC is an upstream inference dependency, not copied into this repository.
- Smart glasses and health integrations remain adapters behind stable interfaces.
- Root access is optional and isolated behind an allowlisted broker.
- No permanent deletion, external upload, financial action, account change, or emergency contact action without explicit policy and approval.
- No medical diagnosis or treatment recommendations.
- No claim of production readiness without device evidence.

## Active workstream

This repository occupies the portfolio's **bounded experiment** slot. It replaces the narrower Android OS agent experiment.

## Documentation

- [Product charter](docs/PRODUCT_CHARTER.md)
- [Architecture](docs/ARCHITECTURE.md)
- [Phase 1 specification](docs/PHASE_1_SPEC.md)
- [Threat model](docs/THREAT_MODEL.md)
- [Lessons learned](docs/LESSONS_LEARNED.md)

## Current proof state

- Repository initialized: verified
- Android application: not built
- QVAC integration: not verified
- Local model benchmark: not run
- Encrypted memory vault: not built
- Smart-glasses integration: not built
- Health integration: not built

Nothing in this repository should be represented as deployed, medically validated, or production-ready until the required evidence exists.
