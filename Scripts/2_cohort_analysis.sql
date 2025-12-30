SELECT
	ca.cohort_year,
	COUNT(DISTINCT ca.customerkey) AS total_customers,
	ROUND(SUM(ca.total_net_revenue)::NUMERIC,2) AS total_cohort_revenue,
	ROUND(SUM(ca.total_net_revenue)::NUMERIC / COUNT(DISTINCT ca.customerkey)::NUMERIC,2) AS cohort_per_customer_revenue
FROM 
	cohort_analysis ca
WHERE 
	orderdate = first_purchase_date 
GROUP BY
	cohort_year;

