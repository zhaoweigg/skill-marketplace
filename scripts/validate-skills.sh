#!/usr/bin/env bash
# validate-skills.sh — Check that each plugin directory has the required files
# and that marketplace.json references all of them.
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
MARKETPLACE="$REPO_DIR/.claude-plugin/marketplace.json"
PLUGINS_DIR="$REPO_DIR/plugins"

errors=0
warnings=0

echo "Validating skill marketplace..."
echo ""

# --- Check each plugin directory ---
for plugin_dir in "$PLUGINS_DIR"/*/; do
  [ -d "$plugin_dir" ] || continue
  plugin_name="$(basename "$plugin_dir")"
  rel_path="plugins/$plugin_name"

  # Required: .claude-plugin/plugin.json
  if [ ! -f "$plugin_dir/.claude-plugin/plugin.json" ]; then
    echo "  ERROR  $rel_path — missing .claude-plugin/plugin.json"
    ((errors++))
  fi

  # Check for at least one SKILL.md
  skill_count=$(find "$plugin_dir/skills" -name "SKILL.md" 2>/dev/null | wc -l)
  if [ "$skill_count" -eq 0 ]; then
    echo "  ERROR  $rel_path — no SKILL.md found under skills/"
    ((errors++))
  fi

  # Check each skill within the plugin
  while IFS= read -r skill_md; do
    skill_dir_path="$(dirname "$skill_md")"
    skill_name="$(basename "$skill_dir_path")"
    skill_rel="$rel_path/skills/$skill_name"

    # Required: SKILL.md with frontmatter
    if ! grep -q "^---" "$skill_md" 2>/dev/null; then
      echo "  ERROR  $skill_rel/SKILL.md — missing YAML frontmatter"
      ((errors++))
    fi

    if ! grep -q "^description:" "$skill_md" 2>/dev/null; then
      echo "  ERROR  $skill_rel/SKILL.md — missing 'description:' in frontmatter"
      ((errors++))
    fi

    # Recommended: README.md
    if [ ! -f "$skill_dir_path/README.md" ]; then
      echo "  WARN   $skill_rel — missing README.md"
      ((warnings++))
    fi
  done < <(find "$plugin_dir/skills" -name "SKILL.md" 2>/dev/null | sort)

  # Check marketplace.json references this plugin
  source_path="./$rel_path"
  if ! python3 -c "
import json, sys
with open('$MARKETPLACE') as f:
    data = json.load(f)
sources = [p.get('source','') for p in data.get('plugins', [])]
sys.exit(0 if '$source_path' in sources else 1)
" 2>/dev/null; then
    echo "  WARN   $rel_path — not registered in .claude-plugin/marketplace.json"
    ((warnings++))
  fi

  echo "  OK     $rel_path"

done

echo ""

# --- Check marketplace.json entries resolve to real directories ---
echo "Checking marketplace.json..."
python3 - <<PYEOF
import json, os, sys

marketplace = "$MARKETPLACE"
repo_dir = "$REPO_DIR"
errors = 0

with open(marketplace) as f:
    data = json.load(f)

for plugin in data.get("plugins", []):
    source = plugin.get("source", "")
    if source.startswith("./"):
        path = os.path.join(repo_dir, source[2:])
        if not os.path.isdir(path):
            print(f"  ERROR  plugin '{plugin['name']}' source '{source}' — directory not found")
            errors += 1
        elif not os.path.isfile(os.path.join(path, ".claude-plugin", "plugin.json")):
            print(f"  ERROR  plugin '{plugin['name']}' source '{source}' — missing .claude-plugin/plugin.json")
            errors += 1

sys.exit(errors)
PYEOF
marketplace_ok=$?

echo ""

if [ $errors -gt 0 ] || [ $marketplace_ok -ne 0 ]; then
  echo "Validation failed: $errors error(s), $warnings warning(s)"
  exit 1
else
  echo "All plugins valid. $warnings warning(s)."
fi

# Run official plugin validation if claude CLI is available
if command -v claude &>/dev/null; then
  echo ""
  echo "Running claude plugin validate..."
  claude plugin validate "$REPO_DIR"
fi
