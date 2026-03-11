---
name: growth-swing-trader
description: "Swing trade analysis for high-growth stocks using market regime detection and sector rotation. Use this skill when: (1) User wants to analyze a growth stock for swing trading, (2) User asks whether to enter or exit a volatile growth stock like SoFi, Hood, UPST, AFRM, MARA, COIN, etc., (3) User asks if the market is risk-on or risk-off and what it means for their growth positions, (4) User wants to know if they should rotate into defensive assets or back into growth, (5) User mentions multiplier expansion, valuation multiples in context of market conditions, (6) User asks about sector rotation or money flow between sectors, (7) User wants timing signals for entering/exiting high-beta growth stocks. This skill is specifically designed for traders who swing trade high-growth, high-volatility stocks and want to time entries and exits based on market regime shifts. It differs from general sentiment analysis by focusing on the interplay between growth stock valuations, market risk appetite, and sector money flows."
---

# Growth Stock Swing Trader

Analyze high-growth, high-volatility stocks for swing trade timing by combining market regime detection, multiplier analysis, and sector money flow tracking.

## What This Skill Does

This skill helps with a specific swing trading strategy:

1. **Hold high-growth stocks during risk-on regimes** — when the market is willing to pay high multiples for growth, stocks like SoFi, Hood, UPST, COIN can move fast.
2. **Exit growth positions when regime shifts to risk-off** — these same stocks get hit hardest when risk appetite contracts because their valuations compress.
3. **Rotate into defensive assets during risk-off** — capital preservation while waiting for the next opportunity.
4. **Re-enter growth stocks early when risk-on signals emerge** — catching the turn back is where the biggest gains happen.

The core insight: high-growth stocks live and die by the multiplier the market is willing to assign them. That multiplier expands in risk-on environments and compresses in risk-off. Timing these regime shifts is the edge.

## Analysis Workflow

When the user provides a stock ticker (or asks about market conditions generally), follow these steps in order. Each step builds on the previous one.

### Step 1: Determine Market Regime (Risk-On vs Risk-Off)

This is the most important step. The market regime determines everything else.

**Search for these indicators using WebSearch:**

**A. VIX and Volatility Structure**
- Use investing.com as the sole source for VIX data. Do NOT use Yahoo Finance for VIX data.
- Search: "investing.com VIX index today"
- Search: "site:investing.com CBOE VIX"
- Search: "investing.com VIX term structure contango backwardation"
- If WebFetch is available, fetch directly from https://www.investing.com/indices/volatility-s-p-500 for the most current VIX reading
- Risk-on signal: VIX below 18, term structure in contango (front month cheaper than back months)
- Risk-off signal: VIX above 25, term structure in backwardation (front month more expensive — market is paying up for near-term protection)
- Transitional: VIX 18-25, watch the direction of movement

**Handling conflicting VIX data:** If web searches return conflicting values, fetch the VIX directly from investing.com and use that as the authoritative source. Ignore any VIX values sourced from Yahoo Finance. Also check: was there a recent spike followed by a pullback? Both readings can be true — a VIX that spiked to 25 and is now at 17 is *not* the same as a VIX that has been stable at 17. Use the trend (rising/falling) as much as the level. Always state the VIX level you are using in your report and note if there is conflicting data.

**B. Growth vs Value Relative Performance**
- Search: "IWF vs IWD performance this week" (iShares Growth vs Value ETFs)
- Search: "QQQ vs SPY relative performance this month"
- Risk-on: Growth outperforming value, QQQ leading SPY
- Risk-off: Value outperforming growth, SPY holding up better than QQQ
- This is a direct read on whether the market is rewarding growth or punishing it

**C. Credit Spreads and Treasury Yields**
- Search: "high yield credit spread today" or "HYG LQD spread"
- Search: "10 year treasury yield today"
- Search: "2 year 10 year yield curve"
- Risk-on: Credit spreads tightening, yields stable or rising on growth expectations
- Risk-off: Credit spreads widening (investors demanding more premium for risk), yield curve flattening on flight to safety

**D. Small Cap vs Large Cap**
- Search: "IWM vs SPY performance this week" (Russell 2000 vs S&P 500)
- Risk-on: Small caps outperforming (investors reaching for higher risk/return)
- Risk-off: Small caps underperforming (investors retreating to safety of large caps)

