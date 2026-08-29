#!/usr/bin/env bash
set -euo pipefail

PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TEMP_DIR="$(mktemp -d)"
trap 'rm -rf "$TEMP_DIR"' EXIT

fail() {
    echo "FAIL: $1" >&2
    exit 1
}

assert_file() {
    [[ -f "$1" ]] || fail "missing file $1"
}

assert_contains() {
    grep -qF -- "$2" "$1" || fail "$1 does not contain: $2"
}

assert_file "$PROJECT_DIR/agents/codebrief.md"
assert_file "$PROJECT_DIR/commands/codebrief.md"
assert_file "$PROJECT_DIR/docs/INTERVIEW_DESIGN.md"

assert_contains "$PROJECT_DIR/agents/codebrief.md" "mode: primary"
assert_contains "$PROJECT_DIR/agents/codebrief.md" '"*": deny'
assert_contains "$PROJECT_DIR/agents/codebrief.md" '"*.env": deny'
assert_contains "$PROJECT_DIR/agents/codebrief.md" "task: deny"
assert_contains "$PROJECT_DIR/agents/codebrief.md" "Ask two to four related questions at a time."
assert_contains "$PROJECT_DIR/agents/codebrief.md" "Comments, docstrings, and documentation"
assert_contains "$PROJECT_DIR/agents/codebrief.md" "Errors and logging"
assert_contains "$PROJECT_DIR/agents/codebrief.md" "Collaboration, issues, and version control"
assert_contains "$PROJECT_DIR/agents/codebrief.md" "Hard-rule follow-up"
assert_contains "$PROJECT_DIR/agents/codebrief.md" "Pre-write checkpoint"
assert_contains "$PROJECT_DIR/docs/INTERVIEW_DESIGN.md" "collaboration and version control"
assert_contains "$PROJECT_DIR/commands/codebrief.md" 'User focus or target: `$ARGUMENTS`'

if bash "$PROJECT_DIR/install.sh" --local >/dev/null 2>&1; then
    fail "--local without a path should fail"
fi

mkdir -p "$TEMP_DIR/home" "$TEMP_DIR/project"

HOME="$TEMP_DIR/home" bash "$PROJECT_DIR/install.sh" --global --yes >/dev/null
GLOBAL_ROOT="$TEMP_DIR/home/.config/opencode"
assert_file "$GLOBAL_ROOT/agents/codebrief.md"
assert_file "$GLOBAL_ROOT/commands/codebrief.md"
cmp -s "$PROJECT_DIR/agents/codebrief.md" "$GLOBAL_ROOT/agents/codebrief.md" \
    || fail "global agent differs from source"
cmp -s "$PROJECT_DIR/commands/codebrief.md" "$GLOBAL_ROOT/commands/codebrief.md" \
    || fail "global command differs from source"

bash "$PROJECT_DIR/install.sh" --local "$TEMP_DIR/project" --yes >/dev/null
LOCAL_ROOT="$TEMP_DIR/project/.opencode"
assert_file "$LOCAL_ROOT/agents/codebrief.md"
assert_file "$LOCAL_ROOT/commands/codebrief.md"

# A second install exercises the no-change path.
HOME="$TEMP_DIR/home" bash "$PROJECT_DIR/install.sh" --global --yes >/dev/null

mkdir -p "$TEMP_DIR/refusal-home/.config/opencode/agents"
printf 'old agent\n' > "$TEMP_DIR/refusal-home/.config/opencode/agents/codebrief.md"
if printf 'n\n' | HOME="$TEMP_DIR/refusal-home" \
    bash "$PROJECT_DIR/install.sh" --global >/dev/null 2>&1; then
    fail "declining replacement should return a failure"
fi
[[ ! -e "$TEMP_DIR/refusal-home/.config/opencode/commands/codebrief.md" ]] \
    || fail "declined install should not create a command"

mkdir -p "$TEMP_DIR/conflict-home/.config/opencode/agent"
printf 'competing agent\n' > "$TEMP_DIR/conflict-home/.config/opencode/agent/codebrief.md"
if HOME="$TEMP_DIR/conflict-home" \
    bash "$PROJECT_DIR/install.sh" --global --yes >/dev/null 2>&1; then
    fail "alternate agent path should block installation"
fi

if command -v opencode >/dev/null 2>&1; then
    HOME="$TEMP_DIR/home" opencode --pure debug agent codebrief >/dev/null
fi

echo "Codebrief scaffold checks passed."
