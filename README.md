# Introduction
Welcome to the Banking Analysis project! In this endeavor, I delve into the world of Banking Analysis, leveraging SQL queries and data visualization techniques to uncover insights into key performance indicators (KPIs), loan metrics, and market trends.

Through this project, I aim to explore various aspects of the banking sector, including loan applications, funded amounts, interest rates, debt-to-income ratios, and more. By analyzing these metrics, I seek to gain a deeper understanding of the financial landscape and identify opportunities for improvement and optimization.

This project not only serves as a platform to showcase my SQL skills but also provides valuable insights into the dynamics of the banking industry.

🔍 SQL queries? Check them out here: [project_sql folder](/project_sql/)

### Dashboard Link : https://app.powerbi.com/groups/me/reports/2aa16b5b-4024-475c-8392-0c3ee5e34721/ReportSection84987305884eec1eb468?experience=power-bi


## Problem Statements Overview:

### Problem Statement 1: Key Performance Indicators (KPIs) Requirements
1. **Total Loan Applications:**
   - How many loan applications were received during a specified period?
   - What is the Month-to-Date (MTD) Loan Applications count?

2. **Total Funded Amount:**
   - What is the total amount of funds disbursed as loans?
   - What is the MTD Total Funded Amount?

3. **Total Amount Received:**
   - What is the total amount received from borrowers?
   - What is the Month-to-Date (MTD) Total Amount Received?

4. **Average Interest Rate:**
   - What is the average interest rate across all loans?
   - How does the MTD average interest rate compare?
   - What are the MoM variations in interest rates?

5. **Average Debt-to-Income Ratio (DTI):**
   - What is the average DTI for all borrowers?
   - How does the Month-to-Date (MTD) average DTI compare?

### Problem Statement 2: Good Loan v Bad Loan KPI’s
- **Good Loan:**
  - What is the percentage of Good Loan Applications?
  - How many Good Loan Applications are there?
  - What is the Good Loan Funded Amount?
  - What is the Total Received Amount for Good Loans?
  
- **Bad Loan:**
  - What is the percentage of Bad Loan Applications?
  - How many Bad Loan Applications are there?
  - What is the Bad Loan Funded Amount?
  - What is the Total Received Amount for Bad Loans?

### Problem Statement 3: Charts
1. **Monthly Trends by Issue Date** (Line Chart)
2. **Regional Analysis by State** (Filled Map)
3. **Loan Term Analysis** (Donut Chart)
4. **Employee Length Analysis** (Bar Chart)
5. **Loan Purpose Breakdown** (Bar Chart)
6. **Home Ownership Analysis** (Tree Map)



## SQL Query Objectives:
1. Identify loan application trends over time.
2. Analyze geographical patterns in lending activities.
3. Understand loan term distributions and their impact.
4. Assess the relationship between employment length and loan metrics.
5. Break down loan purposes to understand borrower needs.
6. Explore how home ownership status influences loan applications.
7. Develop a comprehensive Details Dashboard to provide a holistic view of loan data.

# Tools I Used
For my deep dive into the analysis, I harnessed the power of several key tools:

- **SQL:** The backbone of my analysis, allowing me to query the database and unearth critical insights.
- **PostgreSQL:** The chosen database management system, ideal for handling the job posting data.
- **Visual Studio Code:** My go-to for database management and executing SQL queries.
- **Power BI:** Leveraged for data visualization, creating interactive dashboards to present insights visually and effectively.
- **Git & GitHub:** Essential for version control and sharing my SQL scripts and analysis, ensuring collaboration and project tracking.


# The Analysis
Each query for this project aimed at investigating specific questions. Here’s how I approached each question:

### 1. Total Loan Applications

```sql
SELECT COUNT(id) as Total_Loan_Applications FROM bank_loan_data


SELECT COUNT(id) as MTD_Total_Loan_Applications FROM bank_loan_data
WHERE EXTRACT(MONTH FROM issue_date) = 12 AND EXTRACT(YEAR FROM issue_date) = 2021

SELECT COUNT(id) as PMTD_Total_Loan_Applications FROM bank_loan_data
WHERE EXTRACT(MONTH FROM issue_date) = 11 AND EXTRACT(YEAR FROM issue_date) = 2021
```


### 2. Total Funded Amount

```sql
SELECT SUM(loan_ammount) AS Total_Funded_Amount FROM bank_loan_data

SELECT SUM(loan_ammount) AS MTD_Total_Funded_Amount FROM bank_loan_data
WHERE EXTRACT(MONTH FROM issue_date) = 12 AND EXTRACT(YEAR FROM issue_date) = 2021

SELECT SUM(loan_ammount) AS PMTD_Total_Funded_Amount FROM bank_loan_data
WHERE EXTRACT(MONTH FROM issue_date) = 11 AND EXTRACT(YEAR FROM issue_date) = 2021
```
### 3. Total Amount Received

