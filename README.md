# Customer Analytics Using SQL: Segmentation, Cohort & Retention Analysis

## 1. Overview
This project analyzes transactional sales data to identify how different customer groups contribute to revenue and how their value changes over time.

Primarily using sales database data from Contoso dataset, the analysis moves beyond topline metrics and focuses on who the customers are, when they were acquired, and how they behave across their lifecycle.  The business question is approached through a structured, end-to-end workflow; from data extraction,  manipulation, interpretation to insights. 

For each analysis, I included well defined analytical approach, SQL queries, result tables, AI-assisted visualizations, key findings, and business insights.

## 2. Dataset Background

The data used in this project is based on the Contoso Dataset, a comprehensive synthetic dataset designed to simulate a retail business environment.

The Sales database, contains transactional and dimensional data required to analyze customer purchasing behavior and revenue performance. Key components of the dataset include sales transactions, product information, store details, and structured date-time data.

The dataset reflects realistic business relationships and data structures, making it a diverse mix of numerical, categorical, and temporal fields.

## 3. Business Questions
The goal of this project is addressed through these business questions:
1. **Customer Segmentation Analysis:** How do different customer segments contribute to revenue?
2. **Cohort Analysis:** How do different customer cohort groups generate revenue ?
3. **Customer Retention Analysis:** How does customer retention vary across acquisition cohorts over time?

### 3.1. Customer Segmentation Analysis
#### Approach:
- Customers were categorized on their total lifetime value (LTV)
- Assigned customers to High, Mid, and Low-value customers
- Calculated metrics: total revenue, average LTV for all customers groups

**Query 1:** [1_customer_segmentation](/Scripts/1_customer_segmentation.sql)

|customer_segment|total_ltv|customer_count|avg_ltv|
|----------------|---------|--------------|-------|
|1 - Low Value|4341809.53|12372|350.94|
|2 - Mid Value|66636451.79|24743|2693.14|
|3 - High Value|135429277.27|12372|10946.43|


![Customer Segmentation](/Visualizations/1_customer_ltv_analysis.png)

![Customer Segmentation](/Visualizations/2_customer_segment_count.png)

**Key Findings:**

-  High value customers dominate total LTV (~66%).
Even though they are not the largest segment by count, they contributed nearly two-thirds of total revenue.
- Mid value customers form a strong secondary pillar (~32%). This segment contributes almost one-third of total LTV, indicating solid monetization potential at scale.
- Low value customers add minimal revenue (~2%), despite being a distinct segment (~25%)

**Business Insights:**

- Retention of high value customers is critical. Small improvements in retention incentives here will have an outsized impact on increasing revenue.
- Mid value customers (with 50%) are the best upgrade opportunity. Targeted upsell, cross-sell, or loyalty strategies could convert portions of this segment into high value customers.
- Heavy acquisition or retention effort on low value customers is unlikely to pay off; automated  strategies may make more business sense.


### 3.2 Cohort Analysis
#### Approach:
- Tracked revenue and customer count per cohorts
- Cohorts were grouped by year of first purchase
- Analyzed customer retention at a cohort level

**Query 2:** [2_cohort_analysis](/Scripts/2_cohort_analysis.sql)

|cohort_year|total_customers|total_cohort_revenue|cohort_per_customer_revenue|
|-----------|---------------|--------------------|---------------------------|
|2015|2825|7245612.98|2564.82|
|2016|3397|9839134.34|2896.42|
|2017|4068|11771496.31|2893.68|
|2018|7446|19773770.56|2655.62|
|2019|7755|22245058.22|2868.48|
|2020|3031|7058614.52|2328.81|
|2021|4663|11974082.36|2567.89|
|2022|9010|21507554.55|2387.08|
|2023|5890|12890580.84|2188.55|
|2024|1402|2764779.66|1972.03|



![Cohort Analysis](/Visualizations/2_cohort_analysis.png)

**Key Findings:**
- Customers acquired around 2016–2019 generate the highest revenue per customer, hovering above ~$2.7K 

- Clear downward trend for newer cohorts from 2020 onward; per-customer revenue steadily declines, dropping to ~$2K by 2024, even after adjusting for time in market.

- There’s a consistent, compounding drop in customer value for newer cohorts as shown by the smooth exponential curve.

**Business Insights:**
- Value extracted from customers is decreasing over time and needs more executive investigation.

- From 2021 cohort onwards, there has been a consistent drop in customer revenue.

- Lowering LTV and decreasing  customer acquisition  could cause a potential decline in revenue.

### 3.3 Customer Retention Analysis
#### Approach:
- Identified each customer’s most recent purchase date and defined churn using a 6-month inactivity threshold
- Classified customers as Active or Churned
- Analyzed churn distribution by acquisition cohort year
- Calculated cohort-level metrics: churned customers, active customers, total customers, and churn ratio

**Query 3:** [3_retention_analysis.sql](/Scripts/3_retention_analysis.sql)

|cohort_year|customer_status|num_customers|total_customers|status_ratio|
|-----------|---------------|-------------|---------------|------------|
|2015|Active|237|2825|0.08|
|2015|Churned|2588|2825|0.92|
|2016|Active|311|3397|0.09|
|2016|Churned|3086|3397|0.91|
|2017|Active|385|4068|0.09|
|2017|Churned|3683|4068|0.91|
|2018|Active|704|7446|0.09|
|2018|Churned|6742|7446|0.91|
|2019|Active|687|7755|0.09|
|2019|Churned|7068|7755|0.91|
|2020|Active|283|3031|0.09|
|2020|Churned|2748|3031|0.91|
|2021|Active|442|4663|0.09|
|2021|Churned|4221|4663|0.91|
|2022|Active|937|9010|0.10|
|2022|Churned|8073|9010|0.90|
|2023|Active|455|4718|0.10|
|2023|Churned|4263|4718|0.90|



**Key Findings:**

- Churn is consistently very high across cohorts (~90-92%); i.e only about 8–9% of customers remain active, this could mean
limited long-term retention regardless of acquisition year.
- Slight improvement in recent cohorts (2022–2023); active customers increased marginally to ~10%, with churn dropping suggesting initial signs of better retention .


**Business Insights:**

- Churn is a structural problem and not a cohort-specific one. Improvements must come from other engagement changes, not acquisition alone.

- With only ~10% of customers surviving long term, even small improvements in the first 6–12 months could materially lift the active customer base.

- Recent cohorts should be closely monitored, not assumed successful, to improve statetegies to  increase retaintion. 

## 4. Summary

This project demonstrates how transactional sales data can be transformed into actionable customer insights. Through customer segmentation, cohort analysis, and retention analysis, the project highlights differences in customer value, lifecycle behavior, and long-term engagement.

## 5. Tools and Technologies Used 

- **SQL** – Data analysis using joins, aggregations, CTEs, window functions, views and date-based calculations
- **PostgreSQL** – Database hosting
- **DBeaver** – Executing SQL queries, exploring schemas, and validating results
- **VS Code** – Managing SQL scripts and project files
- **AI-powered Visualizations** – Creating charts to highlight trends

-------------------------------------------
