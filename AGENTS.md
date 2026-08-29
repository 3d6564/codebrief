# AGENTS.md - Codebrief

## Purpose

Codebrief interviews a developer and writes project-specific `INSTRUCTIONS.md`
for coding agents. It is an interview assistant, not a code generator.

## Working Rules

- Keep the interview adaptive. Do not turn it into one long fixed form.
- Use simple, direct language and explain uncommon terms.
- Keep observed facts, user-confirmed choices, and assumptions separate.
- Never turn an unanswered question into a project rule.
- Inspect repositories without reading secrets or generated data.
- Do not change target project files before the user approves a preview.
- Keep the generated file useful at the command and file-path level.
- Cover git, issue, and board workflow when the target uses them; confirmed
  always-on constraints belong in `AGENTS.md`, with procedure in
  `INSTRUCTIONS.md` or `CONTRIBUTING.md`.
- Do not add an application runtime or model API dependency without a clear need.

## Project Layout

- `agents/codebrief.md`: installed OpenCode primary agent.
- `commands/codebrief.md`: installed `/codebrief` command.
- `docs/INTERVIEW_DESIGN.md`: interview stages and design decisions.
- `install.sh`: global or project-local OpenCode installer.
- `tests/test_install.sh`: offline scaffold and installer checks.

## Verification

- Run `bash tests/test_install.sh` after changing installed files or the installer.
- Keep `README.md` usage examples aligned with `install.sh`.
- Restart OpenCode after installing or updating the agent.
