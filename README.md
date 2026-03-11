# Personal Skill Marketplace

A curated collection of Claude Code skills for stock analysis and swing trading.

## Skills

### Trading

| Skill | What it does |
|-------|-------------|
| [market-sentiment-analyzer](skills/trading/market-sentiment-analyzer/) | Multi-factor market sentiment score (−10 to +10) for swing trading decisions |
| [stock-research](skills/trading/stock-research/) | Full investment research report — financials, valuation, competitive position, risk, catalysts |
| [growth-swing-trader](skills/trading/growth-swing-trader/) | Regime-based timing for high-growth stocks (SoFi, COIN, UPST, etc.) |
| [market-conditions-rubric](skills/trading/market-conditions-rubric/) | Scored market health check across 9 dimensions on a 1–10 scale |

## Installation

```bash
git clone https://github.com/zhaoweigg/skill-marketplace
cd skill-marketplace
./scripts/install.sh
```

Restart Claude Code. Skills are registered under the `personal-skills` namespace.

For manual setup, see [docs/getting-started.md](docs/getting-started.md).

## Adding skills

See [docs/creating-a-skill.md](docs/creating-a-skill.md) and copy from `templates/`.

## Structure

```
skill-marketplace/
├── .claude-plugin/marketplace.json   ← marketplace entry point
├── skills/
│   ├── trading/                      ← trading & markets skills
│   └── productivity/                 ← productivity skills
├── templates/                        ← blank skill & readme templates
├── docs/                             ← guides
└── scripts/                          ← tooling
    └── validate-skills.sh
```

## License

MIT
