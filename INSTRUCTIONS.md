# INSTRUCTIONS.md

## Scope and instruction priority

- Apply this file to the Codefactory repository and its components.
- Extend the rules in `AGENTS.md`; do not replace them.
- Before working, read the closest scoped instruction files and any files they
  name as current sources.
- Closer, more specific instructions take priority. If relevant files disagree,
  report the conflict and ask rather than guessing.

## Communication

- Use concise, direct, practical software-engineering language.
- Prefer simple common words over academic or jargon-heavy terms.
- Follow ASD-STE100 Simplified Technical English as an adapted writing style.
  Do not claim formal compliance.
- Prefer short sentences, one main idea per sentence, and specific names over
  vague shorthand.
- Define a specialized term when it is first used.
- Use "fixture" only for internal tests and documentation about those tests. In
  other prose, name the actual item, such as test server or sample data.
- In new prose, use "main," "official," or the named source instead of
  "canonical"; use "use" instead of "utilize" or "leverage"; name the specific
  quality instead of "robust," "clean," or "proper"; and omit "simply,"
  "obviously," or "just."
- Do not explain routine actions unless asked.

## Working method

- Treat review, audit, and inspection requests as report-only until editing is
  separately requested or approved.
- Present a plan before broad, unclear, security-sensitive, or hard-to-reverse
  work.
- Follow the repository's existing language, versions, tools, layout, and style.
- Keep work within the requested scope. Nearby cleanup is allowed when it
  supports the task.
- Ask before editing a file that already contains unrelated user changes.
- Ask when expected behavior is unclear, a choice has lasting effects, or work
  grows beyond the plan.
- Codefactory capabilities are opt-in. Before using one, follow its prompt and
  ask whether Codebrief has been used. Never infer the answer from an
  `INSTRUCTIONS.md` file.

## Code and documentation

- Ask before changing major design choices, public interfaces, dependencies,
  package tools, or core development tools.
- Add concise docstrings to public functions and non-obvious behavior.
- Use comments for reasons and tradeoffs, not to repeat code.
- Give TODO comments an issue or task reference.
- Update documentation when setup, commands, public behavior, or an approved
  major design changes.

## Errors and logging

- Follow the local error pattern. Handle errors when recovery or useful context
  is possible; otherwise let failures surface.
- User-facing errors state what failed and the next useful step without
  unnecessary internal detail.
- Use the existing logger, fields, levels, and destination. Ask before adding a
  new logging system.
- Redact sensitive values in normal output.
- Advanced debug output may show full local detail only when explicitly enabled.
  Keep that output local and out of version control.
- Test logs or structured events only when other code or tools rely on them.

## Testing and checks

- Run every applicable required check named by the closest project guidance. Do
  not invent commands where none are documented.
- Add or update a focused test for changed behavior when a test setup exists.
- For bug fixes, reproduce the failure, identify the cause, and add a test that
  prevents it from returning.
- If a required check cannot run, report the exact command, reason, and remaining
  risk. Do not claim it passed.

## Safety and permissions

- Without asking, the agent may read safe project files, edit the requested
  scope, run offline checks, and run already approved local containers.
- Access secrets, recordings, transcripts, private notes, generated evidence,
  and local databases only when the task requires it and closer instructions
  allow it.
- Ask before editing private or generated data unless closer instructions allow
  the exact change.
- Ask before network calls, dependency changes, commits, pushes, releases,
  deployments, cloud changes, or remote data changes.
- Ask before deletion, resets, history rewrites, or other hard-to-reverse actions
  unless closer instructions allow the exact cleanup.
- Check user input, files, external responses, and model output before using them
  in commands, paths, code, logs, or further prompts.
- Do not send project data to hosted models, APIs, telemetry, or other external
  services without approval.

## Definition of done

- Requested behavior and stated acceptance conditions are met.
- Existing public behavior remains intact unless an approved change requires
  otherwise.
- Tests and documentation meet the rules above.
- The final response lists changed files, checks, risks, assumptions, and
  deferred work.
