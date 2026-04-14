---
name: market-sentiment-analyzer
description: "Comprehensive market sentiment analysis for US equities swing trading decisions. Analyzes news sentiment, technical indicators (VIX, put/call ratio, market breadth, RSI), and social media sentiment to generate actionable trading signals. Use when: (1) User asks about market conditions for swing trading, (2) User wants sentiment analysis for specific stocks or sectors, (3) User asks 'should I swing trade now', (4) User requests analysis of market mood/environment, (5) User mentions swing trading with 1-4 week timeframe. Outputs detailed multi-factor analysis with composite scores, confidence levels, and specific position sizing recommendations."
---

# Market Sentiment Analyzer

Analyze market sentiment across multiple data sources to guide swing trading decisions for US equities with 1-4 week holding periods.

## Overview

This skill provides comprehensive sentiment analysis by combining:
1. **Technical indicators**: VIX, put/call ratio, market breadth, RSI, moving averages
2. **News sentiment**: Financial news, earnings reports, economic data, analyst ratings
3. **Social media sentiment**: Reddit, Twitter/X, StockTwits retail sentiment

Output: Detailed multi-factor analysis with composite score (-10 to +10), confidence level, and actionable trading recommendations.

## Core Workflow

### 1. Identify Analysis Target

Determine what to analyze:
- **Overall market**: For "should I swing trade now?" or "what are market conditions?"
- **Specific stock**: For "analyze AAPL sentiment" or "should I swing trade NVDA?"
- **Sector**: For "what's the sentiment on tech stocks?"

### 2. Gather Data from Three Sources

**A. Technical Indicators (Use WebSearch)**

Search for current values:
- VIX (Volatility Index): Search "VIX current value"
- Put/Call Ratio: Search "CBOE put call ratio today"
- Market Breadth: Search "NYSE advance decline ratio today" or "market breadth today"
- SPY RSI: Search "SPY RSI indicator current"
- Moving Averages: Search "SPY 50-day 200-day moving average"

For specific stocks: Search "[TICKER] RSI" and "[TICKER] technical indicators"

**B. News Sentiment (Use WebSearch)**

Search for recent news (last 24-48 hours):
- Overall market: "stock market news today", "Fed news", "economic data today"
- Specific stock: "[TICKER] news", "[TICKER] earnings", "[TICKER] analyst ratings"
- Sector: "[SECTOR] stocks news"

Analyze sentiment:
- Count positive vs. negative headlines
- Weight by source importance (Fed news > individual stock news)
- Score from -1 (very negative) to +1 (very positive)

**C. Social Media Sentiment (Use WebSearch)**

Search social platforms:
- Reddit: "site:reddit.com/r/wallstreetbets [TICKER or 'market']"
- Twitter: "[TICKER] OR $[TICKER] stock sentiment"
- StockTwits: "site:stocktwits.com [TICKER]"

Gauge sentiment:
- Bullish vs. bearish ratio
- Volume of discussion (trending = higher weight)
- Tone (excitement, fear, apathy)
- Score from -1 (very bearish) to +1 (very bullish)

**Note on social sentiment**: If heavily skewed (all bullish or all bearish), consider contrarian signal.

### 3. Assess Market Regime

After gathering sentiment data, evaluate whether the market is in a **sustained risk-on bull regime**, transitioning into one, or deteriorating out of one. This is distinct from the daily sentiment score — a regime is a structural state that persists for weeks to months.

**Why this matters:** A +4 composite score inside a True Bull Regime means "lean in, this pullback is a gift." A +4 composite score inside a Mixed regime means "proceed with caution, this rally may not hold." The regime is the context that makes the sentiment score actionable.

#### 3a. Regime Entry Checklist

Search for each signal individually. Each signal has a **temporal threshold** — a single day's reading doesn't count.

