#!/usr/bin/env bash
set -euo pipefail

MODE="global"
TARGET_DIR=""
ASSUME_YES=0

usage() {
    cat <<'EOF'
Usage: ./install.sh [--global | --local <project-dir>] [--yes]

Options:
  --global               Install for the current user. This is the default.
  --local <project-dir>  Install only in one project's .opencode directory.
  --yes, -y              Replace existing Codebrief files without prompting.
  --help, -h             Show this help.
EOF
}

while [[ $# -gt 0 ]]; do
    case "$1" in
        --global)
            MODE="global"
            shift
            ;;
        --local)
            if [[ $# -lt 2 ]]; then
                echo "--local requires a project directory." >&2
                exit 1
            fi
            MODE="local"
            TARGET_DIR="$2"
            shift 2
            ;;
        --yes|-y)
            ASSUME_YES=1
            shift
            ;;
        --help|-h)
            usage
            exit 0
            ;;
        *)
            echo "Unknown option: $1" >&2
            usage >&2
            exit 1
            ;;
    esac
done

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
AGENT_SOURCE="$SCRIPT_DIR/agents/codebrief.md"
COMMAND_SOURCE="$SCRIPT_DIR/commands/codebrief.md"

if [[ ! -f "$AGENT_SOURCE" || ! -f "$COMMAND_SOURCE" ]]; then
    echo "Codebrief source files are missing." >&2
    exit 1
fi

if [[ "$MODE" == "global" ]]; then
    INSTALL_ROOT="$HOME/.config/opencode"
else
    if [[ -z "$TARGET_DIR" || ! -d "$TARGET_DIR" ]]; then
        echo "--local requires an existing project directory." >&2
        exit 1
    fi
    INSTALL_ROOT="$(cd "$TARGET_DIR" && pwd)/.opencode"
fi

AGENT_DEST="$INSTALL_ROOT/agents/codebrief.md"
COMMAND_DEST="$INSTALL_ROOT/commands/codebrief.md"
ALTERNATE_AGENT="$INSTALL_ROOT/agent/codebrief.md"
ALTERNATE_COMMAND="$INSTALL_ROOT/command/codebrief.md"

for alternate in "$ALTERNATE_AGENT" "$ALTERNATE_COMMAND"; do
    if [[ -e "$alternate" || -L "$alternate" ]]; then
        echo "Competing Codebrief definition found: $alternate" >&2
        echo "Move or remove it before installing Codebrief." >&2
        exit 1
    fi
done

if cmp -s "$AGENT_SOURCE" "$AGENT_DEST" \
    && cmp -s "$COMMAND_SOURCE" "$COMMAND_DEST"; then
    echo "Codebrief is already up to date in $INSTALL_ROOT."
    exit 0
fi

if [[ -e "$AGENT_DEST" || -L "$AGENT_DEST" \
    || -e "$COMMAND_DEST" || -L "$COMMAND_DEST" ]]; then
    if [[ "$ASSUME_YES" != "1" ]]; then
        read -rp "Replace the installed Codebrief agent and command? [y/N] " reply
        case "$reply" in
            y|Y|yes|YES|Yes) ;;
            *)
                echo "Installation stopped; existing files were left unchanged." >&2
                exit 1
                ;;
        esac
    fi
fi

mkdir -p "$(dirname "$AGENT_DEST")" "$(dirname "$COMMAND_DEST")"
install -m 0644 "$AGENT_SOURCE" "$AGENT_DEST"
install -m 0644 "$COMMAND_SOURCE" "$COMMAND_DEST"
echo "Installed: $AGENT_DEST"
echo "Installed: $COMMAND_DEST"

echo "Restart OpenCode, then select the codebrief agent or run /codebrief."
