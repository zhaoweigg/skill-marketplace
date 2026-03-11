# Growth Swing Trader

Regime-based swing trade analysis for high-growth, high-volatility stocks.

## What it does

Combines three analyses to generate an actionable trade signal:

1. **Market regime detection** — classifies current conditions as Strong Risk-On → Strong Risk-Off using VIX, growth vs value performance, credit spreads, small/large cap ratio, and market breadth
2. **Sector money flow** — tracks rotation between offensive (Tech, Discretionary) and defensive (Utilities, Staples) sectors
3. **Multiplier analysis** — evaluates the stock's P/S relative to its historical range and what the current regime implies for multiple expansion or compression

## Why growth stocks specifically

Stocks like SoFi, Hood, UPST, AFRM, COIN, MARA move primarily on the *multiple* the market is willing to pay, not just fundamentals. A stock growing 40% YoY might trade at 15× P/S in risk-on and 6× P/S in risk-off — a 60% drawdown with no change in business quality. Timing regime shifts is the edge.

## Trigger phrases

- "Should I enter [TICKER]?"
- "Is the market risk-on or risk-off?"
- "Analyze [SOFI/HOOD/COIN/UPST] for swing trade"
- "Should I rotate into defensive assets?"
- "What's the sector money flow saying?"

## Signals

| Signal | Meaning |
|--------|---------|
| STRONG ENTER | Ideal setup — regime + money flow + compressed multiple |
| ENTER | Favorable conditions |
| HOLD | Already in — late in move, tighten stops |
| CAUTION | Transitional — reduce size |
| EXIT | Multiple compression likely — exit growth |
| STAY OUT | Risk-off — stay in defensive assets |
| EARLY ENTER | Catching the turn — smaller position |

## Assets

| File | Purpose |
|------|---------|
| `assets/regime_indicators.md` | Indicator thresholds with historical context |
| `assets/growth_stock_watchlist.md` | Curated list of stocks suited for this strategy |
