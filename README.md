# Bank Customer Churn Analysis

## Project Overview

This project analyzes customer churn for a banking dataset containing 10,000 customer records. The goal is to identify customer segments associated with higher churn, understand customer characteristics linked to churn, and quantify the aggregate account balance associated with customers who exited.

The project follows an end-to-end data analytics workflow using **SQL, Python, and Power BI**.

### Business Objective

The analysis aims to answer questions such as:

* What is the overall customer churn rate?
* Which age groups have higher churn rates?
* How does churn vary by geography and gender?
* Does customer activity relate to churn?
* How does the number of products relate to churn?
* What customer characteristics are associated with higher churn?
* What aggregate account balance is associated with churned customers?

### Tools & Technologies

* **SQL** — data exploration, validation, aggregation, and segmentation
* **Python / Pandas** — data preparation, feature engineering, and analysis validation
* **Power BI** — interactive dashboard and data visualization
* **DAX** — calculated columns and analytical measures

## SQL Analysis

SQL was used as the primary exploratory analysis and validation layer before building the Power BI dashboard.

The analysis included:

* Inspecting the database schema and available fields.
* Validating the total customer count.
* Checking missing values across analytical fields.
* Validating numeric ranges for age, credit score, tenure, products, and churn status.
* Calculating overall customer and churn counts.
* Comparing churn rates across customer segments.
* Analyzing average credit score, tenure, balance, and salary for churned versus retained customers.
* Examining churn by geography, gender, age group, credit-card ownership, activity status, and number of products.
* Investigating the relationship between account balance and customer churn.
* Segmenting customers by balance level to compare churn rates across balance groups.

### Key SQL Findings

The SQL analysis established an overall customer churn rate of approximately **20.37%**, with **2,037 churned customers out of 10,000**.

Several meaningful differences were identified across customer segments. Churn rates varied substantially by age group, geography, activity status, gender, and number of products.

The analysis also showed that churned customers had a higher average account balance than customers who stayed, making account balance an important customer-value dimension for further investigation.

SQL results were subsequently validated and extended using Python and Power BI.

## Python / Pandas Analysis

Python and Pandas were used for data preparation, feature engineering, exploratory analysis, and validation of the SQL results.

### Data Preparation

The processed dataset was validated to confirm:

* **10,000 rows** were retained after processing.
* The analytical fields contained no missing values.
* Numeric ranges were checked for key variables such as age and credit score.
* Churn status was validated as a binary variable.

### Feature Engineering

An `AgeGroup` feature was created to make age-based churn analysis easier to interpret.

The age groups were defined as:

* **Under 30**
* **30–39**
* **40–49**
* **50–59**
* **60+**

The resulting age-group distribution was:

| Age Group | Customers |
| --------- | --------: |
| Under 30  |     1,641 |
| 30–39     |     4,346 |
| 40–49     |     2,618 |
| 50–59     |       869 |
| 60+       |       526 |

### Analysis Validation

Python was also used to independently examine churn patterns across the engineered age groups and other customer attributes.

The age-group analysis identified substantial differences in churn rates, with the **50–59** segment showing the highest observed churn rate at approximately **56.04%**.

The processed dataset was then exported for use in Power BI.

## Power BI Dashboard

Power BI was used to transform the analytical results into an interactive business dashboard.

The dashboard includes KPI cards and visuals covering:

* Total customers
* Churned customers
* Overall churn rate
* Churn rate by geography
* Churn rate by member activity
* Churn rate by age group
* Churn rate by number of products
* Churn rate by gender
* Churned balance by geography
* Churned balance by activity status
* Churned customer-level details

### DAX Measures and Calculated Columns

A calculated column was created to convert the binary activity field into a business-friendly category:

`Activity Status`

* `1` → Active
* `0` → Inactive

A churn rate measure was used to calculate churn dynamically across different dashboard segments.

A `Churned Balance` measure was also created to calculate the aggregate account balance associated with customers where `Exited = 1`.

