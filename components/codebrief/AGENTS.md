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
- Keep `prompt/codebrief.md` as the interview source. Adapter frontmatter lives
  under `packaging/`. Do not install Codebrief into `AGENTS.md`, `CLAUDE.md`, or
  `copilot-instructions.md`.
- Do not add an application runtime or model API dependency without a clear need.
- After a pull request is merged, delete its local and remote branches. Never
  reuse a merged branch; start later work from the current `origin/main`.

## Project Layout

- `prompt/codebrief.md`: canonical interview prompt.
- `packaging/`: per-agent frontmatter and OpenCode command.
- `docs/INTERVIEW_DESIGN.md`: interview stages and design decisions.
- `docs/art/`: mark and other artwork.
- `install.sh`: installer. `--agent` is required with `--yes`.
- `tests/test_install.sh`: offline scaffold and installer checks.
- Root `CONTRIBUTING.md`: branch, PR, and review workflow.
- Root `LICENSE`: MIT.

## Verification

- Run `bash components/codebrief/tests/test_install.sh` from the repository root
  after changing the prompt, packaging, or installer.
- Keep `README.md` usage examples aligned with `install.sh`.
- Follow the root `CONTRIBUTING.md` for branches, PRs, and merge cleanup.
- Restart the target coding agent after installing or updating Codebrief.
