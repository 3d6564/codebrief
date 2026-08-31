# AGENTS.md - Codereview

## Purpose

Codereview is Codefactory's report-first GitHub pull-request review capability.
It does not implement product features in a target repository.

## Working Rules

- Keep each capability focused and separately installable.
- Ask whether Codebrief has been used before a capability starts. Never infer it
  from the presence of `INSTRUCTIONS.md`.
- If the user confirms Codebrief was used, read applicable instruction files
  before acting and treat them as project-specific requirements.
- Review is report-only until the user explicitly requests GitHub comments,
  reviews, issues, or other remote changes.
- Do not read secrets, generated evidence, local databases, or private notes.
- Keep the canonical capability prompt under `prompt/` and adapter frontmatter
  under `packaging/`.
- Do not add an application runtime or model API dependency without approval.

## Project Layout

- `prompt/codereview.md`: canonical review capability prompt.
- `packaging/`: per-agent frontmatter and OpenCode command.
- `install.sh`: installer for supported coding agents.
- `tests/test_install.sh`: offline installer checks.
- Root `LICENSE`: MIT.


## Verification

- Run `bash components/codereview/tests/test_install.sh` from the repository root
  after changing prompts, packaging, or install.
- Keep README examples aligned with `install.sh`.
