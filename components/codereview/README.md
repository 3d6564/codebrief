# Codefactory

Codefactory packages focused capabilities for coding agents. The first is
`codereview`: a report-first GitHub pull-request reviewer.

Before reviewing, Codereview asks whether Codebrief has been used for the
target. A confirmed answer makes the applicable instruction files required
review context. It never infers Codebrief use from an `INSTRUCTIONS.md` file.

## Install

Choose an agent. `--agent` is required with `--yes`. Without `--yes`, an
interactive terminal can pick one.

```bash
./install.sh codereview --agent opencode --global
./install.sh codereview --agent claude --local /path/to/project
./install.sh codereview --global
```

| Agent | Global path | Local path | How to run |
| --- | --- | --- | --- |
| `opencode` | `~/.config/opencode/agents/` and `commands/` | `.opencode/agents/` and `commands/` | Select `codereview` or run `/codereview 42` |
| `prompt` | `~/.config/codefactory/codereview.md` | `.codefactory/codereview.md` | Point any agent at the prompt |
| `claude` | `~/.claude/agents/` and `skills/` | `.claude/agents/` and `.claude/skills/` | `/codereview 42` or `claude --agent codereview` |
| `cursor` | `~/.cursor/skills/` | `.cursor/skills/` | `/codereview 42` in Agent chat |
| `copilot` | `~/.copilot/agents/` | `.github/agents/` | Select the custom agent |
| `codex` | `~/.codex/agents/` | `.codex/agents/` | Ask Codex to use `codereview` |

Use `--yes` for a non-interactive install. If Codefactory files already exist,
the installer asks before replacing them unless `--yes` is set. The installer
copies files, so rerun it after changing Codefactory itself. Restart the target
agent after install.

## Use

Run Codereview from the target repository and provide one pull-request number:

```text
/codereview 42
```

Codereview asks before GitHub access, performs a read-only review by default,
and reports findings with file and line references. It posts comments or creates
follow-up issues only when explicitly requested.

## Verify

```bash
bash components/codereview/tests/test_install.sh
```

The tests use temporary directories and do not change the user's agent
configuration.

## Contributing

See the repository [CONTRIBUTING.md](../../CONTRIBUTING.md).

## License

MIT License. See the repository [LICENSE](../../LICENSE).
