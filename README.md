# Personal Skill Marketplace

A curated collection of Claude Code skills for stock analysis and swing trading.

## Skills

| Skill | What it does |
|-------|-------------|
| [stock-research](skills/stock-research/) | Full investment research report — financials, valuation, competitive position, risk, catalysts |
| [market-sentiment-analyzer](skills/market-sentiment-analyzer/) | Multi-factor market sentiment score (-10 to +10) for swing trading decisions |
| [growth-swing-trader](skills/growth-swing-trader/) | Regime-based timing for high-growth stocks (SoFi, COIN, UPST, etc.) |
| [market-conditions-rubric](skills/market-conditions-rubric/) | Scored market health check across 9 dimensions on a 1-10 scale |

## Installation

Add the marketplace directly from Claude Code:

```
/plugin marketplace add zhaoweigg/skill-marketplace
```

Then install individual plugins:

```
/plugin install stock-research@personal-skills
```

Alternatively, clone and install locally:

```bash
git clone https://github.com/zhaoweigg/skill-marketplace
cd skill-marketplace
./scripts/install.sh
```

For more details, see [docs/getting-started.md](docs/getting-started.md).

## Adding skills

See [docs/creating-a-skill.md](docs/creating-a-skill.md) and copy from `templates/`.

## Structure

```
skill-marketplace/
├── .claude-plugin/marketplace.json   ← marketplace entry point
├── skills/                           ← all skills (flat, no subcategories)
│   ├── stock-research/
│   ├── market-sentiment-analyzer/
│   ├── growth-swing-trader/
│   └── market-conditions-rubric/
├── templates/                        ← blank skill & readme templates
├── docs/                             ← guides
└── scripts/                          ← tooling
```

## License

MIT
