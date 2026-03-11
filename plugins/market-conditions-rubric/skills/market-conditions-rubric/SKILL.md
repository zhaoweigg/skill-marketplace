---
name: market-conditions-rubric
description: >
  Generates a scored market conditions rubric that rates 9 key dimensions of the
  broader market environment on a 1-10 scale, with clear criteria for each score level
  and an overall composite reading. Use this skill when the user asks to score, rate,
  or grade current market conditions; when they want a structured assessment of the
  market environment; when they mention "market rubric", "market scorecard", "market
  health check", or "conditions dashboard"; when they ask "how does the market look
  right now" and want a systematic breakdown rather than a narrative answer; or when
  they want to compare market conditions across time periods. Also trigger when the
  user asks for a framework to evaluate whether it's a good time to invest, trade, or
  stay on the sidelines. This skill differs from market-sentiment-analyzer by providing
  a structured rubric with explicit per-dimension scoring criteria rather than a
  sentiment-focused signal.
---

# Market Conditions Rubric

You are generating a structured, scored assessment of broader market conditions across 9 dimensions. Each dimension is rated 1-10 where 1 is extremely bearish and 10 is extremely bullish. The rubric includes specific criteria so scores are consistent and defensible.

## Research Phase

Before scoring, gather current data using web search. You need recent information for each dimension — don't score from stale knowledge. Search for:

- Current Fed funds rate, recent Fed commentary, and rate expectations
- Latest CPI/PCE inflation readings and GDP growth
- VIX level and trend, put/call ratio, credit spreads
- Market breadth data (advance/decline, new highs vs new lows, % of stocks above 200-day MA)
- Recent sector performance and fund flow data
- S&P 500 and Nasdaq levels relative to 50-day and 200-day moving averages
- Forward P/E for S&P 500, earnings growth estimates
- AAII sentiment survey, fund manager positioning
- Any major geopolitical developments or upcoming catalysts

Aim for data no older than a few days. If you can't find a specific data point, note that and score conservatively.

## Scoring Criteria

Each dimension below includes anchor descriptions for key score levels. Use these as guideposts — you can land between them based on the evidence.

---

### 1. Macro / Economic Backdrop

What it captures: The health of the real economy — growth trajectory, employment, consumer strength, and the direction of monetary policy.

| Score | Condition |
|-------|-----------|
| 1-2   | Economy in recession or contracting. Rising unemployment. Fed aggressively tightening into weakness. Consumer confidence collapsing. |
| 3-4   | Growth slowing meaningfully. Mixed employment signals. Fed policy restrictive with no pivot in sight. Consumer pulling back. |
| 5-6   | Economy growing at trend. Labor market stable. Fed on hold or cautiously adjusting. No major red flags but no strong tailwinds either. |
| 7-8   | Solid above-trend growth. Strong labor market. Fed accommodative or pivoting dovish. Consumer confident and spending. |
| 9-10  | Goldilocks environment — strong growth without overheating. Inflation near target. Fed supportive. Broad-based economic strength. |

---

### 2. Market Breadth & Internals

What it captures: How broad-based market participation is — whether the rally or decline is driven by a few names or by the majority of stocks.

| Score | Condition |
|-------|-----------|
| 1-2   | Extreme narrowness. Fewer than 30% of stocks above 200-day MA. Advance/decline line diverging sharply from index. New lows dwarfing new highs. |
| 3-4   | Narrow leadership. Index gains concentrated in a handful of mega-caps. Breadth deteriorating on rallies. |
| 5-6   | Mixed breadth. About half of stocks participating. Some sectors strong, others lagging. No clear breadth trend. |
| 7-8   | Healthy participation. 60-70%+ of stocks above 200-day MA. Advance/decline line confirming price action. New highs expanding. |
| 9-10  | Exceptional breadth. Broad-based strength across size, style, and sector. Strong thrust signals. Nearly all boats rising. |

---

### 3. Volatility & Risk Sentiment

What it captures: How fearful or complacent the market is, and whether risk appetite is expanding or contracting.

