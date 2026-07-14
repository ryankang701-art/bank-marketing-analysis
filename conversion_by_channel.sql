SELECT
  communication, channel,
  CASE
    WHEN call_duration < 60 THEN 'Under 1 min'
    WHEN call_duration BETWEEN 60 AND 180 THEN '1-3 mins'
    WHEN call_duration BETWEEN 181 AND 300 THEN '3-5 mins'
    ELSE 'Over 5 mins'
  END AS call_duration_bucket,
  COUNT(*) AS total_contacts,
  SUM(CASE WHEN conversion_status = 'converted' THEN 1 ELSE 0 END) AS conversions,
  ROUND(SUM(CASE WHEN conversion_status = 'converted' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS conversion_rate
FROM `project-694258a4-1dd1-46af-a64.12.Bank Marketing Dataset`
GROUP BY channel, occupation
ORDER BY conversion_rate DESC;