**E. Market Breadth**
- Search: "NYSE advance decline line today"
- Search: "percentage of stocks above 50-day moving average"
- Risk-on: Broad participation, most stocks advancing, majority above 50-day MA
- Risk-off: Narrow leadership, most stocks declining, fewer above 50-day MA

**Regime Classification:**

Based on the above, classify the current regime:

| Regime | VIX | Growth vs Value | Credit Spreads | Small vs Large | Breadth |
|--------|-----|-----------------|----------------|----------------|---------|
| **Strong Risk-On** | <16 | Growth leading | Tight/tightening | Small caps leading | Broad |
| **Risk-On** | 16-20 | Growth slight edge | Stable | Roughly equal | Healthy |
| **Transitional** | 18-25 | Mixed signals | Mixed | Mixed | Deteriorating |
| **Risk-Off** | 22-30 | Value leading | Widening | Large caps leading | Narrow |
| **Strong Risk-Off** | >30 | Value dominating | Wide/widening | Small caps crushed | Very narrow |

Not every indicator needs to agree. Weight them: VIX direction and Growth vs Value performance are the strongest signals. If those two align, that's likely the correct regime call even if others are mixed.

### Step 2: Sector Money Flow Analysis

Understanding where money is flowing tells you which phase of the rotation cycle we're in.

**Search for:**
- "sector ETF performance this week" or "sector performance heat map"
- "XLK XLF XLE XLV XLP XLU performance comparison" (Tech, Financials, Energy, Healthcare, Consumer Staples, Utilities)
- "sector rotation today" or "sector money flow"

**Interpret the rotation pattern:**

| Money flowing INTO | Money flowing OUT OF | What it means |
|---|---|---|
| Tech, Consumer Discretionary, Financials | Utilities, Staples, Healthcare | Risk-on rotation — growth multiples expanding |
| Utilities, Staples, Healthcare, Bonds | Tech, Small Caps, Crypto-adjacent | Risk-off rotation — capital seeking safety |
| Cyclicals (Industrials, Materials, Energy) | Defensive + Growth both flat | Economic recovery play, not pure risk-on |
| Cash/Money Market, Short-term Treasuries | Everything | Full risk-off, capital leaving equities entirely |

**Key signals for the user's strategy:**
- If money is rotating FROM growth TO defensive → this is the signal to follow it (exit growth, enter defensive)
- If money is rotating FROM defensive TO growth → early signal to re-enter growth positions
- If money is going to cash → stay in cash or very short-term treasuries, don't force a position

### Step 3: Growth Stock Multiplier Analysis

Now analyze the specific stock the user is interested in. The central question: is the market willing to pay a high multiple for this stock's growth, and is that likely to expand or compress given the current regime?

**Search for the stock's fundamentals:**
- Search: "[TICKER] revenue growth rate"
- Search: "[TICKER] P/S ratio" or "[TICKER] P/E ratio"
- Search: "[TICKER] forward revenue estimates"
- Search: "[TICKER] earnings growth"

**Search for peer comparison:**
- Search: "[TICKER] vs peers valuation" or "[TICKER] competitors P/S ratio"

**Multiplier Framework:**

For high-growth stocks, P/S (Price-to-Sales) is often more relevant than P/E because many of these companies are still scaling toward profitability. Here's how to think about it:

**Revenue Growth Rate → "Deserved" P/S Multiple (in risk-on market):**
- 50%+ growth → market may pay 10-20x P/S
- 30-50% growth → market may pay 6-12x P/S
- 20-30% growth → market may pay 4-8x P/S
- 10-20% growth → market may pay 2-5x P/S

These ranges compress significantly in risk-off environments. A stock trading at 15x P/S with 50% growth in risk-on could easily trade at 6-8x P/S in risk-off — that's a 50%+ drawdown just from multiple compression, not a change in fundamentals.

**Evaluate the stock's current position:**
1. What is the current P/S (or P/E if profitable)?
2. What is the revenue growth rate?
3. Is the current multiple high, middle, or low relative to its historical range?
4. Given the current market regime, is the multiple likely to expand or compress?

**Multiplier Expansion Potential (Bullish for Swing):**
- Stock is growing fast (30%+) AND trading below historical average multiple AND market is shifting to risk-on
- This is the ideal entry: fundamentals + regime shift = multiplier expansion on top of fundamental growth

