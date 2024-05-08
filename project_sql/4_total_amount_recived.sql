SELECT * FROM bank_loan_data


SELECT SUM(total_payment) AS Total_Amount_Received FROM bank_loan_data

SELECT SUM(total_payment) AS MTD_Total_Amount_Received FROM bank_loan_data
WHERE EXTRACT(MONTH FROM issue_date) = 12 AND EXTRACT(YEAR FROM issue_date) = 2021

SELECT SUM(total_payment) AS PMTD_Total_Amount_Received FROM bank_loan_data
WHERE EXTRACT(MONTH FROM issue_date) = 11 AND EXTRACT(YEAR FROM issue_date) = 2021