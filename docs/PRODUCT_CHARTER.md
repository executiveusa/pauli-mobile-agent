# Product Charter

## Mode

Greenfield.

## Classification

Bounded experiment. Candidate to become SELL only after a paid pilot and verified device workflow.

## Outcome

On one Samsung SM-A065M-class Android device, prove a fully local, reversible personal-memory workflow that a nontechnical user can operate by voice.

## Target

Initial target users:

- people who need memory or accessibility assistance;
- caregivers and nonprofit staff;
- field workers handling sensitive information;
- privacy-conscious professionals.

## Constraints

- Preserve owner control of code, device, data, models, keys, backups, and deletion.
- Do not silently record bystanders.
- Do not depend on continuous cloud inference.
- Do not require root for standard operation.
- Do not expose health data or secrets in logs.
- Do not make medical-device or diagnostic claims.
- Do not add smart-glasses or health complexity before the memory loop passes.

## Proof required

Phase 1 passes only with evidence that:

1. capture occurred with explicit user action;
2. visual description was generated locally;
3. memory was encrypted at rest;
4. voice recall returned the correct memory;
5. deletion removed raw and structured data according to policy;
6. network inspection showed no inference payload left the device;
7. an emergency stop disabled sensing and actions;
8. uninstall preserved only user-selected exports.

## Commercial value

The first sellable offer is a **Private Memory and Accessibility Pilot**: device assessment, installation, model tuning, local memory setup, training, verification, rollback, and 30-day support.

## Stop conditions

Pause expansion when:

- the core local memory loop is unverified;
- battery or thermal behavior is unacceptable;
- root becomes necessary for ordinary use;
- bystander consent cannot be made clear;
- engineering replaces customer discovery or pilot sales;
- a new repository duplicates an existing capability.
