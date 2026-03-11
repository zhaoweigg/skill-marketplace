#!/usr/bin/env bash
# install.sh — Register this skills marketplace with Claude Code.
# Usage: ./scripts/install.sh
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
MARKETPLACE_NAME="personal-skills"

echo "Installing $MARKETPLACE_NAME marketplace..."
echo ""

# Add marketplace from local path
claude plugin marketplace add "$REPO_DIR"

echo ""
echo "Marketplace added. Available plugins:"
echo ""

# List available plugins
for plugin_dir in "$REPO_DIR"/plugins/*/; do
  [ -f "$plugin_dir/.claude-plugin/plugin.json" ] || continue
  plugin_name="$(basename "$plugin_dir")"
  echo "  $plugin_name@$MARKETPLACE_NAME"
done

echo ""
echo "Install a plugin with:"
echo "  /plugin install <plugin-name>@$MARKETPLACE_NAME"
