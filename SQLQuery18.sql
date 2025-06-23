SELECT
  BU,
  MONTH(join_date) AS month,
  SUM(salary * 1.0) / COUNT(*) AS weighted_avg_salary
FROM EMPLOYEES
GROUP BY BU, MONTH(join_date);