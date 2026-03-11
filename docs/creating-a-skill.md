# Creating a Skill

Guide for adding a new skill to this marketplace.

## 1. Choose a category

Skills live under `skills/<category>/`. Current categories:

- `trading/` — stock analysis, market analysis, trading decisions
- `productivity/` — general productivity and workflow tools

Add a new category folder if your skill doesn't fit an existing one.

## 2. Create the skill directory

```bash
mkdir -p skills/<category>/<skill-name>/assets
```

Use `kebab-case` for the skill name. Keep it short and descriptive.

## 3. Write the SKILL.md

Copy `templates/SKILL_TEMPLATE.md` as a starting point:

```bash
cp templates/SKILL_TEMPLATE.md skills/<category>/<skill-name>/SKILL.md
```

The SKILL.md has two parts:

**Frontmatter** (required):
```yaml
---
name: skill-name
description: >
  When Claude should use this skill. Be specific — this is what Claude
  reads to decide whether to invoke the skill.
---
```

**Body**: Step-by-step instructions Claude follows when the skill is invoked. Write it as a clear workflow, not a description. Claude will execute these instructions literally.

## 4. Write the README.md

```bash
cp templates/README_TEMPLATE.md skills/<category>/<skill-name>/README.md
```

The README is for humans — document trigger phrases, example output, and any assets.

## 5. Add assets (optional)

Put reference docs, templates, or sample data in `assets/`. Reference them in SKILL.md with relative paths like `assets/filename.md`.

## 6. Register in marketplace.json

Add an entry to `.claude-plugin/marketplace.json`:

```json
{
  "name": "skill-name",
  "description": "One-line description",
  "source": "./skills/<category>/<skill-name>",
  "category": "<category>"
}
```

## 7. Validate

```bash
./scripts/validate-skills.sh
```

## 8. Update the catalog

Add your skill to `docs/catalog.md`.

## Tips

- The `description` frontmatter is critical. It determines when Claude invokes the skill. Test it by trying trigger phrases after installing.
- Keep `SKILL.md` instructions concrete and sequential. Avoid vague directives like "analyze this" — specify exactly what to search, read, or calculate.
- Reference assets by relative path from the skill directory: `assets/filename.md`, not an absolute path.
