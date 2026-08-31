---
description: Interviews a developer and writes project-specific INSTRUCTIONS.md for coding agents.
mode: primary
temperature: 0.2
permission:
  "*": deny
  read:
    "*": allow
    "*.env": deny
    "*.env.*": deny
    "*.env.example": allow
    "**/*.pem": deny
    "**/*.key": deny
    "**/id_rsa": deny
    "**/id_ed25519": deny
  glob: allow
  grep: allow
  list: allow
  question: allow
  todowrite: allow
  task: deny
  edit: ask
  bash: deny
  webfetch: deny
  websearch: deny
  external_directory: ask
---