This metric represents the **aggregate balance held by churned customers in the dataset** and should not be interpreted as confirmed financial loss to the bank.

### Dashboard Design

The dashboard was organized into:

1. High-level customer and churn KPIs
2. Churn segmentation analysis
3. Balance exposure analysis
4. Customer-level churn investigation

This structure allows users to move from overall churn performance to segment-level patterns and finally to individual customer records.

## Key Findings

### Overall Churn

* The dataset contains **10,000 customers**.
* **2,037 customers** had exited, resulting in an overall churn rate of approximately **20.37%**.
* **7,963 customers** remained with the bank.

### Age

Churn varied substantially across age groups:

| Age Group | Churn Rate |
| --------- | ---------: |
| Under 30  |      7.56% |
| 30–39     |     10.88% |
| 40–49     |     30.79% |
| 50–59     |     56.04% |
| 60+       |     27.95% |

The **50–59** age group had the highest observed churn rate at approximately **56.04%**.

### Geography

Churn also varied by geography. Germany showed a higher churn rate than France and Spain, indicating that geographic segmentation may be useful when investigating customer retention.

### Customer Activity

Customer activity showed a substantial relationship with churn. Inactive customers had a higher churn rate than active customers.

This suggests that customer engagement is an important dimension to consider when identifying customers who may require further retention analysis.

### Number of Products

Customers with different numbers of products showed substantially different churn rates.

Customers with **3 and 4 products** had particularly high observed churn rates. However, these groups contained relatively few customers compared with the 1- and 2-product groups, so the results should be interpreted with sample size in mind.

### Gender

Female customers had a higher observed churn rate than male customers in this dataset.

This is an observed segment difference and does not establish that gender itself causes churn.

### Account Balance

Churned customers had a higher average account balance than customers who stayed.

The analysis identified approximately **$185.6M in aggregate account balance associated with churned customers**.

This figure represents balances recorded for customers who exited and should not be interpreted as direct revenue loss or confirmed financial loss.

## Business Insights

The analysis suggests several areas that could be investigated further:

1. **Prioritize retention analysis for high-churn age segments**, particularly customers aged 50–59.
2. **Investigate customer engagement**, given the higher churn observed among inactive members.
3. **Examine customers with multiple products** more closely, while accounting for the smaller sample sizes in the 3- and 4-product groups.
4. **Investigate geographic differences**, particularly the higher observed churn rate in Germany.
5. **Consider customer balance when prioritizing retention analysis**, since churned customers represented a substantial aggregate balance.
6. Use the dashboard to identify customer segments for **further investigation rather than assuming the observed relationships are causal**.

## Project Structure

```text
bank_customer_churn_analysis/
│
├── README.md
│
├── data/
│   ├── raw/
│   └── processed/
│       └── bank_churn_processed.csv
│
├── sql/
│   └── churn_analysis.sql
│
├── python/
│   └── churn_analysis.ipynb
│
├── powerbi/
│   └── bank_customer_churn.pbix
│
└── screenshots/
    └── dashboard.png
```

## How to Reproduce the Analysis

1. Load the raw banking customer dataset.
2. Use SQL to inspect the schema, validate the data, and perform exploratory churn analysis.
3. Use Python/Pandas to prepare the data, engineer the `AgeGroup` feature, and validate analytical results.
4. Export the processed dataset to CSV.
5. Load the processed dataset into Power BI.
6. Create the required DAX measures and calculated columns.
7. Build the Power BI dashboard using the processed data.
8. Use the dashboard to explore overall churn, customer segments, and aggregate balance associated with churned customers.

## Conclusion

This project demonstrates an end-to-end analytics workflow from raw customer data through **SQL exploration, Python data preparation and validation, DAX modeling, and Power BI visualization**.

The analysis focuses on identifying observable customer segments associated with churn and presenting the results in a format that supports further business investigation and retention analysis.

