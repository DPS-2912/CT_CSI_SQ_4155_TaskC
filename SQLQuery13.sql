SELECT 
  C.BU,
  C.cost_month,
  C.cost_amount,
  R.revenue_amount,
  ROUND(C.cost_amount / NULLIF(R.revenue_amount, 0), 4) AS cost_revenue_ratio
FROM COSTS C
JOIN REVENUE R ON C.BU = R.BU AND C.cost_month = R.revenue_month;