| Score | Condition |
|-------|-----------|
| 1-2   | VIX above 30 and rising. Credit spreads blowing out. Put/call ratio spiking. Panic selling evident. Flight to safety. |
| 3-4   | Elevated volatility (VIX 22-30). Widening credit spreads. Risk-off positioning building. Defensive sectors outperforming. |
| 5-6   | Moderate volatility (VIX 16-22). Credit spreads stable. Risk sentiment neither euphoric nor fearful. Normal market functioning. |
| 7-8   | Low volatility (VIX 12-16). Tight credit spreads. Risk-on appetite strong. Investors reaching for yield and growth. |
| 9-10  | Extremely low volatility (VIX below 12). Spreads at cycle tights. Complacency may itself be a yellow flag — score high for current conditions but note the contrarian risk. |

---

### 4. Sector Rotation & Money Flows

What it captures: Where capital is moving and what that says about the market's risk appetite and economic outlook.

| Score | Condition |
|-------|-----------|
| 1-2   | Aggressive rotation into cash, treasuries, and pure defensives (utilities, staples). Outflows from equities. Risk-off across the board. |
| 3-4   | Money favoring defensives and value over growth. Outflows from high-beta sectors. Cautious positioning dominant. |
| 5-6   | No clear rotational trend. Mixed flows. Some money into cyclicals, some into defensives. Balanced positioning. |
| 7-8   | Rotation into cyclicals, tech, and growth. Inflows to equity funds. Money moving up the risk curve. Healthy sector rotation without froth. |
| 9-10  | Strong risk-on flows. Money pouring into high-beta, small caps, speculative names. Broad inflows across equity styles. |

---

### 5. Liquidity Conditions

What it captures: The availability of money in the financial system — central bank balance sheet, lending standards, and financial conditions.

| Score | Condition |
|-------|-----------|
| 1-2   | Severe liquidity crunch. QT at full pace. Banks tightening lending sharply. Financial conditions indices at restrictive extremes. Funding stress visible. |
| 3-4   | Tightening liquidity. QT ongoing. Bank lending standards tightening. Financial conditions below average. |
| 5-6   | Neutral liquidity. Fed balance sheet stable. Lending standards normal. Financial conditions near long-run average. |
| 7-8   | Ample liquidity. QE active or balance sheet expanding. Easy lending. Financial conditions accommodative. |
| 9-10  | Flood of liquidity. Aggressive QE. Banks competing to lend. Financial conditions at extremely easy levels. Money supply growing rapidly. |

---

### 6. Valuation Context

What it captures: How expensive the market is relative to historical norms and the current interest rate environment. Note: valuation alone doesn't predict short-term moves, but it frames risk/reward.

| Score | Condition |
|-------|-----------|
| 1-2   | Extreme overvaluation. Forward P/E well above historical range even accounting for rate environment. Earnings estimates being revised sharply lower. No margin of safety. |
| 3-4   | Stretched valuations. P/E above average. Earnings growth decelerating. Limited upside baked in unless conditions improve. |
| 5-6   | Fair value. P/E near historical median for the current rate environment. Earnings growing in line with expectations. Reasonable risk/reward. |
| 7-8   | Attractive valuations. P/E below average or earnings growth accelerating faster than prices. Positive revisions. Good entry points available. |
| 9-10  | Deep value. P/E at historically low levels. Earnings troughing with recovery ahead. Generational buying opportunities in quality names. |

---

### 7. Technical Structure

What it captures: The price trend of major indices — whether the market is in an uptrend, downtrend, or range, and the quality of the trend.

| Score | Condition |
|-------|-----------|
| 1-2   | Major indices below declining 200-day MA. Death cross (50 below 200). Lower highs and lower lows. Bear market structure. |
| 3-4   | Indices struggling at or below 200-day MA. Trend ambiguous or deteriorating. Breaking down from ranges. |
| 5-6   | Sideways consolidation. Indices near flat 200-day MA. No clear directional trend. Choppy price action. |
| 7-8   | Uptrend intact. Indices above rising 50 and 200-day MAs. Higher highs and higher lows. Pullbacks finding support at key levels. |
| 9-10  | Strong confirmed uptrend. Indices well above rising moving averages. Breakouts holding. Trend strength across timeframes. |

---

### 8. Sentiment & Positioning

What it captures: How investors are feeling and positioned — useful primarily as a contrarian indicator at extremes.

