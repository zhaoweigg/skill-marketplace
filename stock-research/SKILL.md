---
name: stock-research
description: Comprehensive stock research and analysis for investment decisions. Use this skill when the user asks to research a company before buying stock, evaluate an investment opportunity, analyze a stock for purchase, or perform due diligence on a public company. Generates a structured research report covering financial health, valuation analysis, competitive position, risk assessment, and potential catalysts. MANDATORY TRIGGERS include stock research, company analysis, investment research, due diligence, evaluate stock, analyze company, should I buy, stock recommendation, investment analysis, research before buying stock.
---

# Stock Research Skill

Generate comprehensive stock research reports to support informed investment decisions.

## Overview

This skill produces a professional investment research report analyzing a company across five key dimensions:
1. **Financial Health & Metrics** - Revenue, profitability, growth, liquidity, leverage
2. **Valuation Analysis** - Multiple valuation approaches and fair value assessment
3. **Competitive Position** - Industry dynamics, competitive advantages, market position
4. **Risk Assessment** - Business, financial, market, and company-specific risks
5. **Catalyst Analysis** - Events that could drive stock price higher or boost business

## Research Process

### Step 1: Gather Information

**Required Information from User**:
- Company name or ticker symbol
- Clarify if additional context is needed (e.g., investment timeline, risk tolerance)

**Data Collection** (use web search extensively):

1. **Recent Financial Data**:
   - Latest quarterly and annual results (revenue, earnings, cash flow)
   - Key metrics from last 3-5 years
   - Balance sheet highlights (cash, debt, equity)
   - Search: "[Company] quarterly earnings", "[Company] annual report", "[Company] 10-K"

2. **Current Stock Information**:
   - Current stock price
   - Market capitalization
   - P/E ratio, P/S ratio, other valuation multiples
   - 52-week range
   - Short interest data (if available)
   - Search: "[Company] stock price", "[Company] valuation metrics"

3. **Competitive Landscape**:
   - Main competitors (identify 3-5 comparable companies)
   - Market share data
   - Industry trends and growth outlook
   - Search: "[Company] competitors", "[Industry] market analysis", "[Industry] trends 2026"

4. **Recent News and Developments**:
   - Recent earnings calls or management commentary
   - Product launches, acquisitions, strategic changes
   - Analyst opinions and price targets
   - Any controversies or concerns
   - Upcoming events (earnings dates, product launches, regulatory decisions)
   - Search: "[Company] news", "[Company] recent developments", "[Company] analyst ratings", "[Company] upcoming events"

5. **Industry and Market Context**:
   - Industry growth rates and outlook
   - Regulatory environment and pending changes
   - Technological trends
   - Search: "[Industry] outlook", "[Industry] forecast 2026"

6. **Catalyst-Specific Research**:
   - Pipeline/product roadmap
   - Management commentary on strategic initiatives
   - Pending regulatory approvals (FDA, FCC, etc.)
   - M&A rumors or announced deals
   - Capacity expansions or facility openings
   - Index inclusion potential
   - Search: "[Company] pipeline", "[Company] upcoming products", "[Company] strategic initiatives"

### Step 2: Analysis

Load and apply relevant reference frameworks:

**Financial Analysis** - Read `references/financial_metrics.md`
- Calculate and interpret key ratios
- Assess trends over time (improving or deteriorating?)
- Compare to industry benchmarks
- Identify red flags

**Valuation Analysis** - Read `references/valuation_methods.md`
- Calculate multiple valuation metrics (P/E, PEG, EV/EBITDA, P/FCF)
- Compare to historical valuations
- Compare to peer valuations
- Estimate fair value range (bull/base/bear cases)
- Determine margin of safety

**Competitive Analysis** - Read `references/competitive_analysis.md`
- Apply Porter's Five Forces
- Assess competitive moat (narrow/moderate/wide)
- Evaluate market position and share trends
- Identify competitive advantages and vulnerabilities

**Risk Assessment** - Read `references/risk_framework.md`
- Categorize risks: business, financial, market, macro, governance
- Rate severity of each risk category (Low/Medium/High)
- Identify red flags or disqualifying factors
- Note risk mitigation factors

**Catalyst Analysis** - Read `references/catalyst_framework.md`
- Identify potential positive catalysts across all categories
- Assess probability, impact, and timeline for each
- Determine if catalysts are priced into current valuation
- Prioritize catalysts by likelihood and materiality
- Identify anti-catalysts (negative events that could harm stock)

