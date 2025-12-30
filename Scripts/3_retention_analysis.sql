WITH customer_last_purchase AS

(
SELECT 
	customerkey,
	cleaned_name,
	orderdate,
	first_purchase_date,
	cohort_year,
	ROW_NUMBER() OVER (PARTITION BY customerkey ORDER BY orderdate DESC) AS rn
FROM cohort_analysis
),

churned_customers  AS 

(
SELECT 
	 customerkey, 
	 cleaned_name, 
	 orderdate AS last_purchase_date,
	 cohort_year,
	 CASE
	 	WHEN orderdate < (SELECT MAX(orderdate) - INTERVAL '6 months' FROM sales) THEN 'Churned'  
	 	ELSE 'Active'
	 END AS customer_status	 
FROM 
	customer_last_purchase
WHERE
	rn = 1
	AND first_purchase_date < (SELECT MAX(orderdate - INTERVAL '6 months') FROM sales)
)

SELECT 
	cohort_year,
	customer_status,
	COUNT(customerkey) AS num_customers,
	SUM(COUNT(customerkey)) OVER(PARTITION BY cohort_year) AS total_customers,
	ROUND(COUNT(customerkey) / SUM(COUNT(customerkey)) OVER(PARTITION BY cohort_year) ,2) AS status_ratio
FROM 
	churned_customers
GROUP BY
	customer_status,
	cohort_year
ORDER BY 
	cohort_year,
	customer_status
	
	
	