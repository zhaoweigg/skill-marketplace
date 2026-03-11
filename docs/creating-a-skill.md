# Creating a Skill

Guide for adding a new skill to this marketplace.

## 1. Create the skill directory

```bash
mkdir -p skills/<skill-name>/assets
```

Use `kebab-case` for the skill name. Keep it short and descriptive.

## 2. Write the SKILL.md

Copy `templates/SKILL_TEMPLATE.md` as a starting point:

```bash
cp templates/SKILL_TEMPLATE.md skills/<skill-name>/SKILL.md
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

## 3. Write the README.md

```bash
cp templates/README_TEMPLATE.md skills/<skill-name>/README.md
```

The README is for humans — document trigger phrases, example output, and any assets.

## 4. Add assets (optional)

Put reference docs, templates, or sample data in `assets/`. Reference them in SKILL.md with relative paths like `assets/filename.md`.

## 5. Register in marketplace.json

Add an entry to `.claude-plugin/marketplace.json`:

```json
{
  "name": "skill-name",
  "description": "One-line description",
  "version": "1.0.0",
  "author": "zhaoweigg",
  "category": "finance",
  "tags": ["relevant", "tags"],
  "license": "MIT",
  "repository": "https://github.com/zhaoweigg/skill-marketplace",
  "source": "./skills/<skill-name>"
}
```

## 6. Validate

```bash
./scripts/validate-skills.sh
```

## 7. Update the catalog

Add your skill to `docs/catalog.md`.

## Tips

- The `description` frontmatter is critical. It determines when Claude invokes the skill. Test it by trying trigger phrases after installing.
- Keep `SKILL.md` instructions concrete and sequential. Avoid vague directives like "analyze this" — specify exactly what to search, read, or calculate.
- Reference assets by relative path from the skill directory: `assets/filename.md`, not an absolute path.