### Step 3: Synthesize Investment Thesis

**Bull Case** (Optimistic Scenario):
- What could go right?
- Best-case revenue/earnings trajectory
- Competitive advantages playing out
- Market opportunities
- Catalysts materializing

**Bear Case** (Pessimistic Scenario):
- What could go wrong?
- Downside risks materializing
- Competition intensifying
- Market headwinds
- Anti-catalysts occurring

**Base Case** (Most Likely Scenario):
- Realistic expectations
- Balanced view of opportunities and risks
- Fair value estimate
- Expected catalyst timeline

### Step 4: Generate Report

Create a professional markdown document.

**Report Structure**:

```
STOCK RESEARCH REPORT: [COMPANY NAME]
Ticker: [TICKER] | Report Date: [DATE]

EXECUTIVE SUMMARY
- Current Price: $X.XX
- Market Cap: $X.XX billion
- 52-Week Range: $X.XX - $X.XX
- Key Investment Highlights: [2-3 bullet points]
- Primary Risks: [2-3 bullet points]
- Top Catalysts: [2-3 bullet points]
- Fair Value Estimate (Base Case): $X.XX
- Potential Upside/Downside: X%
- Investment Thesis: [2-3 sentence summary]

1. COMPANY OVERVIEW
   - Business description and model
   - Products/services
   - Revenue breakdown by segment/geography if relevant
   - Recent strategic developments

2. FINANCIAL HEALTH & METRICS

   2.1 Revenue and Growth
   - Revenue trend (3-5 years) with specific figures
   - Growth rates YoY and quarter-over-quarter
   - Revenue quality and sustainability assessment
   - Revenue composition and diversification

   2.2 Profitability Analysis
   - Gross margin, operating margin, net margin (with trends)
   - Comparison to peer averages
   - ROE, ROA, ROIC
   - Margin trajectory and drivers

   2.3 Cash Flow
   - Operating cash flow trends
   - Free cash flow and FCF margin
   - Cash conversion metrics
   - Capital allocation

   2.4 Balance Sheet Strength
   - Cash and equivalents
   - Total debt and net debt
   - Debt ratios (Debt/Equity, Debt/EBITDA)
   - Liquidity metrics (current ratio, quick ratio)
   - Interest coverage

   2.5 Financial Health Summary
   - Overall assessment: Strong/Adequate/Weak
   - Key financial strengths
   - Areas of concern
   - Trend direction

3. VALUATION ANALYSIS

   3.1 Current Valuation Metrics
   [Create table with current metrics]
   - P/E ratio (trailing and forward)
   - PEG ratio
   - P/S ratio
   - EV/EBITDA
   - P/FCF
   - Price-to-Book

   3.2 Historical Comparison
   - Current metrics vs. 3-5 year historical range
   - Valuation trend analysis
   - Context for premium/discount to history

   3.3 Peer Comparison
   [Create table comparing company to 3-5 peers]
   Include: Company, Market Cap, P/E, Forward P/E, PEG, EV/EBITDA, P/S, Rev Growth

   Assessment:
   - Is company trading at premium or discount to peers?
   - Is the premium/discount justified by fundamentals?

   3.4 Fair Value Assessment

   Methodology and assumptions for each scenario:

   - Bull Case Value: $X.XX
     * Key assumptions: [List]
     * Implied upside: X%

   - Base Case Value: $X.XX
     * Key assumptions: [List]
     * Implied upside/downside: X%

   - Bear Case Value: $X.XX
     * Key assumptions: [List]
     * Implied downside: X%

   - Current Price: $X.XX

   3.5 Valuation Conclusion
   - Overall assessment: Undervalued/Fairly Valued/Overvalued
   - Margin of safety analysis
   - Valuation risk factors

4. COMPETITIVE POSITION

   4.1 Industry Overview
   - Industry characteristics and dynamics
   - Market size and growth outlook
   - Key industry trends
   - Regulatory landscape

   4.2 Competitive Landscape
   - Main competitors with market positions
   - Market share analysis and trends
   - Competitive intensity assessment
   - Industry structure (fragmented vs. consolidated)

   4.3 Competitive Advantages (Moat Analysis)
   - Type of moat: Cost advantage/Network effects/Brand/Switching costs/Scale/Other
   - Moat width: Narrow/Moderate/Wide
   - Evidence supporting moat assessment
   - Moat sustainability and durability
   - Threats to competitive advantages

   4.4 Porter's Five Forces Analysis

   [Brief assessment of each force]
   - Competitive Rivalry: [High/Medium/Low] - [Rationale]
   - Threat of New Entrants: [High/Medium/Low] - [Rationale]
   - Supplier Power: [High/Medium/Low] - [Rationale]
   - Buyer Power: [High/Medium/Low] - [Rationale]
   - Threat of Substitutes: [High/Medium/Low] - [Rationale]

   Overall Industry Attractiveness: [Assessment]

   4.5 Competitive Position Summary
   - Overall competitive strength: Strong/Average/Weak
   - Key competitive advantages
   - Competitive vulnerabilities
   - Market position trajectory

5. RISK ASSESSMENT

   5.1 Business/Operational Risks [Overall Rating: Low/Medium/High]
   - Customer/revenue concentration
   - Execution risks
   - Competitive threats
   - Technology/disruption risks
   [Provide specific examples and evidence]

   5.2 Financial Risks [Overall Rating: Low/Medium/High]
   - Leverage and debt concerns
   - Liquidity risks
   - Profitability sustainability
   - Accounting quality concerns
   [Provide specific metrics]

   5.3 Market/Industry Risks [Overall Rating: Low/Medium/High]
   - Cyclical exposure
   - Industry structural changes
   - Regulatory risks
   - Market dynamics
   [Provide industry context]

   5.4 Macroeconomic Risks [Overall Rating: Low/Medium/High]
   - Interest rate sensitivity
   - Economic cycle exposure
   - Currency risks
   - Inflation impacts
   [Assess sensitivity]

   5.5 Governance/ESG Risks [Overall Rating: Low/Medium/High]
   - Board and management quality
   - Corporate governance concerns
   - ESG issues
   - Reputational risks
   [Note any red flags]

   5.6 Overall Risk Profile
   - Aggregate risk rating: Low/Medium/High
   - Most significant risks (top 3)
   - Risk mitigation factors
   - Critical red flags (if any)
   - Recommended risk monitoring

6. CATALYST ANALYSIS

   6.1 Identified Positive Catalysts

   [For each major catalyst, create subsection with:]

   Catalyst: [Name/Description]
   - Type: [Financial/Product/Strategic/Management/Industry/Operational/etc.]
   - Description: [What is the catalyst?]
   - Probability: High/Medium/Low (with rationale)
   - Potential Impact: High (>20%)/Medium (10-20%)/Low (<10%) on stock price
   - Timeline: [Specific date or estimated timeframe]
   - Currently Priced In?: Not priced in/Partially/Fully
   - Key Dependencies: [What needs to happen]
   - Monitoring Indicators: [How to track progress]

   [Repeat for 3-7 key catalysts]

   6.2 Catalyst Priority Matrix

   High Priority Catalysts (High probability + High impact + Not priced in):
   - [List top catalysts with brief rationale]

   Medium Priority Catalysts:
   - [List secondary catalysts]

   Long-Shot Catalysts (Lower probability but meaningful if they occur):
   - [List speculative catalysts]

   6.3 Anti-Catalysts (Negative Events to Watch)
   - [List potential negative catalysts]
   - [Assess probability and impact]
   - [Note early warning signs]

   6.4 Catalyst Timeline
   - Next 3 months: [Expected events]
   - 3-12 months: [Medium-term catalysts]
   - 1-3 years: [Long-term developments]

   6.5 Catalyst Analysis Summary
   - Overall catalyst outlook: Strong/Moderate/Weak
   - Most likely near-term catalyst
   - Catalyst that would be most significant
   - Balance of positive vs. negative catalysts

7. INVESTMENT THESIS

   7.1 Bull Case
   - Optimistic scenario narrative
   - What needs to go right
   - Key assumptions
   - Catalysts materializing
   - Potential price target: $X.XX
   - Expected return: X%

   7.2 Bear Case
   - Pessimistic scenario narrative
   - What could go wrong
   - Key concerns
   - Anti-catalysts materializing
   - Potential price target: $X.XX
   - Downside risk: X%

   7.3 Base Case (Most Likely)
   - Realistic scenario narrative
   - Expected developments
   - Moderate assumptions
   - Most probable catalyst path
   - Expected price target: $X.XX
   - Expected return over [timeframe]: X%

   7.4 Investment Outlook
   - Risk/reward assessment
   - Investment suitability (growth/value/income/speculative)
   - Recommended holding period
   - Position sizing suggestion based on risk

8. CONCLUSION

   Summary of Analysis:
   - Financial health: [Assessment]
   - Valuation: [Undervalued/Fair/Overvalued]
   - Competitive position: [Strong/Average/Weak]
   - Risk level: [Low/Medium/High]
   - Catalyst potential: [Strong/Moderate/Weak]

   Investment Considerations:
   - Best suited for: [Type of investor]
   - Key reasons to invest: [Top 2-3]
   - Key reasons to avoid: [Top 2-3]
   - Critical factors to monitor: [Top 3-5]

   Next Steps for Investors:
   - Additional research recommended
   - Key events to watch
   - Entry point considerations

IMPORTANT DISCLAIMERS
- This report is for informational purposes only and does not constitute investment advice
- Past performance does not guarantee future results
- All investments carry risk including potential loss of principal
- Investors should conduct their own due diligence and consult with financial advisors
- Information is based on publicly available data as of [DATE] and may not be complete or accurate
- Analyst estimates and projections are uncertain and subject to change
- The author may have positions in securities mentioned (if applicable)
```