**Multiplier Compression Risk (Bearish for Swing):**
- Stock is at elevated multiple AND market is showing risk-off signals
- This is the exit signal: even if fundamentals are fine, the multiple will contract

### Step 4: Generate Trade Signal

Combine all three analyses into an actionable signal.

**Signal Matrix:**

| Market Regime | Money Flow | Stock Multiple | Signal |
|---|---|---|---|
| Risk-On / Shifting Risk-On | Into growth sectors | Below historical avg | **STRONG ENTER** — ideal setup |
| Risk-On | Into growth sectors | At historical avg | **ENTER** — favorable conditions |
| Risk-On | Into growth sectors | Above historical avg | **HOLD if already in** — late in move, tighter stops |
| Transitional | Mixed | Any | **CAUTION** — reduce position size, tighten stops |
| Transitional / Shifting Risk-Off | Rotating to defensive | Above historical avg | **EXIT** — multiple compression likely |
| Risk-Off | Into defensive | Any | **STAY OUT of growth** — consider defensive positions |
| Risk-Off / Shifting Risk-On | Starting to rotate back to growth | Below historical avg | **EARLY ENTER** — catching the turn, smaller position |

### Step 5: Compile the Report

Save the analysis as a markdown file to the current working directory or display it directly to the user if no writable path is available.

Use filename format: `[TICKER]_swing_analysis_[DATE].md`

If no specific ticker was given (general market regime question), use: `market_regime_analysis_[DATE].md`

**Report Template:**

```markdown
# Swing Trade Analysis: [TICKER or "Market Regime"]
**Date:** [DATE]
**Data as of:** [most recent data point used — e.g. "March 6, 2026 close"]
**Note:** Market data sourced from web searches. If any indicators showed conflicting values, the most recent available is used and noted inline.

## Trade Signal: [STRONG ENTER / ENTER / HOLD / CAUTION / EXIT / STAY OUT / EARLY ENTER]

**One-line summary:** [e.g., "SoFi is growing at 30%+ with a compressed multiple while the market is shifting back to risk-on — favorable setup for swing entry."]

---

## 1. Market Regime: [Strong Risk-On / Risk-On / Transitional / Risk-Off / Strong Risk-Off]

**Regime Direction:** [Stable / Shifting toward risk-on / Shifting toward risk-off]

| Indicator | Current Value | Signal | Trend |
|-----------|--------------|--------|-------|
| VIX | [value] | [Risk-on/off] | [Rising/Falling/Stable] |
| Growth vs Value (QQQ/SPY) | [relative perf] | [Risk-on/off] | [direction] |
| Credit Spreads | [level] | [Risk-on/off] | [Tightening/Widening] |
| Small vs Large Cap | [relative perf] | [Risk-on/off] | [direction] |
| Market Breadth | [% above 50d MA] | [Risk-on/off] | [Improving/Deteriorating] |

**Regime Assessment:** [2-3 sentences explaining the overall picture and which way things are moving]

## 2. Sector Money Flow

**Rotation Pattern:** [Money flowing from X to Y — what this means]

| Sector | Recent Performance | Flow Direction |
|--------|-------------------|----------------|
| Technology (XLK) | [%] | [Inflow/Outflow/Neutral] |
| Financials (XLF) | [%] | [Inflow/Outflow/Neutral] |
| Consumer Disc (XLY) | [%] | [Inflow/Outflow/Neutral] |
| Utilities (XLU) | [%] | [Inflow/Outflow/Neutral] |
| Consumer Staples (XLP) | [%] | [Inflow/Outflow/Neutral] |
| Healthcare (XLV) | [%] | [Inflow/Outflow/Neutral] |
| Energy (XLE) | [%] | [Inflow/Outflow/Neutral] |

**Money Flow Assessment:** [What the rotation pattern tells us about where we are in the cycle]

## 3. Stock Analysis: [TICKER]

*(Skip this section if no specific ticker was provided)*

| Metric | Value | Context |
|--------|-------|---------|
| Current Price | $[X] | [52-week context] |
| Revenue Growth (YoY) | [X]% | [Accelerating/Decelerating] |
| P/S Ratio | [X] | Historical range: [X-Y] |
| P/E Ratio | [X or N/A] | [Context] |
| Forward P/S | [X] | Based on [X]% expected growth |

**Multiplier Position:** [Where is the multiple relative to history?]
- Current P/S: [X] vs Historical Average: [Y] vs Peak: [Z]
- In current regime, market likely to assign: [X-Y]x P/S
- This implies [upside/downside] of approximately [X]% from multiple change alone

**Growth Quality Check:**
- Revenue growth trend: [Accelerating/Stable/Decelerating]
- Path to profitability: [Clear/Unclear/Already profitable]
- Market position: [Gaining/Stable/Losing share]
- Is this a stock that can genuinely rip when conditions are right? [Yes/No and why]

## 4. Trade Recommendation

**Signal:** [STRONG ENTER / ENTER / HOLD / CAUTION / EXIT / STAY OUT / EARLY ENTER]

**Rationale:** [3-5 sentences connecting regime + money flow + multiplier analysis]

**If entering:**
- Suggested position size: [% of portfolio] (based on conviction and regime clarity)
- Entry approach: [All at once / Scale in over X days]
- Stop loss: [X]% below entry (tighter in transitional regime, wider in strong risk-on)
- Target: [X]% upside based on multiplier expansion to [X]x P/S
- Time horizon: [X-Y weeks]

**If exiting:**
- Urgency: [Immediately / Over next 1-2 days / Reduce gradually]
- Where to rotate: [Specific defensive assets — e.g., XLU, XLP, TLT, short-term treasuries, cash]

**If holding:**
- Adjust stops to: [level]
- Watch for: [specific trigger that would change the signal]

## 5. What to Watch Next

- **Regime flip signals:** [What specific changes would shift the regime?]
- **Key dates:** [Earnings, Fed meetings, economic data releases that matter]
- **Re-evaluation trigger:** [When to re-run this analysis]

---

*This analysis is for informational purposes only and does not constitute investment advice. All trading involves risk. Past regime patterns do not guarantee future results.*
```

