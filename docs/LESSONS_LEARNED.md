# Lessons Learned

This file records verified lessons from architecture, implementation, device testing, customer discovery, failures, and rollback exercises.

## 2026-08-01 — Repository bootstrap

- The repository was initially created publicly and empty.
- GitHub's contents API could not initialize an unborn branch; a local first commit was required.
- Running `gh repo clone` from `C:\Windows\System32` failed because the directory is protected.
- The successful local workspace is `C:\Users\execu\Projects\pauli-mobile-agent`.
- The first verified local commit was `6a3e337` and established a writable `main` branch.
- Sensitive architecture and implementation should not be committed while the repository remains public.

## Format for future entries

Each entry should include:

- Date and device/build identifier
- Assumption tested
- Evidence collected
- Result
- Failure or surprise
- Decision made
- Reusable rule
- Rollback impact