**Report Quality Standards**:
- Use clear, professional language
- Include specific numbers and data points (not just qualitative statements)
- Present balanced analysis (not promotional or biased)
- Use tables for comparative data
- Keep sections concise but comprehensive
- Cite data sources where important (e.g., "According to Q4 2024 earnings report")
- Use conservative assumptions in base case
- Be honest about limitations and uncertainties
- Ensure catalyst analysis is evidence-based, not speculative

### Step 5: Deliver Report

1. Save the report to `/mnt/user-data/outputs/`
2. Use filename format: `[TICKER]_Stock_Research_[DATE].md`
3. Present the file to the user using the present_files tool
4. Offer brief 2-3 sentence summary

**Summary Format**:
"I've completed a comprehensive research report on [Company]. The stock appears [undervalued/fairly valued/overvalued] with [X]% potential upside to fair value. Key catalysts include [top catalyst], while main risks are [top risk]. The company has [strong/moderate/weak] financial health and [strong/moderate/weak] competitive position."

## Quality Standards

**Research Quality**:
- Use recent data (within last 6 months for financials, within last month for news/catalysts)
- Verify key facts with multiple sources when possible
- Be explicit about data gaps or uncertainties
- Don't fabricate numbers - state clearly if data is unavailable
- For catalyst analysis, distinguish between confirmed events and speculation

