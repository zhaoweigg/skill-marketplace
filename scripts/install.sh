#!/usr/bin/env bash
# install.sh — Register this skills marketplace with Claude Code locally.
# Run once after cloning. Restart Claude Code to pick up the new skills.
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
MARKETPLACE_NAME="personal-skills"
CLAUDE_PLUGINS_DIR="$HOME/.claude/plugins"
MARKETPLACE_DIR="$CLAUDE_PLUGINS_DIR/marketplaces/$MARKETPLACE_NAME"
KNOWN_MARKETPLACES="$CLAUDE_PLUGINS_DIR/known_marketplaces.json"
SETTINGS="$HOME/.claude/settings.json"

echo "Installing $MARKETPLACE_NAME from $REPO_DIR..."

# Copy repo into marketplace location
mkdir -p "$CLAUDE_PLUGINS_DIR/marketplaces"
if [ -e "$MARKETPLACE_DIR" ]; then
  echo "  Updating existing install at $MARKETPLACE_DIR"
  rm -rf "$MARKETPLACE_DIR"
fi
cp -r "$REPO_DIR" "$MARKETPLACE_DIR"
echo "  Copied: $REPO_DIR → $MARKETPLACE_DIR"

NOW="$(date -u +"%Y-%m-%dT%H:%M:%S.000Z")"

# Update known_marketplaces.json
[ -f "$KNOWN_MARKETPLACES" ] || echo '{}' > "$KNOWN_MARKETPLACES"
python3 - <<PYEOF
import json
path = "$KNOWN_MARKETPLACES"
with open(path) as f:
    data = json.load(f)
data["$MARKETPLACE_NAME"] = {
    "source": {"source": "local", "path": "$REPO_DIR"},
    "installLocation": "$MARKETPLACE_DIR",
    "lastUpdated": "$NOW"
}
with open(path, "w") as f:
    json.dump(data, f, indent=2)
print("  Updated:", path)
PYEOF

# Update settings.json
[ -f "$SETTINGS" ] || echo '{}' > "$SETTINGS"
python3 - <<PYEOF
import json
path = "$SETTINGS"
with open(path) as f:
    data = json.load(f)
marketplaces = data.setdefault("extraKnownMarketplaces", {})
marketplaces["$MARKETPLACE_NAME"] = {
    "source": {"source": "local", "path": "$REPO_DIR"}
}
with open(path, "w") as f:
    json.dump(data, f, indent=2)
print("  Updated:", path)
PYEOF

echo ""
echo "Done! Skills registered:"
while IFS= read -r skill_md; do
  skill_dir="$(dirname "$skill_md")"
  skill_name="$(basename "$skill_dir")"
  echo "  · $MARKETPLACE_NAME:$skill_name"
done < <(find "$REPO_DIR/skills" -name "SKILL.md" | sort)
echo ""
echo "Restart Claude Code to pick up the new skills."
