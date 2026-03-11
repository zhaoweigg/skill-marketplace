# Getting Started

How to add this skill marketplace to Claude Code.

## Install via script (local)

Clone the repo and run the install script:

```bash
git clone https://github.com/zhaoweigg/skill-marketplace ~/skill-marketplace
cd ~/skill-marketplace
./scripts/install.sh
```

Then restart Claude Code. Skills will appear in the skill list under the `personal-skills` namespace.

## Install via Claude Code settings (manual)

Add this to your `~/.claude/settings.json`:

```json
{
  "extraKnownMarketplaces": {
    "personal-skills": {
      "source": {
        "source": "local",
        "path": "/absolute/path/to/this/repo"
      }
    }
  }
}
```

Restart Claude Code to pick up the changes.

## Verifying the install

In Claude Code, type a trigger phrase for any skill — for example:

- `"Should I swing trade now?"` → triggers **market-sentiment-analyzer**
- `"Research Apple stock"` → triggers **stock-research**
- `"Is the market risk-on or risk-off?"` → triggers **growth-swing-trader**
- `"Score the market conditions"` → triggers **market-conditions-rubric**

## Uninstalling

Remove the `personal-skills` entry from `extraKnownMarketplaces` in `~/.claude/settings.json` and restart Claude Code.
