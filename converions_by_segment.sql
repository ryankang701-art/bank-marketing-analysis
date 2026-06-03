SELECT
  occupation,
  CASE
    WHEN age < 30 THEN 'Under 30'
    WHEN age BETWEEN 30 AND 45 THEN '30-45'
    WHEN age BETWEEN 46 AND 60 THEN '46-60'
    ELSE 'Over 60'
  END AS age_group,
  education_level,
  COUNT(*) AS total_contacts,
  SUM(CASE WHEN conversion_status = 'converted' THEN 1 ELSE 0 END) AS conversions,
  ROUND(SUM(CASE WHEN conversion_status = 'converted' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS conversion_rate
FROM `project-694258a4-1dd1-46af-a64.12.Bank Marketing Dataset`
GROUP BY 
  occupation,
  CASE
    WHEN age < 30 THEN 'Under 30'
    WHEN age BETWEEN 30 AND 45 THEN '30-45'
    WHEN age BETWEEN 46 AND 60 THEN '46-60'
    ELSE 'Over 60'
  END,
  education_level
ORDER BY conversion_rate DESC;
