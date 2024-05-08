SELECT * FROM bank_loan_data


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



-- Regional Analysis by State (Filled Map) 
SELECT 
    address_state,
    COUNT(id) AS Total_Loan_Applications,
    SUM(loan_ammount) AS Total_Funded_Amount,
    SUM(total_payment) AS Total_Received_Amount
FROM bank_loan_data
GROUP BY address_state
ORDER BY SUM(loan_ammount) DESC



-- Loan Term Analysis (Donut Chart)
SELECT 
    term,
    COUNT(id) AS Total_Loan_Applications,
    SUM(loan_ammount) AS Total_Funded_Amount,
    SUM(total_payment) AS Total_Received_Amount
FROM bank_loan_data
GROUP BY term
ORDER BY term



-- Employee Length Analysis (Bar Chart)
SELECT 
	emp_length AS Employee_Length, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_ammount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY emp_length
ORDER BY emp_length



-- Loan Purpose Breakdown (Bar Chart)
SELECT 
	purpose AS PURPOSE, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_ammount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY purpose
ORDER BY purpose



-- Home Ownership Analysis (Tree Map)
SELECT 
	home_ownership AS Home_Ownership, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_ammount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY home_ownership
ORDER BY home_ownership





