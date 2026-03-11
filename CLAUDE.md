# Project Instructions

## Version Bumping

Whenever any plugin content is modified (skills, assets, or plugin configuration), you **must** bump the patch version in:

- **Marketplace entry**: `.claude-plugin/marketplace.json` → the matching plugin's `"version"` field

This is the single source of truth for plugin versions. Do **not** set a version in `plugins/<plugin-name>/.claude-plugin/plugin.json` — the plugin manifest version silently overrides the marketplace version, which causes confusion.

Use semantic versioning (MAJOR.MINOR.PATCH). Bump the **patch** version for content changes (e.g., `1.0.1` → `1.0.2`).

### Example

If the current version is `1.0.3` and you edit a SKILL.md or asset file, update the marketplace entry to `1.0.4`.
