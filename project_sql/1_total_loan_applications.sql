SELECT * FROM bank_loan_data

SELECT COUNT(id) as Total_Loan_Applications FROM bank_loan_data


SELECT COUNT(id) as MTD_Total_Loan_Applications FROM bank_loan_data
WHERE EXTRACT(MONTH FROM issue_date) = 12 AND EXTRACT(YEAR FROM issue_date) = 2021

SELECT COUNT(id) as PMTD_Total_Loan_Applications FROM bank_loan_data
WHERE EXTRACT(MONTH FROM issue_date) = 11 AND EXTRACT(YEAR FROM issue_date) = 2021