```sql
SELECT SUM(total_payment) AS Total_Amount_Received FROM bank_loan_data

SELECT SUM(total_payment) AS MTD_Total_Amount_Received FROM bank_loan_data
WHERE EXTRACT(MONTH FROM issue_date) = 12 AND EXTRACT(YEAR FROM issue_date) = 2021

SELECT SUM(total_payment) AS PMTD_Total_Amount_Received FROM bank_loan_data
WHERE EXTRACT(MONTH FROM issue_date) = 11 AND EXTRACT(YEAR FROM issue_date) = 2021
```

### 4. Average Interest Rate

```sql
SELECT 
    skills,
    ROUND(AVG(salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home = True 
GROUP BY
    skills
ORDER BY
    avg_salary DESC
LIMIT 25;
```

### 5. Average Debt-to-Income Ratio (DTI)

```sql
SELECT AVG(dti) * 100 AS Avg_DTI_Rate FROM bank_loan_data


SELECT AVG(dti) * 100 AS MTD_Avg_DTI_Rate FROM bank_loan_data
WHERE EXTRACT(MONTH FROM issue_date) = 12 AND EXTRACT(YEAR FROM issue_date) = 2021


SELECT AVG(dti) * 100 AS PMTD_Avg_DTI_Rate FROM bank_loan_data
WHERE EXTRACT(MONTH FROM issue_date) = 11 AND EXTRACT(YEAR FROM issue_date) = 2021
```

### 6. Good Loan status

```sql
-- Good Loan Application Percentage
SELECT
    (COUNT(CASE WHEN loan_status = 'Fully Paid' OR loan_status = 'Current' THEN id END) * 100)
    /
    COUNT(id) AS Good_Loan_Percentage
FROM bank_loan_data

-- Good Loan Applications
SELECT COUNT(id) AS Good_Loan_Applications FROM bank_loan_data
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'

-- Good Loan Funded Amount
SELECT SUM(loan_ammount) AS Good_Loan_Funded_Amount FROM bank_loan_data
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'

-- Good Loan Total Received Amount
SELECT SUM(total_payment) AS Good_Loan_Received_Amount FROM bank_loan_data
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'
```

### 7. Bad Loan status

```sql
-- Bad Loan Application Percentage
SELECT
    (COUNT(CASE WHEN loan_status = 'Charged Off' THEN id END) * 100.0)
    /
    COUNT(id) AS Bad_Loan_Percentage
FROM bank_loan_data

-- Bad Loan Applications
SELECT COUNT(id) AS Bad_Loan_Applications FROM bank_loan_data
WHERE loan_status = 'Charged Off'

-- Bad Loan Funded Amount
SELECT SUM(loan_ammount) AS Bad_Loan_Funded_Amount FROM bank_loan_data
WHERE loan_status = 'Charged Off'

-- Bad Loan Total Received Amount
SELECT SUM(total_payment) AS Bad_Loan_Received_Amount FROM bank_loan_data
WHERE loan_status = 'Charged Off'
```

### 8. Loan Status Grid view

