# Codebrief

Codebrief is an interview assistant that learns how a developer wants a project
handled, then writes those choices to `INSTRUCTIONS.md` for a coding agent.

It first inspects the repository, asks short sets of follow-up questions, and
branches into the areas that fit the project. It covers details that generic
agent instructions often miss, including:

- preferred language, tone, response length, and words to avoid
- architecture boundaries and dependency choices
- comments, docstrings, naming, typing, and error handling
- log format, levels, fields, redaction, and destinations
- test types, exact commands, CI gates, and the definition of done
- issues, project boards, default-branch policy, and pull-request handoff
- secrets, sensitive data, network access, and approval boundaries
- UI, API, data/ML, cloud, security, and AI-agent concerns when relevant
- what the coding agent may edit, install, execute, commit, or deploy

## Why the name

A useful coding-agent file is a project brief, not a pile of generic rules.
Codebrief builds that brief from repository evidence and developer decisions.

## Install

Install the agent and command for your user account:

```bash
./install.sh --global
```

Or install them only in one project:

```bash
./install.sh --local /path/to/project
```

Use `--yes` for a non-interactive install. The installer copies the files, so
rerun it after changing Codebrief itself.

Quit and restart OpenCode after installation. OpenCode loads agents and commands
only at startup.

## Use

Start OpenCode in the project that needs instructions. Select the `codebrief`
agent or run:

```text
/codebrief
```

Optional text after the command can set a focus:

```text
/codebrief deep interview, focus on logging and deployment
/codebrief update the existing instructions for a Python API
```

Codebrief offers three depths:

- **Quick:** core workflow and immediate risks.
- **Guided:** core workflow plus relevant project branches. This is the default.
- **Deep:** full review, including operations and agent permissions.

It does not write during discovery. Before creating or updating
`INSTRUCTIONS.md`, it shows the rules it plans to include, calls out unresolved
questions, and asks for approval. Confirmed always-on constraints can later be
added to `AGENTS.md` or `CONTRIBUTING.md` as a separate approved change.

## Loading the result

`INSTRUCTIONS.md` is intentionally tool-neutral. Not every coding agent loads
that filename automatically. Codebrief asks which agent will consume it and can
offer the smallest separate loader change after the file is approved.

For OpenCode, a project can load it through `opencode.json`:

```json
{
  "$schema": "https://opencode.ai/config.json",
  "instructions": ["INSTRUCTIONS.md"]
}
```

Codebrief does not create or change that config unless the user separately
approves it.

## Design

See `docs/INTERVIEW_DESIGN.md` for the interview flow, evidence rules, branching
topics, and output contract.

## Verify

```bash
bash tests/test_install.sh
```

The tests use temporary directories and do not change the user's OpenCode
configuration.