| # | Signal | Search Query | Bull Regime Condition | Temporal Threshold |
|---|---|---|---|---|
| 1 | Trend structure | "SPY 50-day moving average" and "SPY 200-day moving average" | Price above both MAs; 50-day > 200-day (golden cross) | Golden cross in place for 5+ trading days |
| 2 | VIX regime | "VIX index 10 day history" | VIX sustained below 20 | Below 20 for 7+ consecutive sessions; below 15 = strong confirm |
| 3 | Small cap participation | "IWM ETF performance 1 month" and "SPY performance 1 month" | IWM keeping pace with or outperforming SPY | IWM trailing SPY by no more than 2% over 20 trading days |
| 4 | Sector rotation | "XLY ETF performance 1 month" and "XLU ETF performance 1 month" | Cyclicals (XLY, XLF, XLI) outperforming defensives (XLU, XLP) | Cyclicals leading over trailing 10+ trading days |
| 5 | Credit confirmation | "HYG ETF price 1 month" | HYG in uptrend (credit spreads tightening) | HYG rising for 10+ trading days, not just a 1-day bounce |
| 6 | New highs expanding | "NYSE new 52-week highs today" | Daily new highs count increasing | 100+ new highs on NYSE for 3+ of the last 5 sessions |
| 7 | A/D line trend | "NYSE advance decline line" | A/D line making new highs alongside price | A/D line at or near 20-day highs, not diverging from price |
| 8 | Options sentiment | "CBOE equity put call ratio 10 day moving average" | P/C 10-day moving average below 0.90 | Sustained below 0.90 for 5+ sessions |

**Regime Score (0–8):** 1 point per confirmed signal.

| Regime Score | Label | Meaning |
|---|---|---|
| 7–8 | **True Bull Regime** | Full risk-on confirmed; high conviction in sustained uptrend |
| 5–6 | **Emerging Bull** | Conditions improving; most signals confirming but watch stragglers |
| 3–4 | **Mixed / Transitional** | Selective trades only; regime not yet established |
| 0–2 | **Bear / Risk-Off** | No bull regime; rallies are likely counter-trend bounces |

#### 3b. False Breakout Detection

Even with a score of 5+, flag as a **potential false breakout** if any of these are present:

- **Narrow leadership**: Top 10 stocks account for most of index gains; IWM lagging SPY by >5% over 20 days
- **VIX divergence**: VIX dropped sharply intraday but 10-day average remains above 22
- **Credit divergence**: HYG flat or falling while equities rally — bond market not confirming
- **Breadth divergence**: A/D line making lower highs while SPY makes higher highs
- **Defensive outperformance**: XLU or XLP outperforming XLY and XLF over the last 10 days despite a price rally

If 2+ false breakout flags are present, **downgrade the regime score by 2 points** and note this in the output.

#### 3c. Regime Deterioration Signals

When the regime score was previously high (6+), watch for these signs that the bull regime is **breaking down**:

| Deterioration Signal | What to Search | Threshold |
|---|---|---|
| VIX breakout | "VIX index today" | VIX closes above 20 after being below for 7+ sessions |
| Breadth collapse | "NYSE advance decline ratio today" | A/D ratio below 0.70 for 2+ consecutive sessions |
| Credit stress | "HYG ETF price today" | HYG drops 1%+ in a week after sustained uptrend |
| Small caps cracking | "IWM ETF performance 1 week" | IWM underperforms SPY by 3%+ in a single week |
| Rotation to defensives | "XLU ETF performance 1 week" | XLU outperforms XLY by 2%+ in a single week |
| New highs drying up | "NYSE new 52-week highs today" | New highs drop below 50 after being 100+ |

**Deterioration count:**
- **0–1 signals**: Regime intact — normal fluctuation
- **2–3 signals**: Regime under stress — tighten stops, reduce new entries, shrink hold periods
- **4+ signals**: Regime likely over — treat as Mixed/Bear, move to capital preservation

#### 3d. Regime x Sentiment Decision Matrix

Use this matrix to resolve the final trading posture when regime and sentiment scores diverge:

| | Sentiment Bullish (+3 to +10) | Sentiment Neutral (-3 to +3) | Sentiment Bearish (-10 to -3) |
|---|---|---|---|
| **True Bull Regime (7–8)** | Full conviction: 100-120% size, full hold period, wider stops (8-10%) | Buy-the-dip opportunity: 75-100% size, look for support entries | Likely short-term pullback within bull trend: 25-50% size, tight stops, wait for sentiment to recover before adding |
| **Emerging Bull (5–6)** | Lean in selectively: 75-100% size, normal hold period | Wait for confirmation: 25-50% size on high-conviction setups only | Stay out: regime not strong enough to override bearish sentiment |
| **Mixed (3–4)** | Proceed with caution: 50-75% size, shorter hold (1-2 weeks), tight stops (5-6%) | No trade: insufficient edge from either regime or sentiment | No trade: both signals negative |
| **Bear / Risk-Off (0–2)** | Counter-trend bounce only: 25-50% size, very tight stops (4-5%), take profits quickly | No trade | No trade, capital preservation mode |

