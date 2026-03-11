# Stock Research

Generates a comprehensive investment research report covering five analysis pillars.

## What it does

Produces a professional markdown report with:

1. **Financial health** — revenue, margins, cash flow, balance sheet (3–5 year trends)
2. **Valuation** — P/E, PEG, EV/EBITDA, P/FCF vs peers; bull/base/bear fair value
3. **Competitive position** — Porter's Five Forces, moat width, market share trends
4. **Risk assessment** — business, financial, market, macro, governance risks rated Low/Medium/High
5. **Catalyst analysis** — upcoming events that could drive the stock, with probability and timeline

## Trigger phrases

- "Research [COMPANY] before I buy"
- "Analyze [TICKER] stock"
- "Do due diligence on [COMPANY]"
- "Should I buy [TICKER]?"
- "Give me an investment analysis of [COMPANY]"

## Assets

| File | Purpose |
|------|---------|
| `assets/financial_metrics.md` | Key ratio definitions and benchmarks |
| `assets/valuation_methods.md` | DCF, comps, and other valuation frameworks |
| `assets/competitive_analysis.md` | Porter's Five Forces and moat assessment guide |
| `assets/risk_framework.md` | Risk categorization and rating criteria |
| `assets/catalyst_framework.md` | Catalyst types, probability assessment, monitoring |

## Output format

Saved as `[TICKER]_Stock_Research_[DATE].md` in the current working directory.