| Score | Condition |
|-------|-----------|
| 1-2   | Extreme bearish sentiment (AAII bears >55%). Max pessimism. Everyone positioned defensively. Contrarian bullish signal. |
| 3-4   | Bearish lean. Elevated cash positions. Cautious fund manager surveys. Below-average retail participation. |
| 5-6   | Neutral sentiment. Balanced bull/bear readings. Normal cash levels. No extreme positioning in either direction. |
| 7-8   | Bullish sentiment. Rising retail participation. Fund managers overweight equities. Optimism building but not extreme. |
| 9-10  | Extreme bullish euphoria (AAII bulls >55%). Peak optimism. Maximum leverage. Contrarian bearish signal. Everyone already invested. |

Note the contrarian nature: very low scores (extreme fear) can actually be bullish for forward returns, and very high scores (extreme greed) can be bearish. The composite interpretation section addresses this.

---

### 9. Geopolitical & Event Risk

What it captures: External risks that could disrupt markets — wars, elections, trade policy, regulatory shifts, or other catalysts on the horizon.

| Score | Condition |
|-------|-----------|
| 1-2   | Active geopolitical crisis directly impacting markets. Major policy shock in progress. Extreme uncertainty with no resolution timeline. |
| 3-4   | Elevated geopolitical tensions. Upcoming elections or policy decisions creating significant uncertainty. Trade war escalation. |
| 5-6   | Normal background risk. Some geopolitical tensions but manageable. Standard policy calendar. No imminent shocks. |
| 7-8   | Low geopolitical risk. Stable policy environment. Resolution of prior tensions. Clarity on trade and regulatory outlook. |
| 9-10  | Exceptionally calm geopolitical backdrop. International cooperation. Pro-growth policy consensus. No material event risk on the horizon. |

---

## Output Format

Produce the rubric as a clean HTML document with the following structure. Use inline CSS for styling — no external stylesheets. Make it visually polished and easy to scan.

### Structure

1. **Header**: "Market Conditions Rubric" with the current date
2. **Composite Score**: Large, prominently displayed composite score (weighted average, see below) with a color-coded background:
   - 1-3: Red background (#dc3545) — Bearish
   - 4-4.9: Orange background (#fd7e14) — Cautious
   - 5-6: Yellow/amber background (#ffc107, dark text) — Neutral
   - 6.1-7.5: Light green (#28a745) — Bullish
   - 7.6-10: Dark green (#155724) — Strongly Bullish
3. **Interpretation paragraph**: 2-3 sentences summarizing what the composite score means for investors and traders right now. Be specific — reference which dimensions are pulling the score up or down.
4. **Dimension table**: A table with columns for Dimension, Score (1-10), a visual bar or indicator, and a 1-2 sentence rationale citing specific data points.
5. **Key risks**: 2-3 bullet points on what could cause conditions to deteriorate.
6. **Potential catalysts**: 2-3 bullet points on what could improve conditions.
7. **Data sources note**: Brief note on when data was gathered and any gaps.

### Weighting for Composite Score

Not all dimensions matter equally for forward returns. Use these weights:

| Dimension | Weight | Reasoning |
|-----------|--------|-----------|
| Macro / Economic Backdrop | 15% | Sets the fundamental floor |
| Market Breadth & Internals | 15% | Best real-time health signal |
| Volatility & Risk Sentiment | 10% | Important but mean-reverting |
| Sector Rotation & Money Flows | 10% | Shows where money is going |
| Liquidity Conditions | 15% | Liquidity drives everything |
| Valuation Context | 10% | Matters more for longer horizons |
| Technical Structure | 10% | Confirms or denies the narrative |
| Sentiment & Positioning | 10% | Contrarian value at extremes |
| Geopolitical & Event Risk | 5% | Usually noise, occasionally critical |

When computing the composite, also flag if Sentiment & Positioning is at a contrarian extreme (below 3 or above 8) — in those cases, note that the raw composite may understate or overstate the true outlook.

### Visual Design

- Use a clean sans-serif font (system font stack)
- Score bars: horizontal bars filled proportionally to the score, color-coded using the same scale as the composite
- Keep the layout single-column and mobile-friendly
- Total page should be scannable in under 60 seconds

Save the output as an HTML file in the workspace directory.