**This matrix supersedes the standalone sentiment-only position sizing in Step 5.** When regime data is available, always use this matrix. Fall back to sentiment-only sizing only if regime signals cannot be assessed (e.g., data unavailable).

### 4. Calculate Composite Score

Use the `calculate_composite_score.py` script:

```bash
cd scripts
python calculate_composite_score.py
```

Or calculate manually using the SentimentScorer class in the script:

```python
from scripts.calculate_composite_score import SentimentScorer

scorer = SentimentScorer()

# Prepare technical data dictionary
technical_data = {
    "vix": 18.5,  # Current VIX value
    "put_call_ratio": 0.85,  # Current P/C ratio
    "ad_ratio": 1.3,  # Advance/Decline ratio
    "rsi": 55  # SPY or stock RSI
}

# Calculate composite score
result = scorer.calculate_composite_score(
    news_score=0.4,  # Your news sentiment assessment (-1 to +1)
    technical_data=technical_data,
    social_score=0.2  # Your social sentiment assessment (-1 to +1)
)
```

The script outputs:
- Component scores (news, technical, social)
- Composite score (-10 to +10)
- Confidence level (high/medium/low)
- Signal (Strong Bullish/Bullish/Neutral/Bearish/Strong Bearish)
- Recommendation

### 5. Apply Personal Trading Context

Reference `personal_trading_profile.md` for user's performance patterns.

**Seasonal Performance Adjustment:**
- Check current date against user's historical performance periods
- During peak performance months (May-August):
  - User has demonstrated stronger edge during this period
  - Can recommend slightly larger positions or more active trading
  - Confidence in bullish signals can be higher
- Outside peak performance months (September-April):
  - Apply more conservative position sizing
  - Increase selectivity threshold for trade recommendations
  - Factor in reduced historical edge when setting expectations

**Position Sizing Adjustment by Season:**

*During May-August (Peak Performance):*
- Strong Bullish (+6 to +10): 100-120% of normal size
- Bullish (+3 to +6): 100% of normal size
- Neutral (-3 to +3): 50-75% for high-conviction setups only

*Outside May-August:*
- Strong Bullish (+6 to +10): 75-100% of normal size
- Bullish (+3 to +6): 75-90% of normal size  
- Neutral (-3 to +3): Generally avoid unless exceptional

### 6. Interpret Results and Provide Recommendations

Reference `sentiment_indicators.md` for detailed interpretation guidance.

**Composite Score Ranges** (baseline — use Regime x Sentiment Matrix from Step 3d when regime data is available):
- **+6 to +10 (Strong Bullish)**: Actively swing trade, normal-to-larger positions
- **+3 to +6 (Bullish)**: Selectively swing trade, normal positions
- **-3 to +3 (Neutral)**: Avoid swing trading unless high-conviction setups
- **-6 to -3 (Bearish)**: Stay on sidelines, very small positions only
- **-10 to -6 (Strong Bearish)**: No long swing trades, capital preservation

**Important:** When regime assessment is available, the Regime x Sentiment Matrix (Step 3d) takes precedence over the standalone ranges above. The matrix provides regime-calibrated position sizing, stop widths, and hold periods that account for the structural environment.

Reference `swing_trading_framework.md` for:
- Position sizing by sentiment score
- Stop loss guidelines
- Entry timing strategies
- Risk management rules
- Daily workflow recommendations

### 7. Present Analysis to User

Structure your response with:

1. **Summary**: One-sentence assessment combining regime state and sentiment
2. **Composite Score**: The numerical score and signal (e.g., "+4.5 - Bullish")
3. **Confidence Level**: High/Medium/Low with brief explanation
4. **Market Regime Assessment**:
   - Regime Score (0–8) and label (True Bull / Emerging Bull / Mixed / Bear)
   - Each of the 8 signals: confirmed (with data) or not confirmed (with reason)
   - False breakout flags: list any present, note if score was downgraded
   - Deterioration signals (if regime was previously strong): list any present with count
   - Verdict: e.g., "True Bull Regime confirmed" / "Emerging — watch for X and Y to confirm" / "Regime deteriorating — 3 of 6 warning signs active"