## Key Principles

**Why this approach works for high-growth stocks specifically:**

These stocks (SoFi, Hood, UPST, AFRM, COIN, MARA, etc.) share important characteristics:
- They tend to have high revenue growth rates
- Their valuations are driven more by the multiple the market assigns than by current earnings
- They are highly sensitive to risk appetite — when the market is generous with multiples, these stocks fly; when it's not, they crash
- They move faster than the broader market in both directions

This makes them ideal for regime-based swing trading, but it also means timing matters more than with blue chips. Being in these stocks during risk-off is expensive. Being out of them when risk appetite returns means missing the fastest part of the move.

**The multiplier is the swing trader's best friend:**

A stock growing revenue at 40% YoY might trade at 15x P/S in risk-on and 6x P/S in risk-off. That's not a 60% decline in the business — it's a 60% decline in what the market is willing to pay per dollar of sales. The business is the same. Understanding this helps stay rational: you're not trading fundamentals on a swing basis, you're trading the market's willingness to pay for those fundamentals.

**Don't try to catch the exact top or bottom:**

The regime shift signals will always be somewhat lagging. The goal isn't to sell the exact top or buy the exact bottom. The goal is to:
- Be out of growth stocks before the bulk of the risk-off decline
- Be in defensive assets during the worst of it
- Be back in growth stocks before the bulk of the recovery

Capturing 60-70% of the moves is excellent. Trying to capture 100% leads to overtrading and whipsaws.

## Defensive Assets to Consider During Risk-Off

When the signal says to exit growth, the user needs somewhere to park capital:

- **XLU** (Utilities ETF) — classic defensive, tends to hold up or rally during risk-off
- **XLP** (Consumer Staples ETF) — stable demand regardless of economy
- **TLT** (Long-term Treasury ETF) — benefits from flight to quality (but watch if yields are rising due to inflation, not growth fears)
- **SHY / BIL** (Short-term Treasury ETFs) — lowest risk, capital preservation
- **GLD** (Gold ETF) — alternative safe haven, especially if risk-off is driven by geopolitical uncertainty
- Cash — sometimes the best position is no position

The choice depends on what's driving the risk-off move. If it's growth fears, TLT and XLU work well. If it's inflation fears, GLD and short-term treasuries are safer.

## Resources

- **assets/regime_indicators.md** — Detailed guide to interpreting each regime indicator with historical context and thresholds
- **assets/growth_stock_watchlist.md** — Curated list of high-growth stocks well-suited for this strategy, with key metrics to track
