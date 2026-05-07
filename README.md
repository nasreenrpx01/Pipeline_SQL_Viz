# Performance Matrix: E-commerce Data Pipeline & Dashboard

## Project Overview
This project demonstrates an end-to-end data analytics workflow that transforms raw e-commerce transactional data into an interactive business intelligence dashboard for performance monitoring and strategic decision-making.

The workflow includes:
- Data ingestion and cleaning
- SQL-based ETL pipeline development in BigQuery
- Data validation and transformation
- KPI generation and business analysis
- Interactive dashboard creation using Looker Studio

The final dashboard provides insights into:
- Sales performance
- Customer behavior
- Product trends
- Regional performance
- Logistics efficiency

---

# Tech Stack

| Technology | Purpose |
|---|---|
| BigQuery | Data Warehousing & SQL Processing |
| SQL | ETL, Data Cleaning & Analysis |
| Looker Studio | Data Visualization & Dashboarding |
| Excel | Data Validation & Initial Checks |

---

# Dataset
The dataset contains raw e-commerce order transactions, including:
- Orders
- Customers
- Products
- Sales
- Shipping details
- Geographic information

---

# SQL Data Pipeline

## 1. Data Cleaning & Schema Standardization

### Column Normalization
Standardized column names by replacing spaces with underscores to ensure SQL compatibility and improve query readability.

Example:
```sql
Ship Mode → ship_mode
Order Date → order_date
```

### Data Validation
Performed null-value checks using `COUNTIF()` on critical business fields such as:
- order_id
- customer_id
- sales
- category
- region

### Deduplication Checks
Validated transactional integrity by identifying duplicate `order_id` values.

---

# Analytical SQL Queries

## Revenue & KPI Analysis
Calculated core business KPIs including:
- Total Revenue
- Total Orders
- Total Customers
- Average Order Value (AOV)

---

## Monthly Revenue Growth
Used `DATE_TRUNC()` to aggregate revenue month-wise and analyze growth trends over time.

---

## Customer Segmentation
Segmented customers into:
- New Customers
- Repeat Customers

based on purchasing frequency.

---

## Product & Regional Analysis
Identified:
- Top-performing products
- Highest revenue-generating regions
- Best-performing cities
- Category-wise revenue contribution

---

# SQL Concepts Used

- Common Table Expressions (CTEs)
- Aggregations
- GROUP BY & ORDER BY
- COUNTIF()
- CASE Statements
- Window Functions
- Ranking Functions
- DATE_TRUNC()
- KPI Calculations
- Data Validation Queries

---

# Dashboard Overview

The final dashboard was developed in Looker Studio as a multi-page Performance Matrix Dashboard covering business activity from:

📅 **June 1, 2015 – December 31, 2015**

---

# Page 1: Executive Overview

## High-Level KPIs
- **Total Sales:** $354.37K
- **Orders:** 689
- **Unique Customers:** 482

---

## Revenue Trends
Visualized monthly revenue growth trends showing consistent business growth throughout Q3 and Q4 2015.

---

## Market Composition

### Revenue by Category
Balanced revenue contribution across:
- Furniture
- Technology
- Office Supplies

demonstrating diversified business performance.

---

## Customer Segment Analysis
The **Consumer Segment** emerged as the primary revenue contributor with over **$219K** in sales.

---

## Regional Performance
The **West Region** generated the highest overall revenue.

---

## Logistics Insights
Identified **Standard Class** as the most frequently used shipping method.

---

# Page 2: Product & Geographic Deep-Dive

## Inventory Performance
Tracked performance across:
- **1,861 Total SKUs**

---

## Category Leadership
- Technology identified as the leading category
- Phones emerged as the highest revenue-generating sub-category

---

## Top Products
Highlighted high-value products contributing significantly to overall sales.

Example:
- Canon imageCLASS 2200 Advanced Copier

---

## Geographic Intelligence
Created a U.S. heat map visualization to analyze:
- Regional sales density
- High-performing states
- Revenue concentration zones

---

# Strategic Business Insights

## Consistent Revenue Growth
Sales demonstrated steady month-over-month growth throughout the second half of 2015.

---

## Diversified Product Distribution
Revenue remained balanced across major product categories, reducing dependency on a single segment.

---

## Customer Revenue Concentration
Consumer customers generated significantly higher revenue compared to Corporate and Home Office segments.

---

# Business Impact

This project demonstrates:
- End-to-end analytics workflow design
- SQL-based ETL pipeline development
- KPI reporting and dashboard automation
- Business intelligence reporting
- Cloud analytics using BigQuery
- Interactive dashboard storytelling

---

# Future Improvements

- Build automated ETL workflows
- Integrate live data sources
- Add predictive sales forecasting
- Implement customer retention analytics
- Deploy real-time dashboard refresh

---

# Author

## Nasreen Fatima
- Data Analyst | Performance Analyst
- Skilled in SQL, Power BI, BigQuery, Looker Studio, Python

LinkedIn: https://www.linkedin.com/in/nasreen-fatima/  

```
