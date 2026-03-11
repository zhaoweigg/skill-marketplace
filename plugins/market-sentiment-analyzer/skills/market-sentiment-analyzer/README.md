# Market Sentiment Analyzer

Comprehensive market sentiment analysis for US equities swing trading decisions.

## What it does

Analyzes three data sources to produce a composite sentiment score (−10 to +10):

- **Technical indicators** — VIX, put/call ratio, market breadth, RSI, moving averages
- **News sentiment** — financial news, earnings reports, Fed commentary, analyst ratings
- **Social media sentiment** — Reddit, Twitter/X, StockTwits retail positioning

Output includes a signal (Strong Bullish → Strong Bearish), confidence level, position sizing guidance, and a next-assessment timestamp.

## Trigger phrases

- "Should I swing trade now?"
- "What are market conditions like?"
- "Analyze [TICKER] sentiment"
- "What's the sentiment on tech stocks?"
- "Is it a good time to swing trade?"

## Example output

```
COMPOSITE SCORE: +5.2 (Bullish) | Confidence: High

• Technical: +4.8 — VIX 16.2, P/C ratio 0.78, breadth healthy
• News:      +6.0 — Positive Fed commentary, strong earnings
• Social:    +4.5 — Bullish but not euphoric

RECOMMENDATION: Swing trade — 100% normal position size
Stop loss: 6–8% below entry | Holding period: 2–4 weeks
```

## Holding period

Designed for **1–4 week** swing trades. Not suitable for intraday or multi-month positions.
