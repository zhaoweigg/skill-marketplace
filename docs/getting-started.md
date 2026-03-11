# Getting Started

How to add this skill marketplace to Claude Code.

## Install from GitHub (recommended)

In Claude Code, run:

```
/plugin marketplace add zhaoweigg/skill-marketplace
```

Then install individual plugins:

```
/plugin install stock-research@personal-skills
/plugin install market-sentiment-analyzer@personal-skills
/plugin install growth-swing-trader@personal-skills
/plugin install market-conditions-rubric@personal-skills
```

## Install from local clone

```bash
git clone https://github.com/zhaoweigg/skill-marketplace
cd skill-marketplace
./scripts/install.sh
```

Then install plugins using the `/plugin install` commands above.

## Verifying the install

In Claude Code, type a trigger phrase for any skill:

- `"Research Apple stock"` → triggers **stock-research**
- `"Should I swing trade now?"` → triggers **market-sentiment-analyzer**
- `"Is the market risk-on or risk-off?"` → triggers **growth-swing-trader**
- `"Score the market conditions"` → triggers **market-conditions-rubric**

## Updating

```
/plugin marketplace update personal-skills
```

## Uninstalling

Remove individual plugins:

```
/plugin uninstall stock-research@personal-skills
```

Or remove the entire marketplace:

```
/plugin marketplace remove personal-skills
```
