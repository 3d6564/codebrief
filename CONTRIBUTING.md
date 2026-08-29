# Contributing

Codebrief is a small interview-assistant project. Work happens on short-lived
branches and lands through pull requests.

## Workflow

1. Branch from current `main` as `feature/<short-description>` or
   `fix/<short-description>`.
2. Never implement on `main`.
3. Keep one concern per branch.
4. When required checks pass, open a pull request without waiting to be asked.
   Tell the owner it is ready to review.
5. Squash merge after review.
6. After merge, update local `main` and delete both the local and remote topic
   branches.
7. Treat a merged branch as closed. For any later change, fetch `origin`, create
   a new branch from the current `origin/main`, and open a separate pull request.

Do not reuse merged branches or use long-lived developer branches. If a merged
branch was not deleted, delete it instead of adding more commits.

## Required checks

```bash
bash tests/test_install.sh
```

The tests use temporary directories and do not change the user's agent config.

## Change rules

- Read `AGENTS.md` and `docs/INTERVIEW_DESIGN.md`.
- Keep `prompt/codebrief.md` as the interview source.
- Keep adapter frontmatter under `packaging/`.
- Do not invent other tools' config shapes.
- Do not install Codebrief into `AGENTS.md`, `CLAUDE.md`, or
  `copilot-instructions.md`.
- Update `README.md` when setup, commands, or install targets change.
- Do not commit secrets, `.env`, or generated local install copies.

## Pull requests

The pull request is the review handoff. State files changed, checks run, known
risks, and work left out of scope. Open it as soon as local required checks
pass, then stop and ask the owner to review.
