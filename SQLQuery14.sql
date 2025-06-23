SELECT 
  sub_band, 
  COUNT(*) AS headcount,
  COUNT(*) * 100.0 / (SELECT COUNT(*) FROM EMPLOYEES) AS percentage
FROM EMPLOYEES
GROUP BY sub_band;