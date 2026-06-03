WITH monthly AS (
  SELECT
    call_month,
    COUNT(*) AS total_contacts,
    SUM(CASE WHEN conversion_status = 'converted' THEN 1 ELSE 0 END) AS conversions,
    ROUND(SUM(CASE WHEN conversion_status = 'converted' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS conversion_rate,
    ROUND(AVG(call_duration), 2) AS avg_call_duration,
    ROUND(AVG(call_frequency), 2) AS avg_call_frequency
  FROM `project-694258a4-1dd1-46af-a64.12.Bank Marketing Dataset`
  GROUP BY call_month
)
SELECT
  call_month,
  total_contacts,
  conversions,
  conversion_rate,
  avg_call_duration,
  avg_call_frequency,
  LAG(conversion_rate) OVER (ORDER BY call_month) AS prev_month_conversion_rate,
  ROUND(conversion_rate - LAG(conversion_rate) OVER (ORDER BY call_month), 2) AS conversion_rate_change
FROM monthly
ORDER BY call_month;