5. **Component Breakdown**:
   - Technical sentiment: Score and key drivers
   - News sentiment: Score and key themes
   - Social sentiment: Score and notable trends
6. **Trading Recommendation** (derived from Regime x Sentiment Matrix in Step 3d):
   - Should they swing trade? (Yes/No/Selective)
   - Position sizing: use the matrix cell matching current regime + sentiment
   - Stop loss width and holding period (regime-adjusted)
   - Specific regime-informed guidance (e.g., "regime confirmed — use wider stops and hold full duration" or "regime not confirmed — tighten stops to 5%, shorten hold to 1 week")
7. **Seasonal Context**: How current date relates to user's historical performance patterns and any adjustments
8. **Key Considerations**: Any important caveats, upcoming events, or risks
9. **Next Steps**: When to reassess; specifically note which unconfirmed regime signals or deterioration signals to monitor

**Example Output Format:**

```
Market Sentiment Analysis - January 19, 2026

COMPOSITE SCORE: +5.2 (Bullish)
Confidence: High

MARKET REGIME ASSESSMENT: 6/8 — Emerging Bull
Confirmed (6):
  ✓ Trend structure: SPY above 50d & 200d MA, golden cross in place for 12 sessions
  ✓ VIX regime: VIX at 16.2, below 20 for 9 consecutive sessions
  ✓ Small cap participation: IWM -0.8% vs SPY over 20 days (within 2% threshold)
  ✓ Sector rotation: XLY +3.2% vs XLU -1.1% over trailing 10 days
  ✓ Credit confirmation: HYG up 0.6% over 10 days, steady uptrend
  ✓ New highs expanding: 142, 118, 155 new highs in last 3 sessions (all >100)
Not confirmed (2):
  ✗ A/D line: making lower highs while SPY pushed to 20-day high — divergence
  ✗ Options sentiment: P/C 10-day MA at 0.93, still above 0.90 threshold
False breakout flags: 1 of 5 (breadth divergence) — not enough to downgrade
Deterioration signals: 0 of 6 — no stress
Verdict: Emerging Bull — strong but A/D divergence and elevated P/C keep this
  one notch below True Bull. Watch for A/D confirmation to upgrade.

COMPONENT BREAKDOWN:
• Technical Sentiment: +4.8/10
  - VIX at 16.2 (low volatility, favorable)
  - Put/Call ratio 0.78 today (bullish tilt, but 10-day avg still elevated)
  - Market breadth A/D ratio 1.6 today (strong, but trend diverging)
  - SPY RSI at 58 (healthy momentum, not overbought)

• News Sentiment: +6.0/10
  - Positive Fed commentary on soft landing
  - Strong earnings from tech leaders
  - Inflation data came in as expected
  - No major negative catalysts

• Social Sentiment: +4.5/10
  - Bullish retail sentiment but not euphoric
  - Increasing interest in growth stocks
  - Some caution around valuations (healthy, not contrarian-bearish)

TRADING RECOMMENDATION (Emerging Bull + Bullish Sentiment → "lean in selectively"):
✓ Favorable for selective swing trading
- Position Size: 75-100% of normal allocation
- Recommended Positions: 2-3 concurrent, favor highest-conviction setups
- Stop Loss: 6-8% below entry (standard — would widen to 8-10% if regime upgrades)
- Holding Period: Full 2-4 weeks
- Risk per Trade: 1-2% of portfolio

SEASONAL CONTEXT:
January — outside peak performance period (May-Aug). Apply seasonal
discount: use lower end of regime-recommended sizing (75% vs 100%).
Higher bar for entry quality.

KEY CONSIDERATIONS:
- A/D divergence is the main concern — if it persists 5+ more sessions while
  price rises, this becomes a false breakout flag
- VIX is well-behaved but watch for any close above 20 (regime deterioration trigger)
- Cyclical leadership and credit confirmation are strong positives
- Focus on cyclical growth in leading sectors (XLY, XLF, XLI names)

NEXT ASSESSMENT: Re-analyze before market open tomorrow (Jan 20)
Regime signals to watch:
  - A/D line: needs to make a new high to confirm → upgrades regime to 7/8
  - P/C 10-day avg: needs to drop below 0.90 → upgrades regime to 7/8
  - VIX: any close above 20 → triggers deterioration protocol
```

