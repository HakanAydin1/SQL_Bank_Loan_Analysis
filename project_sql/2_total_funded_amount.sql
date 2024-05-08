SELECT * FROM bank_loan_data


SELECT SUM(loan_ammount) AS Total_Funded_Amount FROM bank_loan_data

SELECT SUM(loan_ammount) AS MTD_Total_Funded_Amount FROM bank_loan_data
WHERE EXTRACT(MONTH FROM issue_date) = 12 AND EXTRACT(YEAR FROM issue_date) = 2021

SELECT SUM(loan_ammount) AS PMTD_Total_Funded_Amount FROM bank_loan_data
WHERE EXTRACT(MONTH FROM issue_date) = 11 AND EXTRACT(YEAR FROM issue_date) = 2021
