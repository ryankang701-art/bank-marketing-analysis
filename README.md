# Bank Marketing Campaign Analysis

## Overview
What separates a converted customer from a missed one? Digging into 45,000 customer interactions, three things stood out: who the bank called, how long the conversation lasted, and when the campaign ran. Each finding tells a different part of the conversion story and what the bank should test next.

## Tools Used
- Google BigQuery (SQL)
- Power BI Desktop

## Key Findings
- Retired and student segments converted at 22.8% and 28.7%, roughly 2.5x the rate of working segments like administrative staff (12.2%). A common characterisitic between both groups is greater schedule flexibility and different financial priorites among non working segments, making them more receptive to outreach during business hours. A test to confirm whether time of day is a contributing factor since these segments may simply be more reachable rather than more persuadable.
- Call lasting over 5 minutes converted at 84% compared to just 1% for calls under a minute. Longer engagement likely allows agents to address objections and built rapport, increasing conversion likelihood. To confirm this hypothesis, we should run a test to determine whether this is causal (better engagement drives conversion) or correlational (customers with existing conversion intent simply stay on the line longer). If causal, call scripts should be redesigned to extend engagement.
- Conversion rates showed a clear seasonal pattern, peaking in March (52%) and September (46%), with a dip from May through August (averaging 11%). This suggests campaign timing and budget allocation could be optimized around these higher converting windows rather than running fixed, always-on campaigns. The takeaway here is budgets could be more efficient by scaling down during off-season and ramp up during lead-up and maximized during peak conversion months.

## Dashboard
![Dashboard](Bank_Campaign_Analysis_PowerBI.PNG)

## SQL Queries
- `conversion_by_segment.sql` — Conversion rate by occupation, age group, and education
- `conversion_by_channel.sql` — Conversion rate by communication channel and call duration
- `monthly_performance.sql` — Month over month campaign performance with conversion rate change

## Data Source
Bank marketing campaign dataset — 45,000 records