**Analysis Quality**:
- Support conclusions with specific evidence
- Compare to relevant benchmarks (peers, historical, industry)
- Consider multiple perspectives
- Acknowledge limitations and alternative interpretations
- For catalysts, provide realistic probability assessments

**Report Quality**:
- Professional markdown formatting
- Clear executive summary that captures key findings
- Logical flow and organization
- Actionable insights
- Appropriate caveats and disclaimers
- Data-driven catalyst analysis

## Important Notes

**What This Skill Does**:
- Provides comprehensive research and analysis framework
- Identifies potential catalysts and their likelihood
- Estimates fair value ranges
- Assesses risks and competitive position
- Synthesizes information into professional report

**What This Skill Does NOT Do**:
- Does not provide specific buy/sell/hold recommendations (presents analysis for user to decide)
- Does not predict future stock prices with certainty
- Does not guarantee investment returns
- Does not replace professional financial advice
- Does not have insider information

**Ethical Considerations**:
- Present balanced analysis (both positives and negatives)
- Disclose limitations and uncertainties
- Use conservative assumptions when estimating valuations
- Include appropriate disclaimers
- Do not hype or promote stocks
- Distinguish between facts and speculation in catalyst analysis
- Be transparent about confidence levels

**Data Limitations**:
- Acknowledge when data is unavailable or uncertain
- State the date of data used
- Note if analysis is based on limited information
- Recommend user verify critical facts independently
- For catalyst timing, provide ranges rather than exact predictions

## Customization Options

Adjust depth and emphasis based on user needs:

- **Quick screen**: Focus on executive summary, key metrics, and top catalysts only
- **Deep dive financials**: Expand financial analysis with detailed ratios and trend analysis
- **Valuation focus**: Multiple valuation methodologies and sensitivity analysis
- **Catalyst focus**: Extensive catalyst research with detailed probability trees
- **Risk focus**: Expanded risk assessment with scenario analysis
- **Competitive deep dive**: Detailed industry analysis and competitive positioning

Always maintain the five core pillars (Financial Health, Valuation, Competitive Position, Risk, Catalysts) while adjusting granularity.
