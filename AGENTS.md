# AGENTS.md - Codefactory

## Purpose

Codefactory packages focused, separately installable capabilities for coding
agents. Current components are `codebrief` and `codereview`.

## Working Rules

- Read and follow `INSTRUCTIONS.md` and `CONTRIBUTING.md`.
- Keep each component focused and separately installable.
- Keep component prompts and adapter frontmatter inside that component.
- Ask whether Codebrief has been used before a Codefactory capability starts.
  Never infer the answer from the presence of `INSTRUCTIONS.md`.
- Read the closest component `AGENTS.md` before changing that component.
- Do not add an application runtime or model API dependency without approval.

## Project Layout

- `components/codebrief/`: project-instruction interview capability.
- `components/codereview/`: report-first pull-request review capability.
- `INSTRUCTIONS.md`: shared repository working, safety, and reporting rules.
- `CONTRIBUTING.md`: issue, branch, pull-request, and review workflow.
- `install.sh`: dispatches installation to one selected component.
- `tests/test_install.sh`: root dispatcher checks.

## Verification

Run all checks after changing repository-level installation or packaging:

```bash
bash tests/test_install.sh
bash components/codebrief/tests/test_install.sh
bash components/codereview/tests/test_install.sh
```
