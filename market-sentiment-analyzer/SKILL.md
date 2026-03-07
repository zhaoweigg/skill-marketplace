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

### 3. Calculate Composite Score

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

### 4. Apply Personal Trading Context

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

### 5. Interpret Results and Provide Recommendations

Reference `sentiment_indicators.md` for detailed interpretation guidance.

**Composite Score Ranges:**
- **+6 to +10 (Strong Bullish)**: Actively swing trade, normal-to-larger positions
- **+3 to +6 (Bullish)**: Selectively swing trade, normal positions
- **-3 to +3 (Neutral)**: Avoid swing trading unless high-conviction setups
- **-6 to -3 (Bearish)**: Stay on sidelines, very small positions only
- **-10 to -6 (Strong Bearish)**: No long swing trades, capital preservation

Reference `swing_trading_framework.md` for:
- Position sizing by sentiment score
- Stop loss guidelines
- Entry timing strategies
- Risk management rules
- Daily workflow recommendations

### 6. Present Analysis to User

Structure your response with:

1. **Summary**: One-sentence assessment of current conditions
2. **Composite Score**: The numerical score and signal (e.g., "+4.5 - Bullish")
3. **Confidence Level**: High/Medium/Low with brief explanation
4. **Component Breakdown**:
   - Technical sentiment: Score and key drivers
   - News sentiment: Score and key themes
   - Social sentiment: Score and notable trends
5. **Trading Recommendation**:
   - Should they swing trade? (Yes/No/Selective)
   - Position sizing guidance (% of normal size)
   - Risk management specifics (stop loss %, holding period)
6. **Seasonal Context**: How current date relates to user's historical performance patterns and any adjustments to recommendations
7. **Key Considerations**: Any important caveats, upcoming events, or risks
8. **Next Steps**: When to reassess (usually within 24 hours)

**Example Output Format:**

```
Market Sentiment Analysis - January 19, 2026

COMPOSITE SCORE: +5.2 (Bullish)
Confidence: High

COMPONENT BREAKDOWN:
• Technical Sentiment: +4.8/10
  - VIX at 16.2 (low volatility - favorable)
  - Put/Call ratio 0.78 (bullish tilt)
  - Strong market breadth (A/D ratio 1.6)
  - SPY RSI at 58 (healthy momentum)

• News Sentiment: +6.0/10
  - Positive Fed commentary on soft landing
  - Strong earnings from tech leaders
  - Inflation data came in as expected
  - No major negative catalysts

• Social Sentiment: +4.5/10
  - Bullish retail sentiment but not euphoric
  - Increasing interest in growth stocks
  - Some caution around valuations

TRADING RECOMMENDATION:
✓ Favorable conditions for swing trading
- Position Size: 100% of normal allocation
- Recommended Positions: 2-3 concurrent swing trades
- Stop Loss: 6-8% below entry
- Holding Period: Can hold full 2-4 weeks
- Risk per Trade: 1-2% of portfolio

SEASONAL CONTEXT:
Current date is in January - outside your peak performance period (May-Aug). While market conditions are bullish, historical data suggests applying slightly more conservative positioning. Consider 75-90% of normal position sizes and higher selectivity for entries.

KEY CONSIDERATIONS:
- Monitor VIX - if it spikes above 20, reassess
- Strong breadth suggests individual stock picks will work well
- Focus on stocks in sectors with positive momentum

NEXT ASSESSMENT: Re-analyze before market open tomorrow (Jan 20)
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
- Position sizing guidance
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
4. Calculate composite score
5. Provide recommendation with confidence level

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