## Advanced Usage

### Sector-Specific Analysis

When analyzing a sector:
1. Follow same workflow but focus searches on sector
2. Compare sector sentiment to overall market sentiment
3. Best trades: Bullish sector + Bullish market
4. Avoid: Bearish sector even if market is bullish (swim with current)

### Stock-Specific Analysis

When analyzing individual stock:
1. Start with overall market sentiment (this workflow)
2. Then analyze stock-specific sentiment:
   - Recent earnings and guidance
   - Analyst ratings changes
   - Stock-specific news and catalysts
   - Stock's RSI and technical setup
3. Hierarchy: Need bullish market OR bullish stock + neutral market
4. Avoid: Bearish market makes most long stock trades difficult

### Real-Time Adjustments

Market sentiment can change intraday. Watch for:
- **VIX spike >20%**: Reassess immediately
- **Major news**: Fed announcements, surprise economic data
- **Market reversal**: Large cap stocks breaking key support

If any occur, re-run analysis and adjust positions accordingly.

## Data Freshness Requirements

- **Technical indicators**: Refresh daily (ideally pre-market)
- **News sentiment**: Refresh every 24 hours or after major events
- **Social sentiment**: Refresh every 24-48 hours
- **Composite score**: Recalculate daily before market open

Sentiment becomes stale quickly. Always note timestamp of analysis and when to reassess.

## Important Guidelines

### What This Analysis Provides

✓ **Does provide:**
- Overall market environment assessment
- Risk-on vs. risk-off signal
- Market regime identification (True Bull / Emerging / Mixed / Bear)
- Regime deterioration early warning
- Position sizing guidance calibrated to regime + sentiment combination
- Appropriate timeframe for holding
- When to avoid swing trading

✗ **Does not provide:**
- Specific stock picks (user must find technical setups)
- Entry/exit prices (use technical analysis for that)
- Guarantee of success (markets are probabilistic)
- Intraday trading signals (this is for swing trading only)

### Limitations and Disclaimers

1. **Not financial advice**: This is analytical framework, not recommendations
2. **User responsibility**: Trading decisions and risk management are user's responsibility
3. **Past performance**: Sentiment analysis does not guarantee future results
4. **Market changes**: Conditions can shift rapidly, requiring reassessment
5. **Data quality**: Analysis quality depends on current data availability

### When to Override the Analysis

Even with bullish score, avoid trading if:
- User's personal risk tolerance says no
- User lacks proper technical setup/entry point
- User already at maximum position size
- Recent string of losses (emotional state matters)

Even with bearish score, user might trade if:
- High-conviction setup with clear catalyst
- Proper risk management in place
- Reduced position size
- User understands they're trading against wind

## Resources

- **sentiment_indicators.md**: Detailed guide to interpreting each indicator
- **swing_trading_framework.md**: Complete decision framework and daily workflow
- **personal_trading_profile.md**: User's performance patterns, seasonal edge, and trading style preferences
- **calculate_composite_score.py**: Script for scoring sentiment
- **fetch_market_data.py**: Template for technical data structure

## Quick Reference

**For "Should I swing trade now?" questions:**
1. Search current VIX, put/call ratio, market breadth, SPY RSI
2. Search today's market news
3. Search Reddit/Twitter market sentiment
4. Run regime checklist (Step 3a): search each of the 8 signals with temporal thresholds
5. Check for false breakout flags (Step 3b) and deterioration signals (Step 3c)
6. Calculate composite score
7. Look up Regime x Sentiment Matrix (Step 3d) for position sizing
8. Provide recommendation with regime verdict and matrix-derived guidance

**For "Analyze [TICKER] sentiment" questions:**
1. Start with overall market analysis (above)
2. Add stock-specific: news, earnings, analyst ratings, technical
3. Calculate stock sentiment relative to market
4. Recommend whether stock + market combination is favorable

**For "What's [SECTOR] sentiment?" questions:**
1. Start with overall market analysis
2. Add sector-specific: news, performance, rotation themes
3. Compare sector strength vs. market
4. Recommend if sector is favorable for swing trading

**Time Commitment per Analysis:**
- Quick assessment: 5-10 minutes
- Comprehensive analysis: 15-20 minutes
- Refresh daily: 5 minutes (update key indicators only)