```sql
SELECT
        loan_status,
        COUNT(id) AS Total_Loan_Applications,
        SUM(total_payment) AS Total_Amount_Received,
        SUM(loan_ammount) AS Total_Funded_Amount,
        AVG(int_rate * 100) AS Interest_Rate,
        AVG(dti * 100) AS DTI
    FROM
        bank_loan_data
    GROUP BY
        loan_status
```
![image](https://github.com/HakanAydin1/SQL_Bank_Loan_Analysis/assets/103836951/0578a11d-57f4-4742-9536-ebed4990f59b)


```sql
SELECT
        loan_status,
        SUM(total_payment) AS MTD_Total_Amount_Received,
        SUM(loan_ammount) AS MTD_Total_Funded_Amount
    FROM
        bank_loan_data
    WHERE EXTRACT(MONTH FROM issue_date) = 12 
    GROUP BY
        loan_status
```
![image](https://github.com/HakanAydin1/SQL_Bank_Loan_Analysis/assets/103836951/a801e9a1-cdb8-4086-9256-f4c6a755ea2e)


### 9. Charts

```sql
-- Monthly Trends by Issue Date (Line Chart)  
SELECT 
    EXTRACT(MONTH FROM issue_date) AS Month,
    TO_CHAR(issue_date, 'Month') AS Month_Name,
    COUNT(id) AS Total_Loan_Applications,
    SUM(loan_ammount) AS Total_Funded_Amount,
    SUM(total_payment) AS Total_Received_Amount
FROM bank_loan_data
GROUP BY EXTRACT(MONTH FROM issue_date), TO_CHAR(issue_date, 'Month')
ORDER BY EXTRACT(MONTH FROM issue_date)
```
![image](https://github.com/HakanAydin1/SQL_Bank_Loan_Analysis/assets/103836951/b7e3c6be-d1e3-42ba-9dd5-697c478fb6fb)

```sql
-- Regional Analysis by State (Filled Map) 
SELECT 
    address_state,
    COUNT(id) AS Total_Loan_Applications,
    SUM(loan_ammount) AS Total_Funded_Amount,
    SUM(total_payment) AS Total_Received_Amount
FROM bank_loan_data
GROUP BY address_state
ORDER BY SUM(loan_ammount) DESC
```
![image](https://github.com/HakanAydin1/SQL_Bank_Loan_Analysis/assets/103836951/21858270-c323-42f2-9408-ab0c71d75513)

```sql
-- Term Analysis (Donut Chart)
SELECT 
    term,
    COUNT(id) AS Total_Loan_Applications,
    SUM(loan_ammount) AS Total_Funded_Amount,
    SUM(total_payment) AS Total_Received_Amount
FROM bank_loan_data
GROUP BY term
ORDER BY term
```
![image](https://github.com/HakanAydin1/SQL_Bank_Loan_Analysis/assets/103836951/42ae1039-ca2f-4103-a198-0f1fa175dfe8)

```sql
-- Employee Length Analysis (Bar Chart)
SELECT 
	emp_length AS Employee_Length, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_ammount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY emp_length
ORDER BY emp_length
```
![image](https://github.com/HakanAydin1/SQL_Bank_Loan_Analysis/assets/103836951/61613d73-0cd1-4629-82c8-7817398349a9)


```sql
-- Loan Purpose Breakdown (Bar Chart)
SELECT 
	purpose AS PURPOSE, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_ammount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY purpose
ORDER BY purpose
```
![image](https://github.com/HakanAydin1/SQL_Bank_Loan_Analysis/assets/103836951/d237355f-1fa5-45b9-b3fd-1ad193a1e1e7)

```sql
-- Home Ownership Analysis (Tree Map)
SELECT 
	home_ownership AS Home_Ownership, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_ammount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY home_ownership
ORDER BY home_ownership
```
![image](https://github.com/HakanAydin1/SQL_Bank_Loan_Analysis/assets/103836951/3c43c09e-3d6b-443e-9dfb-b4d4a1e7aca5)


# Power BI visualization
![Screenshot 2024-05-09 215304](https://github.com/HakanAydin1/SQL_Bank_Loan_Analysis/assets/103836951/42490bbc-04a6-4ccb-9488-c1fcbc6d298c)

![Screenshot 2024-05-09 215335](https://github.com/HakanAydin1/SQL_Bank_Loan_Analysis/assets/103836951/34ca08eb-c666-40df-aeb6-57243848fd12)

![Screenshot 2024-05-09 215345](https://github.com/HakanAydin1/SQL_Bank_Loan_Analysis/assets/103836951/9d41f41e-c1f2-4af8-9434-3ad4d5126749)





# What I Learned

Throughout this adventure, I've turbocharged my SQL toolkit with some serious firepower:

- **📊 Data Aggregation:** Got cozy with GROUP BY and turned aggregate functions like COUNT() and AVG() into my data-summarizing sidekicks.
- **💡 Analytical Wizardry:** Leveled up my real-world puzzle-solving skills, turning questions into actionable, insightful SQL queries.

# Conclusions

# Insights

## Key Findings

- **Loan Market Trends:** Analysis of loan applications and funded amounts revealed consistent growth in the data analyst job market over the specified period.
- **Financial Stability:** Despite fluctuations in funded amounts, the overall trend in total amount received remained positive, indicating a stable financial landscape for job seekers.
- **Credit Profile:** The majority of loan applications were successful, reflecting strong credit profiles among applicants and a healthy lending environment.
- **Geographical Variations:** Regional analysis highlighted areas with high demand for data analyst positions, guiding strategic decisions on resource allocation and market expansion.
- **Employment Impact:** Employment length analysis revealed varying loan metrics among job seekers, suggesting the importance of employment stability in loan approval processes.

## Actionable Insights

- **Market Expansion:** Focus on regions with high demand for data analysts to capitalize on growth opportunities and expand market presence.
- **Product Customization:** Tailor loan products to meet the diverse needs of job seekers, considering factors such as loan terms and purposes.
- **Risk Mitigation:** Continuously assess loan application processes to minimize risks associated with bad loans and ensure a healthy loan portfolio.
- **Marketing Strategies:** Leverage insights on employment length and loan purposes to design targeted marketing campaigns and attract high-quality applicants.
- **Financial Planning:** Utilize trends in loan applications and funded amounts for long-term financial planning, ensuring sustainability and profitability.

## Next Steps

- **Further Analysis:** Conduct deeper analysis on specific regions or demographic segments to uncover additional insights and opportunities.
- **Data Enhancement:** Incorporate additional data sources or refine existing data to enhance the accuracy and depth of analysis.
- **Continuous Monitoring:** Implement regular monitoring of loan metrics and market trends to adapt strategies and stay competitive in the dynamic job market.



### Closing Thoughts

This project has significantly improved my SQL skills and provided valuable insights into the realm of Banking Analysis. The findings from this analysis offer guidance for skill development and understanding the intricacies of financial data. It underscores the importance of continuous learning and adaptation to evolving trends in data analytics.