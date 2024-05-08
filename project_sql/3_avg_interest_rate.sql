SELECT * FROM bank_loan_data


SELECT AVG(int_rate) * 100 AS Avg_Interest_Rate FROM bank_loan_data

SELECT AVG(int_rate) * 100 AS MTD_Avg_Interest_Rate FROM bank_loan_data
WHERE EXTRACT(MONTH FROM issue_date) = 12 AND EXTRACT(YEAR FROM issue_date) = 2021

SELECT AVG(int_rate) * 100 AS PMTD_Avg_Interest_Rate FROM bank_loan_data
WHERE EXTRACT(MONTH FROM issue_date) = 11 AND EXTRACT(YEAR FROM issue_date) = 2021