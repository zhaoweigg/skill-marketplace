#!/usr/bin/env bash
# validate-skills.sh — Check that each skill directory has the required files
# and that marketplace.json references all of them.
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
MARKETPLACE="$REPO_DIR/.claude-plugin/marketplace.json"
SKILLS_DIR="$REPO_DIR/skills"

errors=0
warnings=0

echo "Validating skill marketplace..."
echo ""

# --- Check each skill directory ---
while IFS= read -r skill_md; do
  skill_dir="$(dirname "$skill_md")"
  skill_name="$(basename "$skill_dir")"
  rel_path="${skill_dir#$REPO_DIR/}"

  # Required: SKILL.md with frontmatter
  if ! grep -q "^---" "$skill_md" 2>/dev/null; then
    echo "  ERROR  $rel_path/SKILL.md — missing YAML frontmatter"
    ((errors++))
  fi

  if ! grep -q "^name:" "$skill_md" 2>/dev/null; then
    echo "  ERROR  $rel_path/SKILL.md — missing 'name:' in frontmatter"
    ((errors++))
  fi

  if ! grep -q "^description:" "$skill_md" 2>/dev/null; then
    echo "  ERROR  $rel_path/SKILL.md — missing 'description:' in frontmatter"
    ((errors++))
  fi

  # Recommended: README.md
  if [ ! -f "$skill_dir/README.md" ]; then
    echo "  WARN   $rel_path — missing README.md"
    ((warnings++))
  fi

  # Check marketplace.json references this skill
  source_path="./${rel_path}"
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

done < <(find "$SKILLS_DIR" -name "SKILL.md" | sort)

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
        elif not os.path.isfile(os.path.join(path, "SKILL.md")):
            print(f"  ERROR  plugin '{plugin['name']}' source '{source}' — missing SKILL.md")
            errors += 1

sys.exit(errors)
PYEOF
marketplace_ok=$?

echo ""

if [ $errors -gt 0 ] || [ $marketplace_ok -ne 0 ]; then
  echo "Validation failed: $errors error(s), $warnings warning(s)"
  exit 1
else
  echo "All skills valid. $warnings warning(s)."
fi
