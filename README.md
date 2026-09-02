# Codefactory

Codefactory packages focused capabilities for coding agents. Each component is
independently installable and keeps its own prompt, adapters, documentation, and
tests.

## Components

| Component | Purpose | Documentation |
| --- | --- | --- |
| `codebrief` | Interviews a developer and writes project-specific `INSTRUCTIONS.md`. | [Codebrief](components/codebrief/README.md) |
| `codereview` | Reviews one pull request or merge request by URL or number and reports findings before remote changes. | [Codereview](components/codereview/README.md) |

## Install

Select a component, then pass its installer options:

```bash
./install.sh codebrief --agent opencode --global
./install.sh codereview --agent claude --local /path/to/project
```

Run `./install.sh --help` to list components. Each component installer can also
be run directly from its component directory.

## Verify

```bash
bash tests/test_install.sh
bash components/codebrief/tests/test_install.sh
bash components/codereview/tests/test_install.sh
```

The tests use temporary directories and do not change the user's agent
configuration.

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md).

## License

MIT License. See [LICENSE](LICENSE).
